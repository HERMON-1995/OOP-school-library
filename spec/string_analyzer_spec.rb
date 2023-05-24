describe 'An example of the equality Matchers' do
  it 'should show how the equality Matchers work' do
    a = 'test string'
    b = a

    # The following Expectations will all pass
    expect(a).to eq 'test string'
    expect(a).to eql 'test string'
    expect(a).to be b
    expect(a).to equal b
  end
end
