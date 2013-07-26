#= require backbone/models/admin/card

describe 'Card', () ->
  it 'should be defined', () ->
    expect( Varkek.Admin.Models.Card ).toBeDefined()

describe 'CardCollection', () ->
  it 'should be defined', () ->
    expect( Varkek.Admin.Collections.CardCollection).toBeDefined()
