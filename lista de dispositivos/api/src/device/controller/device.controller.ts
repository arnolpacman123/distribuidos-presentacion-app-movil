import { Controller, Get } from '@nestjs/common';
import { DeviceI } from '../model/device.interface';
import { DeviceService } from '../service/device.service';

@Controller('devices')
export class DeviceController {
  constructor(private deviceService: DeviceService) {
    
  }

  @Get()
  async findAll(): Promise<DeviceI[]> {
    return this.deviceService.findAll();
  }
}
