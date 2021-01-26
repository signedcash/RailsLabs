# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Home Controller Class
class HomeController < ApplicationController
  before_action :check_params, only: %(output)

  XSLT_FILE = '/xslt_for_response.xslt'
  MAIN_SERV = 'http://localhost:3000'

  def input; end

  # rubocop:disable Security/Open
  def output
    response = Nokogiri::XML(URI.open("#{MAIN_SERV}/home/output?txt=#{params[:txt]}"))

    handle = params[:process]
    case handle
    when 'Сервер'
      render inline: transform_xml(response, "#{Rails.root}/public#{XSLT_FILE}")
    when 'Клиент'
      render xml: add_instr(response, XSLT_FILE)
    when 'Не обрабатывать'
      render xml: response
    end
  end
  # rubocop:enable Security/Open

  protected

  def check_params
    render :output unless Integer(params[:txt], exception: false)
  end

  def add_instr(doc, _href_xslt)
    ins = Nokogiri::XML::ProcessingInstruction
          .new(doc, 'xml-stylesheet', "type=\"text/xsl\" href=\"#{XSLT_FILE}\"")
    doc.root.add_previous_sibling ins
    doc
  end

  def transform_xml(doc, href_xslt)
    xslt = Nokogiri::XSLT(File.read(href_xslt))
    xslt.transform(doc)
  end
end
