require 'ruley/engine'
require 'ruley/story'
require 'ruley/version'

module Ruley

  def self.config
    yield self if block_given?
    self
  end

  def self.stories=(stories)
    Ruley::Story.definitions = stories
    self
  end

end
