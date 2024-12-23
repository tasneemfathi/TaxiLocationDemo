package com.business.locationappdemo.di

import android.content.Context
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.Koin
import org.koin.core.context.startKoin
import org.koin.core.module.Module

@Suppress("EXPECT_ACTUAL_CLASSIFIERS_ARE_IN_BETA_WARNING")
actual class KoinInitializer(
    private val context: Context, private val nativeAppModule:Module
) {
    actual fun init() {
        startKoin {
            androidContext(context)
            androidLogger()
            modules(DataStorePreferencesModule, networkModule, viewModelModule, localRepoModule,nativeAppModule)
        }
    }
}