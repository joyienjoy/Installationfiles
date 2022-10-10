STEPS:
You may run dnf if yum is not available:
     sudo dnf install -y nodejs

You may also need development tools to build native addons:
     sudo yum install gcc-c++ make

To install the Yarn package manager, run:

curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install yarn
