Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jF1dF-0000c6-3q
	for mharc-qemu-riscv@gnu.org; Thu, 19 Mar 2020 16:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jF1dC-0000Z3-2q
 for qemu-riscv@nongnu.org; Thu, 19 Mar 2020 16:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jF1dA-0000Ex-Bu
 for qemu-riscv@nongnu.org; Thu, 19 Mar 2020 16:19:06 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:42389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jF1d6-0000CI-JS; Thu, 19 Mar 2020 16:19:00 -0400
Received: by mail-vs1-xe43.google.com with SMTP id i25so2565021vsq.9;
 Thu, 19 Mar 2020 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RLUle+BrXsLKU1wdhS9fqQe6Wxwvu4uf/cuSQFm9c/w=;
 b=jQvY1BWo+hmKYqdY3WjQ2reu6zwMfxYnQDCD4/1oOuuW2URCfNMlOV7ZyLsRZwjIjA
 YvZuj8HuLA/x+8DP9nHRzN8tIuYxtYTOuiB0/8AOiXOVzrrBf8BkvseiWuLjfhMZafI3
 u4EM49ILrYho0fJih48TAwfG9BWPTw7T/z11nwjCGBAolUfRs4vGkTbRK5K8seKdJws9
 wEndq/JRwDoUIqkFIy/GQVZHboDJUKDHLgKM50paoU0jk5FclcP3y0xpM+s8PnzVm7ab
 7Dbiw/bU1JGaFpchb9lGSahjpMgTeo6b/v9xt021ZLop4PA+j/tRAxMXXNkbnVy/Ua7m
 7APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RLUle+BrXsLKU1wdhS9fqQe6Wxwvu4uf/cuSQFm9c/w=;
 b=LbDS31C1dUZfOGy0vTzi2Jy+DBPvrEF7TRpjT9vNT0a++3XCuua8DnF7UxyWIfTaNY
 /ekkupudIK68ZCOcnQ7G+GL1eyDvadMiQuXj6vXg6XGP5g/m/WpB00oJjJ1b80km/s3Y
 seZhDyqJTsPNLUD+CEcAE54c2tLh2knFWrVRXg++FJXhWk1DGnnSTNazZmK536wDqYkT
 GdZZZKcVsk0dJ1zZrbPTykpX4BCa2JiIpV4772jfqRH/L86RMNmi9SIkX/1aSZ8268An
 x2mxpX4bz7TUcEqjIWccNRCvl6QXJJFJq6khj8bB1FeN61hfRahR+eMNPevEqdPCy9jj
 f0Nw==
X-Gm-Message-State: ANhLgQ0mT2jaEjh/G8gMgpLchDFWxXl8VMDXer/V24HtCa7I2dJzJdwF
 txIyUSHSIPSSJFHE6BcgFESNxdWv+yEC7uM8Bng=
X-Google-Smtp-Source: ADFU+vuqgkolwrQTdi9sT20jOtSh3YbNgNTA8kRyL5eLgZ0DTsriQguF9nh9snbnCCoYE9K1dUVsXbSfj9BD4rbXXBQ=
X-Received: by 2002:a67:26c2:: with SMTP id m185mr3857812vsm.180.1584649139720; 
 Thu, 19 Mar 2020 13:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-15-zhiwei_liu@c-sky.com>
In-Reply-To: <20200317150653.9008-15-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Mar 2020 13:10:57 -0700
Message-ID: <CAKmqyKNQQS0GmZS-8T52uOfPoadrX4pTg4AepKRf235zWDLT7A@mail.gmail.com>
Subject: Re: [PATCH v6 14/61] target/riscv: vector single-width bit shift
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, guoren@linux.alibaba.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
X-List-Received-Date: Thu, 19 Mar 2020 20:19:08 -0000

On Tue, Mar 17, 2020 at 8:35 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 25 ++++++++
>  target/riscv/insn32.decode              |  9 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 54 ++++++++++++++++
>  target/riscv/vector_helper.c            | 85 +++++++++++++++++++++++++
>  4 files changed, 173 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 4373e9e8c2..47284c7476 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -397,3 +397,28 @@ DEF_HELPER_6(vxor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vxor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vxor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vxor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vsll_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsll_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsll_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsll_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsra_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vsll_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsll_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsll_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsll_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsrl_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3ad6724632..f6d0f5aec5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -320,6 +320,15 @@ vor_vi          001010 . ..... ..... 011 ..... 1010111 @r_vm
>  vxor_vv         001011 . ..... ..... 000 ..... 1010111 @r_vm
>  vxor_vx         001011 . ..... ..... 100 ..... 1010111 @r_vm
>  vxor_vi         001011 . ..... ..... 011 ..... 1010111 @r_vm
> +vsll_vv         100101 . ..... ..... 000 ..... 1010111 @r_vm
> +vsll_vx         100101 . ..... ..... 100 ..... 1010111 @r_vm
> +vsll_vi         100101 . ..... ..... 011 ..... 1010111 @r_vm
> +vsrl_vv         101000 . ..... ..... 000 ..... 1010111 @r_vm
> +vsrl_vx         101000 . ..... ..... 100 ..... 1010111 @r_vm
> +vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
> +vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
> +vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
> +vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index b4ba6d83f3..6ed2466e75 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -1258,3 +1258,57 @@ GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
>  GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
>  GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
>  GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
> +
> +/* Vector Single-Width Bit Shift Instructions */
> +GEN_OPIVV_GVEC_TRANS(vsll_vv,  shlv)
> +GEN_OPIVV_GVEC_TRANS(vsrl_vv,  shrv)
> +GEN_OPIVV_GVEC_TRANS(vsra_vv,  sarv)
> +
> +typedef void GVecGen2sFn32(unsigned, uint32_t, uint32_t, TCGv_i32,
> +                           uint32_t, uint32_t);
> +
> +static inline bool
> +do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
> +                    gen_helper_opivx *fn)
> +{
> +    if (!opivx_check(s, a)) {
> +        return false;
> +    }
> +
> +    if (a->vm && s->vl_eq_vlmax) {
> +        TCGv_i32 src1 = tcg_temp_new_i32();
> +        TCGv tmp = tcg_temp_new();
> +
> +        gen_get_gpr(tmp, a->rs1);
> +        tcg_gen_trunc_tl_i32(src1, tmp);
> +        tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
> +        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
> +                src1, MAXSZ(s), MAXSZ(s));
> +
> +        tcg_temp_free_i32(src1);
> +        tcg_temp_free(tmp);
> +        return true;
> +    } else {
> +        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> +    }
> +    return true;
> +}
> +
> +#define GEN_OPIVX_GVEC_SHIFT_TRANS(NAME, SUF) \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
> +{                                                                         \
> +    static gen_helper_opivx * const fns[4] = {                            \
> +        gen_helper_##NAME##_b, gen_helper_##NAME##_h,                     \
> +        gen_helper_##NAME##_w, gen_helper_##NAME##_d,                     \
> +    };                                                                    \
> +                                                                          \
> +    return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);    \
> +}
> +
> +GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
> +GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
> +GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
> +
> +GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
> +GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
> +GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 470bf079b2..c3518516f0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1286,3 +1286,88 @@ GEN_VEXT_VX(vxor_vx_b, 1, 1, clearb)
>  GEN_VEXT_VX(vxor_vx_h, 2, 2, clearh)
>  GEN_VEXT_VX(vxor_vx_w, 4, 4, clearl)
>  GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
> +
> +/* Vector Single-Width Bit Shift Instructions */
> +#define DO_SLL(N, M)  (N << (M))
> +#define DO_SRL(N, M)  (N >> (M))
> +
> +/* generate the helpers for shift instructions with two vector operators */
> +#define GEN_VEXT_SHIFT_VV(NAME, TS1, TS2, HS1, HS2, OP, MASK, CLEAR_FN)   \
> +void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
> +        void *vs2, CPURISCVState *env, uint32_t desc)                     \
> +{                                                                         \
> +    uint32_t mlen = vext_mlen(desc);                                      \
> +    uint32_t vm = vext_vm(desc);                                          \
> +    uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(TS1);                                           \
> +    uint32_t vlmax = vext_maxsz(desc) / esz;                              \
> +    uint32_t i;                                                           \
> +                                                                          \
> +    if (vl == 0) {                                                        \
> +        return;                                                           \
> +    }                                                                     \
> +    for (i = 0; i < vl; i++) {                                            \
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
> +            continue;                                                     \
> +        }                                                                 \
> +        TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
> +        TS2 s2 = *((TS2 *)vs2 + HS2(i));                                  \
> +        *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
> +    }                                                                     \
> +    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                              \
> +}
> +
> +GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VV(vsll_vv_h, uint16_t, uint16_t, H2, H2, DO_SLL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VV(vsll_vv_w, uint32_t, uint32_t, H4, H4, DO_SLL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VV(vsll_vv_d, uint64_t, uint64_t, H8, H8, DO_SLL, 0x3f, clearq)
> +
> +GEN_VEXT_SHIFT_VV(vsrl_vv_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VV(vsrl_vv_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VV(vsrl_vv_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VV(vsrl_vv_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, clearq)
> +
> +GEN_VEXT_SHIFT_VV(vsra_vv_b, uint8_t,  int8_t, H1, H1, DO_SRL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
> +
> +/* generate the helpers for shift instructions with one vector and one scalar */
> +#define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK, CLEAR_FN) \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
> +        void *vs2, CPURISCVState *env, uint32_t desc)                 \
> +{                                                                     \
> +    uint32_t mlen = vext_mlen(desc);                                  \
> +    uint32_t vm = vext_vm(desc);                                      \
> +    uint32_t vl = env->vl;                                            \
> +    uint32_t esz = sizeof(TD);                                        \
> +    uint32_t vlmax = vext_maxsz(desc) / esz;                          \
> +    uint32_t i;                                                       \
> +                                                                      \
> +    if (vl == 0) {                                                    \
> +        return;                                                       \
> +    }                                                                 \
> +    for (i = 0; i < vl; i++) {                                        \
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                    \
> +            continue;                                                 \
> +        }                                                             \
> +        TS2 s2 = *((TS2 *)vs2 + HS2(i));                              \
> +        *((TD *)vd + HD(i)) = OP(s2, s1 & MASK);                      \
> +    }                                                                 \
> +    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                          \
> +}
> +
> +GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VX(vsll_vx_h, uint16_t, int16_t, H2, H2, DO_SLL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VX(vsll_vx_w, uint32_t, int32_t, H4, H4, DO_SLL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VX(vsll_vx_d, uint64_t, int64_t, H8, H8, DO_SLL, 0x3f, clearq)
> +
> +GEN_VEXT_SHIFT_VX(vsrl_vx_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VX(vsrl_vx_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VX(vsrl_vx_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VX(vsrl_vx_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, clearq)
> +
> +GEN_VEXT_SHIFT_VX(vsra_vx_b, int8_t, int8_t, H1, H1, DO_SRL, 0x7, clearb)
> +GEN_VEXT_SHIFT_VX(vsra_vx_h, int16_t, int16_t, H2, H2, DO_SRL, 0xf, clearh)
> +GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f, clearl)
> +GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
> --
> 2.23.0
>

