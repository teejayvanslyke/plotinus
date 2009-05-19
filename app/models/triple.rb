class Triple < ActiveRecord::Base

  belongs_to :subject, :class_name => 'Entity'
  belongs_to :object,  :class_name => 'Entity'

  belongs_to :predicate
  belongs_to :domain
  
  define_index do
    indexes subject.name,     :as => :subject_name
    indexes object.name,      :as => :object_name 
    indexes predicate.name,   :as => :predicate_name

    has subject.permalink,    :as => :subject_permalink
    has object.permalink,     :as => :object_permalink
  end

  def predicate_name
    predicate.name
  end

  def predicate_name=(predicate_name)
    self.predicate = Predicate.find_by_name(predicate_name) || Predicate.new(:name => predicate_name)
  end

  def subject_name
    subject.name
  end

  def subject_name=(subject_name)
    self.subject = Entity.find_by_name(subject_name) || Entity.new(:name => subject_name)
  end

  def object_name
    object.name
  end

  def object_name=(object_name)
    self.object = Entity.find_by_name(object_name) || Entity.new(:name => object_name)
  end

  def to_sentence
    "#{subject_name} #{predicate_name} #{object_name}."
  end

  def related_triples
    Triple.search("#{self.subject_name} | #{self.predicate_name} | #{self.object_name}", :match_mode => :extended)
  end

end
