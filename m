Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdTkT-0003iw-3h
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTkQ-0003hN-8w
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTkM-0003G4-9M
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 04:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i4uo4X8/KeEcW+kiLaeK3kYzS+ZjsIEI0o6acD5tpE8=;
 b=JIYxSC8IidgRkebTCo8aLmCi3z5RH9b/nTbWQkwhztWciInDy7RTVAKt0m9ZMuSxU6xo7c
 hJymYGUa2KFX/43lW7pW/Uu9jL26uC5hCFKQasJ99VBL5Vb7cOqcAFzgBsCOgCtrRjrrDI
 kIeuNTul+NDB+vFrpl3kwwx8zmt4U2U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-DhClodLnP-mhRe1iwpYdMQ-1; Thu, 21 Oct 2021 04:48:20 -0400
X-MC-Unique: DhClodLnP-mhRe1iwpYdMQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so23598334edl.5
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 01:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4uo4X8/KeEcW+kiLaeK3kYzS+ZjsIEI0o6acD5tpE8=;
 b=UowWBUflf3XkcUK0hsPjFz1qtBMJm5Nx5y/+DvUDWy51DgnlsY7LV5vzQk0L3A/3Cv
 8EofnsS+tK8/em2Dub72guab3bDv1dX4CB5vuTOVb5Ol8deOEaLy1kXc4zGuyt/1SuSz
 ds4P/voA3iUuYx4BAqUru9bkyjK5cYf7JfIFHfwn8I5GfSpvZBanuZe57TADemSbPUdJ
 g1vvQzaDqLNC1xkgnbfWj+MxNxntV1hO/grCoMvhxkuWw2olhRRSYxQg9/jDfb4Thz13
 HeXbTibn7TGdss+zIZmTGMK5Nly9rI+urGCMZyGyVUxU9JsuiMjIxvaAjiqKjKKFsbuU
 q1vg==
X-Gm-Message-State: AOAM533FmPx2gYi4KKqPjUnExspKsp+zCIZ9zHDGohMA6qIcrGf4ZzAM
 EwJuNfjQfQ2rMIyVm8hNjP810Xx60d0xij1MZDb2ZpHq/nXd/VZE9Q43MWnnAYkMxTEER+rRBzq
 zgBzNiyQzF5rV1xI=
X-Received: by 2002:a50:fd9a:: with SMTP id o26mr5992475edt.352.1634806099284; 
 Thu, 21 Oct 2021 01:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqRI/7lxHLR6Lf8i50qjkvr9KGuHpVktLXQ7F5g2ZH9wskdzC2rzTDN0ALmFpW5xfbPJ7cbQ==
X-Received: by 2002:a50:fd9a:: with SMTP id o26mr5992453edt.352.1634806099143; 
 Thu, 21 Oct 2021 01:48:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u23sm2211010ejx.99.2021.10.21.01.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:48:18 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:48:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>
Subject: Re: [PATCH v2 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram
 and MachineClass::default_ram_id
Message-ID: <20211021104817.7db6a276@redhat.com>
In-Reply-To: <20211020014112.7336-2-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-2-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 21 Oct 2021 08:48:26 -0000

On Wed, 20 Oct 2021 09:41:07 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> Changes in v2:
> - split RAM into low and high regions using aliases to machine->ram
> - rename mc->default_ram_id to "microchip.icicle.kit.ram"
> 
>  hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e475b6d511..3fc8545562 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -463,7 +463,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> -    uint64_t mem_high_size;
> +    uint64_t mem_low_size, mem_high_size;
>      hwaddr firmware_load_addr;
>      const char *firmware_name;
>      bool kernel_as_payload = false;
> @@ -485,31 +485,34 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                              TYPE_MICROCHIP_PFSOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
> +    /* Split RAM into low and high regions using aliases to machine->ram */
> +    mem_low_size = memmap[MICROCHIP_PFSOC_DRAM_LO].size;
> +    mem_high_size = machine->ram_size - mem_low_size;
> +    memory_region_init_alias(mem_low, NULL,
> +                             "microchip.icicle.kit.ram_low", machine->ram,
> +                             0, mem_low_size);
> +    memory_region_init_alias(mem_high, NULL,
> +                             "microchip.icicle.kit.ram_high", machine->ram,
> +                             mem_low_size, mem_high_size);
> +
>      /* Register RAM */
> -    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> -                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> -                           &error_fatal);
> -    memory_region_init_alias(mem_low_alias, NULL,
> -                             "microchip.icicle.kit.ram_low.alias",
> -                             mem_low, 0,
> -                             memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>                                  mem_low);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
> +                                mem_high);
> +
> +    /* Create aliases for the low and high RAM regions */
> +    memory_region_init_alias(mem_low_alias, NULL,
> +                             "microchip.icicle.kit.ram_low.alias",
> +                             mem_low, 0, mem_low_size);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
>                                  mem_low_alias);
> -
> -    mem_high_size = machine->ram_size - 1 * GiB;
> -
> -    memory_region_init_ram(mem_high, NULL, "microchip.icicle.kit.ram_high",
> -                           mem_high_size, &error_fatal);
>      memory_region_init_alias(mem_high_alias, NULL,
>                               "microchip.icicle.kit.ram_high.alias",
>                               mem_high, 0, mem_high_size);
> -    memory_region_add_subregion(system_memory,
> -                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
> -                                mem_high);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
>                                  mem_high_alias);
> @@ -606,6 +609,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
>                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
>      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpus = mc->min_cpus;
> +    mc->default_ram_id = "microchip.icicle.kit.ram";
>  
>      /*
>       * Map 513 MiB high memory, the mimimum required high memory size, because


