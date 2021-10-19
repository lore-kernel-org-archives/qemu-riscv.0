Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcjIp-00087E-Pe
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjIk-00082m-GH
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjIi-0002Hz-Uz
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 03:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jls7fUIUE3b4VwemQ8ZxXhWsUTPAqX11INIiPo6qyyI=;
 b=erblvzzQ1IvXpwud+Re4eFJbmiZq6AU7xr41XLUybWQTjLQafTtHiEOPLerbc4RM9QmHuG
 KWMyFVgsm9uPs1KynEVtxssWW+ylJMrY5P4XcclLfW1P0N6Hxh7c/auZ9pa2V8mTrH4BlN
 cji+CgakfJk6cM+pQAbO3OWojbe0Ra4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-wxx17IQRP8SMUe9E9NizoQ-1; Tue, 19 Oct 2021 03:12:43 -0400
X-MC-Unique: wxx17IQRP8SMUe9E9NizoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y142-20020a1c7d94000000b00322f2e380f2so417645wmc.6
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 00:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jls7fUIUE3b4VwemQ8ZxXhWsUTPAqX11INIiPo6qyyI=;
 b=EMzgk2/FmNFkeiIgFgX505LHeTSuIM7b3DhySIf/hjUp56GQiMvThI5tz+fFzMVX/4
 xa10a8cVcUEKbPGw/TIecT1PRVP/WsJG703sHIU1pQwQO8bFF4i5SvfCBgPJ+FwWoHZe
 h+T2yfpswBRX1YjEabI6TgsE7XeWFQr9vOrOuwYORfrhSQgphOJ/DzqSwICtqzk7dYpS
 +hvej4xzozWjhrpgPba6xP9VkxSAFd6xIeuQk9ih8kxIYBiIAx6TsvRXsn2fIyEDbXEC
 ZF4kprfknm5mg7w/sM5AKxbvtUfkzBSWidh246Dqt760tKrNWVRWOvgV38HsfiRDfoIc
 1fVg==
X-Gm-Message-State: AOAM532x/04f/Igpb+uZZHSOVem78glp5XFFlGjrXaMNgLVDiM1AVxW2
 vxB0fLmi/qVQursM8Qruk11SoowFugk61zUXfSGNAS5yeh5mdjK5ETbuzMPBcljq2hVaLo17TTG
 /HVlpSJopkanZzBk=
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr4132963wmb.160.1634627561897; 
 Tue, 19 Oct 2021 00:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCs83txbyX8xd0vm3LyQi5vQVTJ5kymzXvcDnXDzF4P8h2080bKNyiXSsb0+/+JH+eEPvJig==
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr4132951wmb.160.1634627561719; 
 Tue, 19 Oct 2021 00:12:41 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g8sm1132599wrx.26.2021.10.19.00.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:12:41 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:12:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 3/6] hw/riscv: shakti_c: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091240.4cb89b87@redhat.com>
In-Reply-To: <20211018153829.24382-3-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-3-bmeng.cn@gmail.com>
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
X-List-Received-Date: Tue, 19 Oct 2021 07:12:49 -0000

On Mon, 18 Oct 2021 23:38:26 +0800
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
>  hw/riscv/shakti_c.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index d7d1f91fa5..90e2cf609f 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -45,7 +45,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
>  {
>      ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>  
>      /* Allow only Shakti C CPU for this platform */
>      if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
> @@ -59,11 +58,9 @@ static void shakti_c_machine_state_init(MachineState *mstate)
>      qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
>  
>      /* register RAM */
> -    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
> -                           mstate->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory,
>                                  shakti_c_memmap[SHAKTI_C_RAM].base,
> -                                main_mem);
> +                                mstate->ram);
>  
>      /* ROM reset vector */
>      riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
> @@ -88,6 +85,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
>      mc->desc = "RISC-V Board compatible with Shakti SDK";
>      mc->init = shakti_c_machine_state_init;
>      mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
> +    mc->default_ram_id = "riscv.shakti.c.ram";
>  }
>  
>  static const TypeInfo shakti_c_machine_type_info = {


