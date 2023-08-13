class ModifyController < ApplicationController
  def edit
    @response = params[:response]
  end

  def update
    # Process the modification request and update the response accordingly
    modified_prompt = build_modified_prompt(params)
    @response = OpenaiService.new(modified_prompt).call

    redirect_to response_page_path(response: CGI.escape(@response))
  end

  private

  def build_modified_prompt(params)
    modification_request = params[:modification_request]
    response = params[:response]

    modified_prompt = "Here is the message I want to modify: #{CGI.unescape(response)}. Now I want to make a modification based on the following information. #{modification_request}"

    Rails.logger.debug("Built modified prompt: #{modified_prompt}")

    modified_prompt
  end
end
