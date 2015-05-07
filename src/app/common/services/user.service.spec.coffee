'use strict'

describe 'user.service', ->
  scope = undefined

  userData = {
    "username": "kotazi00",
    "bio": "",
    "website": "http://kotazi.com",
    "profile_picture": "https://igcdn-photos-g-a.akamaihd.net/hphotos-ak-xpa1/t51.2885-19/1538500_770312479710878_1172916184_a.jpg",
    "full_name": "kotazi",
    "counts": {
      "media": 95,
      "followed_by": 125,
      "follows": 170
    },
    "id": "13712342"
  }

  beforeEach module('ohshimagram')

  it 'should return null, when initialize.', inject((User) ->
    expect(User.get()).toBeNull()
  )

  it 'should return userData, after setting.', inject((User) ->
    User.set(userData)

    data = User.get()
    expect(data.username).toEqual(userData.username)
    expect(data.website).toEqual(userData.website)
    expect(data.profile_picture).toEqual(userData.profile_picture)
    expect(data.counts).toBe(userData.counts)
  )

  return
