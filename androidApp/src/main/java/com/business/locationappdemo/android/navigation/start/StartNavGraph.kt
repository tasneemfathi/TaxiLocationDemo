package com.business.locationappdemo.android.navigation.start

import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable
import com.business.locationappdemo.android.navigation.Destinations
import com.business.locationappdemo.android.ui.screens.SplashScreen


fun NavGraphBuilder.startNavigationHost(navController: NavHostController) {
    composable(route = Destinations.SplashScreen.toString()){
        SplashScreen(onFinish = navController::startApp)
    }
}

