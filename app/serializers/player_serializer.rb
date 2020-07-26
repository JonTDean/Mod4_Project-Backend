class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :hp, :mp, :phys, :mag, :def, :res, :luck
end
