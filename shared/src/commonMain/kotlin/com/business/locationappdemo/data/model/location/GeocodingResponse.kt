package com.business.locationappdemo.data.model.location

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class GeocodingResponse(
    val results: List<Result>,
    val status: String
){
    val formattedAddress: String
        get() {
            return results.first().formattedAddress
        }
}

@Serializable
data class Result(
    @SerialName("formatted_address")
    val formattedAddress: String,
    @SerialName("address_components")
    val addressComponents: List<AddressComponent>,
    val geometry: Geometry
)
@Serializable
data class AddressComponent(
    @SerialName("long_name")
    val longName: String,
    @SerialName("short_name")
    val shortName: String,
    val types: List<String>
)
@Serializable
data class Geometry(
    val location: Location
)
@Serializable
data class Location(
    val lat: Double,
    val lng: Double
)
