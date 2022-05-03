class Order < ApplicationRecord
  include Slugable
  include AASM
  
  aasm column: "status" do 
    state :pending, initial: true
    state :paid, :cancelled, :failed

    event :pay do
      transitions from: [:pending, :failed], to: :paid
      after do
        puts "發送 SMS"
      end
    end

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :cancel do
      transitions from: [:pending, :paid, :failed], to: :canceled
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end

  belongs_to :resume
  belongs_to :user
end
