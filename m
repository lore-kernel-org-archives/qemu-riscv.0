Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04581C25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:47:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXfD-0003EP-81; Wed, 25 Oct 2023 02:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXet-0003D4-8X; Wed, 25 Oct 2023 02:46:30 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXep-0005W6-El; Wed, 25 Oct 2023 02:46:26 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutV4m4_1698216370; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutV4m4_1698216370) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:46:11 +0800
Message-ID: <f7a8038c-6ecb-451e-a7ba-bc81ff0bbe05@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:45:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] target/riscv/tcg: add MISA user options hash
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-5-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/10/21 6:39, Daniel Henrique Barboza wrote:
> We already track user choice for multi-letter extensions because we
> needed to honor user choice when enabling/disabling extensions during
> realize(). We refrained from adding the same mechanism for MISA
> extensions since we didn't need it.
>
> Profile support requires tne need to check for user choice for MISA
> extensions, so let's add the corresponding hash now. It works like the
> existing multi-letter hash (multi_ext_user_opts) but tracking MISA bits
> options in the cpu_set_misa_ext_cfg() callback.
>
> Note that we can't re-use the same hash from multi-letter extensions
> because that hash uses cpu->cfg offsets as keys, while for MISA
> extensions we're using MISA bits as keys.
>
> After adding the user hash in cpu_set_misa_ext_cfg(), setting default
> values with object_property_set_bool() in add_misa_properties() will end
> up marking the user choice hash with them. Set the default value
> manually to avoid it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 3dd4783191..59b75a14ac 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -34,6 +34,7 @@
>   
>   /* Hash that stores user set extensions */
>   static GHashTable *multi_ext_user_opts;
> +static GHashTable *misa_ext_user_opts;
>   
>   static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
>   {
> @@ -669,6 +670,10 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> +    g_hash_table_insert(misa_ext_user_opts,
> +                        GUINT_TO_POINTER(misa_bit),
> +                        (gpointer)value);
> +
>       prev_val = env->misa_ext & misa_bit;
>   
>       if (value == prev_val) {
> @@ -732,6 +737,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>    */
>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>   {
> +    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
>       bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
>       int i;
>   
> @@ -752,7 +758,13 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>                               NULL, (void *)misa_cfg);
>           object_property_set_description(cpu_obj, name, desc);
>           if (use_def_vals) {
> -            object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
> +            if (misa_cfg->enabled) {
> +                env->misa_ext |= bit;
> +                env->misa_ext_mask |= bit;
> +            } else {
> +                env->misa_ext &= ~bit;
> +                env->misa_ext_mask &= ~bit;
> +            }
>           }
>       }
>   }
> @@ -989,6 +1001,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       Object *obj = OBJECT(cpu);
>   
> +    misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
>       riscv_cpu_add_user_properties(obj);
>   

