class AddAttachmentImageSolutionToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :image_solution
    end
  end

  def self.down
    remove_attachment :questions, :image_solution
  end
end
