package users

import (
	"fmt"
)

type user struct {
	Userid        int    `db:"user_id"`
	Usertype      string `db:"user_type"`
	Parentid      int    `db:"parent_id"`
	Username      string `db:"username"`
	Password      string `db:"password"`
	Firstname     string `db:"first_name"`
	Lastname      string `db:"last_name"`
	Phone         int    `db:"phone"`
	Streetaddress string `db:"street_address"`
	city          string `db:"city"`
	state         string `db:"state"`
	zip           int    `db:"zip"`
}
type users []user

// GET ALL USERS
func (u users) getUsers() (users users, err error) {
	if err != nil {
		return users, fmt.Errorf("There was an error loading all users: %w ", err)
	}
	return users, nil
}

// GET USER BY ID
func (u user) getUser(uid int) (user user, err error) {
	if err != nil {
		return user, fmt.Errorf("There was an error loading the user: %w ", err)
	}
	return user, nil
}

// UPDATE USER BY ID
func (u user) updateUser() (user user, err error) {
	if err != nil {
		return user, fmt.Errorf("There was an error updating the user: %w ", err)
	}
	return user, nil
}

// DELETE USER BY ID
func (u user) delUser() (user user, err error) {
	if err != nil {
		return user, fmt.Errorf("There was an error deleting the user: %w ", err)
	}
	return user, nil
}
