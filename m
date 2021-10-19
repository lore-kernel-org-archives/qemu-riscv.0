Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjMO-0003I0-DH
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjML-0003GM-4T
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:16:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjMJ-0005Or-Dx
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAAsMuRfNa5N7r7AZPS+Si3SkCykWvUXu2gcVja7+vc=;
 b=AnZoGy2LAUL0si8Y4gLb3oyTJRAW6fQxu6Oj5L5LtX2RWAaoq1nr4U0aJ+/l4GODlEAOWV
 +ZtvKs+0PwuBam7UACXo7PxQ+2t9vIC/9RR2Bf+firpr5yd2aWIZ0Jy38ZMCbF0ACbdYbR
 /4hWsuN13JoKnU6pmDTQj2F5soYh4no=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-hfn-q7HgMC2Rz-JHkO-mtA-1; Tue, 19 Oct 2021 03:16:25 -0400
X-MC-Unique: hfn-q7HgMC2Rz-JHkO-mtA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso9766818wra.13
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAAsMuRfNa5N7r7AZPS+Si3SkCykWvUXu2gcVja7+vc=;
 b=cpIGIiVvy60E+TWgJP8kRj5Qqei6kBzGSL+9u2X12DlrMcs5cYJTjfO8YUYQJKR/WX
 S0mA9SCA45Hyuxl47ePXMQSrFtpYHGRsz+wmehxms3b+taYK+7M2EDKR5dmDDLgN8Ljn
 GOWsMpQ5tzKWCnQSfzA71K8lbit3IG/7XCOVwJnoczCK+u0hzgWlZL1tHXAAchRea4ng
 9pN7rahK3sGUEekngSKgwcJ12fweM/Wgd0qQYC5lV1FHs+0bRl9Ar6heRy1fNILtq4lY
 tMp0fbfyiV9zvFiRT2w0GPVC2q+64EWOnN8D1uCFteqJ0LD1O2Y/e0BPm+31jjbHR9Jg
 jzGA==
X-Gm-Message-State: AOAM532eGy9iWVHxwqdXobafTXHV1J1L2gh/rEY6plT3Pnnt4LZy8Vx0
 B32cuH3VHn1NdSlklASpFX2JeOzZkKizkjJ6qmyX5OeMhWhtbJj/E7+B+69VB6zs3VnyIbxyMGW
 5FhYAa9WZJ5N1QM0=
X-Received: by 2002:a7b:c938:: with SMTP id h24mr4181721wml.41.1634627784288; 
 Tue, 19 Oct 2021 00:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxDsS8+ao+d5njQ+Un81/tTE479KOKX2gCxyQrCvWRcd4THE2vxvqoGqzrhwE8IYkLgFgMYQ==
X-Received: by 2002:a7b:c938:: with SMTP id h24mr4181696wml.41.1634627784079; 
 Tue, 19 Oct 2021 00:16:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b19sm1611231wmj.9.2021.10.19.00.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:16:23 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:16:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 5/6] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091622.1e606d94@redhat.com>
In-Reply-To: <20211018153829.24382-5-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-5-bmeng.cn@gmail.com>
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
X-List-Received-Date: Tue, 19 Oct 2021 07:16:29 -0000

On Mon, 18 Oct 2021 23:38:28 +0800
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
>  hw/riscv/sifive_u.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fc5790b8ce..0217006c27 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machine)
>      const MemMapEntry *memmap = sifive_u_memmap;
>      SiFiveUState *s = RISCV_U_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> @@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* register RAM */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM].base,
> -                                main_mem);
> +                                machine->ram);
>  
>      /* register QSPI0 Flash */
>      memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
> @@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpu_type = SIFIVE_U_CPU;
>      mc->default_cpus = mc->min_cpus;
> +    mc->default_ram_id = "riscv.sifive.u.ram";
>  
>      object_class_property_add_bool(oc, "start-in-flash",
>                                     sifive_u_machine_get_start_in_flash,


