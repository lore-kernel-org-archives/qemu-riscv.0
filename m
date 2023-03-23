Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfAI9-0004Qe-AV
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 22:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfAI8-0004OL-2u; Wed, 22 Mar 2023 22:03:00 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfAI4-0002e4-W5; Wed, 22 Mar 2023 22:02:59 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R711e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSSXMI_1679536963; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSSXMI_1679536963) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 10:02:44 +0800
Message-ID: <0caf1e06-6612-2bfe-f9d9-387e5eda246c@linux.alibaba.com>
Date: Thu, 23 Mar 2023 10:02:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 09/25] target/riscv/cpu.c: remove cfg setup
 from riscv_cpu_init()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-10-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 23 Mar 2023 02:03:00 -0000


On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> We have 4 config settings being done in riscv_cpu_init(): ext_ifencei,
> ext_icsr, mmu and pmp. This is also the constructor of the "riscv-cpu"
> device, which happens to be the parent device of every RISC-V cpu.
>
> The result is that these 4 configs are being set every time, and every
> other CPU should always account for them. CPUs such as sifive_e need to
> disable settings that aren't enabled simply because the parent class
> happens to be enabling it.
>
> Moving all configurations from the parent class to each CPU will
> centralize the config of each CPU into its own init(), which is clearer
> than having to account to whatever happens to be set in the parent
> device. These settings are also being set in register_cpu_props() when
> no 'misa_ext' is set, so for these CPUs we don't need changes. Named
> CPUs will receive all cfgs that the parent were setting into their
> init().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 48 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fef55d7d79..c7b6e7b84b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -325,7 +325,8 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>   
>   static void riscv_any_cpu_init(Object *obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
>   #if defined(TARGET_RISCV32)
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>   #elif defined(TARGET_RISCV64)
> @@ -340,6 +341,12 @@ static void riscv_any_cpu_init(Object *obj)
>   
>       env->priv_ver = PRIV_VERSION_LATEST;
>       register_cpu_props(obj);
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   #if defined(TARGET_RISCV64)
> @@ -358,13 +365,20 @@ static void rv64_base_cpu_init(Object *obj)
>   
>   static void rv64_sifive_u_cpu_init(Object *obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -375,10 +389,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>       register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv64_thead_c906_cpu_init(Object *obj)
> @@ -411,6 +429,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv128_base_cpu_init(Object *obj)
> @@ -447,7 +469,8 @@ static void rv32_base_cpu_init(Object *obj)
>   
>   static void rv32_sifive_u_cpu_init(Object *obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>   
>       register_cpu_props(obj);
> @@ -455,6 +478,12 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -465,10 +494,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>       register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv32_ibex_cpu_init(Object *obj)
> @@ -479,11 +512,15 @@ static void rv32_ibex_cpu_init(Object *obj)
>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>       register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_11_0;
> -    cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif
>       cpu->cfg.epmp = true;
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv32_imafcu_nommu_cpu_init(Object *obj)
> @@ -494,10 +531,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>       register_cpu_props(obj);
>       env->priv_ver = PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu = false;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.pmp = true;
>   }
>   #endif
>   
> @@ -1384,11 +1425,6 @@ static void riscv_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    cpu->cfg.ext_ifencei = true;
> -    cpu->cfg.ext_icsr = true;
> -    cpu->cfg.mmu = true;
> -    cpu->cfg.pmp = true;
> -

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       cpu_set_cpustate_pointers(cpu);
>   
>   #ifndef CONFIG_USER_ONLY

