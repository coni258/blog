class Comment < ApplicationRecord

  include Visible #metodo para incluir los estados archivado, publico, privado

  belongs_to :article #pertenece a articulos

end
