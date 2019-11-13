class Instrument < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items

  mount_uploader :image, ImageUploader
  serialize :image, JSON # If you use SQLite, add this line

  validates :titulo, :marca, :precio, :modelo, presence: true
  validates :descripcion, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :titulo, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :precio, length: { maximum: 7 }

  MARCA = %w{ Fender Gibson Gretsch ESP Martin }
  COLOR = %w{ Blanco Negro Café Gris }
  CONDICION = %w{ Nueva Excelente Buena Usada }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

end
