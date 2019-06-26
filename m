Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg2ph-0001v0-2f
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 03:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39719)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg2pe-0001sm-Rz
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg2pd-0004sq-Pa
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg2pd-0004sQ-Jg
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so918273pfn.5
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 00:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0zwfrZJlxdbQyl8WOSwwjOIw8/aUFJ5nRNTQ7k14DRo=;
 b=PD3z6JDTCJyGwGyAiZGHVfuhbJD6WdSBZJ5WYRhkqJbhZpRn5Lw9Bj70jR3+1Lv8zp
 uTbZndxlPC7KS9E31NOBVJJWR8IKaXA6fxj5UmBN7vuDWG+BPCygVQY1OPnv2bHp9ul5
 VIB+IDw8GCmM8CiLueO8zLM7HNx84B5IU0mO8Ze2hVtQb8QLkNMyDZV5L5viJhKVBhtL
 U/MdNt5bKH2qrxMkZgrxX1Gz2j6bgJzrRIaYo3JNfTqiCXd5t9Ol7R6kQSlvf2lGS9gf
 mV8EWC0bCg3rXXPGBu5sBAM1b7VWeeuJyYwII+mjgUVf5YAZxw4iaqMqXFIx+EWUPOmI
 urjg==
X-Gm-Message-State: APjAAAUnShI0g50C/QVLV2QW70ixs4LR5IAlTwNPErEszJiPV45UE0Xz
 on8P/HnNVUocd8zk1WYI3XxsSwauXV27nOru
X-Google-Smtp-Source: APXvYqyR01nS/gZO1ChSG7McBHzUreq6FjXHGwXyWHefUwnUR0y4PLxoW1CvwTossJAK5apYYjSa6g==
X-Received: by 2002:a63:5d54:: with SMTP id o20mr1570807pgm.97.1561535944230; 
 Wed, 26 Jun 2019 00:59:04 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id k3sm15450599pgo.81.2019.06.26.00.59.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 00:59:03 -0700 (PDT)
Date: Wed, 26 Jun 2019 00:59:03 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 00:58:39 PDT (-0700)
In-Reply-To: <f0e0ab118a46b81351cfa833c13d0791d203de2d.camel@wdc.com>
CC: qemu-riscv@nongnu.org, bmeng.cn@gmail.com, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-3e4dd9ae-754c-4563-a19d-3dcfbcb9fcbf@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PATCH 2/2] riscv: sifive_u: Update the plic hart
 config to support multicore
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
X-List-Received-Date: Wed, 26 Jun 2019 07:59:08 -0000

On Fri, 17 May 2019 14:35:56 PDT (-0700), Alistair Francis wrote:
> On Fri, 2019-05-17 at 08:51 -0700, Bin Meng wrote:
>> At present the PLIC is instantiated to support only one hart, while
>> the machine allows at most 4 harts to be created. When more than 1
>> hart is configured, PLIC needs to instantiated to support multicore,
>> otherwise an SMP OS does not work.
>> 
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I got this one as well.

> 
> Alistair
> 
>> ---
>> 
>>  hw/riscv/sifive_u.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index e2120ac..a416d5d 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -344,6 +344,8 @@ static void
>> riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>      MemoryRegion *system_memory = get_system_memory();
>>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>      qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
>> +    char *plic_hart_config;
>> +    size_t plic_hart_config_len;
>>      int i;
>>      Error *err = NULL;
>>      NICInfo *nd = &nd_table[0];
>> @@ -357,9 +359,21 @@ static void
>> riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>      memory_region_add_subregion(system_memory,
>> memmap[SIFIVE_U_MROM].base,
>>                                  mask_rom);
>>  
>> +    /* create PLIC hart topology configuration string */
>> +    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
>> smp_cpus;
>> +    plic_hart_config = g_malloc0(plic_hart_config_len);
>> +    for (i = 0; i < smp_cpus; i++) {
>> +        if (i != 0) {
>> +            strncat(plic_hart_config, ",", plic_hart_config_len);
>> +        }
>> +        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
>> +                plic_hart_config_len);
>> +        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) +
>> 1);
>> +    }
>> +
>>      /* MMIO */
>>      s->plic = sifive_plic_create(memmap[SIFIVE_U_PLIC].base,
>> -        (char *)SIFIVE_U_PLIC_HART_CONFIG,
>> +        plic_hart_config,
>>          SIFIVE_U_PLIC_NUM_SOURCES,
>>          SIFIVE_U_PLIC_NUM_PRIORITIES,
>>          SIFIVE_U_PLIC_PRIORITY_BASE,

