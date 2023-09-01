# frozen_string_literal: true

if Rails.env.development?
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.alert = false
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.honeybadger = false
    Bullet.raise = true
  end
elsif Rails.env.test?
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.alert = false
    Bullet.bullet_logger = false
    Bullet.console = false
    Bullet.rails_logger = false
    Bullet.honeybadger = false
    Bullet.raise = true
  end
end
