# Guadaskate

Application creating for Guadalajara Skating World's 2018

## v0.1
In this release we are implementing the following requirements:

 - Navigation drawer (with mocked static data)
 - Internationalization support (No implementation)

## v1.0
In this release we are implementing the following requirements:
 - Corporative colors
 - Navigation drawer (with real static data)
 - Create final layout
 - Show information about pages and post
 - Push notifications from wp to app
 - No comments allowed in posts
 - Internationalization (App & Content)
 
## v2.0
In this release we are implementing the following requirements:
 - Social network. Allow users to:
	 - Create new threads
	 - Comment in threads
	 - Upload images
 - Twitter and Intagram feed read (from hashtags)

## Wordpress testing site
**hosting**: https://ccp.cloudaccess.net/clientarea.php

**wp site**: https://thisisatest.cloudaccess.host/

## DEV

### Internationalization

Commands to execute:

 - flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/src/lang/lang_localizations.dart
 - flutter pub pub run intl_translation:generate_from_arb lib/src/lang/sit_localizations.dart lib/l10n/*.arb --output-dir=lib/l10n

## TODO

 - Internationalizatoin
 - Pages layout
 - Social network
