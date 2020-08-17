<p align="center">
	<strong>Github-Actions-Demo</strong>
</p>
<p align="center">
    <a href="https://github.com/xiaoka-li/GithubActions/actions">
      <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/xiaoka-li/GithubActions/Java%20CI">
    </a>
    <a href="https://github.com/xiaoka-li/GithubActions">
      <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/xiaoka-li/GithubActions?style=flat-square"/>
    </a>
    </a>
	<a href="https://codecov.io/gh/xiaoka-li/GithubActions">
      <img src="https://codecov.io/gh/xiaoka-li/GithubActions/branch/master/graph/badge.svg" />
    </a>
</p>

<hr>

### 构建流程
1. master分支触发
2. maven进行打包进行单元测试
3. 关联到codecov进行代码审查
4. 打包成docker镜像
5. push到DockerHub仓库
6. push到Github仓库
### 示例代码
```yaml
# This workflow will build a Java project with Maven
# For more information see: https://help.github.com/actions/language-and-framework-guides/building-and-testing-java-with-maven

name: Java CI
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Build with Maven
      run: mvn -B package --file pom.xml
    - name: Coverage Test
      uses: codecov/codecov-action@v1
      with:
        token: ${{ secrets.CODECOV }}
    - name: Build and tag image
      run: |
        docker build  -t "github-actions-docker:latest" .
    - name: Docker Push Image
      uses: docker/build-push-action@v1
      with:
        username: ${{ secrets.DOCKER_NAME }}
        password: ${{ secrets.DOCKER_PWD }}
        repository: xiaokas/github-action-demo
        tags: latest
    - name: Github Package Docker
      uses: Kolkies/githubpackages-docker@v1.0.4
      with:
        repo-token: ${{secrets.GITHUB_TOKEN}}
        image-name: "github-actions-docker"
```