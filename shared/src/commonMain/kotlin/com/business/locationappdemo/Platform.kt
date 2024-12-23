package com.business.locationappdemo

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform