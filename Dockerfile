# Goの公式イメージを使用
FROM golang:1.20 AS build

WORKDIR /app

# アプリのソースコードをコピー
COPY . .

# バイナリをビルド
ENV GO111MODULE=off
ENV CGO_ENABLED=0
RUN go build -v -o server main.go

# ランタイム用の軽量イメージ（distrolessなど）にコピー
FROM gcr.io/distroless/base-debian10

# ポートを明示
EXPOSE 8080

# バイナリを /app/server に配置
COPY --from=build /app/server /app/server

# 実行コマンドを設定
CMD ["/app/server"]