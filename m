Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJBaP-0007hF-LH
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 06:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oJBaD-0007aP-0h; Wed, 03 Aug 2022 06:26:33 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:57254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oJBa9-00033j-Kp; Wed, 03 Aug 2022 06:26:31 -0400
Received: from [167.98.27.226] (helo=[10.35.5.6])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oJBZy-008r0c-FJ; Wed, 03 Aug 2022 11:26:18 +0100
Message-ID: <57873d3b-dd78-2bcc-7e28-a7aec0bbf24e@codethink.co.uk>
Date: Wed, 3 Aug 2022 11:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 2/3] target/riscv: Add stimecmp support
Content-Language: en-GB
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220803082516.2271344-1-atishp@rivosinc.com>
 <20220803082516.2271344-3-atishp@rivosinc.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220803082516.2271344-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 03 Aug 2022 10:26:39 -0000

On 03/08/2022 09:25, Atish Patra wrote:
> stimecmp allows the supervisor mode to update stimecmp CSR directly
> to program the next timer interrupt. This CSR is part of the Sstc
> extension which was ratified recently.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.c         | 12 +++++
>   target/riscv/cpu.h         |  5 ++
>   target/riscv/cpu_bits.h    |  4 ++
>   target/riscv/csr.c         | 81 +++++++++++++++++++++++++++++++
>   target/riscv/machine.c     |  1 +
>   target/riscv/meson.build   |  3 +-
>   target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
>   target/riscv/time_helper.h | 30 ++++++++++++
>   8 files changed, 233 insertions(+), 1 deletion(-)
>   create mode 100644 target/riscv/time_helper.c
>   create mode 100644 target/riscv/time_helper.h
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d4635c7df46b..e0c3e786849f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,6 +23,7 @@
>   #include "qemu/log.h"
>   #include "cpu.h"
>   #include "internals.h"
> +#include "time_helper.h"
>   #include "exec/exec-all.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
> @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> @@ -675,6 +677,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   
>       set_resetvec(env, cpu->cfg.resetvec);
>   
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +#endif /* CONFIG_USER_ONLY */
> +
> +
>       /* Validate that MISA_MXL is set properly. */
>       switch (env->misa_mxl_max) {
>   #ifdef TARGET_RISCV64
> @@ -968,7 +977,9 @@ static void riscv_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> +
>   #endif /* CONFIG_USER_ONLY */
> +
>   }
>   
>   static Property riscv_cpu_extensions[] = {
> @@ -995,6 +1006,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>   
>       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>       DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0fae1569945c..4cda2905661e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -309,6 +309,9 @@ struct CPUArchState {
>       uint64_t mfromhost;
>       uint64_t mtohost;
>   
> +    /* Sstc CSRs */
> +    uint64_t stimecmp;
> +
>       /* physical memory protection */
>       pmp_table_t pmp_state;
>       target_ulong mseccfg;
> @@ -362,6 +365,7 @@ struct CPUArchState {
>       float_status fp_status;
>   
>       /* Fields from here on are preserved across CPU reset. */
> +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
> @@ -425,6 +429,7 @@ struct RISCVCPUConfig {
>       bool ext_ifencei;
>       bool ext_icsr;
>       bool ext_zihintpause;
> +    bool ext_sstc;
>       bool ext_svinval;
>       bool ext_svnapot;
>       bool ext_svpbmt;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6be5a9e9f046..ac17cf1515c0 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -206,6 +206,10 @@
>   #define CSR_STVAL           0x143
>   #define CSR_SIP             0x144
>   
> +/* Sstc supervisor CSRs */
> +#define CSR_STIMECMP        0x14D
> +#define CSR_STIMECMPH       0x15D
> +
>   /* Supervisor Protection and Translation */
>   #define CSR_SPTBR           0x180
>   #define CSR_SATP            0x180
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0fb042b2fd0f..b71e2509b64f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -22,6 +22,7 @@
>   #include "qemu/timer.h"
>   #include "cpu.h"
>   #include "pmu.h"
> +#include "time_helper.h"
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   #include "sysemu/cpu-timers.h"
> @@ -803,6 +804,76 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException sstc(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (env->priv != PRV_S) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

These seem to be checking env->priv twice, wouldnt
one check for nv->priv != PRV_S be sufficient?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

