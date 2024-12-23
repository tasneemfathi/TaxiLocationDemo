package com.business.locationappdemo.android.ui.screens

import androidx.lifecycle.viewModelScope
import com.business.locationappdemo.data.model.location.GeocodingResponse
import com.business.locationappdemo.data.repo.LocationRepo
import com.business.locationappdemo.utils.log

import com.business.locationappdemo.utils.networking.onError
import com.business.locationappdemo.utils.networking.onSuccess
import com.business.locationappdemo.viewModels.SharedViewModel
import com.google.android.gms.maps.model.LatLng
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch

class AndroidViewModel(repository: LocationRepo)  : SharedViewModel(repository){
     var geo = MutableStateFlow<GeocodingResponse?>(null)
         private set

    var directions = MutableStateFlow<List<LatLng>>(listOf())
        private set

    init {
        observeLocation()
        observeRoute()
    }

    fun observeLocation() {
        viewModelScope.launch {
            location.collectLatest {
                it?.onSuccess { geoLocation ->
                    geo.value = geoLocation
                    updateGeoLocationAddresses(geoLocation.formattedAddress)
                }?.onError { networkingError, message ->
                }
            }
        }
    }

    fun observeRoute() {
        viewModelScope.launch {
            route.collectLatest {
                it?.onSuccess { route ->
                    directions.value =  route.directionRoute.map{ LatLng(it.first, it.second) }
                }?.onError { networkingError, message ->
                }
            }
        }
    }


    fun getLocationGeoCode(latitude:Double,longitude:Double)  {
        fetchLocation(latitude, longitude)
    }


    fun incrementTripStep() = incrementStep()
    fun resetTrip()  = restartTrip()

}