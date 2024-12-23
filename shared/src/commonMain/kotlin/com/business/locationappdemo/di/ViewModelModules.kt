package com.business.locationappdemo.di


import com.business.locationappdemo.viewModels.SharedViewModel
import org.koin.core.module.dsl.viewModel
import org.koin.dsl.module

val viewModelModule = module {
    viewModel { SharedViewModel(get()) }
}