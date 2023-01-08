Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEMjR-0004La-Hq
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 22:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMjQ-0004LH-1z; Sat, 07 Jan 2023 22:52:24 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMjN-0008Lc-Kn; Sat, 07 Jan 2023 22:52:23 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hw16so370330ejc.10;
 Sat, 07 Jan 2023 19:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I5sNx7TX9ACxlUPDc7jdGO70mReEt4uLX6fgAA91hvo=;
 b=WAjYiIAgEsaR6ngiji5aTm2R+ImB6tOiclrRhCx2ZaKZutkfgDqPFgY5s/iM8+3RYs
 sJweG9FK5dx9J55rmGGIKIJyFC7KnKqw04INnq77oUkYpZwwy8YKtWb8ODaq9DygNsdB
 T1QZcm4zdE/NKJDZjcXAcQrMW6qdC1KLKVa1uke/1Sl2p+YgaLNl/azp0/A1w/fouF0n
 gcDIwidAUTheyfEtv79GbVdBe8zYXYvBTYZC5KtmFLsIYab8wxCoAKsJQn5S8RJli+U3
 jlwu+Y0KGVz90cYOhGOtn4GPTpgw9w1xAnBbqcYidzeiEGB9bGL6hYLcrKFD0RffrBc0
 /UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I5sNx7TX9ACxlUPDc7jdGO70mReEt4uLX6fgAA91hvo=;
 b=JkYncS+bnfZf+wD1+ohHDgQSPgDCl/HT+boBLZzvINbWGzHL55fWYiLSLPxwT/2KtT
 FjQQqTSSjfNAUZHYQdvrJ8en2PXBcemGQK4X4O/U6N9D8il3Amts7FswaIhesFLC9U9L
 aNjEfldvG8F7ewDj5ezLLRWXAR9rkxMOmcNYdVbJQFVpH1hmGFlxoZW6CQ+3CBNBKDfB
 oi/LzXnADtKRn3JzUZSTx1u5g+gW5+HJ6haax1oWeIVFm2PYKIDWYl5VrZ/4Zfvis+xM
 qsitCRKpx4rFiZjdfSjZWRyvZ9GGJN+p7zNLHmldShKpmCgZWEAwUI6y2LPjJ1eOijUr
 tgKA==
X-Gm-Message-State: AFqh2koMumB/NxTODtoqG0cDhz1tTlun24IfluhyQkwDT+CwUlt+rV0b
 f2EMemUdmtVegJ2dLKyN9K12f1qhbTuN6sfoSq0=
X-Google-Smtp-Source: AMrXdXtJbMJ1ZvY6xP5s+/qq59gTpJD7SW3yOPrRjOmb41XDe+EkwYXtj6Mm7PMOY9PCw1v5OtBD/qNQfKxsBtXVlDw=
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id
 ky2-20020a170907778200b007c0e3803d44mr5195971ejc.498.1673149939578; Sat, 07
 Jan 2023 19:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20221229172734.119600-1-abdulras@google.com>
In-Reply-To: <20221229172734.119600-1-abdulras@google.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 11:52:08 +0800
Message-ID: <CAEUhbmW5_5htR53nXHJEv+FShz2-+94CROV8JpGRBMhLqTRUWQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: do not set the rounding mode via `gen_set_rm`
To: Saleem Abdulrasool <abdulras@google.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, frank.chang@sifive.com, 
 Saleem Abdulrasool <compnerd@compnerd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 03:52:24 -0000

On Fri, Dec 30, 2022 at 2:20 AM Saleem Abdulrasool <abdulras@google.com> wrote:
>
> From: Saleem Abdulrasool <compnerd@compnerd.org>
>
> Setting the rounding mode via the `gen_set_rm` call would alter the
> state of the disassembler, resetting the `TransOp` in the assembler
> context.  When we subsequently set the rounding mode to the desired
> value, we would trigger an assertion in `decode_save_opc`.  Instead
> we can set the rounding mode via the `gen_helper_set_rounding_mode`
> which will still trigger the exception in the case of an invalid RM
> without altering the CPU disassembler state.
>
> Signed-off-by: Saleem Abdulrasool <compnerd@compnerd.org>
> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 69 +++++++++++++------------
>  1 file changed, 36 insertions(+), 33 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4dea4413ae..73f6fab1c5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2679,8 +2679,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>                      int rm)
>  {
>      if (checkfn(s, a)) {
> +        // the helper will raise an exception if the rounding mode is invalid

nits: use /* */

>          if (rm != RISCV_FRM_DYN) {
> -            gen_set_rm(s, RISCV_FRM_DYN);
> +            gen_helper_set_rounding_mode(cpu_env,
> +                                         tcg_constant_i32(RISCV_FRM_DYN));
>          }
>
>          uint32_t data = 0;
> @@ -3001,38 +3003,39 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>             require_scale_zve64f(s);
>  }
>
> -#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
> -static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> -{                                                                  \
> -    if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
> -        uint32_t data = 0;                                         \
> -        static gen_helper_gvec_3_ptr * const fns[2] = {            \
> -            gen_helper_##HELPER##_h,                               \
> -            gen_helper_##HELPER##_w,                               \
> -        };                                                         \
> -        TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> -        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
> -                                                                   \
> -        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> -        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> -        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> -        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
> -        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> -                           fns[s->sew - 1]);                       \
> -        mark_vs_dirty(s);                                          \
> -        gen_set_label(over);                                       \
> -        return true;                                               \
> -    }                                                              \
> -    return false;                                                  \
> +#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)                     \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)                       \
> +{                                                                           \
> +    if (CHECK(s, a)) {                                                      \
> +        if (FRM != RISCV_FRM_DYN) {                                         \
> +            gen_helper_set_rounding_mode(cpu_env,                           \
> +                                         tcg_constant_i32(RISCV_FRM_DYN));  \
> +        }                                                                   \
> +                                                                            \
> +        uint32_t data = 0;                                                  \
> +        static gen_helper_gvec_3_ptr * const fns[2] = {                     \
> +            gen_helper_##HELPER##_h,                                        \
> +            gen_helper_##HELPER##_w,                                        \
> +        };                                                                  \
> +        TCGLabel *over = gen_new_label();                                   \
> +        gen_set_rm(s, FRM);                                                 \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);                   \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);          \
> +                                                                            \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                          \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                      \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);                        \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);                        \
> +        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),              \
> +                           vreg_ofs(s, a->rs2), cpu_env,                    \
> +                           s->cfg_ptr->vlen / 8,                            \
> +                           s->cfg_ptr->vlen / 8, data,                      \
> +                           fns[s->sew - 1]);                                \
> +        mark_vs_dirty(s);                                                   \
> +        gen_set_label(over);                                                \
> +        return true;                                                        \
> +    }                                                                       \
> +    return false;                                                           \
>  }
>
>  GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
> --

Is it possible to create a test case (tests/tcg/riscv64) for this?

Regards,
Bin

