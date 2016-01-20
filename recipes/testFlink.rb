bash 'run_flink_test' do
  cwd "/tmp/streaming-benchmarks"
  user node[:streamingExperiment][:user]
  group node[:streamingExperiment][:group]
  code <<-EOM
    ./stream-bench.sh FLINK_TEST
  EOM
end
