package com.business.locationappdemo.android.navigation

import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import com.business.locationappdemo.android.navigation.home.homeNavigationHost
import com.business.locationappdemo.android.navigation.start.startNavigationHost



@Composable
fun NavHostGraph(
    navController: NavHostController,
    startDestination: Destinations,
    contentPadding: PaddingValues
){
        NavHost(navController = navController, startDestination = startDestination.toString()){
             startNavigationHost(navController = navController)
             homeNavigationHost(navController = navController)

        }
}
