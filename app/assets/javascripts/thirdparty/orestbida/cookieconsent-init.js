// From https://cookieconsent.orestbida.com/essential/getting-started.html#usage

const cc = CookieConsent.init();

cc.run(
    // your config. goes here (required)
    {

        onConsent: function () {
            // consent was given
        },
    
        onChange: function () {
            // user changed his/her preferences
        },
    
        categories: {
            necessary: {
                enabled: true,  // this category is enabled by default
                readOnly: true  // this category cannot be disabled
            },
            analytics: {
                enabled: false,
                readOnly: false,
    
                // Delete specific cookies when the user opts-out of this category
                autoClear: {
                    cookies: [
                        {
                            name: /^_ga/,   // regex: match all cookies starting with '_ga'
                        },
                        {
                            name: '_gid',   // string: exact cookie name
                        }
                    ]
                }
            }
        },
    
        cookie: {
            expiresAfterDays: function(acceptType){
                if(acceptType === 'all') return 1000;
                return 182;
            }
        },

        language: {
            default: 'en',
    
            translations: {
                en: {
                    consentModal: {
                        title: 'We use cookies',
                        description: 'We only use necessary cookies to make our site work. We do not set any analytics or tracking cookies, and we will ask for your consent again if we ever want to set them.',
                        acceptAllBtn: 'OK'
                    },
                    preferencesModal: {
                        title: 'Manage cookie preferences',
                        acceptAllBtn: 'Accept all',
                        acceptNecessaryBtn: 'Reject all',
                        savePreferencesBtn: 'Accept current selection',
                        closeIconLabel: 'Close modal',
                        sections: [
                            {
                                title: 'Somebody said ... cookies?',
                                description: 'We use necessary cookies to make our site work. We would also like to set analytics cookies that help us make improvements by measuring how you use the site. These will be set only if you accept.'
                            },
                            {
                                title: 'Strictly Necessary and Functional cookies',
                                description: 'These cookies are essential for the proper functioning of the website and cannot be disabled.',
    
                                //this field will generate a toggle linked to the 'necessary' category
                                linkedCategory: 'necessary'
                            },
                            {
                                title: 'Performance and Analytics',
                                description: 'We would like to use Google Analytics to understand how to improve our website. We use Consent Mode so no cookies are set unless you consent to our use of Analytics cookies. All of the data is anonymized and cannot be used to identify you.',
                                linkedCategory: 'analytics'
                            },
                            {
                                title: 'More information',
                                description: 'For more information on our cookies and your choices, please see our <a href="/en/infos/cookie_policy">cookie policy</a> or our <a href="/en/infos/cookies">full list of cookies</a>'
                            }
                        ]
                    }
                }
            }
        }
    }    
);