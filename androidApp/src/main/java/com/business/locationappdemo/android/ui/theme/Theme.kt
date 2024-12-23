package com.business.locationappdemo.ui.theme


import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.ColorScheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color


private  val myAppLightTheme:ColorScheme
    get() = lightColorScheme(primary = Primary, onPrimary = onPrimary, background = PrimaryContainer)

@Composable
fun MyAppTheme(content: @Composable () -> Unit){
    MaterialTheme(
        colorScheme = myAppLightTheme,
        typography = typography,
        content = content
    )
}
