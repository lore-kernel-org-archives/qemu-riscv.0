Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvpUa-0002fN-0v
	for mharc-qemu-riscv@gnu.org; Mon, 30 May 2022 20:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpUZ-0002f4-0h; Mon, 30 May 2022 20:12:11 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:39361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpUU-0004TS-2Q; Mon, 30 May 2022 20:12:10 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2e0a41009so14823625fac.6; 
 Mon, 30 May 2022 17:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nA80fCdjT4lK6SgmXZdWqpPcUbhUEOdbdj0+26h0SvM=;
 b=QYtLRf65kMtILJleosMg1Kiu/TS3PrZzDyXQ0t28NEjm38jl1dkvS71XQBsJDnFbYa
 ycgg+XsLifypvPaqKlSMgdjoqN9dV+HnsW5FMVUPtQO5C9YFWlJpIobBGQYkqEC0t8lD
 N+IQR6Qzzf+biaBPNbB1jZIMIbPA6Db4HEUdw6Hc1R+U69PFF/82fUkB3LW8DzfQdjva
 I8sQNF2fQsMQXSn4fD3JHup9GsxW51bYBMYKCJ9JzQ6kGaEUGNrTykP0ZbkTgLl3Tl+Y
 KIRvAPI52LfgRtG+GKTIjTXi9LUD+Nl9nTy6rdBTxDi70Zt8VGOF3iqct70uMMUjys60
 eLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nA80fCdjT4lK6SgmXZdWqpPcUbhUEOdbdj0+26h0SvM=;
 b=10QaZsbTiJxDQ0awUF9h2ydcavbipHJPSp54ekJwcu1dCVALEMfkTGBehVzX47zYti
 K7GSv501mUbQq7Ex+Cs2LNIfXZmfi2yarQWtcndM5znqbUBcU1yjh+S/L9V8CunsDRBQ
 rGXBH0uqwkttfwU7ty/NyaIU3uO5OqIbMSrxN/fNrvjTbrSsuXkwB5yGzJf93QkFiD3P
 QL/OgGYlMCd9MCl+FG1vd+NaTJBp1aJknL474L8LyvRQt/+qvh3lAABM14tyj/9q0AL/
 a7sOQ1rzXxAQEhNP4U/wxa1G/QNxMM/KAq/LU0Nxg1hgaiQ7zjpDiQ+Qri1Oba6Q/JQj
 fasQ==
X-Gm-Message-State: AOAM531cfqUfvUcpd90Krk3ZiJSIkFQcNWrYEg0eltl3LzG4gSZZxFN0
 NQXhHyxfzjB21k8FTMh5duATItyMjKNodqueLDg=
X-Google-Smtp-Source: ABdhPJyENYVA7kdZm9AA3VNzj9sQDvUqrlZ1yqZxlvZkVQ5ooGR7YAglpprRKKUtBItQFKKi61V+n2A+bBDhtCWcwfQ=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr11730540oae.278.1653955923937; Mon, 30
 May 2022 17:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523235057.123882-1-atishp@rivosinc.com>
 <20220523235057.123882-12-atishp@rivosinc.com>
In-Reply-To: <20220523235057.123882-12-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 May 2022 10:11:37 +1000
Message-ID: <CAKmqyKOoyUFKFjj4coJEHgdThmAjDR+GW8Tq6rDy=RakwXfhxw@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] hw/riscv: virt: Add PMU DT node to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 31 May 2022 00:12:11 -0000

On Tue, May 24, 2022 at 10:10 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Qemu virt machine can support few cache events and cycle/instret counters.
> It also supports counter overflow for these events.
>
> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> capabilities. There are some dummy nodes added for testing as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c    | 28 +++++++++++++++++++++++
>  target/riscv/cpu.c |  1 +
>  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/pmu.h |  1 +
>  4 files changed, 87 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96a2..1b17ba7f8059 100644
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
> @@ -715,6 +716,32 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
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
> @@ -760,6 +787,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>                      &intc_phandles[phandle_pos]);
>              }
>          }
> +        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
>      }
>
>      if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a8f156a66eba..b51ad7496f71 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1032,6 +1032,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zkt, ext_zkt),
>          ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> +        ISA_EDATA_ENTRY(sscofpmf, ext_sscofpmf),
>          ISA_EDATA_ENTRY(svinval, ext_svinval),
>          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 7bb85d8d6ad7..0163758297c4 100644
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

