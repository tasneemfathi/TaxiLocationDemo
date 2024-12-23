package com.business.locationappdemo.utils.networking

enum class NetworkingError : Error {
    REQUEST_TIMEOUT,
    UNAUTHORIZED,
    ACCEPT_UNAUTHORIZED,
    CONFLICT,
    TOO_MANY_REQUESTS,
    NO_INTERNET,
    PAYLOAD_TOO_LARGE,
    SERVER_ERROR,
    SERIALIZATION,
    UNKNOWN;
}