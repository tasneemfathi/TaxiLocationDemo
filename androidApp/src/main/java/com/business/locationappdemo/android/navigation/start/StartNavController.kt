package com.business.locationappdemo.android.navigation.start

import androidx.navigation.NavController
import com.business.locationappdemo.android.navigation.Destinations
import com.business.locationappdemo.android.navigation.start.actions.StartRoute


fun NavController.startApp(start: StartRoute){
    when(start){
        StartRoute.Home -> navigate(Destinations.HomeScreen.toString())
    }
}
