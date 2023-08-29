class Contact < ApplicationRecord
  validates :first_name, :last_name, :fonction, :firm, :subject, presence: true
  # validates :message, presence: true LENGTH
  validates_email_format_of :email, message: "ne semble pas être une adresse valide."
  validates :message, length: { minimum: 10, maximum: 1000, too_short: "doit faire au moins %{count} caractères.", too_long: "doit faire au maximum %{count} caractères." }
end
