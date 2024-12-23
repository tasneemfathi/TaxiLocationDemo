package com.business.locationappdemo.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.LayoutDirection
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsControllerCompat
import com.business.locationappdemo.android.navigation.NavigationHost
import com.business.locationappdemo.ui.theme.MyAppTheme
import com.business.locationappdemo.ui.theme.Primary
import com.google.accompanist.systemuicontroller.rememberSystemUiController

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        installSplashScreen()
        super.onCreate(savedInstanceState)
        // Ensure we draw behind the system bars
        WindowCompat.setDecorFitsSystemWindows(window, false)

        // Hide navigation and status bars
        val insetsController = WindowInsetsControllerCompat(window, window.decorView)
        insetsController.systemBarsBehavior = WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE

        setContent {
            val sysUiController = rememberSystemUiController()
            SideEffect {
                sysUiController.setSystemBarsColor(color = Color.Transparent , darkIcons = false)
                sysUiController.setNavigationBarColor(color = Color.Transparent)
            }

            CompositionLocalProvider(LocalLayoutDirection provides  LayoutDirection.Rtl ) {
                MyAppTheme {
                    NavigationHost()
                }
            }
        }
    }
}


@Preview
@Composable
fun DefaultPreview() {
    MyAppTheme {
        NavigationHost()
    }
}
