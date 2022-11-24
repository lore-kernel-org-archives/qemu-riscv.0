Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyC87-0003Cf-CR
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 08:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oyC7e-00036J-FT; Thu, 24 Nov 2022 08:18:35 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oyC7b-00009b-PG; Thu, 24 Nov 2022 08:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669295912; x=1700831912;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e12rJloOSSmbkY5BvmHsVqpB0/1fYxIbmqwVDUFN7Sk=;
 b=dw44fbm8T+AwmYOeOlmqfGh5CUZOcUtPX1MHv1pXSCNg2dYdw7Hfu+gm
 jQB51PTQGc0Tr1Xs8507iiJRBus2WioOhz0lsshi68dOC1CeINCOTLWoM
 vKkP9lOhCsEMI+aIFoHGeo+2lQUU+W34H5M0WGXK7BmBg79EwzyBUkofm
 uqJ6EpItk5us65urkM6nONzXvCxErBPyhPTzZnHoVRPZUoEUhVvCdGjvm
 wUO47XJyZoE7gib0jK5kAsPYvHH9RuW6FLAmtAtEeXI3GQi+tAAlNyyT3
 Hp/zFq5ceuLRdyX1Uv7CTmdsX1IX4y9V39VhjZmnOqpYgb0mG0N2APvx5 w==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="185034589"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Nov 2022 06:17:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:16:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:16:48 -0700
Date: Thu, 24 Nov 2022 13:16:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
CC: <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Message-ID: <Y39urpX82uO85AAb@wendy>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220824221701.41932-5-atishp@rivosinc.com>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 24 Nov 2022 13:19:02 -0000

On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> Qemu virt machine can support few cache events and cycle/instret counters.
> It also supports counter overflow for these events.
> 
> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> capabilities. There are some dummy nodes added for testing as well.

Hey Atish!

I was fiddling with dumping the virt machine dtb again today to check
some dt-binding changes I was making for the isa string would play
nicely with the virt machine & I noticed that this patch has introduced
a new validation failure:

./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb

dt-validate -p ../linux/Documentation/devicetree/bindings/processed-schema.json qemu.dtb 
/home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 65563, 524280, 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
	From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/simple-bus.yaml

I assume this is the aforementioned "dummy" node & you have no intention
of creating a binding for this?

Thanks,
Conor.

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
> index ff8c0df5cd47..befa9d2c26ac 100644
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
> @@ -708,6 +709,20 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
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
> @@ -1036,6 +1051,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>  
>      create_fdt_flash(s, memmap);
>      create_fdt_fw_cfg(s, memmap);
> +    create_fdt_pmu(s);
>  
>  update_bootargs:
>      if (cmdline && *cmdline) {
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index a5f504e53c88..b8e56d2b7b8e 100644
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
> +/*
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
> +   /*
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
> 

