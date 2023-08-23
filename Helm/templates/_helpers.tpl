{{/*
Define a helper function to read and encode the contents of the .env file.
*/}}
{{- define "readEnvFile" -}}
{{- .Files.Get "files/.env" | b64enc | quote }}
{{- end }}
