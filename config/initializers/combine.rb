Stripe.api_key = ENV['STRIPE_API'] || "ETPdHzvFZ1LFbwrIskXDLrZiudilJvig"
STRIPE_PUBLIC_KEY = ENV['STRIPE_API_PUBLIC'] || "pk_cD9uLyh2HOG7c2OA1lQBeqrmG1nvR"
STRIPE_FEE = ENV['STRIPE_FEE'] ? ENV['STRIPE_FEE'] : 0.029 # Stripe per-transaction percentage as a decimal (ignore the $0.30)
BUSINESS_NAME = ENV['BUSINESS_NAME'] || "Cassava Labs, LLC"
SUPPORT_EMAIL = ENV['SUPPORT_EMAIL'] || "team@cassavalabs.com"