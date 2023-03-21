Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peR6e-00005P-L7
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 21:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR6b-0008Vb-UL; Mon, 20 Mar 2023 21:48:05 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR6Z-0002iC-Hk; Mon, 20 Mar 2023 21:48:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeL-w11_1679363269; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeL-w11_1679363269) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 09:47:50 +0800
Message-ID: <1e68e023-4857-9203-045f-1fb8c7a72487@linux.alibaba.com>
Date: Tue, 21 Mar 2023 09:47:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v3 01/26] target/riscv/cpu.c: add
 riscv_cpu_validate_v()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-2-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230318200436.299464-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 21 Mar 2023 01:48:07 -0000


On 2023/3/19 4:04, Daniel Henrique Barboza wrote:
> The RVV verification will error out if fails and it's being done at the
> end of riscv_cpu_validate_set_extensions(). Let's put it in its own
> function and do it earlier.
>
> We'll move it out of riscv_cpu_validate_set_extensions() in the near future,
> but for now this is enough to clean the code a bit.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 86 ++++++++++++++++++++++++++--------------------
>   1 file changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..18591aa53a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -802,6 +802,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>       }
>   }
>   
> +static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
> +                                 Error **errp)
> +{
> +    int vext_version = VEXT_VERSION_1_00_0;
> +
> +    if (!is_power_of_2(cfg->vlen)) {
> +        error_setg(errp, "Vector extension VLEN must be power of 2");
> +        return;
> +    }
> +    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
> +        error_setg(errp,
> +                   "Vector extension implementation only supports VLEN "
> +                   "in the range [128, %d]", RV_VLEN_MAX);
> +        return;
> +    }
> +    if (!is_power_of_2(cfg->elen)) {
> +        error_setg(errp, "Vector extension ELEN must be power of 2");
> +        return;
> +    }
> +    if (cfg->elen > 64 || cfg->elen < 8) {
> +        error_setg(errp,
> +                   "Vector extension implementation only supports ELEN "
> +                   "in the range [8, 64]");
> +        return;
> +    }
> +    if (cfg->vext_spec) {
> +        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> +            vext_version = VEXT_VERSION_1_00_0;
> +        } else {
> +            error_setg(errp, "Unsupported vector spec version '%s'",
> +                       cfg->vext_spec);
> +            return;
> +        }
> +    } else {
> +        qemu_log("vector version is not specified, "
> +                 "use the default value v1.0\n");
> +    }
> +    set_vext_version(env, vext_version);
> +}
> +
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly, doing a set_misa() in the end.
> @@ -809,6 +849,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>   static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
> +    Error *local_err = NULL;
>       uint32_t ext = 0;
>   
>       /* Do some ISA extension error checking */
> @@ -939,6 +980,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> +    if (cpu->cfg.ext_v) {
> +        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
> +
>       if (cpu->cfg.ext_zk) {
>           cpu->cfg.ext_zkn = true;
>           cpu->cfg.ext_zkr = true;
> @@ -993,44 +1042,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           ext |= RVH;
>       }
>       if (cpu->cfg.ext_v) {
> -        int vext_version = VEXT_VERSION_1_00_0;
>           ext |= RVV;
> -        if (!is_power_of_2(cpu->cfg.vlen)) {
> -            error_setg(errp,
> -                       "Vector extension VLEN must be power of 2");
> -            return;
> -        }
> -        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> -            error_setg(errp,
> -                       "Vector extension implementation only supports VLEN "
> -                       "in the range [128, %d]", RV_VLEN_MAX);
> -            return;
> -        }
> -        if (!is_power_of_2(cpu->cfg.elen)) {
> -            error_setg(errp,
> -                       "Vector extension ELEN must be power of 2");
> -            return;
> -        }
> -        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
> -            error_setg(errp,
> -                       "Vector extension implementation only supports ELEN "
> -                       "in the range [8, 64]");
> -            return;
> -        }
> -        if (cpu->cfg.vext_spec) {
> -            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> -                vext_version = VEXT_VERSION_1_00_0;
> -            } else {
> -                error_setg(errp,
> -                           "Unsupported vector spec version '%s'",
> -                           cpu->cfg.vext_spec);
> -                return;
> -            }
> -        } else {
> -            qemu_log("vector version is not specified, "
> -                     "use the default value v1.0\n");
> -        }
> -        set_vext_version(env, vext_version);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       }
>       if (cpu->cfg.ext_j) {
>           ext |= RVJ;

