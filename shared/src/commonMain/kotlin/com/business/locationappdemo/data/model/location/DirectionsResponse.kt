package com.business.locationappdemo.data.model.location

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class DirectionsResponse(
    val routes: List<Route>
){
    val directionRoute : List<Pair<Double,Double>>
        get() {
            val points = mutableListOf<Pair<Double,Double>>()
            for (route in routes) {
                for (leg in route.legs) {
                    for (step in leg.steps) {
                        points.add(Pair(step.startLocation.lat, step.startLocation.lng))
                    }
                }
            }
            return  points
        }
}

@Serializable
data class Route(
    val legs: List<Leg>
)

@Serializable
data class Leg(
    val steps: List<Step>
)

@Serializable
data class Step(
    @SerialName("start_location")
    val startLocation: Location,
    @SerialName("end_location")
    val endLocation: Location
)

