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
    ("✮", [
        ("USD", "United States Dollar"),
        ("EUR", "Euro"),
        ("GBP", "British Pound Sterling"),
        ("AUD", "Australian Dollar"),
        ("CAD", "Canadian Dollar"),
        ("DKK", "Danish Krone"),
        ]
    ),
    ("A", [
        ("AED", "United Arab Emirates Dirham"),
        ("AFN", "Afghan Afghani"),
        ("ALL", "Albanian Lek"),
        ("AMD", "Armenian Dram"),
        ("ANG", "Netherlands Antillean Guilder"),
        ("AOA", "Angolan Kwanza"),
        ("ARS", "Argentine Peso"),
        ("AUD", "Australian Dollar"),
        ("AWG", "Aruban Florin"),
        ("AZN", "Azerbaijani Manat")
        ]
    ),
    ("B", [
        ("BAM", "Bosnia-Herzegovina Convertible Mark"),
        ("BBD", "Barbadian Dollar"),
        ("BDT", "Bangladeshi Taka"),
        ("BGN", "Bulgarian Lev"),
        ("BHD", "Bahraini Dinar"),
        ("BIF", "Burundian Franc"),
        ("BMD", "Bermudan Dollar"),
        ("BND", "Brunei Dollar"),
        ("BOB", "Bolivian Boliviano"),
        ("BRL", "Brazilian Real"),
        ("BSD", "Bahamian Dollar"),
        ("BTN", "Bhutanese Ngultrum"),
        ("BWP", "Botswanan Pula"),
        ("BZD", "Belize Dollar")
        ]
    ),
    ("C", [
        ("CAD", "Canadian Dollar"),
        ("CDF", "Congolese Franc"),
        ("CHF", "Swiss Franc"),
        ("CLF", "Chilean Unit of Account UF"),
        ("CLP", "Chilean Peso"),
        ("CNH", "Chinese Yuan Offshore"),
        ("CNY", "Chinese Yuan"),
        ("COP", "Colombian Peso"),
        ("CUP", "Cuban Peso"),
        ("CVE", "Cape Verdean Escudo"),
        ("CZK", "Czech Republic Koruna")
        ]
    ),
    ("D", [
        ("DJF", "Djiboutian Franc"),
        ("DKK", "Danish Krone"),
        ("DOP", "Dominican Peso"),
        ("DZD", "Algerian Dinar")
        ]
    ),
    ("E", [
        ("EGP", "Egyptian Pound"),
        ("ERN", "Eritrean Nakfa"),
        ("ETB", "Ethiopian Birr"),
        ("EUR", "Euro")
        ]
    ),
    ("F", [
        ("FJD", "Fijian Dollar"),
        ("FKP", "Falkland Islands Pound")
        ]
    ),
    ("G", [
        ("GBP", "British Pound Sterling"),
        ("GEL", "Georgian Lari"),
        ("GHS", "Ghanaian Cedi"),
        ("GIP", "Gibraltar Pound"),
        ("GMD", "Gambian Dalasi"),
        ("GNF", "Guinean Franc"),
        ("GTQ", "Guatemalan Quetzal"),
        ("GYD", "Guyanaese Dollar")
        ]
    ),
    ("H", [
        ("HKD", "Hong Kong Dollar"),
        ("HNL", "Honduran Lempira"),
        ("HRK", "Croatian Kuna"),
        ("HTG", "Haitian Gourde"),
        ("HUF", "Hungarian Forint")
        ]
    ),
    ("I", [
        ("IDR", "Indonesian Rupiah"),
        ("ILS", "Israeli New Sheqel"),
        ("INR", "Indian Rupee"),
        ("IQD", "Iraqi Dinar"),
        ("IRR", "Iranian Rial"),
        ("ISK", "Icelandic Króna")
        ]
    ),
    ("J", [
        ("JEP", "Jersey Pound"),
        ("JMD", "Jamaican Dollar"),
        ("JOD", "Jordanian Dinar"),
        ("JPY", "Japanese Yen")
        ]
    ),
    ("K", [
        ("KES", "Kenyan Shilling"),
        ("KGS", "Kyrgystani Som"),
        ("KHR", "Cambodian Riel"),
        ("KMF", "Comorian Franc"),
        ("KPW", "North Korean Won"),
        ("KRW", "South Korean Won"),
        ("KWD", "Kuwaiti Dinar"),
        ("KYD", "Cayman Islands Dollar"),
        ("KZT", "Kazakhstani Tenge")
        ]
    ),
    ("L", [
        ("LAK", "Laotian Kip"),
        ("LBP", "Lebanese Pound"),
        ("LKR", "Sri Lankan Rupee"),
        ("LRD", "Liberian Dollar"),
        ("LSL", "Lesotho Loti"),
        ("LYD", "Libyan Dinar")
        ]
    ),
    ("M", [
        ("MAD", "Moroccan Dirham"),
        ("MDL", "Moldovan Leu"),
        ("MGA", "Malagasy Ariary"),
        ("MKD", "Macedonian Denar"),
        ("MMK", "Myanma Kyat"),
        ("MNT", "Mongolian Tugrik"),
        ("MOP", "Macanese Pataca"),
        ("MRO", "Mauritanian Ouguiya (pre-2018)"),
        ("MRU", "Mauritanian Ouguiya"),
        ("MUR", "Mauritian Rupee"),
        ("MVR", "Maldivian Rufiyaa"),
        ("MWK", "Malawian Kwacha"),
        ("MXN", "Mexican Peso"),
        ("MYR", "Malaysian Ringgit"),
        ("MZN", "Mozambican Metical")
        ]
    ),
    ("N", [
        ("NAD", "Namibian Dollar"),
        ("NGN", "Nigerian Naira"),
        ("NOK", "Norwegian Krone"),
        ("NPR", "Nepalese Rupee"),
        ("NZD", "New Zealand Dollar")
        ]
    ),
    ("O", [
        ("OMR", "Omani Rial")
        ]
    ),
    ("P", [
        ("PAB", "Panamanian Balboa"),
        ("PEN", "Peruvian Nuevo Sol"),
        ("PGK", "Papua New Guinean Kina"),
        ("PHP", "Philippine Peso"),
        ("PKR", "Pakistani Rupee"),
        ("PLN", "Polish Zloty"),
        ("PYG", "Paraguayan Guarani")
        ]
    ),
    ("Q", [
        ("QAR", "Qatari Rial")
        ]
    ),
    ("R", [
        ("RON", "Romanian Leu"),
        ("RSD", "Serbian Dinar"),
        ("RUB", "Russian Ruble"),
        ("RUR", "Old Russian Ruble"),
        ("RWF", "Rwandan Franc")
        ]
    ),
    ("S", [
        ("SAR", "Saudi Riyal"),
        //("SBDf", "Solomon Islands Dollar"),
        ("SCR", "Seychellois Rupee"),
        ("SDG", "Sudanese Pound"),
        ("SEK", "Swedish Krona"),
        ("SGD", "Singapore Dollar"),
        ("SHP", "Saint Helena Pound"),
        ("SLL", "Sierra Leonean Leone"),
        ("SOS", "Somali Shilling"),
        ("SRD", "Surinamese Dollar"),
        ("SYP", "Syrian Pound"),
        ("SZL", "Swazi Lilangeni")
        ]
    ),
    ("T", [
        ("THB", "Thai Baht"),
        ("TJS", "Tajikistani Somoni"),
        ("TMT", "Turkmenistani Manat"),
        ("TND", "Tunisian Dinar"),
        ("TOP", "Tongan Pa'anga"),
        ("TRY", "Turkish Lira"),
        ("TTD", "Trinidad and Tobago Dollar"),
        ("TWD", "New Taiwan Dollar"),
        ("TZS", "Tanzanian Shilling")
        ]
    ),
    ("U", [
        ("UAH", "Ukrainian Hryvnia"),
        ("UGX", "Ugandan Shilling"),
        ("USD", "United States Dollar"),
        ("UYU", "Uruguayan Peso"),
        ("UZS", "Uzbekistan Som")
        ]
    ),
    ("V", [
        ("VND", "Vietnamese Dong"),
        ("VUV", "Vanuatu Vatu")
        ]
    ),
    ("W", [
        ("WST", "Samoan Tala")
        ]
    ),
    ("X", [
        ("XAF", "CFA Franc BEAC"),
        ("XAG", "Silver Ounce"),
        ("XAU", "Gold Ounce"),
        ("XCD", "East Caribbean Dollar"),
        ("XDR", "Special Drawing Rights"),
        ("XOF", "CFA Franc BCEAO"),
        ("XPF", "CFP Franc")
        ]
    ),
    ("Y", [
        ("YER", "Yemeni Rial")
        ]
    ),
    ("Z", [
        ("ZAR", "South African Rand"),
        ("ZMW", "Zambian Kwacha"),
        ("ZWL", "Zimbabwean Dollar")
        ]
    )
]
