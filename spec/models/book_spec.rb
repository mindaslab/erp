require 'spec_helper'

describe Book do
  it { should belong_to(:company) }
  it { should validate_presence_of(:name) }
end
