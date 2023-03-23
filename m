Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf9sD-0008N9-Dz
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 21:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pf9sA-0008Mj-RX; Wed, 22 Mar 2023 21:36:10 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pf9s8-0002Ad-C0; Wed, 22 Mar 2023 21:36:10 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSJQ1a_1679535357; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSJQ1a_1679535357) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 09:35:58 +0800
Message-ID: <dcf58916-3ec4-9bb2-00e9-1a7cf07be69d@linux.alibaba.com>
Date: Thu, 23 Mar 2023 09:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 06/25] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-7-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 23 Mar 2023 01:36:11 -0000


On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> Let's remove more code that is open coded in riscv_cpu_realize() and put
> it into a helper. Let's also add an error message instead of just
> asserting out if env->misa_mxl_max != env->misa_mlx.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 51 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 17b301967c..1a298e5e55 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -879,6 +879,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       }
>   }
>   
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> +    CPUClass *cc = CPU_CLASS(mcc);
> +    CPURISCVState *env = &cpu->env;
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (env->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (env->misa_mxl_max != env->misa_mxl) {
> +        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> +        return;
> +    }
> +}
> +
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly, doing a set_misa() in the end.
> @@ -1180,9 +1207,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   {
>       CPUState *cs = CPU(dev);
>       RISCVCPU *cpu = RISCV_CPU(dev);
> -    CPURISCVState *env = &cpu->env;
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> -    CPUClass *cc = CPU_CLASS(mcc);
>       Error *local_err = NULL;
>   
>       cpu_exec_realizefn(cs, &local_err);
> @@ -1197,6 +1222,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
> @@ -1213,22 +1244,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>   #endif /* CONFIG_USER_ONLY */
>   
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (env->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    assert(env->misa_mxl_max == env->misa_mxl);
> -

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);

