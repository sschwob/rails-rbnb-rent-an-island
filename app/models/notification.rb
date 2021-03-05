class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  def self.number_unread(current_user)
    count_islands_notif_unread(current_user) + count_bookings_notif_unread(current_user)
  end

  private

  def self.count_islands_notif_unread(current_user)
    @count_islands_notif = 0
    islands = current_user.islands
    islands.each do |island|
      island.bookings.each do |booking|
        unless booking.notification.owner_answer
          @count_islands_notif += 1
        end
      end
    end
    return @count_islands_notif
  end

  def self.count_bookings_notif_unread(current_user)
    Notification.where(user: current_user, to_read: true).count 
  end

end
