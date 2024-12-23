package com.business.locationappdemo.android.ui.screens

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.ColorInt
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.State
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.unit.dp
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.business.locationappdemo.android.R
import com.business.locationappdemo.ui.theme.Primary
import com.business.locationappdemo.ui.theme.onPrimary
import com.business.locationappdemo.utils.log
import com.business.locationappdemo.viewModels.TripStep
import com.google.android.gms.location.LocationServices
import com.google.android.gms.maps.model.BitmapDescriptor
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.CameraPosition
import com.google.android.gms.maps.model.LatLng
import com.google.maps.android.compose.GoogleMap
import com.google.maps.android.compose.Marker
import com.google.maps.android.compose.MarkerState
import com.google.maps.android.compose.Polyline
import com.google.maps.android.compose.rememberCameraPositionState
import kotlinx.coroutines.delay

@Composable
fun GoogleMapComponent(
    currentStep: TripStep,
    pickLocation: Pair<Double, Double>,
    dropLocation: Pair<Double, Double>,
    directions: State<List<LatLng>>,
    onReset: MutableState<Boolean>,
    onMapIdle: (LatLng) -> Unit
){
    var currentUserLocation by remember { mutableStateOf(LatLng(24.7136, 46.6753)) } // Default to San Francisco
    val cameraPositionState = rememberCameraPositionState {
        position = CameraPosition.fromLatLngZoom(currentUserLocation, 16f)
    }
    val context = LocalContext.current

    val requestPermissionLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.RequestPermission(),
            onResult = { isGranted: Boolean ->
                if (isGranted) {
                    getCurrentLocation(context) { lat, long ->
                        currentUserLocation = LatLng(lat,long)

                    }
                }
            })

    LaunchedEffect(Unit) {
        if (hasLocationPermission(context)) {
            getCurrentLocation(context) { lat, long ->
                currentUserLocation = LatLng(lat,long)
                cameraPositionState.position  = CameraPosition.fromLatLngZoom(currentUserLocation, 16f)
            }
        } else {
            requestPermissionLauncher.launch(Manifest.permission.ACCESS_FINE_LOCATION)
        }
    }

    LaunchedEffect(cameraPositionState.isMoving) {
        if(!cameraPositionState.isMoving) {
            onMapIdle(cameraPositionState.position.target)
        }
    }
    LaunchedEffect(onReset.value){
        cameraPositionState.position = CameraPosition.fromLatLngZoom(LatLng(currentUserLocation.latitude,currentUserLocation.longitude), 16f)
    }
    LaunchedEffect(Unit){
        delay(1000)
        onMapIdle(cameraPositionState.position.target)
    }

    Box (modifier = Modifier.fillMaxWidth()
        .semantics(mergeDescendants = true) { }
        .clearAndSetSemantics { contentDescription = "Google Map" }) {
        GoogleMap(
            modifier = Modifier.fillMaxSize(),
            cameraPositionState = cameraPositionState,
            onMapClick = { latLng ->

            }
        ) {
            // Add a marker to the map
            log("Pick Marker ${pickLocation.first} ${pickLocation.second}")

            if(currentStep.value > TripStep.PICK.value) {
                log("Pick Marker")

                Marker(
                    state = MarkerState(position = LatLng(pickLocation.first, pickLocation.second)),
                    title = "My Marker Title",
                    snippet = "Marker Description",
                    icon = getBitmapDescriptorFromVector(
                        context,
                        R.drawable.ic_marker,
                        tintColor = Primary.toArgb(),
                        60,
                        60
                    )

                )
            }
            if(currentStep.value > TripStep.DROP.value)
                Marker(
                    state = MarkerState(position = LatLng(dropLocation.first,dropLocation.second)),
                    title = "My Marker Title",
                    snippet = "Marker Description",
                    icon = getBitmapDescriptorFromVector(context, R.drawable.ic_marker, tintColor = onPrimary.toArgb(), 60, 60)

                )

            if (directions.value.isNotEmpty()) {
                Polyline(
                    points = directions.value,
                    color = Color(android.graphics.Color.RED),
                    width = 10f
                )
            }
        }

        Box(
            contentAlignment = Alignment.Center,
            modifier = Modifier.fillMaxSize().padding(bottom = 50.dp)
        ) {
            if(currentStep == TripStep.PICK) {
                Icon(
                    painter = painterResource(R.drawable.ic_marker),
                    contentDescription = "User Pick Marker",
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(60.dp)
                )
            }

            if(currentStep == TripStep.DROP) {
                Icon(
                    painter = painterResource(R.drawable.ic_marker),
                    contentDescription = "User Drop Marker",
                    tint = MaterialTheme.colorScheme.onPrimary,
                    modifier = Modifier.size(60.dp)
                )
            }
        }
    }

}



private fun hasLocationPermission(context: Context): Boolean {
    return ContextCompat.checkSelfPermission(
        context,
        Manifest.permission.ACCESS_FINE_LOCATION
    ) == PackageManager.PERMISSION_GRANTED
}

private fun getCurrentLocation(context: Context, callback: (Double, Double) -> Unit) {
    val fusedLocationClient = LocationServices.getFusedLocationProviderClient(context)
    if (ActivityCompat.checkSelfPermission(
            context,
            Manifest.permission.ACCESS_FINE_LOCATION
        ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
            context,
            Manifest.permission.ACCESS_COARSE_LOCATION
        ) != PackageManager.PERMISSION_GRANTED
    ) {
       println("No User Permission")
        return
    }
    fusedLocationClient.lastLocation
        .addOnSuccessListener { location ->
            if (location != null) {
                val lat = location.latitude
                val long = location.longitude
                callback(lat, long)
            }
        }
        .addOnFailureListener { exception ->
            // Handle location retrieval failure
            exception.printStackTrace()
        }
}

fun getBitmapDescriptorFromVector(context: Context, vectorResId: Int, @ColorInt tintColor: Int, width: Int, height: Int): BitmapDescriptor {
    // Convert dp to pixels
    val density = context.resources.displayMetrics.density
    val widthPx = (width * density).toInt()
    val heightPx = (height * density).toInt()

    val vectorDrawable = ContextCompat.getDrawable(context, vectorResId)
        ?: return BitmapDescriptorFactory.defaultMarker()

    // Set bounds with the converted width and height in pixels
    vectorDrawable.setBounds(0, 0, widthPx, heightPx)
    vectorDrawable.setTint(tintColor)

    // Create bitmap with the custom size in pixels
    val bitmap = Bitmap.createBitmap(widthPx, heightPx, Bitmap.Config.ARGB_8888)
    val canvas = Canvas(bitmap)
    vectorDrawable.draw(canvas)

    return BitmapDescriptorFactory.fromBitmap(bitmap)
}