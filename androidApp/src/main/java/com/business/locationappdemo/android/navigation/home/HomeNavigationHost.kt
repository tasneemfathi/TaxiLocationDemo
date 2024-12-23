package com.business.locationappdemo.android.navigation.home

import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable
import com.business.locationappdemo.android.navigation.Destinations
import com.business.locationappdemo.android.ui.screens.HomeScreen

fun NavGraphBuilder.homeNavigationHost(navController: NavHostController) {
    composable(route = Destinations.HomeScreen.toString()){
        HomeScreen()
    }
}

