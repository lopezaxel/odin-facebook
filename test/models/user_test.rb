require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "returns posts" do
    assert User.first.posts
  end

  test "returns comments" do
    assert User.first.comments
  end

  test "returns friends" do
    assert User.first.friends
  end

  test "returns friend requests" do
    assert User.first.friend_requests
  end

  test "returns likes" do
    assert User.first.likes
  end

  test "saves a correct user" do
    user = User.new(name: "Pepe Sanchez", email: "pepesanchez@correo.com", gender: "male", birthday: Date.today, password: "123456")
    assert user.save
  end

  test "can't save without a name" do
    user = User.new(email: "pepito@correo.com", gender: "male", birthday: Date.today, password: "123456")
    assert_not user.save
  end

  test "can't save without an email" do
    user = User.new(name: "Pepe Sanchez", gender: "male", birthday: Date.today, password: "123456")
    assert_not user.save
  end

  test "can't save without a birthday" do
    user = User.new(name: "Pepe Sanchez", email: "pepito@correo.com", gender: "male", password: "123456")
    assert_not user.save
  end

  test "can't save without a gender" do
    user = User.new(name: "Pepe Sanchez", email: "pepito@correo.com", birthday: Date.today, password: "123456")
    assert_not user.save
  end

  test "can't save without a password" do
    user = User.new(name: "Pepe Sanchez", email: "pepito@correo.com", birthday: Date.today, gender: "male")
    assert_not user.save
  end
end
