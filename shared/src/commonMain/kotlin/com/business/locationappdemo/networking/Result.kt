package com.business.locationappdemo.utils.networking


sealed class Result<out D, out E: Error>{
    data class Success<out D>(val data:D,val responseMessage:String): Result<D, Nothing>()
    data class Failure<out E: Error>(val error:E,val responseMessage:String): Result<Nothing, E>()
}

inline fun <T, E: Error, R> Result<T, E>.map(map: (T) -> R): Result<R, E> {
    return when(this) {
        is Result.Failure -> Result.Failure(error,responseMessage)
        is Result.Success -> Result.Success(map(data),responseMessage)
    }
}

fun <T, E: Error> Result<T, E>.asEmptyDataResult(): EmptyResult<E> {
    return map {  }
}

inline fun <T, E: Error> Result<T, E>.onSuccess(action: (T) -> Unit): Result<T, E> {
    return when(this) {
        is Result.Failure -> this
        is Result.Success -> {
            action(data)
            this
        }
    }
}
inline fun <T, E: Error> Result<T, E>.onError(action: (E,String) -> Unit): Result<T, E> {
    return when(this) {
        is Result.Failure -> {
            action(error,responseMessage)
            this
        }
        is Result.Success -> this
    }
}

typealias EmptyResult<E> = Result<Unit, E>