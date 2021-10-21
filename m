Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdPhM-00078F-7o
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 00:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPhJ-00072Y-Hj; Thu, 21 Oct 2021 00:28:57 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPhH-0001ZS-OJ; Thu, 21 Oct 2021 00:28:57 -0400
Received: by mail-io1-xd36.google.com with SMTP id p142so690623iod.0;
 Wed, 20 Oct 2021 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=la72QeLHa788/NNxQrpkhsnVxEmBhJ01DfyIbWvWpIQ=;
 b=q5AhBWwbLyvPx9tDaNXq/loo6cVCAx2vyHNEicWX82PscziPdhMl6UeadUufO0dPDO
 kMmj3Uk92p4eQ4pQiKvavXDddmkI2iNeurZiDH1cKxgkxwpRQQI5Vej+AmkKSLileyQT
 drRZ86cwMWM1Ll+F3IyVXqeB8I1UjIhGt5tTWCBmNO80i8zEP+8fHPl1SmqntIj6u8bt
 l8KsowJt37DivRtrLCkSz+AqXtRhG2bkxYhZYdQlpX/YyHFZNTwIxl3q0CpWD0ZRB4Yp
 cAqeR+X9p5t+qxSIWzwVtJTYOkGH1D1hUfVECzX8Fu8Buz4VtORWPeg3vbVP9DXmH29f
 Occg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=la72QeLHa788/NNxQrpkhsnVxEmBhJ01DfyIbWvWpIQ=;
 b=Emn6g5G2BeJWQxlcI6ks23oPkrKtFcCFxpqOJPm+hjh6+UABoQaFoxuPGO8oTkvfdl
 /St1iWhdOkxxH5izgL6uDnBOrtJT0ftG0BvRPsQWYZST+Ml3HCckl9Y0xJsSY0bjJr0l
 fq2mFnUx5eOn0l0eclaLzmLC++Jjx2WUCdsdH0ateUsLfoXFzG1W5wEYUyItrVEReXzH
 8lUZxJOgodvd9ipfJAmebYQQMAQs6pt1MS3mGNaVXO7bT5+991YWFrhnGJBy44yJnE8c
 clwBkJ+smiLVHBa6C+oSuEA38WL+nzbx8SrfnQWdT2brn5juaYeAZrSKr3om4CyQb7vp
 x+Hw==
X-Gm-Message-State: AOAM531oLYlWBwcPECm4HEoBrv3CC3war/pZiezdaMyIp45fhgxkht3g
 9KcFh7ri0/bfdd+swljrhlb3X3VlBnd7k9B1Mtc=
X-Google-Smtp-Source: ABdhPJxdBFdtE0kNznWbo2yUpGzk/kaxYj9cjTVEHbebEXjRoNXyQaWcydgXyugc8WjHCrkTPONmf3W52OS1UR8J74k=
X-Received: by 2002:a05:6638:1192:: with SMTP id
 f18mr2333397jas.114.1634790534065; 
 Wed, 20 Oct 2021 21:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-42-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-42-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 14:28:27 +1000
Message-ID: <CAKmqyKPDoESK8QCtfpCE5svWmN+D0QUM9Mi_PjiFUe5-PDhBgw@mail.gmail.com>
Subject: Re: [PATCH v8 34/78] target/riscv: rvv-1.0: allow load element with
 sign-extended
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 04:28:58 -0000

On Fri, Oct 15, 2021 at 6:28 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> For some vector instructions (e.g. vmv.s.x), the element is loaded with
> sign-extended.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3751496676f..31ea231b3be 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2824,17 +2824,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>  /* Integer Extract Instruction */
>
>  static void load_element(TCGv_i64 dest, TCGv_ptr base,
> -                         int ofs, int sew)
> +                         int ofs, int sew, bool sign)
>  {
>      switch (sew) {
>      case MO_8:
> -        tcg_gen_ld8u_i64(dest, base, ofs);
> +        if (!sign) {
> +            tcg_gen_ld8u_i64(dest, base, ofs);
> +        } else {
> +            tcg_gen_ld8s_i64(dest, base, ofs);
> +        }
>          break;
>      case MO_16:
> -        tcg_gen_ld16u_i64(dest, base, ofs);
> +        if (!sign) {
> +            tcg_gen_ld16u_i64(dest, base, ofs);
> +        } else {
> +            tcg_gen_ld16s_i64(dest, base, ofs);
> +        }
>          break;
>      case MO_32:
> -        tcg_gen_ld32u_i64(dest, base, ofs);
> +        if (!sign) {
> +            tcg_gen_ld32u_i64(dest, base, ofs);
> +        } else {
> +            tcg_gen_ld32s_i64(dest, base, ofs);
> +        }
>          break;
>      case MO_64:
>          tcg_gen_ld_i64(dest, base, ofs);
> @@ -2889,7 +2901,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
>
>      /* Perform the load. */
>      load_element(dest, base,
> -                 vreg_ofs(s, vreg), s->sew);
> +                 vreg_ofs(s, vreg), s->sew, false);
>      tcg_temp_free_ptr(base);
>      tcg_temp_free_i32(ofs);
>
> @@ -2905,9 +2917,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
>  }
>
>  static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
> -                              int vreg, int idx)
> +                              int vreg, int idx, bool sign)
>  {
> -    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
> +    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
>  }
>
>  static bool trans_vext_x_v(DisasContext *s, arg_r *a)
> @@ -2917,7 +2929,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
>
>      if (a->rs1 == 0) {
>          /* Special case vmv.x.s rd, vs2. */
> -        vec_element_loadi(s, tmp, a->rs2, 0);
> +        vec_element_loadi(s, tmp, a->rs2, 0, false);
>      } else {
>          /* This instruction ignores LMUL and vector register groups */
>          int vlmax = s->vlen >> (3 + s->sew);
> @@ -2999,7 +3011,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>          (s->mstatus_fs != 0) && (s->sew != 0)) {
>          unsigned int len = 8 << s->sew;
>
> -        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
> +        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
>          if (len < 64) {
>              tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
>                              MAKE_64BIT_MASK(len, 64 - len));
> @@ -3101,7 +3113,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>          TCGv_i64 dest = tcg_temp_new_i64();
>
>          if (a->rs1 == 0) {
> -            vec_element_loadi(s, dest, a->rs2, 0);
> +            vec_element_loadi(s, dest, a->rs2, 0, false);
>          } else {
>              vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
>          }
> --
> 2.25.1
>
>

