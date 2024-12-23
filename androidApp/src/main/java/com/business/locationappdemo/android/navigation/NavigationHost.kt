package com.business.locationappdemo.android.navigation

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.business.locationappdemo.android.R
import com.business.locationappdemo.android.ui.core.ResizableText
import com.business.locationappdemo.ui.theme.PaddingHorizontal
import com.business.locationappdemo.ui.theme.Primary
import com.business.locationappdemo.ui.theme.bold16Style

@Composable
fun NavigationHost(){
    val navController: NavHostController = rememberNavController()
    val backStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination =  Destinations.valueOf(
        backStackEntry?.destination?.route?.substringAfterLast(".")?.substringBefore("/") ?: Destinations.HomeScreen.name
    )
    val startDestination: Destinations = Destinations.SplashScreen
    Scaffold(
        containerColor = Color.White,
        topBar = {
            if(currentDestination.showAppBar) {
                Box(
                    modifier = Modifier.fillMaxWidth().height(100.dp)
                        .background(Primary)
                        .padding(horizontal = PaddingHorizontal).statusBarsPadding()
                ) {
                    Icon(painterResource(R.drawable.baseline_chevron_right_24),
                        contentDescription = null,
                        tint = Color.White,
                        modifier = Modifier.align(
                            Alignment.CenterStart
                        ).clickable { navController.navigateUp() })
                    ResizableText(
                        stringResource(R.string.app_name),
                        style = bold16Style,
                        fontSizeRange = 12..18,
                        color = Color.White,
                        modifier = Modifier.width(250.dp).align(
                            Alignment.Center
                        ),
                        textAlign = TextAlign.Center,
                        minLines = 1,
                        maxLines = 1
                    )
                }
            }
        }
    ) {contentPadding ->
        Box(modifier = Modifier.fillMaxSize().background(MaterialTheme.colorScheme.background)) {
            NavHostGraph(navController = navController, startDestination = startDestination,contentPadding)
        }
    }

}

