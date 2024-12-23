package com.business.locationappdemo.di

import org.koin.core.module.Module

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import com.business.locationappdemo.data.datastore.DATA_STORE_FILE_NAME
import kotlinx.cinterop.ExperimentalForeignApi
import org.koin.dsl.module
import platform.Foundation.NSDocumentDirectory
import platform.Foundation.NSFileManager
import platform.Foundation.NSUserDomainMask

actual val DataStorePreferencesModule: Module = module {
    single { createDataStore() }
}

@OptIn(ExperimentalForeignApi::class)
fun createDataStore(): DataStore<Preferences> {
    return createDataStore {
        val directory = NSFileManager.defaultManager.URLForDirectory(
            directory = NSDocumentDirectory,
            inDomain = NSUserDomainMask,
            appropriateForURL = null,
            create = false,
            error = null
        )
        requireNotNull(directory).path + "/$DATA_STORE_FILE_NAME"
    }
}