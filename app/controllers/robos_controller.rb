# frozen_string_literal: true

class RobosController < ApplicationController
  def create
    place = params[:place]
    pla = place[0].split(',')
    x = pla[0][-1].to_i
    y = pla[1].to_i
    pace = pla[2]
    array = []

    place.each do |dir|
      if dir == 'LEFT' && pace == 'NORTH'
        pace = 'WEST'
      elsif dir == 'LEFT' && pace == 'EAST'
        pace = 'NORTH'
      elsif dir == 'LEFT' && pace == 'WEST'
        pace = 'SOUTH'
      elsif dir == 'LEFT' && pace == 'SOUTH'
        pace == 'EAST'
      elsif dir == 'RIGHT' && pace == 'NORTH'
        pace = 'EAST'
      elsif dir == 'RIGHT' && pace == 'EAST'
        pace = 'SOUTH'
      elsif dir == 'RIGHT' && pace == 'SOUTH'
        pace = 'WEST'
      elsif dir == 'RIGHT' && pace == 'WEST'
        pace = 'NORTH'

      elsif dir == 'MOVE' && pace == 'EAST'
        x += 1
      elsif dir == 'MOVE' && pace == 'SOUTH'
        y -= 1
      elsif dir == 'MOVE' && pace == 'WEST'
        x -= 1
      elsif dir == 'MOVE' && pace == 'NORTH'
        y += 1

      elsif dir == 'REPORT'
        array = [" #{x},#{y}, #{pace}"]
      end
    end
    output = if x > 4 || x.negative?
               'robo is fallen '
             elsif y.negative? || y > 4
               'robo is fallen'
             else
               array
             end

    render json: { locatio: output }
  end
end
