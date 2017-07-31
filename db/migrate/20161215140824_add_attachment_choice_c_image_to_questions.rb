class AddAttachmentChoiceCImageToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :choice_c_image
    end
  end

  def self.down
    remove_attachment :questions, :choice_c_image
  end
end
