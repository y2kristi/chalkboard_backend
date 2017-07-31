class AddAttachmentChoiceDImageToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :choice_d_image
    end
  end

  def self.down
    remove_attachment :questions, :choice_d_image
  end
end
