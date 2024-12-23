package com.business.locationappdemo.utils

import android.util.Log

actual fun log(msg: String) {
    Log.d("MyApp", msg)
}