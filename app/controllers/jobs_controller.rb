class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def search
    keyword = params[:search][:keyword]

    response = HTTParty.get("https://www.104.com.tw/jobs/search/?keyword=#{keyword}")

    doc = Nokogiri::HTML(response.body)

    jobs = doc.css('.js-job-item')

    jobs.each do |job|
      title = job.css('.js-job-link').text.strip
      company = job.xpath('.//ul[@class="b-list-inline b-clearfix"]/li[2]').text.strip
      location = job.xpath('.//ul[@class="b-list-inline b-clearfix job-list-intro b-content"]/li[1]').text.strip

      Job.create(title: title, company: company, location: location)
    end

    redirect_to jobs_path
  end
end
