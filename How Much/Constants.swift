//
//  Constants.swift
//  How Much
//
//  Created by Gunnar Hafdal on 02/07/2018.
//  Copyright © 2018 Gunnar Hafdal. All rights reserved.
//

struct defaultsKeys {
    static let currencyRate = "currencyRate"
    static let timeWhenLastUpdated = "timeWhenLastUpdated"
    static let fromCurrency = "fromCurrency"
    static let toCurrency = "toCurrency"
}

var currencies: [(title: String, currencies: [(code: String, name: String)])] = [
    ("✓", []
    ),
    ("A", [
        ("AUD", "Australian Dollar")
        ]
    ),
    ("B", [
        
        ("BGN", "Bulgarian Lev"),
        ("BRL", "Brazilian Real")
        ]
    ),
    ("C", [
        ("CAD", "Canadian Dollar"),
        ("CHF", "Swiss Franc"),
        ("CNY", "Chinese Yuan"),
        ("CZK", "Czech Republic Koruna")
        ]
    ),
    ("D", [
        ("DKK", "Danish Krone")
        ]
    ),
    ("E", [
        ("EUR", "Euro")
        ]
    ),
    ("G", [
        ("GBP", "British Pound Sterling")
        ]
    ),
    ("H", [
        ("HKD", "Hong Kong Dollar"),
        ("HRK", "Croatian Kuna"),
        ("HUF", "Hungarian Forint")
        ]
    ),
    ("I", [
        ("IDR", "Indonesian Rupiah"),
        ("ILS", "Israeli New Sheqel"),
        ("INR", "Indian Rupee"),
        ("ISK", "Icelandic Króna")
        ]
    ),
    ("J", [
        ("JPY", "Japanese Yen")
        ]
    ),
    ("K", [
        ("KRW", "South Korean Won")
        ]
    ),
    ("M", [
        ("MXN", "Mexican Peso"),
        ("MYR", "Malaysian Ringgit")
        ]
    ),
    ("N", [
        ("NOK", "Norwegian Krone"),
        ("NZD", "New Zealand Dollar")
        ]
    ),
    ("P", [
        ("PHP", "Philippine Peso"),
        ("PLN", "Polish Zloty")
        ]
    ),
    ("R", [
        ("RON", "Romanian Leu"),
        ("RUB", "Russian Ruble")
        ]
    ),
    ("S", [
        ("SEK", "Swedish Krona"),
        ("SGD", "Singapore Dollar")
        ]
    ),
    ("T", [
        ("THB", "Thai Baht"),
        ("TRY", "Turkish Lira")
        ]
    ),
    ("U", [
        ("USD", "United States Dollar")
        ]
    ),
    ("Z", [
        ("ZAR", "South African Rand")
        ]
    )
]
