package com.business.locationappdemo.android.di


import com.business.locationappdemo.android.ui.screens.AndroidViewModel
import org.koin.core.module.dsl.viewModel
import org.koin.dsl.module

val androidViewModelModule = module {
    viewModel { AndroidViewModel(get()) }
}