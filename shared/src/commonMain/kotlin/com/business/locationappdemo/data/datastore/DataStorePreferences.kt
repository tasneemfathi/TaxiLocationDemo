package com.business.locationappdemo.data.datastore

import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey


internal const val DATA_STORE_FILE_NAME = "prefs.preferences_pb"
internal const val DATA_STORE_CONFIG = "config_key"
internal const val DATA_STORE_USER = "user_key"
internal const val DATA_STORE_COUNTRIES = "countries_key"
internal const val DATA_STORE_FIRST_LAUNCH = "is_first_launch"
internal const val DATA_STORE_LANG = "lang_key"
internal const val DATA_STORE_AUTH_TOKEN = "auth_token"
internal const val DATA_STORE_FCM_TOKEN = "fcm_token"
internal const val DATA_STORE_CONFIG_VERSION = "config_version"

object PreferencesKeys {
    val authKeys = stringPreferencesKey(DATA_STORE_AUTH_TOKEN)
    val fcmKeys = stringPreferencesKey(DATA_STORE_FCM_TOKEN)
    val userKeys = stringPreferencesKey(DATA_STORE_USER)
    val configKeys = stringPreferencesKey(DATA_STORE_CONFIG)
    val countriesKeys = stringPreferencesKey(DATA_STORE_COUNTRIES)
    val firstLaunchKeys = booleanPreferencesKey(DATA_STORE_FIRST_LAUNCH)
    val langKeys = stringPreferencesKey(DATA_STORE_LANG)
    val configVersionKeys = stringPreferencesKey(DATA_STORE_CONFIG_VERSION)
}