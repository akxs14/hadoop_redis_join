# encoding: utf-8
Rubydoop.configure do |input_path, output_path|
  job 'collect_ids' do
    input input_path
    output output_path

    mapper CollectIDs::Mapper
    reducer CollectIDs::Reducer

    output_key Hadoop::Io::Text
    output_value Hadoop::Io::IntWritable
  end
end
