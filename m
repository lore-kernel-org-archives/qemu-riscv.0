Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZMz-0001Tb-B4
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZMx-0001Ru-KV
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:27:15 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZMv-0002Wg-E1
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:27:15 -0400
Received: by mail-io1-xd42.google.com with SMTP id j8so36123786ioe.9
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TOwgOTFC4+U2nVC22s5CtQLqpA6Bn97mPirtq5I97r8=;
 b=EBE6btoe5pusX+PkoWIUv9nk1m+g10QIhByhVwS/SgrDwOeonceig1Q2CC9LbkQr+m
 XFlR+J0RERJszCTZcJadINFfXgOxLUwBfRpgFXw7q+aN6sT4rb6SXwsRyGv/9rRqu6P0
 zXYeSOkToOajtzfvBSXXg+7Te3yXtvgtuwIQV7w+Htkbot3TSIBGjsw1+mPGUM0GSKls
 jCLp5z9MmWy/Q//kEOv5UMuMHRJBOCP25ubqvzLcEKPnT04zlxaiIJJvlSza0ZBqIeG4
 Rpgt3YrEL1ZFlVMZBSFhzU7J0EnxQ6yX7uXyiru5mzN7/TizTwlpMR2Rf1j6DlOOOCzW
 x9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOwgOTFC4+U2nVC22s5CtQLqpA6Bn97mPirtq5I97r8=;
 b=ggUlyrjR8+5FRp52GO6lmmzoIN794e4RkjuvG4t7zRZKTIyebqzDK7/YmPuOR8kurE
 1bZhjjFa9MYhR/bew4EQNPu0Gjw9EKjE0sJ7nlZSm7lZJP8DaMXwKze57aWvUdWl+U3Q
 tKeavbulmgV9DHAllBwf1XX4+tLQ/cMCfo+mkrKq7RDN0aXVsp5n1XxM71jWgS8EuAj0
 QjHrbi7Wwkt17AakB7MeSqNgM9yCsEgVOlLpRl8cbkiQhr2BQ3/YHqLwbOWOqCFcNQQx
 QdjXPyQHmPZ71fxPaN2bvl8/FwtPfwT6lxfsw7oT5XVwwZMqqpxlLGnk3PupwmyuaE5N
 KZfQ==
X-Gm-Message-State: AOAM531/bmCOYig4OTPbSv+nSuHnVMmy70PjKjIMpnH0xvYCcEP2dP3x
 1eb8HPiqvLUZrX/bXBfaP65M4fRezrjLenFlBFVxMQ==
X-Google-Smtp-Source: ABdhPJyDBs0MmokTAakSywrz89yXIdg6fWHhG3hmQAQKyPRH1ecKwD+gkHaqE7ZYI6B2P+l+CNc/JBHI2zz/ctxwuCk=
X-Received: by 2002:a6b:3bcf:: with SMTP id i198mr8116636ioa.194.1596695231694; 
 Wed, 05 Aug 2020 23:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-6-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-6-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:27:01 +0800
Message-ID: <CAEiOBXUE+sP8rYx8Dxw6EUmVpA0bPcsSz4Az+wbzHqu8Kf7iuQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/riscv: Check nanboxed inputs in
 trans_rvf.inc.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000019a2d505ac2f9479"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 06:27:15 -0000

--00000000000019a2d505ac2f9479
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> If a 32-bit input is not properly nanboxed, then the input is replaced
> with the default qnan.  The only inline expansion is for the sign-changing
> set of instructions: FSGNJ.S, FSGNJX.S, FSGNJN.S.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvf.inc.c | 71 +++++++++++++++++++------
>  target/riscv/translate.c                | 18 +++++++
>  2 files changed, 73 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
> b/target/riscv/insn_trans/trans_rvf.inc.c
> index 264d3139f1..f9a9e0643a 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -161,47 +161,86 @@ static bool trans_fsgnj_s(DisasContext *ctx,
> arg_fsgnj_s *a)
>  {
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> +
>      if (a->rs1 == a->rs2) { /* FMOV */
> -        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
>      } else { /* FSGNJ */
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
> cpu_fpr[a->rs1],
> -                            0, 31);
> +        TCGv_i64 rs1 = tcg_temp_new_i64();
> +        TCGv_i64 rs2 = tcg_temp_new_i64();
> +
> +        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +
> +        /* This formulation retains the nanboxing of rs2. */
> +        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
> +        tcg_temp_free_i64(rs1);
> +        tcg_temp_free_i64(rs2);
>      }
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
>      mark_fs_dirty(ctx);
>      return true;
>  }
>
>  static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>  {
> +    TCGv_i64 rs1, rs2, mask;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> +
> +    rs1 = tcg_temp_new_i64();
> +    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +
>      if (a->rs1 == a->rs2) { /* FNEG */
> -        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
> +        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31, 1));
>      } else {
> -        TCGv_i64 t0 = tcg_temp_new_i64();
> -        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
> -        tcg_temp_free_i64(t0);
> +        rs2 = tcg_temp_new_i64();
> +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +
> +        /*
> +         * Replace bit 31 in rs1 with inverse in rs2.
> +         * This formulation retains the nanboxing of rs1.
> +         */
> +        mask = tcg_const_i64(~MAKE_64BIT_MASK(31, 1));
> +        tcg_gen_andc_i64(rs2, mask, rs2);
> +        tcg_gen_and_i64(rs1, mask, rs1);
> +        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
> +
> +        tcg_temp_free_i64(mask);
> +        tcg_temp_free_i64(rs2);
>      }
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> +    tcg_temp_free_i64(rs1);
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
>
>  static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>  {
> +    TCGv_i64 rs1, rs2;
> +
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> +
> +    rs1 = tcg_temp_new_i64();
> +    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> +
>      if (a->rs1 == a->rs2) { /* FABS */
> -        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT32_MIN);
> +        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(31, 1));
>      } else {
> -        TCGv_i64 t0 = tcg_temp_new_i64();
> -        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT32_MIN);
> -        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
> -        tcg_temp_free_i64(t0);
> +        rs2 = tcg_temp_new_i64();
> +        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> +
> +        /*
> +         * Xor bit 31 in rs1 with that in rs2.
> +         * This formulation retains the nanboxing of rs1.
> +         */
> +        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
> +        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
> +
> +        tcg_temp_free_i64(rs2);
>      }
> -    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
> +    tcg_temp_free_i64(rs1);
> +
>      mark_fs_dirty(ctx);
>      return true;
>  }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 12a746da97..bf35182776 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -101,6 +101,24 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>  }
>
> +/*
> + * A narrow n-bit operation, where n < FLEN, checks that input operands
> + * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
> + * If so, the least-significant bits of the input are used, otherwise the
> + * input value is treated as an n-bit canonical NaN (v2.2 section 9.2).
> + *
> + * Here, the result is always nan-boxed, even the canonical nan.
> + */
> +static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
> +{
> +    TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
> +    TCGv_i64 t_nan = tcg_const_i64(0xffffffff7fc00000ull);
> +
> +    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
> +    tcg_temp_free_i64(t_max);
> +    tcg_temp_free_i64(t_nan);
> +}
> +
>  static void generate_exception(DisasContext *ctx, int excp)
>  {
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Chih-Min Chao

--00000000000019a2d505ac2f9479
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>=
</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jul 24, 2020 at 8:28 AM Richard Henderson &lt;<a href=3D"mailto:r=
ichard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">If a 32-bit input =
is not properly nanboxed, then the input is replaced<br>
with the default qnan.=C2=A0 The only inline expansion is for the sign-chan=
ging<br>
set of instructions: FSGNJ.S, FSGNJX.S, FSGNJN.S.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvf.inc.c | 71 +++++++++++++++++++-----=
-<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 18 +++++++<br>
=C2=A02 files changed, 73 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_tr=
ans/trans_rvf.inc.c<br>
index 264d3139f1..f9a9e0643a 100644<br>
--- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
@@ -161,47 +161,86 @@ static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgn=
j_s *a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVF);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (a-&gt;rs1 =3D=3D a-&gt;rs2) { /* FMOV */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_i64(cpu_fpr[a-&gt;rd], cpu_fpr[a-&=
gt;rs1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_check_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[=
a-&gt;rs1]);<br>
=C2=A0 =C2=A0 =C2=A0} else { /* FSGNJ */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], cpu_fpr=
[a-&gt;rs2], cpu_fpr[a-&gt;rs1],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0, 31);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 rs1 =3D tcg_temp_new_i64();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 rs2 =3D tcg_temp_new_i64();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This formulation retains the nanboxing of r=
s2. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], rs2, rs=
1, 0, 31);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(rs1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(rs2);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
=C2=A0static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv_i64 rs1, rs2, mask;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVF);<br>
+<br>
+=C2=A0 =C2=A0 rs1 =3D tcg_temp_new_i64();<br>
+=C2=A0 =C2=A0 gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (a-&gt;rs1 =3D=3D a-&gt;rs2) { /* FNEG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_xori_i64(cpu_fpr[a-&gt;rd], cpu_fpr[a-=
&gt;rs1], INT32_MIN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_xori_i64(cpu_fpr[a-&gt;rd], rs1, MAKE_=
64BIT_MASK(31, 1));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t0 =3D tcg_temp_new_i64();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_not_i64(t0, cpu_fpr[a-&gt;rs2]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_i64(cpu_fpr[a-&gt;rd], t0, cpu=
_fpr[a-&gt;rs1], 0, 31);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rs2 =3D tcg_temp_new_i64();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Replace bit 31 in rs1 with inverse in =
rs2.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This formulation retains the nanboxing=
 of rs1.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D tcg_const_i64(~MAKE_64BIT_MASK(31, 1)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andc_i64(rs2, mask, rs2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_and_i64(rs1, mask, rs1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_or_i64(cpu_fpr[a-&gt;rd], rs1, rs2);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(rs2);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
+=C2=A0 =C2=A0 tcg_temp_free_i64(rs1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
=C2=A0static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 TCGv_i64 rs1, rs2;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVF);<br>
+<br>
+=C2=A0 =C2=A0 rs1 =3D tcg_temp_new_i64();<br>
+=C2=A0 =C2=A0 gen_check_nanbox_s(rs1, cpu_fpr[a-&gt;rs1]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (a-&gt;rs1 =3D=3D a-&gt;rs2) { /* FABS */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(cpu_fpr[a-&gt;rd], cpu_fpr[a-=
&gt;rs1], ~INT32_MIN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(cpu_fpr[a-&gt;rd], rs1, ~MAKE=
_64BIT_MASK(31, 1));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t0 =3D tcg_temp_new_i64();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(t0, cpu_fpr[a-&gt;rs2], INT32=
_MIN);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_xor_i64(cpu_fpr[a-&gt;rd], cpu_fpr[a-&=
gt;rs1], t0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rs2 =3D tcg_temp_new_i64();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_check_nanbox_s(rs2, cpu_fpr[a-&gt;rs2]);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Xor bit 31 in rs1 with that in rs2.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This formulation retains the nanboxing=
 of rs1.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31,=
 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_xor_i64(cpu_fpr[a-&gt;rd], rs1, rs2);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(rs2);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 gen_nanbox_s(cpu_fpr[a-&gt;rd], cpu_fpr[a-&gt;rd]);<br>
+=C2=A0 =C2=A0 tcg_temp_free_i64(rs1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0mark_fs_dirty(ctx);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 12a746da97..bf35182776 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -101,6 +101,24 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)<br=
>
=C2=A0 =C2=A0 =C2=A0tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));<br>
=C2=A0}<br>
<br>
+/*<br>
+ * A narrow n-bit operation, where n &lt; FLEN, checks that input operands=
<br>
+ * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.<br>
+ * If so, the least-significant bits of the input are used, otherwise the<=
br>
+ * input value is treated as an n-bit canonical NaN (v2.2 section 9.2).<br=
>
+ *<br>
+ * Here, the result is always nan-boxed, even the canonical nan.<br>
+ */<br>
+static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)<br>
+{<br>
+=C2=A0 =C2=A0 TCGv_i64 t_max =3D tcg_const_i64(0xffffffff00000000ull);<br>
+=C2=A0 =C2=A0 TCGv_i64 t_nan =3D tcg_const_i64(0xffffffff7fc00000ull);<br>
+<br>
+=C2=A0 =C2=A0 tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan)=
;<br>
+=C2=A0 =C2=A0 tcg_temp_free_i64(t_max);<br>
+=C2=A0 =C2=A0 tcg_temp_free_i64(t_nan);<br>
+}<br>
+<br>
=C2=A0static void generate_exception(DisasContext *ctx, int excp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(cpu_pc, ctx-&gt;base.pc_next);<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><span style=3D"color:rgb(136,136,136)">Chih-Min Chao</span><div style=3D=
"color:rgb(136,136,136)"></div></div></div></div><div>=C2=A0</div></div></d=
iv>

--00000000000019a2d505ac2f9479--

