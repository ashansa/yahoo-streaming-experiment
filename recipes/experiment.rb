script 'run_experiment' do
  cwd "/tmp"
  user node['streamingExperiment']['user']
  group node['streamingExperiment']['group']
  
  interpreter "bash"
  user "root"
  code <<-EOM
    echo "yahoo streaming benchmark"
    apt-get install maven -y
    apt-get install leiningen -y
  EOM
end

script 'get_source' do
  cwd "/tmp"
  user node['streamingExperiment']['user']
  group node['streamingExperiment']['group']
  interpreter "bash"
  code <<-EOM
     wget https://s3-us-west-2.amazonaws.com/yahoo-stream-compiled/streaming-benchmarks.tgz
  EOM
end

script 'unpack_source' do
  cwd "/tmp"
  user node['streamingExperiment']['user']
  group node['streamingExperiment']['group']
  interpreter "bash"
  code <<-EOM
     tar -xvzf streaming-benchmarks.tgz
  EOM
end

file "/tmp/streaming-benchmarks/stream-bench.sh" do
  owner node[:streamingExperiment][:user]
  action :delete
end

template "/tmp/streaming-benchmarks/stream-bench.sh" do
    source "stream-bench.sh.erb"
    user node[:streamingExperiment][:user]
    group node[:streamingExperiment][:group]
    mode 0775
end

