Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8FED69108
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 13:08:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGeEz-0001Ta-Rm; Thu, 28 Nov 2024 08:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGeEs-0001Sx-Tt
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 08:07:24 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGeEl-0006NS-Va
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 08:07:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-212884028a3so5402595ad.0
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732799234; x=1733404034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dpaRP1FK3GFDdZ1Xraj3M8knnV+25CMqr5GGhebrHQ=;
 b=G4bZqBUGl98uTydCKbX1GetS/7CzqtPHcan3rA033WXdpNO8CU0jSVpdYLcO6rZXOi
 oA7EzbKtHNmp0x7Yhi+mHbzGDt5xVn0oODwFIe2chbsZUNODybRenvj7t2yVTa6bOnIn
 /eolp18bFq0G61S1EhxTzOXLlXL9xocjEnp0CjRhFGIK6saueoCGDQl++DkrOwNVPw6h
 gc5jLZCQNu42K7fV/n8gLAGx/Cjx1mZsqmMh96MTvnhd1iFcKtvWfR2PSG4iMvOpTbIE
 iS4aQvjX9DEglos140a5GkwfAYisHvIutKOOAIQMqaYaaiouDEynl3oUXRd9CS9g1Lqs
 eFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732799234; x=1733404034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dpaRP1FK3GFDdZ1Xraj3M8knnV+25CMqr5GGhebrHQ=;
 b=AzD6/IcJWZ8bHJVHQTFRQiOQI1Zacx3CpyXbhgdRbcmLxnibtOFPMxhLa6IeffNC4D
 dsg0qvjlduZX20hnHxrH+/gc7Hq53EyaC5wySMpTeD0GywQbnj7Q8EX/G7QVO1q7U0HS
 fLIGz+1tkloDPnz5Lflh2jjOeOe8tF4CvM7HZpn4pJ6nIjCB6TW5TTSEq1qTNuwCSqV9
 gCNLHOJKmbIjfjlAyN3zxKHnNwJ+dDagwgbzpaa4q0YfvCwoWbGBOPHfOycOVx0f43hO
 4snc7k8GPGktDNTVqAilmuP7F9mA7iyBTWmZmDIGT7P633Vv7uTa4MA2mJpWjElTXkBV
 wnww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+EbZo1LNjCbUhHuyQibKs3XVMi+ewTgEI3JVKcRqxJSHxxQw6UVE9sUBwBAJg0tMip4XaZy1Wz5rH@nongnu.org
X-Gm-Message-State: AOJu0Yz+7SaO7S6hG+qsWZgibf6hnqrHpwaJkUnOK0G5NWT+YqaTtiJJ
 PKH0ArO0bOW4KMyz82j2tJpv6Wj40muS3cxY2aJCpPzPQDCFu5ZOht8lxRwoZTk=
X-Gm-Gg: ASbGncuJ/X5iGBfultW5m++U/4vi8lgGJF+534ql6vPqvPtWDHYljYAiSxM/xfNXOtm
 hLi/0KlGF4pOHAMfFGgnVolv5lSV6Lcamj0aEdVw3HZtb8GUqaZb5An46tYDoDVMFnwviHNerGB
 bgOixEraSBiSKmRlzbxJ7j0kyxzOGZDg5byg8x4WeS97f1TfhXR3duozAEB03z7p/F8hEnzgK/u
 kAPr2PI4usVAINKesp1+PFeFCZ12VzCi0YrZvBKDWYoDIm+lt5W02iAy3jZ6rE=
X-Google-Smtp-Source: AGHT+IEwbPbXZhMMFrv3tFifwjQcz3r/PRnf7sUcD1EvADC6myQwAwi1+/rxQqt2Wcj1BEQhtDovuA==
X-Received: by 2002:a17:902:f541:b0:20c:5d5a:af6f with SMTP id
 d9443c01a7336-2151d300374mr56843145ad.10.1732799234518; 
 Thu, 28 Nov 2024 05:07:14 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215219059fesm12907425ad.68.2024.11.28.05.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 05:07:14 -0800 (PST)
Message-ID: <88cf1e67-eab9-45d3-b2e9-a42b5b58a364@ventanamicro.com>
Date: Thu, 28 Nov 2024 10:07:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] hw/riscv: Support to load DTB after 3GB memory on
 64-bit system.
To: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20241120153935.24706-1-jim.shu@sifive.com>
 <20241120153935.24706-2-jim.shu@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241120153935.24706-2-jim.shu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 11/20/24 12:39 PM, Jim Shu wrote:
> Larger initrd image will overlap the DTB at 3GB address. Since 64-bit
> system doesn't have 32-bit addressable issue, we just load DTB to the end
> of dram in 64-bit system.
> 
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/boot.c            | 14 +++++++++-----
>   hw/riscv/microchip_pfsoc.c |  4 ++--
>   hw/riscv/sifive_u.c        |  4 ++--
>   hw/riscv/spike.c           |  4 ++--
>   hw/riscv/virt.c            |  2 +-
>   include/hw/riscv/boot.h    |  2 +-
>   6 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2e319168db..d36d3a7104 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -293,7 +293,7 @@ out:
>    * The FDT is fdt_packed() during the calculation.
>    */
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> -                                MachineState *ms)
> +                                MachineState *ms, RISCVHartArrayState *harts)
>   {
>       int ret = fdt_pack(ms->fdt);
>       hwaddr dram_end, temp;
> @@ -317,11 +317,15 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
>   
>       /*
>        * We should put fdt as far as possible to avoid kernel/initrd overwriting
> -     * its content. But it should be addressable by 32 bit system as well.
> -     * Thus, put it at an 2MB aligned address that less than fdt size from the
> -     * end of dram or 3GB whichever is lesser.
> +     * its content. But it should be addressable by 32 bit system as well in RV32.
> +     * Thus, put it near to the end of dram in RV64, and put it near to the end
> +     * of dram or 3GB whichever is lesser in RV32.
>        */
> -    temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> +    if (!riscv_is_32bit(harts)) {
> +        temp = dram_end;
> +    } else {
> +        temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> +    }
>   
>       return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>   }
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index f9a3b43d2e..ba8b0a2c26 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -519,7 +519,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>       bool kernel_as_payload = false;
>       target_ulong firmware_end_addr, kernel_start_addr;
>       uint64_t kernel_entry;
> -    uint32_t fdt_load_addr;
> +    uint64_t fdt_load_addr;
>       DriveInfo *dinfo = drive_get(IF_SD, 0, 0);
>   
>       /* Sanity check on RAM size */
> @@ -625,7 +625,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>           /* Compute the fdt load address in dram */
>           fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>                                                  memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> -                                               machine);
> +                                               machine, &s->soc.u_cpus);
>           riscv_load_fdt(fdt_load_addr, machine->fdt);
>   
>           /* Load the reset vector */
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index c5e74126b1..05467e833a 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -519,7 +519,7 @@ static void sifive_u_machine_init(MachineState *machine)
>       const char *firmware_name;
>       uint32_t start_addr_hi32 = 0x00000000;
>       int i;
> -    uint32_t fdt_load_addr;
> +    uint64_t fdt_load_addr;
>       uint64_t kernel_entry;
>       DriveInfo *dinfo;
>       BlockBackend *blk;
> @@ -606,7 +606,7 @@ static void sifive_u_machine_init(MachineState *machine)
>   
>       fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
>                                              memmap[SIFIVE_U_DEV_DRAM].size,
> -                                           machine);
> +                                           machine, &s->soc.u_cpus);
>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>   
>       if (!riscv_is_32bit(&s->soc.u_cpus)) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index fceb91d946..acd7ab1ae1 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -201,7 +201,7 @@ static void spike_board_init(MachineState *machine)
>       hwaddr firmware_load_addr = memmap[SPIKE_DRAM].base;
>       target_ulong kernel_start_addr;
>       char *firmware_name;
> -    uint32_t fdt_load_addr;
> +    uint64_t fdt_load_addr;
>       uint64_t kernel_entry;
>       char *soc_name;
>       int i, base_hartid, hart_count;
> @@ -317,7 +317,7 @@ static void spike_board_init(MachineState *machine)
>   
>       fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
>                                              memmap[SPIKE_DRAM].size,
> -                                           machine);
> +                                           machine, &s->soc[0]);
>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>   
>       /* load the reset vector */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 45a8c4f819..761bce3304 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1424,7 +1424,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>   
>       fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>                                              memmap[VIRT_DRAM].size,
> -                                           machine);
> +                                           machine, &s->soc[0]);
>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>   
>       /* load the reset vector */
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f778b560de..34a80c5ff4 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -49,7 +49,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                  bool load_initrd,
>                                  symbol_fn_t sym_cb);
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
> -                                MachineState *ms);
> +                                MachineState *ms, RISCVHartArrayState *harts);
>   void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                  hwaddr saddr,


