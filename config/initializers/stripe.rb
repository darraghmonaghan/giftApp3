
# Rails.configuration.stripe = {
#   :publishable_key => ENV['stripe_publishable_key'],
#   :secret_key      => ENV['stripe_secret_key']
# }




if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV[ 'STRIPE_PUBLISHABLE_KEY' ],
    secret_key:      ENV[ 'STRIPE_SECRET_KEY' ]
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_7Xrz5QNBAV1vJCf3hRMBEtKS',
    secret_key:      'sk_test_vGMPaW1vKvvvu5KFZzazu4rQ'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]