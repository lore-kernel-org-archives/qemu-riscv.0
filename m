Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maZg4-0000yr-Re
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 04:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1maZg3-0000xo-1J; Wed, 13 Oct 2021 04:31:55 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:55161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1maZfz-0005v3-Tm; Wed, 13 Oct 2021 04:31:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436671|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.102343-0.000721652-0.896935;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYLjTF2_1634113901; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYLjTF2_1634113901)
 by smtp.aliyun-inc.com(10.147.42.253);
 Wed, 13 Oct 2021 16:31:41 +0800
Subject: Re: [PATCH 12/13] target/riscv: Use gen_unary_per_ol for RVB
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-13-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2c15a089-c4b8-ecae-287a-94f1e5e9719a@c-sky.com>
Date: Wed, 13 Oct 2021 16:31:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
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
X-List-Received-Date: Wed, 13 Oct 2021 08:31:55 -0000


On 2021/10/8 上午1:47, Richard Henderson wrote:
> The count zeros instructions require a separate implementation
> for RV32 when TARGET_LONG_BITS == 64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c                | 16 ++++++++++++
>   target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
>   2 files changed, 32 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f960929c16..be458ae0c2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -510,6 +510,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>       return true;
>   }
>   
> +static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv))
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
> +    return gen_unary(ctx, a, ext, f_tl);
> +}
> +
>   static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index c62eea433a..adc35b6491 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -47,10 +47,18 @@ static void gen_clz(TCGv ret, TCGv arg1)
>       tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
>   }
>   
> +static void gen_clzw(TCGv ret, TCGv arg1)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_shli_tl(t, arg1, 32);
> +    tcg_gen_clzi_tl(ret, t, 32);
> +    tcg_temp_free(t);
> +}
> +
>   static bool trans_clz(DisasContext *ctx, arg_clz *a)
>   {
>       REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
> +    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
>   }
>   
>   static void gen_ctz(TCGv ret, TCGv arg1)
> @@ -58,10 +66,15 @@ static void gen_ctz(TCGv ret, TCGv arg1)
>       tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
>   }
>   
> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ctzi_tl(ret, ret, 32);

Typo:

tcg_gen_ctzi_tl(ret,  arg1,  32);

Otherwise,

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Thanks,
Zhiwei

> +}
> +
>   static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>   {
>       REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
> +    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
>   }
>   
>   static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
> @@ -314,14 +327,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
>       return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
>   }
>   
> -static void gen_clzw(TCGv ret, TCGv arg1)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_shli_tl(t, arg1, 32);
> -    tcg_gen_clzi_tl(ret, t, 32);
> -    tcg_temp_free(t);
> -}
> -
>   static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>   {
>       REQUIRE_64BIT(ctx);
> @@ -329,17 +334,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>       return gen_unary(ctx, a, EXT_NONE, gen_clzw);
>   }
>   
> -static void gen_ctzw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> -    tcg_gen_ctzi_tl(ret, ret, 64);
> -}
> -
>   static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>   {
>       REQUIRE_64BIT(ctx);
>       REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
>   }
>   
>   static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)

