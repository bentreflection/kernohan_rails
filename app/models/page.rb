class Page < Snippet
  validates_presence_of :nav_title
  before_save :urlify_slug  
  belongs_to :image
  accepts_nested_attributes_for :image
  named_scope :nav_items, :conditions => {:nav_item => true}, :order => 'nav_position ASC'
  protected
  def urlify_slug
    self.slug = slug.gsub(/[^\w\/]|[!\(\)\.]+/, ' ').strip.downcase.gsub(/\ +/, '-')
  end
end