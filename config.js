module.exports = {
	"db": {
		"client": "mysql",
		"connection":
		{
			"host": "localhost",
			"user": "master_slithery",
			"password": "HRmz7JdY",
			"database": "eventure_db",
			"charset": "utf8",
		}
	},
	"passport" : {
		"secret"       : "7H1515S053Cr37tH4TN080DYw1lL6E7TH1s",
		"facebookAuth"     : {
				"clientID"       : "1110391179042316",
	      "clientSecret"   : "f5a4a19efd10ddf31ac5d4f5542fd319",
	      "callbackURL"    : "http://localhost:9000/auth/facebook/callback",
		},
		"twitterAuth"      : {
				"consumerKey"    : "your-consumer-key-here",
	      "consumerSecret" : "your-client-secret-here",
	      "callbackURL"    : "http://localhost:9000/auth/twitter/callback",
		},
		"googleAuth"       : {
				"clientID"       : "your-secret-clientID-here",
	      "clientSecret"   : "your-client-secret-here",
	      "callbackURL"    : "http://localhost:9000/auth/google/callback",
		}
	},
	"jwt" : {
		"secret" : "Ul71M4tePoW3R0F76R3AT3573veR"
	}
};
