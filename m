Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZOZ-0003Ha-Q3
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZOY-0003GY-TX
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:28:54 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZOX-0002gG-2b
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:28:54 -0400
Received: by mail-io1-xd44.google.com with SMTP id u126so11184860iod.12
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t3FPoHPpd/u+4Q/X4VJ4aN0TeasF4QwxfNG1d8AyZNo=;
 b=MmdpH3Xak60LOps8/52yHvf7RgdOQfadfCN29aA2Ls1B58rf+YziycVMV/4CDZ/m+/
 AsZ7rpZPFxJY4eFGJLywMAkLXcAGzdGgjVhXUyFctpzOByuLl4703PIlIVneHUOZ9f2J
 Q3xjpjC0ITx6yQapmh7SpvdROQOswPBXa0UXCsnuPf//WfGpTHuU8hvobcgPAsEBMVJj
 ZN3w8oN1Ls9/tcl9t5a/jub8uHr7tx4i3obHUHpMba+0yzubEYgEcbnhKOg9qYnYi6WJ
 T+xNoT35yAs9FWMQHbZj0pCAjPe4fL0hKX/twjo7q8aHQEIp74TCzrdndfpGKrknM77D
 EAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t3FPoHPpd/u+4Q/X4VJ4aN0TeasF4QwxfNG1d8AyZNo=;
 b=DKWa44JWbbSDUD1g641rmDUIcibZWwQO+zov2maIksLfnmP1dmsVZyGRK/McLGdLio
 Mnju6Txd4ZqGRha6+3k9FwnwMA8iz7s52ks9oyWn0bhct/2K1mHmShdlc1A0cG3cbYqd
 mKk5/OtsFxBIoDdTJgeCiS9B7QxBGS38rM5UOPuQYJHg9ILaDSR+30wlevsKvIMHagYn
 uNP53RCGXUrMQoRk5U89GzPmDJSB3wl7xIt/ZzXqH5BSq63cszwmTr6Nn1yv++iw/kAQ
 mLcyjR9Lh/qnfz1nQ93lksl6X80ZA7lFMZw9BaGeByHpuaQGDfVzrq3q+4R6ub/e96Un
 +qEw==
X-Gm-Message-State: AOAM531mfixoo6LeVJYdEtAaZE6tHgGYxHDd0r4JQ2fpdFSOvezI0hA0
 heR0TmrdkTjraLpbruqHJxlYUeCymsuwcmpdzYu0ug==
X-Google-Smtp-Source: ABdhPJxX7T6L5MjKHp7olaHwoVKfoLOs/fllbKqvyFs0uiHAkidC1j8vCIsCFxVPx0nQSOnPkKgVTQegG9U1Hcprb4A=
X-Received: by 2002:a6b:f911:: with SMTP id j17mr7652574iog.96.1596695332214; 
 Wed, 05 Aug 2020 23:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-8-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-8-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:28:41 +0800
Message-ID: <CAEiOBXWhSi=ydVJMD6bdd9+Buayg1kBV62n15aM1eh59QoA4Bw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/riscv: check before allocating TCG temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000017647f05ac2f9a44"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd44.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 06:28:55 -0000

--00000000000017647f05ac2f9a44
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:32 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Message-Id: <20200626205917.4545-5-zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvd.inc.c | 8 ++++----
>  target/riscv/insn_trans/trans_rvf.inc.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.inc.c
> b/target/riscv/insn_trans/trans_rvd.inc.c
> index ea1044f13b..4f832637fa 100644
> --- a/target/riscv/insn_trans/trans_rvd.inc.c
> +++ b/target/riscv/insn_trans/trans_rvd.inc.c
> @@ -20,10 +20,10 @@
>
>  static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> +    TCGv t0 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
>
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
> @@ -35,10 +35,10 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>
>  static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> +    TCGv t0 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
>
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c
> b/target/riscv/insn_trans/trans_rvf.inc.c
> index 0d04677a02..16df9c5ee2 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -25,10 +25,10 @@
>
>  static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> +    TCGv t0 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
>      tcg_gen_addi_tl(t0, t0, a->imm);
>
>      tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
> @@ -41,11 +41,11 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>
>  static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>  {
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
>      TCGv t0 = tcg_temp_new();
>      gen_get_gpr(t0, a->rs1);
>
> -    REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
>      tcg_gen_addi_tl(t0, t0, a->imm);
>
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Chih-Min Chao

--00000000000017647f05ac2f9a44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>=
</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jul 24, 2020 at 8:32 AM Richard Henderson &lt;<a href=3D"mailto:r=
ichard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: LIU Zhiwei &=
lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-s=
ky.com</a>&gt;<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20200626205917.4545-5-zhiwei_liu@c-sky.co=
m" target=3D"_blank">20200626205917.4545-5-zhiwei_liu@c-sky.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvd.inc.c | 8 ++++----<br>
=C2=A0target/riscv/insn_trans/trans_rvf.inc.c | 8 ++++----<br>
=C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_tr=
ans/trans_rvd.inc.c<br>
index ea1044f13b..4f832637fa 100644<br>
--- a/target/riscv/insn_trans/trans_rvd.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvd.inc.c<br>
@@ -20,10 +20,10 @@<br>
<br>
=C2=A0static bool trans_fld(DisasContext *ctx, arg_fld *a)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVD);<br>
+=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(t0, t0, a-&gt;imm);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_ld_i64(cpu_fpr[a-&gt;rd], t0, ctx-&gt;mem_=
idx, MO_TEQ);<br>
@@ -35,10 +35,10 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)<br=
>
<br>
=C2=A0static bool trans_fsd(DisasContext *ctx, arg_fsd *a)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVD);<br>
+=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(t0, t0, a-&gt;imm);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st_i64(cpu_fpr[a-&gt;rs2], t0, ctx-&gt;mem=
_idx, MO_TEQ);<br>
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_tr=
ans/trans_rvf.inc.c<br>
index 0d04677a02..16df9c5ee2 100644<br>
--- a/target/riscv/insn_trans/trans_rvf.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvf.inc.c<br>
@@ -25,10 +25,10 @@<br>
<br>
=C2=A0static bool trans_flw(DisasContext *ctx, arg_flw *a)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_FPU;<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVF);<br>
+=C2=A0 =C2=A0 TCGv t0 =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 gen_get_gpr(t0, a-&gt;rs1);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(t0, t0, a-&gt;imm);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_ld_i64(cpu_fpr[a-&gt;rd], t0, ctx-&gt;mem_=
idx, MO_TEUL);<br>
@@ -41,11 +41,11 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)<br=
>
<br>
=C2=A0static bool trans_fsw(DisasContext *ctx, arg_fsw *a)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 REQUIRE_FPU;<br>
+=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVF);<br>
=C2=A0 =C2=A0 =C2=A0TCGv t0 =3D tcg_temp_new();<br>
=C2=A0 =C2=A0 =C2=A0gen_get_gpr(t0, a-&gt;rs1);<br>
<br>
-=C2=A0 =C2=A0 REQUIRE_FPU;<br>
-=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVF);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(t0, t0, a-&gt;imm);<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st_i64(cpu_fpr[a-&gt;rs2], t0, ctx-&gt;mem=
_idx, MO_TEUL);<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><span style=3D"color:rgb(136,136,136)">Chih-Min Chao</span><div style=3D=
"color:rgb(136,136,136)"></div></div></div></div><div>=C2=A0</div></div></d=
iv>

--00000000000017647f05ac2f9a44--

