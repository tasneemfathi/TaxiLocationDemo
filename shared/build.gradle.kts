plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.skie)
    alias(libs.plugins.kotlin.serialization)

}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
        }
    }

    sourceSets {
        androidMain.dependencies {
            implementation(libs.bundles.compose)
            implementation(libs.bundles.android.koin)
            implementation(libs.ktor.client.okhttp)

        }
        commonMain.dependencies {
            implementation(libs.bundles.kotlin)
            implementation(libs.kotlinx.serialization.json)
            implementation(libs.bundles.ktor)
            implementation(libs.bundles.datastore)
            implementation(libs.bundles.koin)
            implementation(libs.bundles.viewModel)
        }

        nativeMain.dependencies {
            implementation(libs.ktor.client.darwin)
        }
    }
}
skie {
    features {
        enableFlowCombineConvertorPreview = true
    }
}
android {
    namespace = "com.business.locationappdemo"
    compileSdk = 34
    defaultConfig {
        minSdk = 28
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
}
