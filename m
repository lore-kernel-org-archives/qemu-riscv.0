Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phRLP-0006ti-3L
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 04:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phRLI-0006t1-Oy; Wed, 29 Mar 2023 04:39:42 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phRLG-0003Af-8l; Wed, 29 Mar 2023 04:39:40 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAB3kNQ_+SNkEViMGA--.12101S2;
 Wed, 29 Mar 2023 16:39:28 +0800 (CST)
Message-ID: <994af832-9db7-b42f-c1d1-f6d2469259e2@iscas.ac.cn>
Date: Wed, 29 Mar 2023 16:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v5 8/9] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
 <20230328173543.431342-9-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230328173543.431342-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAB3kNQ_+SNkEViMGA--.12101S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1xCrykWFyrZr47AF4Dtwb_yoWxGrW5pr
 y5Ga15CrW5J3ZrG3yfXFykCrWrXr1Iv3yaga90va1rGa18CrZrXF97K3W7CFWqgFs3ZFya
 q3Z5GwnrGayxt37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 29 Mar 2023 08:39:44 -0000


On 2023/3/29 01:35, Daniel Henrique Barboza wrote:
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
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 48 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1a095ce8e3..cd924029d4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -326,7 +326,8 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
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
>   #endif
>   
>       env->priv_ver = PRIV_VERSION_LATEST;
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
>   }
>   
>   #if defined(TARGET_RISCV64)
> @@ -358,12 +365,19 @@ static void rv64_base_cpu_init(Object *obj)
>   
>   static void rv64_sifive_u_cpu_init(Object *obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
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
> @@ -373,10 +387,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
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
> @@ -404,6 +422,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>   #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei = true;

Assignment for ext_ifencei is redundant here, since G is enabled in c906 
cpu.

Regards,

Weiwei Li

> +    cpu->cfg.pmp = true;
>   }
>   
>   static void rv128_base_cpu_init(Object *obj)
> @@ -440,12 +462,19 @@ static void rv32_base_cpu_init(Object *obj)
>   
>   static void rv32_sifive_u_cpu_init(Object *obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
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
> @@ -455,10 +484,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
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
> @@ -468,11 +501,15 @@ static void rv32_ibex_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
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
> @@ -482,10 +519,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   
>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
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
> @@ -1344,11 +1385,6 @@ static void riscv_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    cpu->cfg.ext_ifencei = true;
> -    cpu->cfg.ext_icsr = true;
> -    cpu->cfg.mmu = true;
> -    cpu->cfg.pmp = true;
> -
>       cpu_set_cpustate_pointers(cpu);
>   
>   #ifndef CONFIG_USER_ONLY


