Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki69Z-0005vZ-Ot
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 20:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ki69U-0005ue-2y
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 20:32:52 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ki69Q-0007pU-7C
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 20:32:50 -0500
Received: by mail-pf1-x442.google.com with SMTP id s21so128681pfu.13
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2020 17:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KGSQCqgotQ42M6KFwrQdymZpDfNmZuevBXjkkhHB2WE=;
 b=qEUhRxkx9yoZN1NSFALVVxkaNm7eHlGurfRbVUE4JUiwJGdcq4lN7Y3TZG5kpQJr67
 AO82guOL9ydXyPCUtwKhmYKD8hKozJWA7VpG57lINABm1iHQtfflk41BQHX4w8Fdt9TZ
 dOBr91Ow1/q52SqPB95cVTAvatB10AsGGH7ObtLlzywk5jT4ICas2FUqyyHzXH8NTm0H
 +NbMAvPpVQ06xjztuMcTT8CjtcCmHm3GQ3yYAmrJZsV1MYtQXMD8jwgcbXUv4/GCyU1y
 /yDR0dYAzGrT1qkZT+PLFpXlB3wvBanb76QHbN3sYPrJk2PFxSB6GpGGoShTPdoW8uHS
 qhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KGSQCqgotQ42M6KFwrQdymZpDfNmZuevBXjkkhHB2WE=;
 b=EarB+PZNuTQIBre1UeXKqv7duAg6ZL7LS//O22TP5KVZYwZ175Nx32ZiXDVdAPqIC/
 QgK7pNisNLMGFYity3MWnFWFporVxlSqvvus3jbCnAAft8prXTSDltsEnMXITN0EuiYP
 mUCkHrFy68jhBM1S6dvzWv1d4W/Mnxbf43esgvVbCyZ4aUQvOA5eVuqLcHj5bj4xZEVg
 Txg1WMwnV0jK+bZynsvDWgZ8Inj0pVvs/q/PeRgUbv9672A3na8VNjOKAOydCs8ndmVP
 qqeO7nWvTvzKM+binQzO/nCj+gYEx2HPuumqj7vVecl65wTSRE2ieEYEUPZfo9eX2pSU
 Q2tA==
X-Gm-Message-State: AOAM533M+d8QozOFPQwgmNDZDLmhP9x6qrLQUtMnDrQU6lEy2AGTq9ky
 rsMXTYuVFyuui3p5d6G+15VKuHMRqALu2nNb
X-Google-Smtp-Source: ABdhPJwLsxYg7y5PDFqDfbCYNMF2OrpCS5W5Om6WbMhOBjWRNkojK4JFsWw+D0sCx5F7spm+vaPqTA==
X-Received: by 2002:a17:90a:d916:: with SMTP id
 c22mr711740pjv.71.1606354365210; 
 Wed, 25 Nov 2020 17:32:45 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e2sm3883288pjv.10.2020.11.25.17.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 17:32:44 -0800 (PST)
Date: Wed, 25 Nov 2020 17:32:44 -0800 (PST)
X-Google-Original-Date: Wed, 25 Nov 2020 17:32:37 PST (-0800)
Subject: Re: [PATCH 1/1] hw/riscv: clint: timebase-freq is machine-specific
In-Reply-To: <20201103153844.91458-2-emmanuel.blot@sifive.com>
CC: qemu-riscv@nongnu.org, emmanuel.blot@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emmanuel.blot@sifive.com
Message-ID: <mhng-51837baa-e2f5-4d57-9a3d-9ab39910b77e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 26 Nov 2020 01:32:52 -0000

On Tue, 03 Nov 2020 07:38:44 PST (-0800), emmanuel.blot@sifive.com wrote:
> * sifive_e (HiFive1 platform) uses a RTC clock running at 32.768 KHz
> * sifive_u (HiFive Unleashed platform) uses a RTC clock running at 1 MHz

This is a bit oddly done (usually it's sentences as opposed to bullets), but
otherwise

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
> ---
>  hw/riscv/sifive_e.c            | 2 +-
>  hw/riscv/sifive_u.c            | 4 ++--
>  hw/riscv/spike.c               | 4 ++--
>  hw/riscv/virt.c                | 4 ++--
>  include/hw/intc/sifive_clint.h | 4 ----
>  include/hw/riscv/sifive_e.h    | 2 ++
>  include/hw/riscv/sifive_u.h    | 2 ++
>  include/hw/riscv/spike.h       | 2 ++
>  include/hw/riscv/virt.h        | 2 ++
>  9 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 59bac4cc9a..89d0fe74b6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -216,7 +216,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>      sifive_clint_create(memmap[SIFIVE_E_DEV_CLINT].base,
>          memmap[SIFIVE_E_DEV_CLINT].size, 0, ms->smp.cpus,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +        SIFIVE_E_CLINT_TIMEBASE_FREQ, false);
>      create_unimplemented_device("riscv.sifive.e.aon",
>          memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b2472c6627..403f614eca 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -155,7 +155,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        SIFIVE_U_CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -739,7 +739,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
>          memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +        SIFIVE_U_CLINT_TIMEBASE_FREQ, false);
>
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
>          return;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index facac6e7d2..4beeeb4ef6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -98,7 +98,7 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        SPIKE_CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> @@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
>              memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size,
>              memmap[SPIKE_CLINT].size, base_hartid, hart_count,
>              SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -            SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +            SPIKE_CLINT_TIMEBASE_FREQ, false);
>      }
>
>      /* register system main memory (actual RAM) */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 6bfd10dfc7..837368696c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -213,7 +213,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> +                          VIRT_CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> @@ -543,7 +543,7 @@ static void virt_machine_init(MachineState *machine)
>              memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
>              memmap[VIRT_CLINT].size, base_hartid, hart_count,
>              SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -            SIFIVE_CLINT_TIMEBASE_FREQ, true);
> +            VIRT_CLINT_TIMEBASE_FREQ, true);
>
>          /* Per-socket PLIC hart topology configuration string */
>          plic_hart_config_len =
> diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
> index a30be0f3d6..04856fd04b 100644
> --- a/include/hw/intc/sifive_clint.h
> +++ b/include/hw/intc/sifive_clint.h
> @@ -53,8 +53,4 @@ enum {
>      SIFIVE_TIME_BASE    = 0xBFF8
>  };
>
> -enum {
> -    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
> -};
> -
>  #endif
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..dbaba7f205 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -80,6 +80,8 @@ enum {
>      SIFIVE_E_GPIO0_IRQ0 = 8
>  };
>
> +#define SIFIVE_E_CLINT_TIMEBASE_FREQ 32768
> +
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
>  #define SIFIVE_E_PLIC_NUM_SOURCES 127
>  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index a9f7b4a084..dcdc708799 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -137,6 +137,8 @@ enum {
>  #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
>  #define SIFIVE_U_COMPUTE_CPU_COUNT      4
>
> +#define SIFIVE_U_CLINT_TIMEBASE_FREQ 1000000
> +
>  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
>  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index cddeca2e77..d131bf4091 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -53,4 +53,6 @@ enum {
>  #define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE64
>  #endif
>
> +#define SPIKE_CLINT_TIMEBASE_FREQ 10000000
> +
>  #endif
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index b4ed9a32eb..d9e417852a 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -70,6 +70,8 @@ enum {
>      VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
>  };
>
> +#define VIRT_CLINT_TIMEBASE_FREQ 10000000
> +
>  #define VIRT_PLIC_HART_CONFIG "MS"
>  #define VIRT_PLIC_NUM_SOURCES 127
>  #define VIRT_PLIC_NUM_PRIORITIES 7

