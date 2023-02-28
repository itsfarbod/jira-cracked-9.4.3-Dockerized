FROM debian:11
WORKDIR /
COPY ./atlassian-jira-software-9.4.3-x64.bin /
COPY ./answers.txt /
RUN apt update && apt upgrade -y
RUN sh ./atlassian-jira-software-9.4.3-x64.bin < answers.txt
COPY ./atlassian-agent.jar /opt/atlassian/jira/atlassian-agent.jar
RUN rm -f /opt/atlassian/jira/bin/setenv.sh
COPY ./setenv.sh /opt/atlassian/jira/bin/setenv.sh
CMD ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]
