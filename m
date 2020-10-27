Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXSzS-00053Z-Vh
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 13:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXSzN-00051y-Hk; Tue, 27 Oct 2020 13:42:29 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:42224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXSzK-0004GJ-PH; Tue, 27 Oct 2020 13:42:29 -0400
Received: by mail-io1-xd43.google.com with SMTP id k21so2445709ioa.9;
 Tue, 27 Oct 2020 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2YFMNrVt0KtTz+rNAgd0A8fNm+bJ5Y3j6JqD4NXvhs=;
 b=XRuuYyjc3nFPlrUicnp9GdAJD5QcAWbhbIhLx71jlFGLjEK8XEx0cfI3atBB2RvZ2D
 +tQhRACocaa9pK9JEdTTh1XtLWsNlMPPCmrxFlwSCZRlwm0WAKh0jwlUzyMgdbXJ8N2o
 uPbLPb6HuVnvDzwnRjZ5sh/zhTnkVY2rapzAvIBIJMU7pxhn/waYOg+vaz43DVbKcYwh
 RqQiDKN+TCGBC94uyBa3cLBC+xHPqZf+GsfLC/N40Qgizdgl63iHQi7kFwbR2Oh8E30B
 jV57Zsc+2y4sSGP1+/8DRyu63XQpHxUAQ+DNTbnEAey2v8Ct6Xml2e0lsqOhjCPHIo6V
 5qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2YFMNrVt0KtTz+rNAgd0A8fNm+bJ5Y3j6JqD4NXvhs=;
 b=dZQRbWeF2KDD0S3iQ2HkYLu+HAqMdEv5sgzsUWbkeUn4Ce5ovvc+YgpptwywQdLzlX
 OICOfFR30OwjTHINo9EGJIFQXVsOWfzrdT5IWk/0IhSAY3IUE7/Wp+vz7VDhLDMWx8SZ
 PTKOAXcr09071T1/NragrEWhALcrS9TPxxizIh1BXR7Nqi71EERzmmw7fSDIhwVXF07D
 m4t4Vkql/j+OtBHRP8bIWErsvzchx/jpct3p/ozxa2ZtyBFhovHgPDdhesnGC3+N/Lsj
 RGPQfQqA984R0wuoKdyBlQbWw0C1T3SMAY99+fh6E2pbgKwDnHL1Il4XIrJSXmpepvwI
 Ax+A==
X-Gm-Message-State: AOAM5337M6pP/R29CxCkUiHipz4tp3bOcgV1Ol+92meCAeelwbTuvgYG
 u+/Otu/joGeejoriGf6zN+lEIBxvWIy/dD6O7TU=
X-Google-Smtp-Source: ABdhPJzQmZRNc3aZ04yHqGAkuC4zNoQc7MP+NVdmrVa6s9NCiaBr5WgbxjAdpIzQNNuNlWCsWVq9A6TRMvj1GEJEf1M=
X-Received: by 2002:a02:84c3:: with SMTP id f61mr3713303jai.8.1603820544780;
 Tue, 27 Oct 2020 10:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
 <20201027141740.18336-8-bmeng.cn@gmail.com>
In-Reply-To: <20201027141740.18336-8-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 10:30:35 -0700
Message-ID: <CAKmqyKNVUgV6Go6RdogLxhE5hOBr7aboe1indWTEaodep4MJLg@mail.gmail.com>
Subject: Re: [RESEND PATCH 7/9] hw/riscv: microchip_pfsoc: Map debug memory
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 27 Oct 2020 17:42:33 -0000

On Tue, Oct 27, 2020 at 7:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Somehow HSS needs to access address 0 [1] for the DDR calibration data
> which is in the chipset's debug memory. Let's map the debug memory.
>
> [1] See the config_copy() calls in various places in ddr_setup() in
>     the HSS source codes.

Really? This is reserved memory that they just read and write to? That's crazy.

If we really need this can you add a comment saying that the
documentation is wrong (again) and that this needs to be here.

>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/microchip_pfsoc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 69117c6000..b9c2f73e7c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -158,6 +158,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
>      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
>      MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *debug_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *envm_data = g_new(MemoryRegion, 1);
> @@ -177,6 +178,13 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
>      qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
>
> +    /* Debug */

This doesn't seem right.

Debug should start at 0x0000_0100 (it seems like what is currently in
tree is wrong).

Address 0x00 is marked as reserved in the documentation.

Do you mind updating the memory map to fix the debug address? Then
just add a reserved region as well.

Alistair

> +    memory_region_init_ram(debug_mem, NULL, "microchip.pfsoc.debug_mem",
> +                           memmap[MICROCHIP_PFSOC_DEBUG].size, &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DEBUG].base,
> +                                debug_mem);
> +
>      /* E51 DTIM */
>      memory_region_init_ram(e51_dtim_mem, NULL, "microchip.pfsoc.e51_dtim_mem",
>                             memmap[MICROCHIP_PFSOC_E51_DTIM].size, &error_fatal);
> --
> 2.25.1
>
>

