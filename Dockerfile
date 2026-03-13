FROM opensearchproject/opensearch:3.5.0

RUN bin/opensearch-plugin install --batch analysis-icu analysis-kuromoji analysis-phonetic
