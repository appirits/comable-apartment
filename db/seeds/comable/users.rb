require 'highline/import'

def default_email
  'comable@example.com'
end

def default_password
  'password'
end

def ask_root_email
  if ENV['ROOT_EMAIL']
    ENV['ROOT_EMAIL']
  else
    ask("Email [#{default_email}]: ") do |q|
      q.echo = true
      q.whitespace = :strip
    end
  end.presence || default_email
end

def ask_root_password
  if ENV['ROOT_PASSWORD']
    ENV['ROOT_PASSWORD']
  else
    ask("Password [#{default_password}]: ") do |q|
      q.echo = false
      q.whitespace = :strip
    end
  end.presence || default_password
end

def create_root_user
  email = ask_root_email
  password = ask_root_password

  if Comable::User.where(email: email).exists?
    puts "WARNING: The email address has already existed: #{email}"
  else
    Comable::User.with_role(:root).new do |obj|
      obj.email = email
      obj.password = password
    end.save!
  end
end

if Comable::User.with_role(:root).exists?
  puts 'Root user has already been previously created.'
else
  create_root_user
end
