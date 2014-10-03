class AddFileColumnsToDocs < ActiveRecord::Migration
  def self.up
    add_attachment :docs, :file
  end

  def self.down
    remove_attachment :docs, :file
  end
end
