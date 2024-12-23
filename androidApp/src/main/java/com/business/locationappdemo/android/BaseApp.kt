package com.business.locationappdemo.android

import android.app.Application
import android.content.Context
import com.business.locationappdemo.android.di.androidViewModelModule
import com.business.locationappdemo.android.utils.setLocale
import com.business.locationappdemo.di.KoinInitializer


class BaseApp: Application() {
    companion object {
        lateinit var instance: BaseApp
            private set

        fun getAppContext(): Context = instance.applicationContext
    }
    override fun onCreate() {
        super.onCreate()
        instance = this
        applicationContext.setLocale(lang = "ar")
        KoinInitializer(applicationContext,androidViewModelModule).init()
//        AppContext.setUp(applicationContext)
//        NotifierManager.initialize(
//            configuration = NotificationPlatformConfiguration.Android(
//                notificationIconResId = R.mipmap.ic_launcher_foreground,
//                showPushNotification = true,
//            )
//        )

    }

}