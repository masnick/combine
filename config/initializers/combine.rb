# Stripe credentials
Stripe.api_key = ENV['STRIPE_API'] || "ETPdHzvFZ1LFbwrIskXDLrZiudilJvig"
STRIPE_PUBLIC_KEY = ENV['STRIPE_API_PUBLIC'] || "pk_cD9uLyh2HOG7c2OA1lQBeqrmG1nvR"

# Stripe per-transaction percentage as a decimal (ignore the $0.30)
STRIPE_FEE = ENV['STRIPE_FEE'] ? ENV['STRIPE_FEE'] : 0.029

# Inserted in appropriate places throughout
BUSINESS_NAME = ENV['BUSINESS_NAME'] || "Cassava Labs, LLC"

# Email address provided for support
SUPPORT_EMAIL = ENV['SUPPORT_EMAIL'] || "team@cassavalabs.com"

# URL used in emails
APP_URL = ENV['APP_URL'] || "combine.dev"

# Default payment due time when creating an invoice
PAYMENT_TIME = 2.weeks