Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfAU8-0008Kf-Nb
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 22:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfAU6-0008KB-Tb; Wed, 22 Mar 2023 22:15:22 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfATq-0006Tn-18; Wed, 22 Mar 2023 22:15:22 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSNMr9_1679537694; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSNMr9_1679537694) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 10:14:55 +0800
Message-ID: <54371a2c-78f2-19a7-7a85-10ad0dec72a7@linux.alibaba.com>
Date: Thu, 23 Mar 2023 10:14:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 11/25] target/riscv/cpu.c: set cpu config in
 set_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-12-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Mar 2023 02:15:23 -0000


On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> set_misa() is setting all 'misa' related env states and nothing else.
> But other functions, namely riscv_cpu_validate_set_extensions(), uses
> the config object to do its job.
>
> This creates a need to set the single letter extensions in the cfg
> object to keep both in sync. At this moment this is being done by
> register_cpu_props(), forcing every CPU to do a call to this function.
>
> Let's beef up set_misa() and make the function do the sync for us. This
> will relieve named CPUs to having to call register_cpu_props(), which
> will then be redesigned to a more specialized role next.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++-----------
>   target/riscv/cpu.h |  4 ++--
>   2 files changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 36c55abda0..df5c0bda70 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>   
>   static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>   {
> +    RISCVCPU *cpu;
> +
>       env->misa_mxl_max = env->misa_mxl = mxl;
>       env->misa_ext_mask = env->misa_ext = ext;
> +
> +    /*
> +     * ext = 0 will only be a thing during cpu_init() functions
> +     * as a way of setting an extension-agnostic CPU. We do
> +     * not support clearing misa_ext* and the ext_N flags in
> +     * RISCVCPUConfig in regular circunstances.
> +     */
> +    if (ext == 0) {
> +        return;
> +    }
> +
> +    /*
> +     * We can't use riscv_cpu_cfg() in this case because it is
> +     * a read-only inline and we're going to change the values
> +     * of cpu->cfg.
> +     */
> +    cpu = env_archcpu(env);
> +
> +    cpu->cfg.ext_i = ext & RVI;
> +    cpu->cfg.ext_e = ext & RVE;
> +    cpu->cfg.ext_m = ext & RVM;
> +    cpu->cfg.ext_a = ext & RVA;
> +    cpu->cfg.ext_f = ext & RVF;
> +    cpu->cfg.ext_d = ext & RVD;
> +    cpu->cfg.ext_v = ext & RVV;
> +    cpu->cfg.ext_c = ext & RVC;
> +    cpu->cfg.ext_s = ext & RVS;
> +    cpu->cfg.ext_u = ext & RVU;
> +    cpu->cfg.ext_h = ext & RVH;
> +    cpu->cfg.ext_j = ext & RVJ;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
>   #endif
>   
>       env->priv_ver = PRIV_VERSION_LATEST;
> -    register_cpu_props(obj);

This patch will break the original logic. We can only can a empty CPU here.

>   
>       /* inherited from parent obj via riscv_cpu_init() */
>       cpu->cfg.ext_ifencei = true;
> @@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -408,9 +437,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   
>       cpu->cfg.ext_g = true;
> -    cpu->cfg.ext_c = true;
> -    cpu->cfg.ext_u = true;
> -    cpu->cfg.ext_s = true;

Why specially for these configurations?

Zhiwei

>       cpu->cfg.ext_icsr = true;
>       cpu->cfg.ext_zfh = true;
>       cpu->cfg.mmu = true;
> @@ -472,8 +498,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> -
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -492,7 +516,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -510,7 +533,6 @@ static void rv32_ibex_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -529,7 +551,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> -    register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 76f81c6b68..ebe0fff668 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -66,8 +66,8 @@
>   #define RV(x) ((target_ulong)1 << (x - 'A'))
>   
>   /*
> - * Consider updating register_cpu_props() when adding
> - * new MISA bits here.
> + * Consider updating set_misa() when adding new
> + * MISA bits here.
>    */
>   #define RVI RV('I')
>   #define RVE RV('E') /* E and I are mutually exclusive */

