Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjNI-0004WX-JN
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjNH-0004Tw-EG
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:17:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjNE-0006B3-Ml
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcY1y4jcKtFMEgVr6+Fu3di88tM18URkC3d+VWc8xTM=;
 b=Gg/99Av3yS21ASyc30Fmrjur8tt3i59Zgt3dSFaR3lKXU+gFLwWqJOP29eRw23kumCf9UN
 nU+ekd4uHMQ0N4PZsKTf8GtN024MVS3pDxSVZh0LhYPxfyWiarhSxz30Dd+5+oeYwp2k6h
 gSmqgKOOQRVGH+5vXpluwrSe87cskwg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-FWWZe9N-OlKvBliMtBfWug-1; Tue, 19 Oct 2021 03:17:21 -0400
X-MC-Unique: FWWZe9N-OlKvBliMtBfWug-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso9733372wrg.16
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcY1y4jcKtFMEgVr6+Fu3di88tM18URkC3d+VWc8xTM=;
 b=5L1Scc/vjdX9VkDdHJ0i7pJQY1JwP+nNnWpeuwkKjcjtYZ/rbPso0r84kQQrMeuiwz
 7FZnXZ+0GgF6TdRwfZFstlfztFBTsQhd3R1fTX2yyKmmO86sdQdcIEnk4qQhzLEpw6PI
 dSi27DRQUwvMx4K7BdgQH0yPmtzeh7BpddoZ5d6Zhl/5dEsYf6xPrjRb0CkhQNfsl3pg
 cCHvEcbS9PEt1/vi+JPxCpzcSa3EqgQVmQOhOarNivY4bqVHQjv65dI0DtEWA8kzrs4t
 snbeiJdJtdcthKNYgTP70sXHn3v1+VvAO/1FiCiECkh0AFvquporsOPkaCXrilPIGrch
 yJag==
X-Gm-Message-State: AOAM533XWZUNbSfo+57BAJT/Xemmong+IvsA+JM75Depkb05V7RVKIo6
 IHO3N0lZ0Qvm5FyPcWV+c19FCfWGw8OABm3ZfGyw2w37Ocx9WSXs63IMJyl0YvdGsAvLiBlmRYG
 sv1cqav8Dab1LCkI=
X-Received: by 2002:a1c:a302:: with SMTP id m2mr4257696wme.111.1634627840208; 
 Tue, 19 Oct 2021 00:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ety8khjHIRPr6+jDJ+frq9dU3VOaSTmWK5ehlSrdyYClx2V4ccUxIqBOiQjgFqQh7vnO1g==
X-Received: by 2002:a1c:a302:: with SMTP id m2mr4257684wme.111.1634627840078; 
 Tue, 19 Oct 2021 00:17:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e15sm14296861wrv.74.2021.10.19.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:17:19 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:17:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 6/6] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091718.7dd6e227@redhat.com>
In-Reply-To: <20211018153829.24382-6-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-6-bmeng.cn@gmail.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 07:17:27 -0000

On Mon, 18 Oct 2021 23:38:29 +0800
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

> ---
> 
>  hw/riscv/spike.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 79ae355ae2..288d69cd9f 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -180,7 +180,6 @@ static void spike_board_init(MachineState *machine)
>      const MemMapEntry *memmap = spike_memmap;
>      SpikeState *s = SPIKE_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
> @@ -239,10 +238,8 @@ static void spike_board_init(MachineState *machine)
>      }
>  
>      /* register system main memory (actual RAM) */
> -    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
> -        main_mem);
> +        machine->ram);
>  
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> @@ -326,6 +323,7 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported = true;
> +    mc->default_ram_id = "riscv.spike.ram";
>  }
>  
>  static const TypeInfo spike_machine_typeinfo = {


