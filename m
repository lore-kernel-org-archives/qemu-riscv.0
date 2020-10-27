Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXTBK-0003Bs-IF
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 13:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXTBI-00037I-7w; Tue, 27 Oct 2020 13:54:48 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXTBG-0006Yz-9b; Tue, 27 Oct 2020 13:54:47 -0400
Received: by mail-il1-x141.google.com with SMTP id p10so2323984ile.3;
 Tue, 27 Oct 2020 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xH9yPIrZ3E2F/QuXugxSbv1ynMFdDcwZXRb1BmJ8BKY=;
 b=PFcMBf3RbP+UQg5p9IagosmXb+dutCJuudtsb1Ao3MleQrv3z7SypZkcOFrxX0aWCR
 2bzZU2jIIZ7Fkxf4RqDcPAFhy4FF5MrgO/bVyM0ABK4TpAHLcXkir30Is9ZnE3jFQxFA
 XRH8scixoXVgkD7u1hprqdwE8cRjIMcutPIK7AgEsJIvtDxLeS8lKEbc/hy6PMd2WSiA
 kHL4SNVHd4Wy6IvSS5iTMbZhM4jf6+ATKd7wYDPaACQyoKz/lt7RsPmzQlF/iuYUBdh1
 V1ujNWfuotDUApqz7nM+lJgBAYsHNB7pFMG3psLGQc3OIO1qn9pgTu5VQuyGrQC5DPcc
 PqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xH9yPIrZ3E2F/QuXugxSbv1ynMFdDcwZXRb1BmJ8BKY=;
 b=HqpCok2goVSLy1w/VeMza0zdO6rD0lYfcMObQL0ki1pOZL90BNk38wcN0Oi2+9xjzq
 /yRLYbvSVPN6RqhGtJjtt69KTrLTcxm2rAFbpATmrVv7BX8pNx2QMpoXbAivf7lf3EUU
 eNUnt4OL5kARnL1vJiK98otvEgRLErl+KCECtc7O/GBAy3vZS3R6fHdMBpjMl/nuilhp
 PkDVu41p75j1jeRMigSqI2BHF3kwckGYAoDwjA6+5c6UMKpFTG9igCiNC+9BfiDJ063S
 r5CI4GKw64tO/ULiJSHcjNvdKrIfa4Irmr7OgiDG35avVgGXBi/KJW01HQBFn7g8hDjy
 sBfw==
X-Gm-Message-State: AOAM531AnGZYCbmzfDRdyncgE3xH9WUaGWHdz2IBNNWEq8cdNLNnYsR+
 UIVe99kNf6+8HkJrH+rSY4p4JXYJivJNo91px8s=
X-Google-Smtp-Source: ABdhPJwPB1cTV72KreTzw0mvMCFeQLxKt+H39IDAUwiixM8BPMF/rm8BQX+YYzREmp5M2YBbbh/dmSlgzYH0FPMx+JE=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr3096712ilg.131.1603821284821; 
 Tue, 27 Oct 2020 10:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
 <20201027141740.18336-7-bmeng.cn@gmail.com>
In-Reply-To: <20201027141740.18336-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 10:42:55 -0700
Message-ID: <CAKmqyKOXznoPx98+t-c0wZfLUruw9qmQPP3ufaNL0F0-NvWFOw@mail.gmail.com>
Subject: Re: [RESEND PATCH 6/9] hw/riscv: microchip_pfsoc: Connect the SYSREG
 module
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
X-List-Received-Date: Tue, 27 Oct 2020 17:54:48 -0000

On Tue, Oct 27, 2020 at 7:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Previously SYSREG was created as an unimplemented device. Now that
> we have a simple SYSREG module, connect it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/Kconfig                   | 1 +
>  hw/riscv/microchip_pfsoc.c         | 9 ++++++---
>  include/hw/riscv/microchip_pfsoc.h | 2 ++
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 8f043e38e0..facb0cbacc 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -7,6 +7,7 @@ config MICROCHIP_PFSOC
>      select MCHP_PFSOC_DMC
>      select MCHP_PFSOC_IOSCB
>      select MCHP_PFSOC_MMUART
> +    select MCHP_PFSOC_SYSREG
>      select MSI_NONBROKEN
>      select SIFIVE_CLINT
>      select SIFIVE_PDMA
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 05fb5004a1..69117c6000 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -135,6 +135,9 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
>      object_initialize_child(obj, "dma-controller", &s->dma,
>                              TYPE_SIFIVE_PDMA);
>
> +    object_initialize_child(obj, "sysreg", &s->sysreg,
> +                            TYPE_MCHP_PFSOC_SYSREG);
> +
>      object_initialize_child(obj, "ddr-sgmii-phy", &s->ddr_sgmii_phy,
>                              TYPE_MCHP_PFSOC_DDR_SGMII_PHY);
>      object_initialize_child(obj, "ddr-cfg", &s->ddr_cfg,
> @@ -262,9 +265,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      }
>
>      /* SYSREG */
> -    create_unimplemented_device("microchip.pfsoc.sysreg",
> -        memmap[MICROCHIP_PFSOC_SYSREG].base,
> -        memmap[MICROCHIP_PFSOC_SYSREG].size);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->sysreg), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
> +                    memmap[MICROCHIP_PFSOC_SYSREG].base);
>
>      /* MPUCFG */
>      create_unimplemented_device("microchip.pfsoc.mpucfg",
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index a244ae6d39..245c82db61 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -26,6 +26,7 @@
>  #include "hw/dma/sifive_pdma.h"
>  #include "hw/misc/mchp_pfsoc_dmc.h"
>  #include "hw/misc/mchp_pfsoc_ioscb.h"
> +#include "hw/misc/mchp_pfsoc_sysreg.h"
>  #include "hw/net/cadence_gem.h"
>  #include "hw/sd/cadence_sdhci.h"
>
> @@ -47,6 +48,7 @@ typedef struct MicrochipPFSoCState {
>      MchpPfSoCMMUartState *serial2;
>      MchpPfSoCMMUartState *serial3;
>      MchpPfSoCMMUartState *serial4;
> +    MchpPfSoCSysregState sysreg;
>      SiFivePDMAState dma;
>      CadenceGEMState gem0;
>      CadenceGEMState gem1;
> --
> 2.25.1
>
>

