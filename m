Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI3Dx-0000Cz-W7
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 02:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3Dv-0000Cf-No; Mon, 23 Aug 2021 02:14:19 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:33285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3Dq-0003CP-NP; Mon, 23 Aug 2021 02:14:19 -0400
Received: by mail-io1-xd29.google.com with SMTP id f6so12850029iox.0;
 Sun, 22 Aug 2021 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dGQQtw+QtJGhPVAlvWtXDZD2VvOnFPnZ2NLKZ8a6jsg=;
 b=sv4UkQiefIbrRJUItY8DneZsOO99WLtiH65jMCwDzkNt/YMNHY3b3sSBc0VW7vPrj8
 M8zSvktWtenkn9Tu5l5HC1m6T/mPIPcohQKSiFXfkXWjCw4uvIQp/RLXhlpgiRKf/1kf
 owsDuUcFzl0PV0A/N0Wtar8CPD15t6HXt/wWFEk9/FLV/jpgzV5xZ9vrFYzzMStXW9hc
 wIfOLfHLl/NZltSd04yAIo/3NqdiD0disEsFMJHWXdNB/6CeOsQTODWhUlRuuCAbDfO2
 dgqPc+Gi3/9qSaEa2yrH6XIUVqxcmQfx0Q3ZR+0JWrI+QxVtz1Z5Og4TJ77sPbMFBumE
 sfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dGQQtw+QtJGhPVAlvWtXDZD2VvOnFPnZ2NLKZ8a6jsg=;
 b=IRor2HSqKp8cB6tlHlDw0ulnBs5SxGvJ8Lf8+HtK9P/X9tyofXmTGASssaLTI9qxUP
 LoGS1Jokq6R2vmviKuOZcuUZimYr2uY9kCX2L5oxKEGrv8UmZwMR1cRpbKCdNaCnOVKp
 ujyy0w62UUp6xfqIxNoxS05Sa5kTNU+RjdSRFzpl3HAbU95bUos8rJyA85hbcQ5P3//G
 nex1IWaAIvB1T53bYTiP+Fp7BEKxkRK+5Vqn4ZXLeaajQudaPEeCKgJMefG4QGb9/KDS
 /Gx7euVl0HL/dcQGZYg0oHSo0anaDmGFvpoTSFEfPA2jOeM6UgD+/1oSHTenl2nlT0eU
 cshg==
X-Gm-Message-State: AOAM533R7MPT7ueVBfigjXjsRrEJnS1V5cq026p3nOGE2UwybSs0mhtA
 ixE4amPiswXLrgBXU6Lv0mHxtvpMH0W/772T2fc=
X-Google-Smtp-Source: ABdhPJweymulLipOQvtvxlPqFZq8rOz76p63j72xuWUIoAa45tVvA5Z1KB2xn9P6l5nukXFaE+dklQlGas4fCJvUpyA=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr25736604iod.175.1629699252939; 
 Sun, 22 Aug 2021 23:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-11-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-11-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:13:46 +1000
Message-ID: <CAKmqyKM14TSBVYXvp4FnrgHqTSgp=z5bJGR7ZoX=JTLNL0vsZQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/21] target/riscv: Move gen_* helpers for RVB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Aug 2021 06:14:20 -0000

On Sat, Aug 21, 2021 at 3:53 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvb.c.inc.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 233 -----------------------
>  target/riscv/insn_trans/trans_rvb.c.inc | 234 ++++++++++++++++++++++++
>  2 files changed, 234 insertions(+), 233 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7fbacfa6ee..09853530c4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -380,229 +380,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg=
_i *a, DisasExtend ext,
>      return true;
>  }
>
> -static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_deposit_tl(ret, arg1, arg2,
> -                       TARGET_LONG_BITS / 2,
> -                       TARGET_LONG_BITS / 2);
> -}
> -
> -static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t =3D tcg_temp_new();
> -    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
> -    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t =3D tcg_temp_new();
> -    tcg_gen_ext8u_tl(t, arg2);
> -    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_sbop_mask(TCGv ret, TCGv shamt)
> -{
> -    tcg_gen_movi_tl(ret, 1);
> -    tcg_gen_shl_tl(ret, ret, shamt);
> -}
> -
> -static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
> -{
> -    TCGv t =3D tcg_temp_new();
> -
> -    gen_sbop_mask(t, shamt);
> -    tcg_gen_or_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
> -{
> -    TCGv t =3D tcg_temp_new();
> -
> -    gen_sbop_mask(t, shamt);
> -    tcg_gen_andc_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
> -{
> -    TCGv t =3D tcg_temp_new();
> -
> -    gen_sbop_mask(t, shamt);
> -    tcg_gen_xor_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
> -{
> -    tcg_gen_shr_tl(ret, arg1, shamt);
> -    tcg_gen_andi_tl(ret, ret, 1);
> -}
> -
> -static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_not_tl(ret, arg1);
> -    tcg_gen_shl_tl(ret, ret, arg2);
> -    tcg_gen_not_tl(ret, ret);
> -}
> -
> -static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_not_tl(ret, arg1);
> -    tcg_gen_shr_tl(ret, ret, arg2);
> -    tcg_gen_not_tl(ret, ret);
> -}
> -
> -static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
> -{
> -    TCGv source1 =3D tcg_temp_new();
> -    TCGv source2;
> -
> -    gen_get_gpr(ctx, source1, a->rs1);
> -
> -    if (a->shamt =3D=3D (TARGET_LONG_BITS - 8)) {
> -        /* rev8, byte swaps */
> -        tcg_gen_bswap_tl(source1, source1);
> -    } else {
> -        source2 =3D tcg_temp_new();
> -        tcg_gen_movi_tl(source2, a->shamt);
> -        gen_helper_grev(source1, source1, source2);
> -        tcg_temp_free(source2);
> -    }
> -
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    return true;
> -}
> -
> -#define GEN_SHADD(SHAMT)                                       \
> -static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
> -{                                                              \
> -    TCGv t =3D tcg_temp_new();                                   \
> -                                                               \
> -    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
> -    tcg_gen_add_tl(ret, t, arg2);                              \
> -                                                               \
> -    tcg_temp_free(t);                                          \
> -}
> -
> -GEN_SHADD(1)
> -GEN_SHADD(2)
> -GEN_SHADD(3)
> -
> -static void gen_ctzw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> -    tcg_gen_ctzi_tl(ret, ret, 64);
> -}
> -
> -static void gen_clzw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ext32u_tl(ret, arg1);
> -    tcg_gen_clzi_tl(ret, ret, 64);
> -    tcg_gen_subi_tl(ret, ret, 32);
> -}
> -
> -static void gen_cpopw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    tcg_gen_ctpop_tl(ret, arg1);
> -}
> -
> -static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t =3D tcg_temp_new();
> -    tcg_gen_ext16s_tl(t, arg2);
> -    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t =3D tcg_temp_new();
> -    tcg_gen_shri_tl(t, arg1, 16);
> -    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
> -    tcg_gen_ext32s_tl(ret, ret);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 =3D tcg_temp_new_i32();
> -    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
> -static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv_i32 t1 =3D tcg_temp_new_i32();
> -    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
> -}
> -
> -static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    gen_helper_grev(ret, arg1, arg2);
> -}
> -
> -static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    gen_helper_gorcw(ret, arg1, arg2);
> -}
> -
> -#define GEN_SHADD_UW(SHAMT)                                       \
> -static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
> -{                                                                 \
> -    TCGv t =3D tcg_temp_new();                                      \
> -                                                                  \
> -    tcg_gen_ext32u_tl(t, arg1);                                   \
> -                                                                  \
> -    tcg_gen_shli_tl(t, t, SHAMT);                                 \
> -    tcg_gen_add_tl(ret, t, arg2);                                 \
> -                                                                  \
> -    tcg_temp_free(t);                                             \
> -}
> -
> -GEN_SHADD_UW(1)
> -GEN_SHADD_UW(2)
> -GEN_SHADD_UW(3)
> -
> -static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    tcg_gen_add_tl(ret, arg1, arg2);
> -}
> -
>  static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
>                        void (*func)(TCGv, TCGv, TCGv))
>  {
> @@ -701,16 +478,6 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift=
 *a,
>      return true;
>  }
>
> -static void gen_ctz(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
> -}
> -
> -static void gen_clz(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> -}
> -
>  static bool gen_unary(DisasContext *ctx, arg_r2 *a,
>                        void(*func)(TCGv, TCGv))
>  {
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
> index 217a7d1f26..73f088be23 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -17,12 +17,23 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +
> +static void gen_clz(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> +}
> +
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
>      return gen_unary(ctx, a, gen_clz);
>  }
>
> +static void gen_ctz(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
> +}
> +
>  static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -53,18 +64,41 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a=
)
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
>  }
>
> +static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_deposit_tl(ret, arg1, arg2,
> +                       TARGET_LONG_BITS / 2,
> +                       TARGET_LONG_BITS / 2);
> +}
> +
>  static bool trans_pack(DisasContext *ctx, arg_pack *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
>      return gen_arith(ctx, a, EXT_NONE, gen_pack);
>  }
>
> +static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t =3D tcg_temp_new();
> +    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
> +    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_packu(DisasContext *ctx, arg_packu *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
>      return gen_arith(ctx, a, EXT_NONE, gen_packu);
>  }
>
> +static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t =3D tcg_temp_new();
> +    tcg_gen_ext8u_tl(t, arg2);
> +    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_packh(DisasContext *ctx, arg_packh *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -107,6 +141,22 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext=
_h *a)
>      return gen_unary(ctx, a, tcg_gen_ext16s_tl);
>  }
>
> +static void gen_sbop_mask(TCGv ret, TCGv shamt)
> +{
> +    tcg_gen_movi_tl(ret, 1);
> +    tcg_gen_shl_tl(ret, ret, shamt);
> +}
> +
> +static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t =3D tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_or_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_bset(DisasContext *ctx, arg_bset *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -119,6 +169,16 @@ static bool trans_bseti(DisasContext *ctx, arg_bseti=
 *a)
>      return gen_shifti(ctx, a, gen_bset);
>  }
>
> +static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t =3D tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_andc_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -131,6 +191,16 @@ static bool trans_bclri(DisasContext *ctx, arg_bclri=
 *a)
>      return gen_shifti(ctx, a, gen_bclr);
>  }
>
> +static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t =3D tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_xor_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_binv(DisasContext *ctx, arg_binv *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -143,6 +213,12 @@ static bool trans_binvi(DisasContext *ctx, arg_binvi=
 *a)
>      return gen_shifti(ctx, a, gen_binv);
>  }
>
> +static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    tcg_gen_shr_tl(ret, arg1, shamt);
> +    tcg_gen_andi_tl(ret, ret, 1);
> +}
> +
>  static bool trans_bext(DisasContext *ctx, arg_bext *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -155,6 +231,13 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti=
 *a)
>      return gen_shifti(ctx, a, gen_bext);
>  }
>
> +static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_not_tl(ret, arg1);
> +    tcg_gen_shl_tl(ret, ret, arg2);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
>  static bool trans_slo(DisasContext *ctx, arg_slo *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -167,6 +250,13 @@ static bool trans_sloi(DisasContext *ctx, arg_sloi *=
a)
>      return gen_shifti(ctx, a, gen_slo);
>  }
>
> +static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_not_tl(ret, arg1);
> +    tcg_gen_shr_tl(ret, ret, arg2);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
>  static bool trans_sro(DisasContext *ctx, arg_sro *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -203,6 +293,28 @@ static bool trans_grev(DisasContext *ctx, arg_grev *=
a)
>      return gen_shift(ctx, a, gen_helper_grev);
>  }
>
> +static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
> +{
> +    TCGv source1 =3D tcg_temp_new();
> +    TCGv source2;
> +
> +    gen_get_gpr(ctx, source1, a->rs1);
> +
> +    if (a->shamt =3D=3D (TARGET_LONG_BITS - 8)) {
> +        /* rev8, byte swaps */
> +        tcg_gen_bswap_tl(source1, source1);
> +    } else {
> +        source2 =3D tcg_temp_new();
> +        tcg_gen_movi_tl(source2, a->shamt);
> +        gen_helper_grev(source1, source1, source2);
> +        tcg_temp_free(source2);
> +    }
> +
> +    gen_set_gpr(ctx, a->rd, source1);
> +    tcg_temp_free(source1);
> +    return true;
> +}
> +
>  static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -226,6 +338,21 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci=
 *a)
>      return gen_shifti(ctx, a, gen_helper_gorc);
>  }
>
> +#define GEN_SHADD(SHAMT)                                       \
> +static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
> +{                                                              \
> +    TCGv t =3D tcg_temp_new();                                   \
> +                                                               \
> +    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
> +    tcg_gen_add_tl(ret, t, arg2);                              \
> +                                                               \
> +    tcg_temp_free(t);                                          \
> +}
> +
> +GEN_SHADD(1)
> +GEN_SHADD(2)
> +GEN_SHADD(3)
> +
>  #define GEN_TRANS_SHADD(SHAMT)                                          =
   \
>  static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *=
a) \
>  {                                                                       =
   \
> @@ -237,6 +364,13 @@ GEN_TRANS_SHADD(1)
>  GEN_TRANS_SHADD(2)
>  GEN_TRANS_SHADD(3)
>
> +static void gen_clzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ext32u_tl(ret, arg1);
> +    tcg_gen_clzi_tl(ret, ret, 64);
> +    tcg_gen_subi_tl(ret, ret, 32);
> +}
> +
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -244,6 +378,12 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *=
a)
>      return gen_unary(ctx, a, gen_clzw);
>  }
>
> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_tl(ret, ret, 64);
> +}
> +
>  static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -251,6 +391,12 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *=
a)
>      return gen_unary(ctx, a, gen_ctzw);
>  }
>
> +static void gen_cpopw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    tcg_gen_ctpop_tl(ret, arg1);
> +}
> +
>  static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -258,6 +404,14 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw=
 *a)
>      return gen_unary(ctx, a, gen_cpopw);
>  }
>
> +static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t =3D tcg_temp_new();
> +    tcg_gen_ext16s_tl(t, arg2);
> +    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_packw(DisasContext *ctx, arg_packw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -265,6 +419,15 @@ static bool trans_packw(DisasContext *ctx, arg_packw=
 *a)
>      return gen_arith(ctx, a, EXT_NONE, gen_packw);
>  }
>
> +static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t =3D tcg_temp_new();
> +    tcg_gen_shri_tl(t, arg1, 16);
> +    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
> +    tcg_gen_ext32s_tl(ret, ret);
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -349,6 +512,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw=
 *a)
>      return gen_shiftiw(ctx, a, gen_sro);
>  }
>
> +static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 =3D tcg_temp_new_i32();
> +    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -363,6 +544,24 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw=
 *a)
>      return gen_shiftiw(ctx, a, gen_rorw);
>  }
>
> +static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv_i32 t1 =3D tcg_temp_new_i32();
> +    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
> +}
> +
>  static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -370,6 +569,12 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *=
a)
>      return gen_shiftw(ctx, a, gen_rolw);
>  }
>
> +static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    gen_helper_grev(ret, arg1, arg2);
> +}
> +
>  static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -384,6 +589,12 @@ static bool trans_greviw(DisasContext *ctx, arg_grev=
iw *a)
>      return gen_shiftiw(ctx, a, gen_grevw);
>  }
>
> +static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    gen_helper_gorcw(ret, arg1, arg2);
> +}
> +
>  static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -398,6 +609,23 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorc=
iw *a)
>      return gen_shiftiw(ctx, a, gen_gorcw);
>  }
>
> +#define GEN_SHADD_UW(SHAMT)                                       \
> +static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
> +{                                                                 \
> +    TCGv t =3D tcg_temp_new();                                      \
> +                                                                  \
> +    tcg_gen_ext32u_tl(t, arg1);                                   \
> +                                                                  \
> +    tcg_gen_shli_tl(t, t, SHAMT);                                 \
> +    tcg_gen_add_tl(ret, t, arg2);                                 \
> +                                                                  \
> +    tcg_temp_free(t);                                             \
> +}
> +
> +GEN_SHADD_UW(1)
> +GEN_SHADD_UW(2)
> +GEN_SHADD_UW(3)
> +
>  #define GEN_TRANS_SHADD_UW(SHAMT)                             \
>  static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
>                                      arg_sh##SHAMT##add_uw *a) \
> @@ -411,6 +639,12 @@ GEN_TRANS_SHADD_UW(1)
>  GEN_TRANS_SHADD_UW(2)
>  GEN_TRANS_SHADD_UW(3)
>
> +static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    tcg_gen_add_tl(ret, arg1, arg2);
> +}
> +
>  static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
>  {
>      REQUIRE_64BIT(ctx);
> --
> 2.25.1
>
>

