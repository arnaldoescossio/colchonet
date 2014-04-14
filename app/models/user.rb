class User < ActiveRecord::Base
    EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  #EMAIL_REGEXP = /.*/

  validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validates_length_of :bio, minimum: 30, allow_blank: false
  validates_uniqueness_of :email

  # Essa validação pode ser representada da seguinte forma:
  # validates_format_of :email, with: EMAIL_REGEXP
  validate do
    errors.add(:email, :invalid) unless :email.match(EMAIL_REGEXP)
  end

=begin
  validates :email, presence: true,
            format: { with: /\A[^@]+@[^@\.]+\z/ },
            uniqueness: true

  Ainda é possível colocar múltiplos atributos na validação:
  validates :email, :full_name, :location, presence: true
=end

end