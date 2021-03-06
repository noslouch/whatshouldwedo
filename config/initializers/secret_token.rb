require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # use existing token
    File.read(token_file).chomp
  else
    # generate new token
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Whatsnext::Application.config.secret_key_base = secure_token
