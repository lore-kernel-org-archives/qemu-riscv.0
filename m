Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1macNA-0007oU-Mx
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 07:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1macMw-0007kp-Qd; Wed, 13 Oct 2021 07:24:25 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:55320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1macMt-0007SV-KW; Wed, 13 Oct 2021 07:24:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436287|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0884415-0.00012895-0.91143;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYTk4VV_1634124251; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYTk4VV_1634124251)
 by smtp.aliyun-inc.com(10.147.40.26); Wed, 13 Oct 2021 19:24:11 +0800
Subject: Re: [PATCH 13/13] target/riscv: Use gen_shift*_per_ol for RVB, RVI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-14-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e06390ea-2a97-fee9-6b08-a84c28d8b691@c-sky.com>
Date: Wed, 13 Oct 2021 19:24:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.148; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-148.mail.aliyun.com
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
X-List-Received-Date: Wed, 13 Oct 2021 11:24:27 -0000

On 2021/10/8 上午1:47, Richard Henderson wrote:
> Most shift instructions require a separate implementation
> for RV32 when TARGET_LONG_BITS == 64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei

> ---
>   target/riscv/translate.c                | 31 +++++++++
>   target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
>   target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
>   3 files changed, 97 insertions(+), 52 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index be458ae0c2..dbe3670ff3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -462,6 +462,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>       return true;
>   }
>   
> +static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
> +                                    DisasExtend ext,
> +                                    void (*f_tl)(TCGv, TCGv, target_long),
> +                                    void (*f_32)(TCGv, TCGv, target_long))
> +{
> +    int olen = get_olen(ctx);
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_shift_imm_fn(ctx, a, ext, f_tl);
> +}
> +
>   static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>                                void (*func)(TCGv, TCGv, TCGv))
>   {
> @@ -498,6 +514,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
>       return true;
>   }
>   
> +static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv, TCGv))
> +{
> +    int olen = get_olen(ctx);
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_shift(ctx, a, ext, f_tl);
> +}
> +
>   static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>                         void (*func)(TCGv, TCGv))
>   {
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index adc35b6491..9b9c9c8bc4 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -227,22 +227,70 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>       return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
>   }
>   
> +static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    /* truncate to 32-bits */
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_trunc_tl_i32(t2, arg2);
> +
> +    tcg_gen_rotr_i32(t1, t1, t2);
> +
> +    /* sign-extend 64-bits */
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
> +}
> +
>   static bool trans_ror(DisasContext *ctx, arg_ror *a)
>   {
>       REQUIRE_ZBB(ctx);
> -    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
> +    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
> +}
> +
> +static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_rotri_i32(t1, t1, shamt);
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
>   }
>   
>   static bool trans_rori(DisasContext *ctx, arg_rori *a)
>   {
>       REQUIRE_ZBB(ctx);
> -    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_rotri_tl, gen_roriw);
> +}
> +
> +static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    /* truncate to 32-bits */
> +    tcg_gen_trunc_tl_i32(t1, arg1);
> +    tcg_gen_trunc_tl_i32(t2, arg2);
> +
> +    tcg_gen_rotl_i32(t1, t1, t2);
> +
> +    /* sign-extend 64-bits */
> +    tcg_gen_ext_i32_tl(ret, t1);
> +
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
>   }
>   
>   static bool trans_rol(DisasContext *ctx, arg_rol *a)
>   {
>       REQUIRE_ZBB(ctx);
> -    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
> +    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
>   }
>   
>   static void gen_rev8_32(TCGv ret, TCGv src1)
> @@ -349,24 +397,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>       return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
>   }
>   
> -static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 = tcg_temp_new_i32();
> -    TCGv_i32 t2 = tcg_temp_new_i32();
> -
> -    /* truncate to 32-bits */
> -    tcg_gen_trunc_tl_i32(t1, arg1);
> -    tcg_gen_trunc_tl_i32(t2, arg2);
> -
> -    tcg_gen_rotr_i32(t1, t1, t2);
> -
> -    /* sign-extend 64-bits */
> -    tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> -}
> -
>   static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>   {
>       REQUIRE_64BIT(ctx);
> @@ -380,25 +410,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>       REQUIRE_64BIT(ctx);
>       REQUIRE_ZBB(ctx);
>       ctx->ol = MXL_RV32;
> -    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
> -}
> -
> -static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 = tcg_temp_new_i32();
> -    TCGv_i32 t2 = tcg_temp_new_i32();
> -
> -    /* truncate to 32-bits */
> -    tcg_gen_trunc_tl_i32(t1, arg1);
> -    tcg_gen_trunc_tl_i32(t2, arg2);
> -
> -    tcg_gen_rotl_i32(t1, t1, t2);
> -
> -    /* sign-extend 64-bits */
> -    tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
>   }
>   
>   static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index c0a46d823f..b0fdec97de 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -270,14 +270,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
>       return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>   }
>   
> +static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
> +}
> +
>   static bool trans_srli(DisasContext *ctx, arg_srli *a)
>   {
> -    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_shri_tl, gen_srliw);
> +}
> +
> +static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
> +{
> +    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
>   }
>   
>   static bool trans_srai(DisasContext *ctx, arg_srai *a)
>   {
> -    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
> +    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
> +                                   tcg_gen_sari_tl, gen_sraiw);
>   }
>   
>   static bool trans_add(DisasContext *ctx, arg_add *a)
> @@ -344,11 +356,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>       return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
>   }
>   
> -static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
> -{
> -    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
> -}
> -
>   static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>   {
>       REQUIRE_64BIT(ctx);
> @@ -356,11 +363,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>       return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
>   }
>   
> -static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
> -{
> -    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
> -}
> -
>   static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>   {
>       REQUIRE_64BIT(ctx);

