# encoding : utf-8

Money.locale_backend = :currency

MoneyRails.configure do |config|
  config.default_currency = :brl  # or :gbp, :usd, etc.
  # [...]
end
