Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AAFC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:47:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXfo-0003Rc-2E; Wed, 25 Oct 2023 02:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXfZ-0003J2-NK; Wed, 25 Oct 2023 02:47:11 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXfU-0005Xz-RM; Wed, 25 Oct 2023 02:47:08 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutV4mR_1698216371; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutV4mR_1698216371) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:46:53 +0800
Message-ID: <05dd88ba-0e34-49b5-b096-1b92a2da37c0@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] target/riscv/tcg: add riscv_cpu_write_misa_bit()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-6-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/10/21 6:39, Daniel Henrique Barboza wrote:
> We have two instances of the setting/clearing a MISA bit from
> env->misa_ext and env->misa_ext_mask pattern. And the next patch will
> end up adding one more.
>
> Create a helper to avoid code repetition.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 44 ++++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 59b75a14ac..ba11d0566d 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -42,6 +42,20 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
>                                    GUINT_TO_POINTER(ext_offset));
>   }
>   
> +static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
> +                                     bool enabled)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (enabled) {
> +        env->misa_ext |= bit;
> +        env->misa_ext_mask |= bit;
> +    } else {
> +        env->misa_ext &= ~bit;
> +        env->misa_ext_mask &= ~bit;
> +    }
> +}
> +
>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                             const TranslationBlock *tb)
>   {
> @@ -680,20 +694,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> -    if (value) {
> -        if (!generic_cpu) {
> -            g_autofree char *cpuname = riscv_cpu_get_name(cpu);
> -            error_setg(errp, "'%s' CPU does not allow enabling extensions",
> -                       cpuname);
> -            return;
> -        }
> -
> -        env->misa_ext |= misa_bit;
> -        env->misa_ext_mask |= misa_bit;
> -    } else {
> -        env->misa_ext &= ~misa_bit;
> -        env->misa_ext_mask &= ~misa_bit;
> +    if (value && !generic_cpu) {
> +        g_autofree char *cpuname = riscv_cpu_get_name(cpu);
> +        error_setg(errp, "'%s' CPU does not allow enabling extensions",
> +                   cpuname);
> +        return;
>       }
> +
> +    riscv_cpu_write_misa_bit(cpu, misa_bit, value);
>   }
>   
>   static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> @@ -737,7 +745,6 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>    */
>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>   {
> -    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
>       bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
>       int i;
>   
> @@ -758,13 +765,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>                               NULL, (void *)misa_cfg);
>           object_property_set_description(cpu_obj, name, desc);
>           if (use_def_vals) {
> -            if (misa_cfg->enabled) {
> -                env->misa_ext |= bit;
> -                env->misa_ext_mask |= bit;
> -            } else {
> -                env->misa_ext &= ~bit;
> -                env->misa_ext_mask &= ~bit;
> -            }
> +            riscv_cpu_write_misa_bit(RISCV_CPU(cpu_obj), bit,
> +                                     misa_cfg->enabled);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           }
>       }
>   }

