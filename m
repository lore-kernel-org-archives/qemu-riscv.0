Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOu2L-0003Da-CQ
	for mharc-qemu-riscv@gnu.org; Fri, 19 Aug 2022 00:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oOu2J-0003DG-C7; Fri, 19 Aug 2022 00:55:11 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:49454 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oOu29-00049I-OE; Fri, 19 Aug 2022 00:55:11 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowADX3rKQF_9ibHC1Gg--.19465S2;
 Fri, 19 Aug 2022 12:54:40 +0800 (CST)
Subject: Re: [PATCH] target/riscv: Use official extension names for AIA CSRs
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20220819030938.166196-1-apatel@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <8189bac8-4873-bd7c-568a-bc99bb73781b@iscas.ac.cn>
Date: Fri, 19 Aug 2022 12:54:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220819030938.166196-1-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADX3rKQF_9ibHC1Gg--.19465S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGr48Kr4rXw1ruryDJFykGrg_yoWDKFyfpr
 W8Ga9xCryDt3ZrZa93KF1DJF1rZ3WUK3yYk39ru3y3ZF4DGrWUXrnFkasFvr4kuay8Xw1I
 vr15CF1qka12qFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
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
X-List-Received-Date: Fri, 19 Aug 2022 04:55:11 -0000


在 2022/8/19 上午11:09, Anup Patel 写道:
> The arch review of AIA spec is completed and we now have official
> extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
> AIA CSRs).
>
> Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
> https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)
>
> Based on above, we update QEMU RISC-V to:
> 1) Have separate config options for Smaia and Ssaia extensions
>     which replace RISCV_FEATURE_AIA in CPU features
> 2) Not generate AIA INTC compatible string in virt machine
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   hw/intc/riscv_imsic.c     |  4 +++-
>   hw/riscv/virt.c           | 13 ++-----------
>   target/riscv/cpu.c        |  9 ++++-----
>   target/riscv/cpu.h        |  4 ++--
>   target/riscv/cpu_helper.c | 30 ++++++++++++++++++++++--------
>   target/riscv/csr.c        | 30 ++++++++++++++++++++++++------
>   6 files changed, 57 insertions(+), 33 deletions(-)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 8615e4cc1d..4d4d5b50ca 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -344,9 +344,11 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>   
>       /* Force select AIA feature and setup CSR read-modify-write callback */
>       if (env) {
> -        riscv_set_feature(env, RISCV_FEATURE_AIA);
>           if (!imsic->mmode) {
> +            rcpu->cfg.ext_ssaia = true;
>               riscv_cpu_set_geilen(env, imsic->num_pages - 1);
> +        } else {
> +            rcpu->cfg.ext_smaia = true;
>           }
>           riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
>                                         riscv_imsic_rmw, imsic);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e779d399ae..b041b33afc 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -261,17 +261,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>           qemu_fdt_add_subnode(mc->fdt, intc_name);
>           qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
>               intc_phandles[cpu]);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_AIA)) {
> -            static const char * const compat[2] = {
> -                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> -            };
> -            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> -                "riscv,cpu-intc");
> -        }
> +        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> +            "riscv,cpu-intc");
>           qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
>           qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
>   
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d11113fbaa..3cf0c86661 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -101,6 +101,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
>       ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
> @@ -669,10 +671,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> -    if (cpu->cfg.aia) {
> -        riscv_set_feature(env, RISCV_FEATURE_AIA);
> -    }
> -
>       if (cpu->cfg.debug) {
>           riscv_set_feature(env, RISCV_FEATURE_DEBUG);
>       }
> @@ -1058,7 +1056,8 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>       /* ePMP 0.9.3 */
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> -    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> +    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> +    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 42edfa4558..15cad73def 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -85,7 +85,6 @@ enum {
>       RISCV_FEATURE_PMP,
>       RISCV_FEATURE_EPMP,
>       RISCV_FEATURE_MISA,
> -    RISCV_FEATURE_AIA,
>       RISCV_FEATURE_DEBUG
>   };
>   
> @@ -452,6 +451,8 @@ struct RISCVCPUConfig {
>       bool ext_zve64f;
>       bool ext_zmmul;
>       bool ext_sscofpmf;
> +    bool ext_smaia;
> +    bool ext_ssaia;
>       bool rvv_ta_all_1s;
>       bool rvv_ma_all_1s;
>   
> @@ -472,7 +473,6 @@ struct RISCVCPUConfig {
>       bool mmu;
>       bool pmp;
>       bool epmp;
> -    bool aia;
>       bool debug;
>       uint64_t resetvec;
>   
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 81948b37dd..92685947d9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -305,7 +305,7 @@ uint8_t riscv_cpu_default_priority(int irq)
>       return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
>   };
>   
> -static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +static int riscv_cpu_pending_to_irq(CPURISCVState *env, bool has_aia,
>                                       int extirq, unsigned int extirq_def_prio,
>                                       uint64_t pending, uint8_t *iprio)

It seems that we can  get cpu->cfg.ext_smaia/cpu->cfg.ext_ssaia based on 
extirq directly from '*env' in

this function itself. If so, we can reuse the original code for 
following riscv_cpu_*irq_pending functions.

Regards,

Weiwei Li

>   {
> @@ -317,7 +317,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>       }
>   
>       irq = ctz64(pending);
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    if (!has_aia) {
>           return irq;
>       }
>   
> @@ -354,34 +354,45 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>   
>   int riscv_cpu_mirq_pending(CPURISCVState *env)
>   {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
>       uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
>                       ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>   
> -    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_smaia,
> +                                    IRQ_M_EXT, IPRIO_DEFAULT_M,
>                                       irqs, env->miprio);
>   }
>   
>   int riscv_cpu_sirq_pending(CPURISCVState *env)
>   {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
>       uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
>                       ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>   
> -    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
> +                                    IRQ_S_EXT, IPRIO_DEFAULT_S,
>                                       irqs, env->siprio);
>   }
>   
>   int riscv_cpu_vsirq_pending(CPURISCVState *env)
>   {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
>       uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
>                       (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>   
> -    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
> +                                    IRQ_S_EXT, IPRIO_DEFAULT_S,
>                                       irqs >> 1, env->hviprio);
>   }
>   
>   static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>   {
>       int virq;
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
>       uint64_t irqs, pending, mie, hsie, vsie;
>   
>       /* Determine interrupt enable state of all privilege modes */
> @@ -404,21 +415,24 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>       /* Check M-mode interrupts */
>       irqs = pending & ~env->mideleg & -mie;
>       if (irqs) {
> -        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +        return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_smaia,
> +                                        IRQ_M_EXT, IPRIO_DEFAULT_M,
>                                           irqs, env->miprio);
>       }
>   
>       /* Check HS-mode interrupts */
>       irqs = pending & env->mideleg & ~env->hideleg & -hsie;
>       if (irqs) {
> -        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +        return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
> +                                        IRQ_S_EXT, IPRIO_DEFAULT_S,
>                                           irqs, env->siprio);
>       }
>   
>       /* Check VS-mode interrupts */
>       irqs = pending & env->mideleg & env->hideleg & -vsie;
>       if (irqs) {
> -        virq = riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +        virq = riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
> +                                        IRQ_S_EXT, IPRIO_DEFAULT_S,
>                                           irqs >> 1, env->hviprio);
>           return (virq <= 0) ? virq : virq + 1;
>       }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2dcd4e5b2d..b9bce9821f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -181,7 +181,10 @@ static RISCVException any32(CPURISCVState *env, int csrno)
>   
>   static int aia_any(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -190,7 +193,10 @@ static int aia_any(CPURISCVState *env, int csrno)
>   
>   static int aia_any32(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -217,7 +223,10 @@ static int smode32(CPURISCVState *env, int csrno)
>   
>   static int aia_smode(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -226,7 +235,10 @@ static int aia_smode(CPURISCVState *env, int csrno)
>   
>   static int aia_smode32(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -282,7 +294,10 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   
>   static int aia_hmode(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>        }
>   
> @@ -291,7 +306,10 @@ static int aia_hmode(CPURISCVState *env, int csrno)
>   
>   static int aia_hmode32(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   


