FROM node:18.18

WORKDIR /app

COPY . .

# not preffered to expose the database url in docker file as dockerfile is pushed to github
# ENV DATABASE_URL="postgresql://learn_owner:cah4y5gCorlk@ep-lively-pond-a1oxmfob.ap-southeast-1.aws.neon.tech/learn?sslmode=require"

RUN npm install
RUN npm run build
RUN npx prisma generate

EXPOSE 3000

CMD ["node", "dist/index.js"]