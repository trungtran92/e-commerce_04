Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :google_oauth2, "137599430281-978r4n9bfte2n7i513anhcqe9aelv07e.apps.googleusercontent.com", "W-oXMjfOMVfXyc0xoTl3iiec", { scope: "email" }
  config.omniauth :facebook, "1481111758594390", "e39c8ed7754b4ddcf9372b42639db8c6", callback_url: "http://localhost:3000/users/auth/facebook/callback"
  config.omniauth :twitter, "tOei4uRuZi8djQSbHJYHa880s", "u8tKdft9TSQ8hKkrXHq3UfkKZU4lC19L3TdBSjweiJuytTlvYH"
end
