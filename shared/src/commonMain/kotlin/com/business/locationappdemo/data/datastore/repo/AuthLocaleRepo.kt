package com.business.locationappdemo.data.datastore.repo

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import com.business.locationappdemo.data.datastore.PreferencesKeys
import kotlinx.coroutines.flow.firstOrNull


class AuthLocaleRepo(private val dataStore : DataStore<Preferences>){

    suspend fun accessToken() : String? = dataStore.data.firstOrNull()?.get(PreferencesKeys.authKeys)

    private suspend fun updateAccessTokenLaunch(accessToken:String){
        dataStore.edit { it[PreferencesKeys.authKeys] = accessToken }
    }

    suspend fun fcmToken() : String? = dataStore.data.firstOrNull()?.get(PreferencesKeys.fcmKeys)

    suspend fun updateFcmTokenLaunch(accessToken:String){
        dataStore.edit { it[PreferencesKeys.fcmKeys] = accessToken }
    }
//
//    val user: Flow<User?>
//        get() = dataStore.data.map {
//            try{
//                val localUser = it[PreferencesKeys.userKeys]
//                localUser?.let {
//                    Json.decodeFromString(localUser)
//                }
//            }catch (ex:Exception){
//                ex.printStackTrace()
//                null
//            }
//        }
//
//    suspend fun updateUser(user: User?) {
//        if(user == null)
//            dataStore.edit {
//                it.remove(PreferencesKeys.userKeys)
//                it.remove(PreferencesKeys.authKeys)
//            }
//        else {
//            dataStore.edit {
//                it[PreferencesKeys.userKeys] = Json.encodeToString(user)
//            }
//            if (user.accessToken.isNullOrBlank().not()){
//                updateAccessTokenLaunch(user.accessToken.toString())
//            }
//        }
//    }

}