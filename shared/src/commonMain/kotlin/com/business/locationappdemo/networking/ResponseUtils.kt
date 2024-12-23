package com.business.locationappdemo.utils.networking


import com.business.locationappdemo.data.model.GeneralResponse
import io.ktor.client.call.body
import io.ktor.client.network.sockets.ConnectTimeoutException
import io.ktor.client.statement.HttpResponse
import io.ktor.util.network.UnresolvedAddressException
import kotlinx.serialization.SerializationException

suspend inline fun <reified T : Any> safeApiCall(
    acceptNotAuthorized:Boolean = false,crossinline httpRequest: suspend () -> HttpResponse
): Result<T, NetworkingError> {
    return try {
        val response = httpRequest()
        result(acceptNotAuthorized,response)
    } catch (e: UnresolvedAddressException) {
        e.printStackTrace()
        Result.Failure(NetworkingError.NO_INTERNET,e.message.toString())
    } catch (e: SerializationException) {
        e.printStackTrace()
        Result.Failure(NetworkingError.SERIALIZATION,e.message.toString())
    } catch (e: ConnectTimeoutException) {
        e.printStackTrace()
        Result.Failure(NetworkingError.REQUEST_TIMEOUT,e.message.toString())
    } catch (e: Exception) {
        e.printStackTrace()
        Result.Failure(NetworkingError.UNKNOWN,e.message.toString())
    }
}




suspend inline fun <reified T> result(acceptNotAuthorized:Boolean,response: HttpResponse) :Result<T,NetworkingError>{
    val messageResponse = response.body<GeneralResponse>()
    val responseMessage = if(messageResponse.errorsInString.isNotBlank() )messageResponse.errorsInString else messageResponse.responseMessage ?:""
     return  when (response.status.value) {
        in 200..299 -> Result.Success(response.body<T>(),responseMessage)
        401 -> Result.Failure(NetworkingError.UNAUTHORIZED,responseMessage)
        451 -> if(acceptNotAuthorized) Result.Success(response.body<T>(),responseMessage) else Result.Failure(NetworkingError.UNAUTHORIZED,responseMessage)
        409 -> Result.Failure(NetworkingError.CONFLICT,responseMessage)
        408 -> Result.Failure(NetworkingError.REQUEST_TIMEOUT,responseMessage)
        413 -> Result.Failure(NetworkingError.PAYLOAD_TOO_LARGE,responseMessage)
        in 500..599 -> Result.Failure(NetworkingError.SERVER_ERROR,responseMessage)
        else -> Result.Failure(NetworkingError.UNKNOWN,responseMessage)
    }
}
