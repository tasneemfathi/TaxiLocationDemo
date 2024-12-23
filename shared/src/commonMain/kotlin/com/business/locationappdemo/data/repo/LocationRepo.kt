package com.business.locationappdemo.data.repo

import com.business.locationappdemo.data.model.location.DirectionsResponse
import com.business.locationappdemo.data.model.location.GeocodingResponse
import com.business.locationappdemo.utils.networking.EndPoints
import com.business.locationappdemo.utils.networking.NetworkingError
import com.business.locationappdemo.utils.networking.safeApiCall
import io.ktor.client.HttpClient
import io.ktor.client.request.get
import com.business.locationappdemo.utils.networking.Result
import io.ktor.client.request.parameter

class LocationRepo (private val httpClient: HttpClient){

    suspend fun getGeoLocation(latitude:Double,longitude:Double) : Result<GeocodingResponse, NetworkingError> {
        return safeApiCall {
            httpClient.get(EndPoints.GOOGLE_MAP_BASE_URL + "geocode/json"){
                parameter("latlng","${latitude},${longitude}")
                parameter("destination","${latitude},${longitude}")
                parameter("key","AIzaSyA8AitrTSHiTtbvtlDbmrwqZH1HRq0LxLQ")
                parameter("language","ar")
                parameter("mode","driving")
            }
        }
    }


    suspend fun getRoute(pickLat:Double,pickLong:Double,dropLat:Double,dropLong:Double) : Result<DirectionsResponse, NetworkingError> {
        return safeApiCall {
            httpClient.get(EndPoints.GOOGLE_MAP_BASE_URL + "directions/json"){
                parameter("origin","${pickLat},${pickLong}")
                parameter("destination","${dropLat},${dropLong}")
                parameter("key","AIzaSyA8AitrTSHiTtbvtlDbmrwqZH1HRq0LxLQ")
                parameter("language","ar")
                parameter("mode","driving")
            }
        }
    }

}