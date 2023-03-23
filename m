Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfBXs-0002jo-Bx
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 23:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfBXo-0002jJ-Ij; Wed, 22 Mar 2023 23:23:16 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfBXl-0002qJ-Ae; Wed, 22 Mar 2023 23:23:16 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSbx8-_1679541781; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSbx8-_1679541781) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 11:23:02 +0800
Message-ID: <4bdf036a-4d50-2534-559a-415008eeb924@linux.alibaba.com>
Date: Thu, 23 Mar 2023 11:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 12/25] target/riscv/cpu.c: redesign
 register_cpu_props()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-13-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-13-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 23 Mar 2023 03:23:17 -0000

Hi Daniel,

I want to share my opinions about the cpu->cfg and misa.


Two suggestions:

1) The cpu->cfg should be set only once in cpu initialization 
phrase(cpu_init_fn or cpu_realize_fn), and never changes any more in 
other times(for example write_misa).

2) Set the misa only when cpu->cfg is ready.


In my mind, we should setting the misa and cfg in this way.

1) setting cfg  and misa_mxl in xxx_cpu_init.  Don't call set_misa here.

2) register and setting cfg for general cpus by the infrastructure.

3) check the cfg in cpu_realize_fn stage in a special function. Don't 
change cpu->cfg, just pass it as a parameter.

4)  expand the cpu->cfg, such as for RVG.

5)  setting the misa and misa_max

6) when write_misa, construct a cfg for the new misa value. If the cfg 
is legal after checking it against with the cpu->cfg, write it directly 
into misa. Don't change the cpu->cfg here.


Best Regards,
Zhiwei

On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> Now that the function is a no-op if 'env.misa_ext != 0', and no one that
> are setting misa_ext != 0 is calling it because set_misa() is setting
> the cpu cfg accordingly, remove the now deprecated code and rename the
> function to register_generic_cpu_props().
>
> This function is now doing exactly what the name says: it is creating
> user-facing properties to allow changes in the CPU cfg via the QEMU
> command line, setting default values if no user input is provided.
>
> Note that there's the possibility of a CPU to set a certain misa value
> and, at the same, also want user-facing flags and defaults from this
> function. This is not the case since commit 26b2bc58599c ("target/riscv:
> Don't expose the CPU properties on names CPUs"), but given that this is
> also a possibility, clarify in the function that using this function
> will overwrite existing values in cpu->cfg.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 48 ++++++++++------------------------------------
>   1 file changed, 10 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index df5c0bda70..0e56a1c01f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] = {
>       "reserved"
>   };
>   
> -static void register_cpu_props(Object *obj);
> +static void register_generic_cpu_props(Object *obj);
>   
>   const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>   {
> @@ -386,7 +386,7 @@ static void rv64_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV64, 0);
> -    register_cpu_props(obj);
> +    register_generic_cpu_props(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> @@ -472,7 +472,7 @@ static void rv128_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV128, 0);
> -    register_cpu_props(obj);
> +    register_generic_cpu_props(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> @@ -485,7 +485,7 @@ static void rv32_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV32, 0);
> -    register_cpu_props(obj);
> +    register_generic_cpu_props(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> @@ -572,7 +572,7 @@ static void riscv_host_cpu_init(Object *obj)
>   #elif defined(TARGET_RISCV64)
>       set_misa(env, MXL_RV64, 0);
>   #endif
> -    register_cpu_props(obj);
> +    register_generic_cpu_props(obj);
>   }
>   #endif
>   
> @@ -1554,44 +1554,16 @@ static Property riscv_cpu_extensions[] = {
>   };
>   
>   /*
> - * Register CPU props based on env.misa_ext. If a non-zero
> - * value was set, register only the required cpu->cfg.ext_*
> - * properties and leave. env.misa_ext = 0 means that we want
> - * all the default properties to be registered.
> + * Register generic CPU props with user-facing flags declared
> + * in riscv_cpu_extensions[].
> + *
> + * Note that this will overwrite existing values in cpu->cfg.
>    */
> -static void register_cpu_props(Object *obj)
> +static void register_generic_cpu_props(Object *obj)
>   {
> -    RISCVCPU *cpu = RISCV_CPU(obj);
> -    uint32_t misa_ext = cpu->env.misa_ext;
>       Property *prop;
>       DeviceState *dev = DEVICE(obj);
>   
> -    /*
> -     * If misa_ext is not zero, set cfg properties now to
> -     * allow them to be read during riscv_cpu_realize()
> -     * later on.
> -     */
> -    if (cpu->env.misa_ext != 0) {
> -        cpu->cfg.ext_i = misa_ext & RVI;
> -        cpu->cfg.ext_e = misa_ext & RVE;
> -        cpu->cfg.ext_m = misa_ext & RVM;
> -        cpu->cfg.ext_a = misa_ext & RVA;
> -        cpu->cfg.ext_f = misa_ext & RVF;
> -        cpu->cfg.ext_d = misa_ext & RVD;
> -        cpu->cfg.ext_v = misa_ext & RVV;
> -        cpu->cfg.ext_c = misa_ext & RVC;
> -        cpu->cfg.ext_s = misa_ext & RVS;
> -        cpu->cfg.ext_u = misa_ext & RVU;
> -        cpu->cfg.ext_h = misa_ext & RVH;
> -        cpu->cfg.ext_j = misa_ext & RVJ;
> -
> -        /*
> -         * We don't want to set the default riscv_cpu_extensions
> -         * in this case.
> -         */
> -        return;
> -    }
> -
>       for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>           qdev_property_add_static(dev, prop);
>       }

