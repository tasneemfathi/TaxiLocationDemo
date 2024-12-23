package com.business.locationappdemo.android.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.business.locationappdemo.android.R
import com.business.locationappdemo.ui.theme.Primary
import com.business.locationappdemo.ui.theme.bold16Style
import com.business.locationappdemo.ui.theme.medium14Style
import com.business.locationappdemo.viewModels.TripStep
import org.koin.androidx.compose.koinViewModel

@Composable
fun HomeScreen(){
    val viewModel = koinViewModel<AndroidViewModel>()
    val pickGeoLocation = viewModel.pickGeoLocation.collectAsStateWithLifecycle()
    val dropGeoLocation = viewModel.dropGeoLocation.collectAsStateWithLifecycle()
    val pickLocation = viewModel.pickLocation.collectAsStateWithLifecycle()
    val dropLocation = viewModel.dropLocation.collectAsStateWithLifecycle()
    val currentStep = viewModel.currentStep.collectAsStateWithLifecycle()
    val directions = viewModel.directions.collectAsStateWithLifecycle()
    val onReset = remember { mutableStateOf<Boolean>(false) }
    Box (modifier = Modifier.fillMaxSize().background(Color.White), contentAlignment = Alignment.BottomCenter){
        GoogleMapComponent(currentStep = currentStep.value, pickLocation = pickLocation.value,dropLocation = dropLocation.value,directions = directions,onReset = onReset ,onMapIdle = { location ->
            viewModel.getLocationGeoCode(location.latitude, location.longitude)
        })


        Box(modifier = Modifier.fillMaxWidth().padding(bottom = 20.dp).padding(horizontal = 20.dp).background(shape = RoundedCornerShape(20.dp), color = Color.White), contentAlignment = Alignment.CenterStart){
           Column(modifier = Modifier.fillMaxWidth().padding(vertical = 20.dp).padding(horizontal = 20.dp), verticalArrangement = Arrangement.spacedBy(20.dp)) {
               Text(text = pickGeoLocation.value,modifier = Modifier.padding(horizontal = 20.dp), style = medium14Style)
               Text(text = dropGeoLocation.value,modifier = Modifier.padding(horizontal = 20.dp), style = medium14Style)

               Row (modifier = Modifier.fillMaxWidth().height(40.dp), horizontalArrangement = Arrangement.spacedBy(20.dp), verticalAlignment = Alignment.CenterVertically){
                   Button(modifier = Modifier.height(40.dp).weight(1f).background(shape = RoundedCornerShape(8.dp), color = Primary),onClick = viewModel::incrementTripStep) {
                       Text(text = if(currentStep.value == TripStep.STARTED) "FINISH" else "NEXT", style = bold16Style, color = Color.White)
                   }
                   IconButton (modifier = Modifier.size(40.dp).background(shape = RoundedCornerShape(8.dp), color = Primary),onClick = {
                       viewModel.resetTrip()
                       onReset.value = !onReset.value
                   }) {
                       Icon(painter = painterResource(R.drawable.ic_reset), tint = Color.White, contentDescription = "Reset", modifier = Modifier.size(30.dp))
                   }
               }

           }
        }
    }
}