Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n73Ne-0006A3-IX
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 17:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n73Nc-00065c-JB
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 17:43:08 -0500
Received: from [2a00:1450:4864:20::532] (port=37464
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n73NZ-0001u5-3M
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 17:43:08 -0500
Received: by mail-ed1-x532.google.com with SMTP id o6so59763330edc.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Jan 2022 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uHLDQk8SpMqdqb9PogmmvmND1D39rIz23sn/JH0KVw=;
 b=VzRdv1h8qlZbKLvjgbrmR1mdjIUR7kaUbaVFioNRNnQWsUhB61LKgTNQUskGe1oOda
 lM9Nh1o2L5A9ZfEcNHUYED0lE6MNVkqlHLVTzBQdTX1cS8wFEhZpGsfTSNBAOtZ5ICqB
 rGNrpfMtwXSXeKJOWMQRNkWNsOYS2qW5/Y/A7YZ78oOoT2ElsYr6nsigXJGxSXjlEfLB
 lT3kluhZ5xuwvuwPJKo/exSAxI9ZopOn/fr0y4udtmLMvhT62a6FBZw9GMqqhJojUwOq
 UD142AUz9D/a1pn6jCWsWm4WSgvZ06QSvPZGNnLTbYyTDTgDjT2vrAKSRXSsRQjQSqhT
 Gsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uHLDQk8SpMqdqb9PogmmvmND1D39rIz23sn/JH0KVw=;
 b=OPSmqznYV9YR8u0RplLKG4Ug+gFSL8RzP1HDCDK29IZKQRG5dRpPnODcSuvNmeE+4P
 SgZJnwV2KOdn5JPWnQGPaycvXiIIOM/NFPdvLYEmRNtMyHPymhkOGa/epX1l12mNNgPm
 bjbfAYWTdQ/GlQfLyxjpMy+nz2rzd8BEjIGIJrr0mBmuk0d1ISju/KVX8nn+pV4Phn6Y
 Psmk1d4i3Ne/u5dM5/YYj7BXWlTTFH2MatRm+1kd97RRgJp4uowlv46swnA4s+Rfbv7+
 3kXYTk6zm0KqPqpOF8bDA8h8MIuHkXECAo7ZFU/TOhxCSSEWbOZYU0i1cWvWrKn6bRvI
 XIuw==
X-Gm-Message-State: AOAM531BnuewTyBeZrqm3JZz2bCXlhH80/vgaX3XHcYSrEPYVrQUl3cx
 1bZa+IMmFvhLWOsNY8l4MpVeg4gRHsKKPGV7/xEjFlGX35mcyQ==
X-Google-Smtp-Source: ABdhPJzFRtIEhnfwwtkJmBiwuiQJ6MQ/QPD/HCL5xv5rlJXqCVAXmsuLn8cjOpI/2IsOy7DmCPnR5ng00CVmSNTgOJ0=
X-Received: by 2002:a17:906:d93:: with SMTP id
 m19mr1401197eji.34.1641854583477; 
 Mon, 10 Jan 2022 14:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-12-atishp@rivosinc.com>
 <CAEUhbmUK5=M2HL2Zya_Or+yMCVgTZdOUm1LicYE=RRQXsJV=mQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUK5=M2HL2Zya_Or+yMCVgTZdOUm1LicYE=RRQXsJV=mQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 10 Jan 2022 14:42:52 -0800
Message-ID: <CAHBxVyEi=isSuH-u0tGRRG9V5AcxG+V2tCiHUnrw72V16Wfpkw@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] hw/riscv: virt: Add PMU DT node to the device
 tree
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=atishp@rivosinc.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 22:43:08 -0000

On Sun, Jan 9, 2022 at 11:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 7, 2022 at 10:27 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Qemu virt machine can support few cache events and cycle/instret counters.
> > It also supports counter overflow for these events.
> >
> > Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> > capabilities. There are some dummy nodes added for testing as well.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/riscv/virt.c    | 38 ++++++++++++++++++++++++++++++++++++++
> >  target/riscv/pmu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/pmu.h |  1 +
> >  3 files changed, 84 insertions(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3af074148ef4..99154199091c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -28,6 +28,7 @@
> >  #include "hw/qdev-properties.h"
> >  #include "hw/char/serial.h"
> >  #include "target/riscv/cpu.h"
> > +#include "target/riscv/pmu.h"
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/riscv/virt.h"
> >  #include "hw/riscv/boot.h"
> > @@ -406,6 +407,33 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
> >      g_free(plic_cells);
> >  }
> >
> > +static void create_fdt_socket_pmu(RISCVVirtState *s,
> > +                                  int socket, uint32_t *phandle,
> > +                                  uint32_t *intc_phandles)
> > +{
> > +    int cpu;
> > +    char *pmu_name;
> > +    uint32_t *pmu_cells;
> > +    MachineState *mc = MACHINE(s);
> > +    RISCVCPU hart = s->soc[socket].harts[0];
> > +
> > +    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> > +
> > +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> > +        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
> > +    }
> > +
> > +    pmu_name = g_strdup_printf("/soc/pmu");
> > +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> > +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
> > +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> > +
> > +    g_free(pmu_name);
> > +    g_free(pmu_cells);
> > +}
> > +
> > +
> >  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
> >                                 bool is_32_bit, uint32_t *phandle,
> >                                 uint32_t *irq_mmio_phandle,
> > @@ -417,12 +445,20 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
> >      uint32_t *intc_phandles;
> >      MachineState *mc = MACHINE(s);
> >      uint32_t xplic_phandles[MAX_NODES];
> > +    RISCVCPU hart;
> >
> >      qemu_fdt_add_subnode(mc->fdt, "/cpus");
> >      qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
> >                            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
> > +
> > +    /* Add the node for isa extensions discovery */
> > +    qemu_fdt_add_subnode(mc->fdt, "/cpus/riscv,isa-ext");
>
> Looks like the ongoing discussion does not support this idea
> https://lore.kernel.org/linux-riscv/20211224211632.1698523-1-atishp@rivosinc.com/
>

Yes. Palmer's comment arrived after I sent out the Qemu series. I will
fix that in the next
version once we have string parsing (riscv,isa) ready.

> > +    hart = s->soc[0].harts[0];
> > +    if (hart.cfg.ext_sscof) {
> > +        qemu_fdt_setprop(mc->fdt, "/cpus/riscv,isa-ext", "sscofpmf", NULL, 0);
> > +    }
> >      qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
> >
> >      for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
> > @@ -445,6 +481,8 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
> >          create_fdt_socket_plic(s, memmap, socket, phandle,
> >              intc_phandles, xplic_phandles);
> >
> > +        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
> > +
> >          g_free(intc_phandles);
> >          g_free(clust_name);
> >      }
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 15f161059fb7..b58a09c85616 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -19,11 +19,56 @@
> >  #include "qemu/osdep.h"
> >  #include "cpu.h"
> >  #include "pmu.h"
> > +#include "sysemu/device_tree.h"
> >
> >  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> >  #define MAKE_32BIT_MASK(shift, length) \
> >          (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> >
> > +/**
> > + * To keep it simple, any event can be mapped to any programmable counters in
> > + * QEMU. The generic cycle & instruction count events can also be monitored
> > + * using programmable counters. In that case, mcycle & minstret must continue
> > + * to provide the correct value as well. Hetergenous PMU per hart is not
>
> typo of Heterogeneous
>
> > + * supported yet. Thus, number of counters are same across all harts.
> > + */
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
> > +{
> > +    uint32_t fdt_event_ctr_map[20] = {};
> > +    uint32_t cmask;
> > +
> > +    /* All the programmable counters can map to any event */
> > +    cmask = MAKE_32BIT_MASK(3, num_ctrs);
> > +
> > +   /* SBI_PMU_HW_CPU_CYCLES */
> > +   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
> > +
> > +   /* SBI_PMU_HW_INSTRUCTIONS */
> > +   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : READ : MISS */
> > +   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : WRITE : MISS */
> > +   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_ITLB : READ : MISS */
> > +   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
> > +
> > +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> > +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
>
> Where is this documented? I can't find related discussion in the linux-riscv ML.
>

These are OpenSBI specific DT bindings. OpenSBI will delete it during
the dt fixup.
https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md

Apologies for this confusion. I should have put a comment about this here.

> Please add some comment blocks to explain where these magic numbers
> (like 0x00010021) come from.
>

Sure. I will refer to the event encoding scheme and describe the details.

> > +}
> > +
> >  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> >  {
> >      if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
> > diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> > index 9b400c3522f2..63c4b533b223 100644
> > --- a/target/riscv/pmu.h
> > +++ b/target/riscv/pmu.h
> > @@ -31,6 +31,7 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> >  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> >                                 uint32_t ctr_idx);
> >  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
> >  target_ulong get_icount_ticks(bool brv32);
> >  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> >                            uint32_t ctr_idx);
> > --
>
> Regards,
> Bin

