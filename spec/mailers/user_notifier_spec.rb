# require "rails_helper"
#
# RSpec.describe UserNotifier, :type => :mailer do
#   describe "activated" do
#     let(:mail) { UserNotifier.activated }
#
#     it "renders the headers" do
#       expect(mail.subject).to eq("Activated")
#       expect(mail.to).to eq(["to@example.org"])
#       expect(mail.from).to eq(["from@example.com"])
#     end
#
#     it "renders the body" do
#       expect(mail.body.encoded).to match("Hi")
#     end
#   end
#
#   describe "suspended" do
#     let(:mail) { UserNotifier.suspended }
#
#     it "renders the headers" do
#       expect(mail.subject).to eq("Suspended")
#       expect(mail.to).to eq(["to@example.org"])
#       expect(mail.from).to eq(["from@example.com"])
#     end
#
#     it "renders the body" do
#       expect(mail.body.encoded).to match("Hi")
#     end
#   end
#
# end
