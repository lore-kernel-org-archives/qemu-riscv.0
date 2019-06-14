Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbl2R-0002dg-9J
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 08:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbl2M-0002Zg-Lq
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbl2K-0003uh-2m
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbl2J-0003h6-HE
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 08:10:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id c66so2114490wmf.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 05:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HHmxPOXC/7BCycsETxDS9BYLXUGEb3sRUYUuk8X8HLk=;
 b=cAYLUqUFOlMKmpjn6ocLISdCrIl+ctArjWw8XmeS4e+HOnbjwkn3Mlw/wBFE09nZvK
 4pCiFmOvsY939Piol4ULPZvFT0r3TharTGeQjQadAgNIAd+FwsQnLL2r4osZavQ8MWY3
 jEUDo6ueoJG2XkBH0Hwbhxbon1HMNihaCcti0AnXNPibR+uM44z3HuREH8+EARLDriH0
 BT3OClERfzVJHaR11i66Z134mlDv+V0CwUdm5vWufO0AO+NrRtnRNmFd6zN9Ua5OjuRW
 lraXiu0KUo2mzF/RgrbTOYE9qZR4TaZhsqZbnprMLU6hBY6DsBTu5iNXPVXd3xDvOB1F
 uhOA==
X-Gm-Message-State: APjAAAV18pT9XLl3PfnLdwqrRvsO8HoK+LpN8HMPak3jnXggTqbrV15D
 LxEknJuI1YpSy550B93iPlVKTP6r/je6gw==
X-Google-Smtp-Source: APXvYqzW/Brcm6Lo8qlf2hPmdiAbiy/SJaKDnrPS0BUy97rjS7rGcXAhPBAa5tTwUZiBNMXF9BX1xw==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr7744690wmt.57.1560514212594; 
 Fri, 14 Jun 2019 05:10:12 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id p3sm4394672wrd.47.2019.06.14.05.10.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 05:10:12 -0700 (PDT)
Date: Fri, 14 Jun 2019 05:10:12 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jun 2019 05:09:48 PDT (-0700)
In-Reply-To: <CAFEAcA-01sahAvfLRoe3e9RfCcgmk4+Ubceufg9hhmwQAFpbRQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, chouteau@adacore.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-1958cec5-7d9d-483b-bb14-72e53bbde47f@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [PULL 01/29] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Fri, 14 Jun 2019 12:10:32 -0000

On Thu, 30 May 2019 03:57:12 PDT (-0700), Peter Maydell wrote:
> On Sun, 26 May 2019 at 02:10, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> From: Fabien Chouteau <chouteau@adacore.com>
>>
>> QEMU model of the GPIO device on the SiFive E300 series SOCs.
>>
>> The pins are not used by a board definition yet, however this
>> implementation can already be used to trigger GPIO interrupts from the
>> software by configuring a pin as both output and input.
>>
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Hi; this patch causes Coverity to complain about a memory
> leak (CID 1401707):
>
>>  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>  {
>>      const struct MemmapEntry *memmap = sifive_e_memmap;
>> +    Error *err = NULL;
>>
>>      SiFiveESoCState *s = RISCV_E_SOC(dev);
>>      MemoryRegion *sys_mem = get_system_memory();
>> @@ -184,8 +188,28 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
>>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
>>      sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
>> -    sifive_mmio_emulate(sys_mem, "riscv.sifive.e.gpio0",
>> -        memmap[SIFIVE_E_GPIO0].base, memmap[SIFIVE_E_GPIO0].size);
>> +
>> +    /* GPIO */
>> +
>> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>
> This function allocated xip_mem and mask_rom via g_new() but
> then this error-exit doesn't free them.
>
> The best way to fix this is to stop doing separate memory
> allocations at all -- instead just have fields in the
> SiFiveESoCState struct
>    MemoryRegion xip_mem;
>    Memory_Region mask_rom;
>
> and pass &s->xip_mem etc where currently the code uses xip_mem.

Sorry this took a while to fix, I've just sent a patch to fix the memory leak.

