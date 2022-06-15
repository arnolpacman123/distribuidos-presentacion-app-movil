import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { DeviceEntity } from '../model/device.entity';
import { DeviceI } from '../model/device.interface';

@Injectable()
export class DeviceService {
  constructor(
    @InjectRepository(DeviceEntity)
    private readonly deviceRepository: Repository<DeviceEntity>,
  ) {}

  public async findAll(): Promise<DeviceI[]> {
    return await this.deviceRepository.find();
  }
}
