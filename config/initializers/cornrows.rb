Stripe.api_key = ENV['STRIPE_API'] || "1lMkTGRDtLPBL50Q3j6UaIFQgCN5auzc"
STRIPE_PUBLIC_KEY = ENV['STRIPE_API_PUBLIC'] || "pk_6a4NM4z8RKKGHWPlOHQfhlZlKtakp"
STRIPE_FEE = ENV['STRIPE_FEE'].to_f || 0.029 # Stripe per-transaction percentage as a decimal (ignore the $0.30)
BUSINESS_NAME = ENV['BUSINESS_NAME'] || "Cassava Labs, LLC"
SUPPORT_EMAIL = ENV['SUPPORT_EMAIL'] || "team@cassavalabs.com"