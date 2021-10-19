Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjHI-0006h0-UE
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjHF-0006fY-On
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjHC-000137-Hu
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZHRcOOuuPdLCczcFEgxMJ1l3XbzH0pusz2B/P0ZKNE=;
 b=KOotkHVUMgncDdIH+dCYAjDOD7AyR8Uimn1LgVCVia2ARjhyFam4+bUgrB2vtZgpqrYA3s
 aJwPWDeYOZQDAvmyS+7Wfa3sKFqFt4rLgbrKTTteGCP66GKhAEQKx+dNrdOhzNpUs+hiVa
 ifZxaSvxBiWv2YYMYGvap5lcm1WRzXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-gPa0fvwPPL2dfhrpgxRr9A-1; Tue, 19 Oct 2021 03:11:06 -0400
X-MC-Unique: gPa0fvwPPL2dfhrpgxRr9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so9741407wrv.19
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qZHRcOOuuPdLCczcFEgxMJ1l3XbzH0pusz2B/P0ZKNE=;
 b=gnxmreefU7Ft2FoDHIp1UnINz1eUfBDj5dZQBJSos7iv61MtP/Tn/w6Mvb/JjcAM8l
 RIUiBb49BSsVmdPn2GGPsrBh0zfggCDqFJMRljN1Y+/uK+Ehk/ESwbuLoRkjPYfRylF/
 M/l0qKKDphrupJDzWHhcnTjhErfv+Yy6Sey0Om8BuDr2kd5LvG4rW01O3ONpfeknOpw6
 sTGQqWWdpRyOtfEH5vlcRVtbHoaB+TYmX9gjlCISPK4CGKSkDeotoHpobTYqVBKrC2ai
 hZ9DjJ6FU62661AYwBrC0RUBVHiu7aCco6HzfH8UahaOFAVukiQRy0GKxxNzJsdz5Rhe
 pGxA==
X-Gm-Message-State: AOAM532r2zTPXBa0rbvwDHH1hfV7tnz9gTN7vXYzLSX0IID9uaC11BLR
 78IDAqLlXG83ZlpLxlf9UBv5l4VHqAjlqc5VHnJoE3IVfd894ZpiPWIBcxjQEp1FYRPNiMoTiCb
 tKbQ5qWUOpi5a4Y0=
X-Received: by 2002:a05:600c:1d1a:: with SMTP id
 l26mr4126754wms.98.1634627465354; 
 Tue, 19 Oct 2021 00:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWKzPWLLO5ieq27Ntzk50ahIHbiJRtPR3rRLWRu/2YfR5sjFvwCYfe7HVYoFj8XME86wK0oQ==
X-Received: by 2002:a05:600c:1d1a:: with SMTP id
 l26mr4126721wms.98.1634627465040; 
 Tue, 19 Oct 2021 00:11:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c185sm1462385wma.8.2021.10.19.00.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:11:04 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:11:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091103.68908df5@redhat.com>
In-Reply-To: <20211018153829.24382-2-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-2-bmeng.cn@gmail.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 19 Oct 2021 07:11:14 -0000

On Mon, 18 Oct 2021 23:38:25 +0800
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
>  hw/riscv/opentitan.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 9803ae6d70..c356293d29 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -67,17 +67,14 @@ static void opentitan_board_init(MachineState *machine)
>      const MemMapEntry *memmap = ibex_memmap;
>      OpenTitanState *s = g_new0(OpenTitanState, 1);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);

It is likely that you are missing fixed size check here
(looking at code it seems to me that board doesn't support variable RAM size)
See commit 00b9829f83c for example.

>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc,
>                              TYPE_RISCV_IBEX_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
> -    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
> -        memmap[IBEX_DEV_RAM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[IBEX_DEV_RAM].base, main_mem);
> +        memmap[IBEX_DEV_RAM].base, machine->ram);
>  
>      if (machine->firmware) {
>          riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
> @@ -95,6 +92,7 @@ static void opentitan_machine_init(MachineClass *mc)
>      mc->init = opentitan_board_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
> +    mc->default_ram_id = "riscv.lowrisc.ibex.ram";

Are you missing "mc->default_ram_size = memmap[IBEX_DEV_RAM].size" here?

otherwise it will default to generic:
  hw/core/machine.c:    mc->default_ram_size = 128 * MiB;

>  }
>  
>  DEFINE_MACHINE("opentitan", opentitan_machine_init)


