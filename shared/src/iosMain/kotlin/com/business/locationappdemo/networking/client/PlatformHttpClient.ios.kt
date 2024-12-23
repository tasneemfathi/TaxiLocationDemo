package com.business.locationappdemo.utils.networking.client

import io.ktor.client.engine.HttpClientEngine
import io.ktor.client.engine.darwin.Darwin

actual fun createPlatformHttpClient(): HttpClientEngine {
    return Darwin.create()
}