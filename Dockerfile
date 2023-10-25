FROM node:alpine
WORKDIR /reactapp
COPY package*.json ./
RUN npm install 
# copying other code 
COPY . .
#Build command for reactjs app
RUN npm run build
#nginx image 
FROM nginx:alpine 
# copying artifactSs to nginxs web home folder/dir
COPY --from=build /reactapp/build /usr/share/nginx/index.js 
EXPOSE 80
#start the Nginx 
CMD ["nginx","-g","daemon off;"]

