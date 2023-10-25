Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2B8C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:48:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXgF-0003zx-96; Wed, 25 Oct 2023 02:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXgC-0003xF-Ms; Wed, 25 Oct 2023 02:47:48 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXgA-0005fa-JY; Wed, 25 Oct 2023 02:47:48 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutV516_1698216413; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutV516_1698216413) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:47:36 +0800
Message-ID: <0483f5d2-346a-4b1e-88f3-392605e7a340@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:46:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] target/riscv/tcg: handle profile MISA bits
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-7-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
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
> The profile support is handling multi-letter extensions only. Let's add
> support for MISA bits as well.
>
> We'll go through every known MISA bit. If the user set the bit, doesn't
> matter if to 'true' or 'false', ignore it. If the profile doesn't
> declare the bit as mandatory, ignore it. Otherwise, set or clear the bit
> in env->misa_ext and env->misa_ext_mask depending on whether the profile
> was set to 'true' or 'false'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index ba11d0566d..73c7453af6 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -42,6 +42,12 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
>                                    GUINT_TO_POINTER(ext_offset));
>   }
>   
> +static bool cpu_misa_ext_is_user_set(uint32_t misa_bit)
> +{
> +    return g_hash_table_contains(misa_ext_user_opts,
> +                                 GUINT_TO_POINTER(misa_bit));
> +}
> +
>   static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
>                                        bool enabled)
>   {
> @@ -797,6 +803,16 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>   
>       profile->enabled = value;
>   
> +    for (i = 0; misa_bits[i] != 0; i++) {
> +        uint32_t bit = misa_bits[i];
> +
> +        if (cpu_misa_ext_is_user_set(bit) || !(profile->misa_ext & bit)) {
> +            continue;
> +        }
> +
> +        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
> +    }
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
>           ext_offset = profile->ext_offsets[i];
>   

