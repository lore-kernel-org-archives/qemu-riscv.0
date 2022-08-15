Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNV4s-0005qv-5P
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 04:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNV4f-0005oI-8r
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 04:03:53 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNV4X-0006Sq-W8
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 04:03:44 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gk3so12269763ejb.8
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=FxPYsYxjd9/Rp7RwMrC7rKfzxlKO5wcdLVX0BltlHKM=;
 b=VO/mgV+UJDIcdWLKSF82iRjmY/EBy9uMmgYYmYylbanHKfp0Hd07/NqQSZljlZizkO
 /dSO/5mPzQgF8uX254YTbbj1Kjp9sZdd7antqK9Bjh4z4sBPgCTKuxtF7lO7yeymknlU
 iwO5uDke/6hGWYIa87QWr8zx5OcRSbGmT5eOyXO8UTpeO4tUgS+310oRCHorE+7VOpl9
 /1xfCO2eIhgcrTW5SrNLOLlvHo/pgxjMzRlibzOyCGs2OCRuMlT4BPYG/2WGwrJQpEjd
 RAkKR3gqx8Q0eZJXKO2mcoCPln1tPJIIKsv5rKKxCI6UuQtVqLqAJD2b/fQ9PxID2p92
 /sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=FxPYsYxjd9/Rp7RwMrC7rKfzxlKO5wcdLVX0BltlHKM=;
 b=q8tX6ytn3Q7Tt9N4kLnN5+b1icnTtQ96LU2GuaoY280jy1ejrILgZ+nJ83OP8aJKXf
 knuzXdLvCfOecnBuGGRSv+QeG2tPWZjTmH8jMRQyn4rDhCwtxbk3H/2ghJ2w2BvDdD1y
 UV9M2v+0KYmYjpjA3+IWACvbcFcI4xIaiLci1/sT6ysOUaZ/YA+a5TR0xRgfL4RYPkBL
 6mXlCoiAOK0T629oS7CwLzKxsJrNc+bwWmasrvT3Lis0M9+50wG6yGMFl69kaxVJlUNQ
 5Joy9Q9tXBPtbCerhWc8m+CSQXo4m1wO/AdvX/Q3/94pyX7zolovfnfosEu6dvfxtF/F
 /SLA==
X-Gm-Message-State: ACgBeo11HSRV1UNoQx0DOzHOuDdITauZ8kPPZlr3HlNrPU1XfOv3a1Ou
 cP0Gw+ck+gbPBaGQddUlyH6n4g==
X-Google-Smtp-Source: AA6agR5BbTRAj7BzNnUypqCi2C3+Plv0sZrlFfcub/RnCIJnY9wNElIleNETn0aZ2WZ1YDEHEaiWxw==
X-Received: by 2002:a17:907:86aa:b0:734:803b:ece4 with SMTP id
 qa42-20020a17090786aa00b00734803bece4mr9382684ejc.369.1660550620462; 
 Mon, 15 Aug 2022 01:03:40 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0043ba0cf5dbasm6242447edu.2.2022.08.15.01.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 01:03:40 -0700 (PDT)
Date: Mon, 15 Aug 2022 10:03:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v12 4/6] hw/riscv: virt: Add PMU DT node to the device tree
Message-ID: <20220815080339.2dzunadkeanirqw7@kamzik>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <20220802233307.2106839-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802233307.2106839-5-atishp@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2022 08:03:53 -0000

On Tue, Aug 02, 2022 at 04:33:05PM -0700, Atish Patra wrote:
> Qemu virt machine can support few cache events and cycle/instret counters.
> It also supports counter overflow for these events.
> 
> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> capabilities. There are some dummy nodes added for testing as well.
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  hw/riscv/virt.c    | 16 +++++++++++++
>  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/pmu.h |  1 +
>  3 files changed, 74 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f2ce5663a4c7..b58e6ed8b823 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -30,6 +30,7 @@
>  #include "hw/char/serial.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/core/sysbus-fdt.h"
> +#include "target/riscv/pmu.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
> @@ -715,6 +716,20 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>      aplic_phandles[socket] = aplic_s_phandle;
>  }
>  
> +static void create_fdt_pmu(RISCVVirtState *s)
> +{
> +    char *pmu_name;
> +    MachineState *mc = MACHINE(s);
> +    RISCVCPU hart = s->soc[0].harts[0];
> +
> +    pmu_name = g_strdup_printf("/soc/pmu");
> +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
> +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> +
> +    g_free(pmu_name);
> +}
> +
>  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>                                 bool is_32_bit, uint32_t *phandle,
>                                 uint32_t *irq_mmio_phandle,
> @@ -1043,6 +1058,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>  
>      create_fdt_flash(s, memmap);
>      create_fdt_fw_cfg(s, memmap);
> +    create_fdt_pmu(s);
>  
>  update_bootargs:
>      if (cmdline && *cmdline) {
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 34096941c0ce..59feb3c243dd 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -20,11 +20,68 @@
>  #include "cpu.h"
>  #include "pmu.h"
>  #include "sysemu/cpu-timers.h"
> +#include "sysemu/device_tree.h"
>  
>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
>  #define MAKE_32BIT_MASK(shift, length) \
>          (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
>  
> +/**
     ^ This doesn't appear to be a kernel-doc comment, so I think we
     should drop the extra '*'

> + * To keep it simple, any event can be mapped to any programmable counters in
> + * QEMU. The generic cycle & instruction count events can also be monitored
> + * using programmable counters. In that case, mcycle & minstret must continue
> + * to provide the correct value as well. Heterogeneous PMU per hart is not
> + * supported yet. Thus, number of counters are same across all harts.
> + */
> +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
> +{
> +    uint32_t fdt_event_ctr_map[20] = {};
> +    uint32_t cmask;
> +
> +    /* All the programmable counters can map to any event */
> +    cmask = MAKE_32BIT_MASK(3, num_ctrs);
> +
> +   /**
        ^ Same here and I think I saw at least one other comment block
	like this in a previous patch of this series.

> +    * The event encoding is specified in the SBI specification
> +    * Event idx is a 20bits wide number encoded as follows:
> +    * event_idx[19:16] = type
> +    * event_idx[15:0] = code
> +    * The code field in cache events are encoded as follows:
> +    * event_idx.code[15:3] = cache_id
> +    * event_idx.code[2:1] = op_id
> +    * event_idx.code[0:0] = result_id
> +    */
> +
> +   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> +   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
> +   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
> +   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
> +
> +   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> +   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
> +   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
> +   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
> +
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> +   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
> +   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
> +   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
> +
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
> +   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
> +   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
> +   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
> +
> +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> +   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
> +   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
> +   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
> +
> +   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> +}
> +
>  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
>  {
>      if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 036653627f78..3004ce37b636 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
>  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                 uint32_t ctr_idx);
>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
> +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
>  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                            uint32_t ctr_idx);
> -- 
> 2.25.1
> 
>

Thanks,
drew

