package com.business.locationappdemo.di


import com.business.locationappdemo.data.datastore.repo.AuthLocaleRepo
import org.koin.core.module.Module
import org.koin.dsl.module

val localRepoModule : Module  = module{
    single { AuthLocaleRepo(get()) }
}