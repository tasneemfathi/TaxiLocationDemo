package com.business.locationappdemo.data.model


import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Error(
    @SerialName("error")
    val error: String? = null,
    @SerialName("field")
    val `field`: String? = null
)