import { Injectable } from '@nestjs/common';
import { faker } from '@faker-js/faker';

@Injectable()
export class AppService {
  async getHello(): Promise<string> {
    return await new Promise<string>((resolve) => {
      setTimeout(() => {
        resolve(`Hello World! ${faker.person.firstName()}`);
      }, 3000);
    });
  }
}
