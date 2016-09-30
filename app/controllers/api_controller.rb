class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  def on

    code = params[:code]
    unit = Unit.find_by_code(code)
    if unit
      unit.on
      resp = {"response" => "ok"}
    else
      resp = {"response" => "error", "message" => "Code not found"}
    end
    respond_to do |format|
      format.json { render :json => resp.to_json }
    end
  end

  def off
    code = params[:code]
    unit = Unit.find_by_code(code)
    if unit
      unit.off
      resp = {"response" => "ok"}
    else
      resp = {"response" => "error", "message" => "Code not found"}
    end

    respond_to do |format|
      format.json { render :json => resp.to_json }
    end
  end

  protected

    def json_request?
      request.format.json?
    end
end
