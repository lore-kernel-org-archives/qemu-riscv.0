Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjLT-0002bU-Q9
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjLQ-0002Xf-6z
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjLC-0004Lv-HY
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1vBi/GvGHaGPop25rFYYVW6Pq41McgNV349uqaUE00=;
 b=LhRHtZgg4nK0IWpLlMqHiSMFuRf3HE7CaI6gHfidwc1CSj2ZHkUmSsYgFSUwYdW+X0pfA9
 qcdDGRa1bux6gcfF2IoxLL7GWoTPji3Dz2fju/TymiMeDuBfzY8ywFCVLRQqad0Qx4VBg1
 rKjJCbDyM3Azm4bn5HWruR7KpKd+3mw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-7iItYXXFNq-QgEUPt2bt8w-1; Tue, 19 Oct 2021 03:15:12 -0400
X-MC-Unique: 7iItYXXFNq-QgEUPt2bt8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 s10-20020a1cf20a000000b0030d66991388so416819wmc.7
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1vBi/GvGHaGPop25rFYYVW6Pq41McgNV349uqaUE00=;
 b=7nx/uknNm7M2nVTATotEcvq6fAuRThejtzWfna27nJfJiJN11FIwQY4n5NUNMhclOt
 UqxHVswDL9BOB/aD2LtWGCx5VU9pLVmgtN37QcvOLikrybn+lSxDXfcWo+XzK53/cPAI
 EOmoSlRTglScwDojf9VV1Iqc/0g+vdIsxr7FIAW4TwmADJ3S2/mnaUFW/VRw+ypYGtBK
 y4fMyZNZSUqtdWd5RTP5pksx0dnRx9wxiVIWPwbNlzNEMeujhlmAeUYEjY6Esz3d+AlC
 7TEnGA6B+CJFh3lmCqrmj/4w5lqq8H7M26cpWPcKByNWs+RU83SJTPZXj6glmdM78/xw
 GD2A==
X-Gm-Message-State: AOAM532yFN9BQ0wn+0xUzts4yYqzOswch2qKEN2Fm6L8YHuVuW9AiIxX
 jMviK/l9JpB7mKahODOLl09lkqlOlWSoIIINqN89LgFX8ZCftuWY1tx9qRbp5+Kpdm+VCn86Cs5
 Pbjn8FAtXGhF/iBY=
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr4167793wmp.43.1634627711371; 
 Tue, 19 Oct 2021 00:15:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvrG+mLI7istE0rrgfJBY7SI2cQ0QyUj51gggZ/T3L7b3MyiHYR1KmWXuv/cIbav0CMYqLNw==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr4167777wmp.43.1634627711199; 
 Tue, 19 Oct 2021 00:15:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o26sm1421216wmc.17.2021.10.19.00.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:15:10 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:15:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091510.2233398e@redhat.com>
In-Reply-To: <20211018153829.24382-4-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-4-bmeng.cn@gmail.com>
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
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 07:15:32 -0000

On Mon, 18 Oct 2021 23:38:27 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

same issues as in 2/6

> ---
> 
>  hw/riscv/sifive_e.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6e95ea5896..caae860664 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -75,7 +75,6 @@ static void sifive_e_machine_init(MachineState *machine)
>  
>      SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
>  
>      /* Initialize SoC */
> @@ -83,10 +82,8 @@ static void sifive_e_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* Data Tightly Integrated Memory */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
> -        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
> +        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
>  
>      /* Mask ROM reset vector */
>      uint32_t reset_vec[4];
> @@ -142,6 +139,7 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_e_machine_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = SIFIVE_E_CPU;
> +    mc->default_ram_id = "riscv.sifive.e.ram";
>  
>      object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
>                                     sifive_e_machine_set_revb);


