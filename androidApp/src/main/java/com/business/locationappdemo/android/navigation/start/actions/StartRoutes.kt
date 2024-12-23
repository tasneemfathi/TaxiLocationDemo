package com.business.locationappdemo.android.navigation.start.actions

fun determineStartEntryPoint(): StartRoute {
    return when{
        else -> StartRoute.Home
    }
}
enum class StartRoute{
    Home
}