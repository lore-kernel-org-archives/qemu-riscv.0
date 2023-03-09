Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paAi3-0005FF-TZ
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAi2-0005Et-No; Thu, 09 Mar 2023 02:29:07 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAi0-0001rl-Ez; Thu, 09 Mar 2023 02:29:06 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VdSaDQj_1678346937; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdSaDQj_1678346937) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 15:28:58 +0800
Message-ID: <9bb69365-f291-8515-2afa-1792998601b8@linux.alibaba.com>
Date: Thu, 9 Mar 2023 15:28:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 03/17] target/riscv/cpu.c: remove
 set_priv_version()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-4-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230308201925.258223-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 07:29:07 -0000


On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
> The setter is doing nothing special. Just set env->priv_ver directly.
IMHO, No better than the older implementation.

Zhiwei

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0baed79ec2..964817b9d2 100644
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
> @@ -1159,7 +1155,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>   
>       if (priv_version >= PRIV_VERSION_1_10_0) {
> -        set_priv_version(env, priv_version);
> +        env->priv_ver = priv_version;
>       }
>   
>       /* Force disable extensions if priv spec version does not match */

