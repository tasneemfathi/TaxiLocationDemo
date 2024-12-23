package com.business.locationappdemo.di


import com.business.locationappdemo.data.repo.LocationRepo
import com.business.locationappdemo.utils.networking.client.createHttpClient
import org.koin.dsl.module

val networkModule = module {
    single { createHttpClient(get()) }
    single { LocationRepo(get()) }

}