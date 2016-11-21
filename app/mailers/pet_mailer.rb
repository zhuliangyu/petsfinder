class PetMailer < ApplicationMailer

  def notify_pet_owner(user)
    @user = user
    mail(to: @user.email, subject: 'You registered!')
  end

end
