class Item < ActiveRecord::Base
  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :entry_id, :presence => true
  validates :amount, :presence => true

  belongs_to :category
  belongs_to :entry

  def self.to_csv
    attributes = %w{id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end

end
