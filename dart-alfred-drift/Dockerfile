FROM dart:stable as build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/dart_alfred_drift.dart -o ./dart_alfred_drift

# ---

FROM scratch

COPY --from=build /runtime/ /
COPY --from=build /app/dart_alfred_drift /dart_alfred_drift

EXPOSE 8080
ENTRYPOINT ["/dart_alfred_drift"]
