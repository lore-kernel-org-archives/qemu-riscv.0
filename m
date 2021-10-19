Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjiy-0001Uf-MO
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjiw-0001OJ-P4
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjiu-0002Kn-8G
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634629187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfsrHPH1MnCf3qhJ0S6kwPTiJlEnD48f+kOzvIaospE=;
 b=eMqk24DE0EY3Tuj+N9X4lD+cxhVPpaVtNIdlWG2E0TfgLh3smO0nMIpOT0GccN2h4ZPutJ
 bNslMI874WN43uqZBtSol3eF0mCgfQGdWVkRmnOvcp+6/vCQ6pzpbYm/ec6u40hwTZllxC
 vwp88fPyKLjCADBZ+GfvARl7E/baykE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-Kg66nBnMNGKEM4PCBYTZtA-1; Tue, 19 Oct 2021 03:39:46 -0400
X-MC-Unique: Kg66nBnMNGKEM4PCBYTZtA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso9810127wri.17
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfsrHPH1MnCf3qhJ0S6kwPTiJlEnD48f+kOzvIaospE=;
 b=smvB9i9bEf8ZxzL31S7pBfIJoudPfYpEDuyaLpyb3AvQxH/J4H5ZM+K3hCGvFjAird
 9YRTvwKvIvNxD0csK6gpD/gNxn1VJLzrFSUz9dSkiqbeUuHAOv2jJsh3jC+IYtz/FnBL
 B4l6JRsPwqhcR/HXczC3IuKdiZ5ASVBGW94ORXFVhrNF+RKt2qQCAMXCMHiO7smnRf/c
 GRUVU1eP7MFvv6pTwrdMzzmYbFp+F7iyFt7pmvWJVlAgN39qJ6Te28hBqSxsLn3L/3aO
 EK9jt3E3yehrJjdoUl95u0qXsmhUlhTtmAcLig8NR5eFHSr+76mh5XHrCgtUfURIdo5b
 163g==
X-Gm-Message-State: AOAM531T4HHfSSBVMOA0mrEnViHCOLuU9Ma5aUeFupgSGywGdwyj0iEk
 rKUY24jJcuXZR1OEjfE15a9Tj/GSpMdcqperW6/VuEseBmBacuYLrYMyyoiET/wR0gLK7UXHAY9
 pYM5VAyr9JsrYfW0=
X-Received: by 2002:adf:ca10:: with SMTP id o16mr40749465wrh.212.1634629185089; 
 Tue, 19 Oct 2021 00:39:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHpEMphpGDAg1n0eYuCdO3PylUFIbJfgiMgmR8OuPJ64g778YtZh7/wWBO+TRVbDqVJ6zBag==
X-Received: by 2002:adf:ca10:: with SMTP id o16mr40749442wrh.212.1634629184853; 
 Tue, 19 Oct 2021 00:39:44 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v18sm16004874wrm.63.2021.10.19.00.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:39:44 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:39:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram
 and MachineClass::default_ram_id
Message-ID: <20211019093943.54c36b3f@redhat.com>
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
X-List-Received-Date: Tue, 19 Oct 2021 07:39:51 -0000

On Mon, 18 Oct 2021 23:38:24 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/riscv/microchip_pfsoc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e475b6d511..f10f55b488 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -459,7 +459,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      const MemMapEntry *memmap = microchip_pfsoc_memmap;
>      MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *mem_low = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> @@ -486,16 +485,13 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* Register RAM */
> -    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> -                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> -                           &error_fatal);
>      memory_region_init_alias(mem_low_alias, NULL,
>                               "microchip.icicle.kit.ram_low.alias",
> -                             mem_low, 0,
> +                             machine->ram, 0,
>                               memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                mem_low);
> +                                machine->ram);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
>                                  mem_low_alias);

looking at code it seems RAM is split between low and high regions,
so converting only low region is wrong.

I'd suggest something similar to 2dc9ce13d210 : taihu_405ep_init().
i.e. ms->ram should hold whole RAM that is split between low and high
using aliases.

> @@ -606,6 +602,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
>                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
>      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpus = mc->min_cpus;
> +    mc->default_ram_id = "microchip.icicle.kit.ram_low";

given it is not versioned machine, so we don't have to worry about
cross version migration here,
so I'd use "microchip.icicle.kit.ram" for the name here
and currently used "microchip.icicle.kit.ram_low" for corresponding alias

>  
>      /*
>       * Map 513 MiB high memory, the mimimum required high memory size, because


