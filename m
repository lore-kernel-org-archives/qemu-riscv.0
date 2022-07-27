Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGbSF-0001UO-OA
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 03:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oGbSD-0001RR-H5
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 03:27:37 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oGbSB-0000wx-GT
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 03:27:37 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso1314165pjd.3
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7ovlLJadn1ePaSwupUEt0bu/p4IerMFaSNoMu5EwcQA=;
 b=O8j/mUUGG6sf+5IBD+ZSpH5s6oO0V1OqUTLSFkL7BVOq6Gt9T1u1nFDqiN7BA70sWg
 fAOMf1XIBvCmjp/iClw5VJZz2UXRdhRex8AhnkuGJdMSOL2o/jWMyrVgF/rtFQLDGmZ7
 w2xUF/3aXJeRiWUE44AbjSoGSROP2IU/8q4tkZo0uA8E1CAUhR8GTVme8YiUmhDJtJMx
 FX0Nrjt3UWgHUSU+4U1j4jl2bEjeKUbNU1tNM0dUT3z9HV7rWBya9k87vVbUn5CNuALw
 EqQTR5N/LrVXjqwFTv1Ng8eindxOqfygH81KaE9nXnR9mwLhvos0SeJzMEAmcWFzQ3hn
 NPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ovlLJadn1ePaSwupUEt0bu/p4IerMFaSNoMu5EwcQA=;
 b=ZVxDIzIl4eoMq9wymLHjV+5u1z8cTAOUEIrnsyxoEfqc97N4kT2/BBiGKmujNZFzsL
 s0FwSZXprdcTrfRSD0IiRDjIU+fm9/AY6b7j8PJ2DpdFC2dHNp9p9wQBLkC4Q9lnku/P
 gm9nZelMOD+qq7zfM0/RNhfxyMWV1qmJy5GdO9pa/fwYvw8i+BDFiE5Z8zSy/ofy0cgm
 yxd7KEkpSCUgdnLgYODhY47f3v/mIBkfGEMUenNsu/nOT0DbJuq7iBLqG0710+1bMxBl
 aYh4dhlQ9zjS6w4n253DwiYLYs5OtSbV/PsfNv5FvVJjzvHYQQZoMDJhwYIs2wqU6y0L
 9hxg==
X-Gm-Message-State: AJIora/hx70rkhAVAdWX0oenG4VcwWzDD21oT2KYxJJVsmtJGQ/dNy+C
 uYQeMQPef6wNZ1b4Y+z3yyyEgQ==
X-Google-Smtp-Source: AGRyM1spqHWNYfNwRb9PHMwZYL84Y6YV2iTjlju/V13aXAigQan8wj0DMU1Zjwgr78MUgYUWtNxR7Q==
X-Received: by 2002:a17:902:ce09:b0:16c:c7b6:8b63 with SMTP id
 k9-20020a170902ce0900b0016cc7b68b63mr20519069plg.35.1658906853725; 
 Wed, 27 Jul 2022 00:27:33 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.32]) by smtp.gmail.com with ESMTPSA id
 6-20020a631346000000b0041b34595becsm1872380pgt.50.2022.07.27.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:27:33 -0700 (PDT)
Date: Wed, 27 Jul 2022 12:57:26 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v11 4/6] hw/riscv: virt: Add PMU DT node to the device tree
Message-ID: <20220727072726.GA29900@sunil-laptop>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727064913.1041427-5-atishp@rivosinc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 07:27:37 -0000

Hi Atish,

On Tue, Jul 26, 2022 at 11:49:11PM -0700, Atish Patra wrote:
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
>  hw/riscv/virt.c    | 28 +++++++++++++++++++++++
>  target/riscv/cpu.c |  1 +
>  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/pmu.h |  1 +
>  4 files changed, 87 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f523..0f3fdb4908b8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -29,6 +29,7 @@
>  #include "hw/char/serial.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/core/sysbus-fdt.h"
> +#include "target/riscv/pmu.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
> @@ -714,6 +715,32 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>      aplic_phandles[socket] = aplic_s_phandle;
>  }
>  
> +static void create_fdt_socket_pmu(RISCVVirtState *s,
> +                                  int socket, uint32_t *phandle,
> +                                  uint32_t *intc_phandles)
> +{
> +    int cpu;
> +    char *pmu_name;
> +    uint32_t *pmu_cells;
> +    MachineState *mc = MACHINE(s);
> +    RISCVCPU hart = s->soc[socket].harts[0];
> +
> +    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +
> +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
> +    }
> +
> +    pmu_name = g_strdup_printf("/soc/pmu");
> +    qemu_fdt_add_subnode(mc->fdt, pmu_name);

Does this work for you when there are more than 1 sockets? Shouldn't
this be unique name for each socket?

Thanks
Sunil

> +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
> +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> +
> +    g_free(pmu_name);
> +    g_free(pmu_cells);
> +}
> +
>  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>                                 bool is_32_bit, uint32_t *phandle,
>                                 uint32_t *irq_mmio_phandle,
> @@ -759,6 +786,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>                      &intc_phandles[phandle_pos]);
>              }
>          }
> +        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
>      }
>  
>      if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1d62b81a725..5c8417a56e5b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1114,6 +1114,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>          ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>          ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> +        ISA_EDATA_ENTRY(sscofpmf, ext_sscofpmf),
>          ISA_EDATA_ENTRY(svinval, ext_svinval),
>          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
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

