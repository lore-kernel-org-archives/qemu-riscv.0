Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peTyK-0003Fi-33
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 00:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peTyH-0003FT-Ee; Tue, 21 Mar 2023 00:51:42 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peTyE-00075V-RM; Tue, 21 Mar 2023 00:51:41 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeLfJ28_1679374284; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeLfJ28_1679374284) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 12:51:24 +0800
Message-ID: <a2c8e6da-f242-8758-5b9d-55d738843895@linux.alibaba.com>
Date: Tue, 21 Mar 2023 12:51:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v3 05/26] target/riscv/cpu.c: add priv_spec
 validate/disable_exts helpers
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-6-dbarboza@ventanamicro.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230318200436.299464-6-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Tue, 21 Mar 2023 04:51:43 -0000


On 2023/3/19 4:04, Daniel Henrique Barboza wrote:
> We're doing env->priv_spec validation and assignment at the start of
> riscv_cpu_realize(), which is fine, but then we're doing a force disable
> on extensions that aren't compatible with the priv version.
>
> This second step is being done too early. The disabled extensions might be
> re-enabled again in riscv_cpu_validate_set_extensions() by accident.

It is not by accident. We should make sure if two extensions have 
dependency, their privilege
requirements should have the related dependency.  And we should write 
this dependency to the  isa_edata_arr.

I have sent the patch to the mail list to make this comment here clearer.

https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05361.html

Therefore it doesn't matter when do the priv_check or the 
validate_set_extension. Both work for me.

Based on that patch, this patch looks good to me.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   A
> better place to put this code is at the end of
> riscv_cpu_validate_set_extensions() after all the validations are
> completed.
>
> Add a new helper, riscv_cpu_disable_priv_spec_isa_exts(), to disable the
> extesions after the validation is done. While we're at it, create a
> riscv_cpu_validate_priv_spec() helper to host all env->priv_spec related
> validation to unclog riscv_cpu_realize a bit.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 91 ++++++++++++++++++++++++++++------------------
>   1 file changed, 56 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1ee322001b..17b301967c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -833,6 +833,52 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>       env->vext_ver = vext_version;
>   }
>   
> +static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    int priv_version = -1;
> +
> +    if (cpu->cfg.priv_spec) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +            priv_version = PRIV_VERSION_1_11_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> +            priv_version = PRIV_VERSION_1_10_0;
> +        } else {
> +            error_setg(errp,
> +                       "Unsupported privilege spec version '%s'",
> +                       cpu->cfg.priv_spec);
> +            return;
> +        }
> +
> +        env->priv_ver = priv_version;
> +    }
> +}
> +
> +static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    int i;
> +
> +    /* Force disable extensions if priv spec version does not match */
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> +            (env->priv_ver < isa_edata_arr[i].min_version)) {
> +            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> +                        " because privilege spec version does not match",
> +                        isa_edata_arr[i].name, env->mhartid);
> +#else
> +            warn_report("disabling %s extension because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif
> +        }
> +    }
> +}
> +
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly, doing a set_misa() in the end.
> @@ -1002,6 +1048,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_zksh = true;
>       }
>   
> +    /*
> +     * Disable isa extensions based on priv spec after we
> +     * validated and set everything we need.
> +     */
> +    riscv_cpu_disable_priv_spec_isa_exts(cpu);
> +
>       if (cpu->cfg.ext_i) {
>           ext |= RVI;
>       }
> @@ -1131,7 +1183,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       CPURISCVState *env = &cpu->env;
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>       CPUClass *cc = CPU_CLASS(mcc);
> -    int i, priv_version = -1;
>       Error *local_err = NULL;
>   
>       cpu_exec_realizefn(cs, &local_err);
> @@ -1140,40 +1191,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> -            priv_version = PRIV_VERSION_1_12_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> -            priv_version = PRIV_VERSION_1_11_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> -            priv_version = PRIV_VERSION_1_10_0;
> -        } else {
> -            error_setg(errp,
> -                       "Unsupported privilege spec version '%s'",
> -                       cpu->cfg.priv_spec);
> -            return;
> -        }
> -    }
> -
> -    if (priv_version >= PRIV_VERSION_1_10_0) {
> -        env->priv_ver = priv_version;
> -    }
> -
> -    /* Force disable extensions if priv spec version does not match */
> -    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> -            (env->priv_ver < isa_edata_arr[i].min_version)) {
> -            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> -#ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> -                        " because privilege spec version does not match",
> -                        isa_edata_arr[i].name, env->mhartid);
> -#else
> -            warn_report("disabling %s extension because "
> -                        "privilege spec version does not match",
> -                        isa_edata_arr[i].name);
> -#endif
> -        }
> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
>       }
>   
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {

