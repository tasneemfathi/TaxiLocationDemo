package com.business.locationappdemo.ui.theme


import androidx.compose.material3.Typography
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.business.locationappdemo.android.R


val MyAppFontFamily : FontFamily
    @Composable
    get() = FontFamily(
    Font(R.font.light, weight = FontWeight.Light),
    Font(R.font.book, weight = FontWeight.Normal),
    Font(R.font.medium, weight = FontWeight.Medium),
    Font(R.font.bold, weight = FontWeight.Bold),
)
val splashTitleStyle :TextStyle
    @Composable
    get()= TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 32.sp,
        color = Color.White
    )
val titleStyle :TextStyle
    @Composable
    get()= TextStyle(
    fontFamily = MyAppFontFamily,
    fontWeight = FontWeight.Bold,
    fontSize = 20.sp,
    color = TextColor
)

val subtitleStyle :TextStyle
    @Composable
    get()= TextStyle(
    fontFamily = MyAppFontFamily,
    fontWeight = FontWeight.Medium,
    fontSize = 16.sp,
     color = TextColor,
)
val medium14Style :TextStyle
    @Composable
    get()= TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Medium,
        fontSize = 14.sp,
        color = TextColor,

    )
val medium16Style :TextStyle
    @Composable
    get()= TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Medium,
        fontSize = 14.sp,
        color = TextColor,
        lineHeight = 20.sp
    )
val bold16Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 16.sp,
        color = TextColor,
        lineHeight = 20.sp
    )

val bold14Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 14.sp,
        color = TextColor,
    )

val bold12Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 12.sp,
        color = TextColor,
    )

val normalStyle :TextStyle
@Composable
    get() = TextStyle(
    fontFamily = MyAppFontFamily,
    fontWeight = FontWeight.Normal,
    fontSize = 13.sp,
    color = TextColor,
    lineHeight = 20.sp
    )
val normal14Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Normal,
        fontSize = 13.sp,
        color = TextColor,
        lineHeight = 20.sp
    )
val normal16Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        color = TextColor,
        lineHeight = 22.sp,
    )
val normal18Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Normal,
        fontSize = 18.sp,
        color = TextColor,
        lineHeight = 22.sp
    )

val extraBold23Style :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 23.sp,
        color = TextColor,
    )

val buttonsStyle :TextStyle
    @Composable
    get() = TextStyle(
        fontFamily = MyAppFontFamily,
        fontWeight = FontWeight.Medium,
        fontSize = 16.sp,
        color = Color.White
    )


val typography  :Typography
    @Composable
    get() = Typography(
    titleLarge = titleStyle,
    headlineLarge = subtitleStyle,
    bodyMedium = medium14Style ,
    bodySmall = normalStyle
)

