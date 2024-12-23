package com.business.locationappdemo.data.model


import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class GeneralResponse(
    @SerialName("errors")
    val errors: List<Error?>? = null,
    @SerialName("response_message")
    val responseMessage: String? = "",
){
    val errorsInString get() = errors?.joinToString(separator = "/n") { it?.error.toString()} ?:""
}