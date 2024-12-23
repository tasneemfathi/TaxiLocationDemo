package com.business.locationappdemo.utils.networking.client



import com.business.locationappdemo.data.datastore.repo.AuthLocaleRepo
import com.business.locationappdemo.utils.log
import io.ktor.client.HttpClient
import io.ktor.client.plugins.api.Send
import io.ktor.client.plugins.api.createClientPlugin
import io.ktor.client.plugins.auth.Auth
import io.ktor.client.plugins.auth.providers.BearerTokens
import io.ktor.client.plugins.auth.providers.bearer
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.plugins.logging.LogLevel
import io.ktor.client.plugins.logging.Logger
import io.ktor.client.plugins.logging.Logging
import io.ktor.http.ContentType
import io.ktor.http.contentType
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

fun createHttpClient(localeStorage: AuthLocaleRepo): HttpClient {
    return HttpClient(createPlatformHttpClient()) {
        defaultRequest {
            headers.append("language", "ar")
            contentType(ContentType.Application.FormUrlEncoded)

        }
        install(Logging){
            logger = object : Logger {
                override fun log(message: String) {
                   log(msg = message)
                }
            }
            this.level = LogLevel.ALL
        }
        install(ContentNegotiation){
            json(Json {
                ignoreUnknownKeys = true
                isLenient = true
            })
        }

        install(createClientPlugin("fix") {
            on(Send) { request ->
                val updatedAccessToken = localeStorage.accessToken() // Fetch latest token dynamically
                if (updatedAccessToken.isNullOrBlank().not()) {
                    request.headers["Authorization"] = "Bearer $updatedAccessToken"
                }
                request.headers.remove("Accept-Charset")
                this.proceed(request)
            }
        })

    }

}