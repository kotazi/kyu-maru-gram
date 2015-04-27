'use strict'

describe 'api.service', ->
  httpBackend = undefined

  beforeEach module('kyuMaruGram')
  beforeEach inject(($httpBackend) ->
    httpBackend = $httpBackend

    return
  )

  it 'should return correct userData.', inject((api) ->

    userData =      {
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

    httpBackend
      .when('JSONP', 'https://api.instagram.com/v1/users/self?callback=JSON_CALLBACK')
      .respond(userData)

    data = api.getSelfData()
    httpBackend.flush()

    expect(data.username).toEqual(userData.username)
    expect(data.website).toEqual(userData.website)
    expect(data.profile_picture).toEqual(userData.profile_picture)
  )


  return
