package com.business.locationappdemo.android.ui.screens

import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.systemBarsPadding
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import com.business.locationappdemo.android.R
import com.business.locationappdemo.android.navigation.start.actions.StartRoute
import com.business.locationappdemo.android.navigation.start.actions.determineStartEntryPoint
import com.business.locationappdemo.ui.theme.Primary
import com.business.locationappdemo.ui.theme.PrimaryDark
import com.business.locationappdemo.ui.theme.onPrimary
import kotlinx.coroutines.delay

private val splashBrush = Brush.linearGradient(
    colors = listOf(
       Primary,
        onPrimary
    ),
    start = Offset(0f, Float.POSITIVE_INFINITY), // Start at the bottom
    end = Offset(0f, 0f) // End at the top
)
@Composable
fun SplashScreen(onFinish: (StartRoute) -> Unit){
    val scale = remember {
        Animatable(0.0f)
    }

    LaunchedEffect(key1 = true) {
        scale.animateTo(
            targetValue = 0.8f,
            animationSpec = tween(800, easing = LinearEasing)
        )
        delay(2000)
        onFinish(determineStartEntryPoint())
    }
    Box(modifier = Modifier.fillMaxSize().background(splashBrush), contentAlignment = Alignment.Center){

        Column (modifier = Modifier.fillMaxWidth().systemBarsPadding().align(Alignment.Center).scale(scale.value), horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.spacedBy(20.dp) , content = {
            Image(
                modifier = Modifier
                    .size(
                        width = 159.dp,
                        height = 217.dp
                    ),
                painter = painterResource(R.drawable.logo),
                contentDescription = "Logo"
            )
        })
    }
}
