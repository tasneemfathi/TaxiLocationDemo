package com.business.locationappdemo.viewModels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.business.locationappdemo.data.model.location.DirectionsResponse
import com.business.locationappdemo.data.model.location.GeocodingResponse
import com.business.locationappdemo.data.repo.LocationRepo
import com.business.locationappdemo.utils.networking.NetworkingError
import com.business.locationappdemo.utils.networking.onError
import com.business.locationappdemo.utils.networking.onSuccess
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import com.business.locationappdemo.utils.networking.Result
import io.ktor.client.call.body

enum class TripStep(val value: Int){
    PICK(1),
    DROP(2),
    STARTED(3),
}

open class SharedViewModel(private val repository: LocationRepo) : ViewModel() {
     var location = MutableStateFlow<Result<GeocodingResponse, NetworkingError>?>(null)
        private set

    var route = MutableStateFlow<Result<DirectionsResponse, NetworkingError>?>(null)
        private set

    val pickLocation = MutableStateFlow(Pair(0.0,0.0))
    val dropLocation = MutableStateFlow(Pair(0.0,0.0))

    val pickGeoLocation = MutableStateFlow("")
    val dropGeoLocation = MutableStateFlow("")

    val currentStep  = MutableStateFlow(TripStep.PICK)



    protected fun fetchLocation(latitude:Double,longitude:Double) {
        viewModelScope.launch {
            updateTripLocation(latitude, longitude)
            location.value =  repository.getGeoLocation(latitude, longitude)
        }
    }


    protected fun getRoute() {
        viewModelScope.launch {
            route.value =  repository.getRoute(pickLocation.value.first, pickLocation.value.second,dropLocation.value.first , dropLocation.value.second)
        }
    }

   protected fun incrementStep(){
        when(currentStep.value){
            TripStep.PICK ->
            {
               currentStep.value =  TripStep.DROP
            }
            TripStep.DROP -> {
                currentStep.value =  TripStep.STARTED
            }
            TripStep.STARTED -> {
                getRoute()
            }
        }
    }
    protected fun updateTripLocation(latitude:Double,longitude:Double){
        when(currentStep.value){
            TripStep.PICK ->
            {
                pickLocation.value =  Pair(latitude,longitude)
            }
            TripStep.DROP -> {
                dropLocation.value =  Pair(latitude,longitude)
            }
            else ->{}
        }
    }
    protected fun updateGeoLocationAddresses(currentGeo:String){
        when(currentStep.value){
            TripStep.PICK ->
            {
                pickGeoLocation.value =  currentGeo
            }
            TripStep.DROP -> {
                dropGeoLocation.value =  currentGeo
            }
          else ->{}
        }
    }
    protected fun restartTrip(){
        currentStep.value =  TripStep.PICK
        pickLocation.value = Pair(0.0,0.0)
        dropLocation.value = Pair(0.0,0.0)
        dropGeoLocation.value = ""
        route.value = null
        viewModelScope.launch {
            route.value = (Result.Success(DirectionsResponse(listOf()), ""))

        }
    }
}