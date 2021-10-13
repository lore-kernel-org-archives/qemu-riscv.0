Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1macqM-0005ms-Io
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 07:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1macqJ-0005k9-Ez; Wed, 13 Oct 2021 07:54:43 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:46140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1macqG-00025F-QQ; Wed, 13 Oct 2021 07:54:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743942|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0431975-0.00135026-0.955452;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYUS4-9_1634126072; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYUS4-9_1634126072)
 by smtp.aliyun-inc.com(10.147.41.120);
 Wed, 13 Oct 2021 19:54:33 +0800
Subject: Re: [PATCH 10/13] target/riscv: Use gen_arith_per_ol for RVM
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-11-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <efeeebd4-0e31-a7aa-eac4-2cd97ccd2e2a@c-sky.com>
Date: Wed, 13 Oct 2021 19:54:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.147; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-147.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Oct 2021 11:54:43 -0000


On 2021/10/8 上午1:47, Richard Henderson wrote:
> The multiply high-part instructions require a separate
> implementation for RV32 when TARGET_LONG_BITS == 64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/translate.c                | 16 +++++++++++++++
>   target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
>   2 files changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6ab5c6aa58..f960929c16 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -427,6 +427,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
>       return true;
>   }
>   
> +static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv, TCGv))
> +{
> +    int olen = get_olen(ctx);
> +
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_arith(ctx, a, ext, f_tl);
> +}
> +
>   static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>                                void (*func)(TCGv, TCGv, target_long))
>   {
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 9a1fe3c799..2af0e5c139 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
>       tcg_temp_free(discard);
>   }
>   
> +static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
> +{
> +    tcg_gen_mul_tl(ret, s1, s2);
> +    tcg_gen_sari_tl(ret, ret, 32);
> +}
> +
>   static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>   {
>       REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
> +    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
>   }
>   
>   static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
> @@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>       tcg_temp_free(rh);
>   }
>   
> +static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    tcg_gen_ext32s_tl(t1, arg1);
> +    tcg_gen_ext32u_tl(t2, arg2);
> +    tcg_gen_mul_tl(ret, t1, t2);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +    tcg_gen_sari_tl(ret, ret, 32);
> +}
> +
>   static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>   {
>       REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
> +    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
>   }
>   
>   static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
> @@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>   {
>       REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
> +    /* gen_mulh_w works for either sign as input. */
> +    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
>   }
>   
>   static void gen_div(TCGv ret, TCGv source1, TCGv source2)

