Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hcQJz-0003rK-Uh
	for mharc-qemu-riscv@gnu.org; Sun, 16 Jun 2019 04:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hcQJx-0003oq-7T
 for qemu-riscv@nongnu.org; Sun, 16 Jun 2019 04:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hcQJw-0001bD-1z
 for qemu-riscv@nongnu.org; Sun, 16 Jun 2019 04:15:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39263)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hcQJv-0001aR-RY
 for qemu-riscv@nongnu.org; Sun, 16 Jun 2019 04:15:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so6018838wma.4
 for <qemu-riscv@nongnu.org>; Sun, 16 Jun 2019 01:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MAPTb1gHYmhUvkCjrnUgb2AR28xywHkPNE5DYPJmeQ0=;
 b=ecg+80GA18SxDayJS5s4ZX2lC/HOwERJEzB+DCcOCzhl7Wi2FF749hK54fc7AeGw27
 PipWOysXIBUjXl6MwA8Av+cR6UXCsqGNEkpRBVrenZkYmqLHiZFYv83SqMUbreoEPyZq
 UqN3KMusCPWw/Ee7dAQ17gUMzdxEDxjttd4QFtZ4yqAatSj71lHDk/3sZuuS7T2BhAr6
 G6KM42k+2XQSXzbYibIxO7Kn/JBjWJ+0pANVQSHwv9kWOhGwlS9AGuXdDJ0xudebKlTM
 wpP+HDrNfvpXlKr4qj5/cG0z1WO9x/p7OUGm7jwQGoDRsLIcFJipBKkZj7BJRjJCuKkl
 5YIw==
X-Gm-Message-State: APjAAAUA0oOKKzTDtnPhkv4IYvq6K5I5sJSguf+q12rUjKls1O159SKr
 8Dlx4Ohy338oRAMFXo9fY+wYiMYlXMhPQg==
X-Google-Smtp-Source: APXvYqxN9ew032ceUIPVjHSXKS4SRDC3ELzEoaozxSbZrexYbRdTVyCQE8cHHEmYjsh0D79d67TKSQ==
X-Received: by 2002:a1c:44d7:: with SMTP id
 r206mr14702954wma.164.1560672921844; 
 Sun, 16 Jun 2019 01:15:21 -0700 (PDT)
Received: from localhost ([83.137.6.189])
 by smtp.gmail.com with ESMTPSA id d3sm21324189wrf.87.2019.06.16.01.15.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 01:15:21 -0700 (PDT)
Date: Sun, 16 Jun 2019 01:15:21 -0700 (PDT)
X-Google-Original-Date: Sun, 16 Jun 2019 01:07:34 PDT (-0700)
In-Reply-To: <13fe08a2-c89c-b015-3799-067e0f04bfd3@redhat.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: philmd@redhat.com
Message-ID: <mhng-fb0f4eaf-5e38-4e66-958a-9942273b48c3@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Fix a memory leak
 when realizing a sifive_e
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Jun 2019 08:15:26 -0000

On Fri, 14 Jun 2019 05:25:50 PDT (-0700), philmd@redhat.com wrote:
> On 6/14/19 2:08 PM, Palmer Dabbelt wrote:
>> Coverity pointed out a memory leak in riscv_sifive_e_soc_realize(),
>> where a pair of recently added MemoryRegion instances would not be freed
>> if there were errors elsewhere in the function.  The fix here is to
>> simply not use dynamic allocation for these instances: there's always
>> one of each in SiFiveESoCState, so instead we just include them within
>> the struct.
>>
>> Thanks to Peter for pointing out the bug and suggesting the fix!
>
> a.k.a. Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>
> Maybe the thanks can go below the '---' tag, so it doesn't stay in the
> git history.

Works for me.

>
>>
>> Fixes: 30efbf330a45 ("SiFive RISC-V GPIO Device")
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

>
>> ---
>>  hw/riscv/sifive_e.c         | 12 +++++-------
>>  include/hw/riscv/sifive_e.h |  2 ++
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index 80ac56fa7d5e..83375afcd1d6 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -158,17 +158,15 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>
>>      SiFiveESoCState *s = RISCV_E_SOC(dev);
>>      MemoryRegion *sys_mem = get_system_memory();
>> -    MemoryRegion *xip_mem = g_new(MemoryRegion, 1);
>> -    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>
>>      object_property_set_bool(OBJECT(&s->cpus), true, "realized",
>>                              &error_abort);
>>
>>      /* Mask ROM */
>> -    memory_region_init_rom(mask_rom, NULL, "riscv.sifive.e.mrom",
>> +    memory_region_init_rom(&s->mask_rom, NULL, "riscv.sifive.e.mrom",
>>          memmap[SIFIVE_E_MROM].size, &error_fatal);
>>      memory_region_add_subregion(sys_mem,
>> -        memmap[SIFIVE_E_MROM].base, mask_rom);
>> +        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
>>
>>      /* MMIO */
>>      s->plic = sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
>> @@ -228,10 +226,10 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>          memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
>>
>>      /* Flash memory */
>> -    memory_region_init_ram(xip_mem, NULL, "riscv.sifive.e.xip",
>> +    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
>>          memmap[SIFIVE_E_XIP].size, &error_fatal);
>> -    memory_region_set_readonly(xip_mem, true);
>> -    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base, xip_mem);
>> +    memory_region_set_readonly(&s->xip_mem, true);
>> +    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base, &s->xip_mem);
>>  }
>>
>>  static void riscv_sifive_e_machine_init(MachineClass *mc)
>> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
>> index 3b14eb74621f..d175b24cb209 100644
>> --- a/include/hw/riscv/sifive_e.h
>> +++ b/include/hw/riscv/sifive_e.h
>> @@ -33,6 +33,8 @@ typedef struct SiFiveESoCState {
>>      RISCVHartArrayState cpus;
>>      DeviceState *plic;
>>      SIFIVEGPIOState gpio;
>> +    MemoryRegion xip_mem;
>> +    MemoryRegion mask_rom;
>>  } SiFiveESoCState;
>>
>>  typedef struct SiFiveEState {
>>

