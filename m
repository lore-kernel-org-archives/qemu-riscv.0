Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peR95-0001ty-0Q
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 21:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR93-0001tW-OJ; Mon, 20 Mar 2023 21:50:37 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR91-0003SJ-Fh; Mon, 20 Mar 2023 21:50:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeKxAGh_1679363427; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeKxAGh_1679363427) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 09:50:28 +0800
Message-ID: <2e945bcf-831f-4313-7b8d-d2091f0d8076@linux.alibaba.com>
Date: Tue, 21 Mar 2023 09:50:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v3 03/26] target/riscv/cpu.c: remove
 set_priv_version()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-4-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230318200436.299464-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 21 Mar 2023 01:50:38 -0000


On 2023/3/19 4:04, Daniel Henrique Barboza wrote:
> The setter is doing nothing special. Just set env->priv_ver directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2752efe1eb..18032dfd4e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>       env->misa_ext_mask = env->misa_ext = ext;
>   }
>   
> -static void set_priv_version(CPURISCVState *env, int priv_ver)
> -{
> -    env->priv_ver = priv_ver;
> -}
> -
>   #ifndef CONFIG_USER_ONLY
>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
>   {
> @@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
>                                       VM_1_10_SV32 : VM_1_10_SV57);
>   #endif
>   
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver = PRIV_VERSION_1_12_0;
>       register_cpu_props(obj);
>   }
>   
> @@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV64, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver = PRIV_VERSION_1_12_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>   #endif
> @@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>   #endif
> @@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver = PRIV_VERSION_1_10_0;
>       cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    env->priv_ver = PRIV_VERSION_1_11_0;
>   
>       cpu->cfg.ext_g = true;
>       cpu->cfg.ext_c = true;
> @@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV128, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver = PRIV_VERSION_1_12_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>   #endif
> @@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV32, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver = PRIV_VERSION_1_12_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>   #endif
> @@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>   #endif
> @@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver = PRIV_VERSION_1_10_0;
>       cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    env->priv_ver = PRIV_VERSION_1_11_0;
>       cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>       register_cpu_props(obj);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver = PRIV_VERSION_1_10_0;
>       cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -1160,7 +1156,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>   
>       if (priv_version >= PRIV_VERSION_1_10_0) {
> -        set_priv_version(env, priv_version);
> +        env->priv_ver = priv_version;
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei
>       }
>   
>       /* Force disable extensions if priv spec version does not match */

