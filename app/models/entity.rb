class Entity < ActiveRecord::Base

  has_permalink :name

  def to_param; permalink; end

  has_many :triples_as_subject, :class_name => 'Triple', :foreign_key => 'subject_id'
  has_many :triples_as_object,  :class_name => 'Triple', :foreign_key => 'object_id'

  def triples
    triples_as_subject + triples_as_object
  end

end
