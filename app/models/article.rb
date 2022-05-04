class Article < ApplicationRecord

  include Visible #metodo para incluir los estados archivado, publico, privado

  has_many :comments, dependent: :destroy #Un articulo puede tener muchos comentarios. si un articulo se distruye sus comentarios tambien
  validates :title, presence: true #Validacion (no puede ingresar un titulo en blanco)
  validates :body, presence: true, length: { minimum: 10 } 
  #Validacion (el cuerpo debe ser de un minimo de 10 caracteres)
end

