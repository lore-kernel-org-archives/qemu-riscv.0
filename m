Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA80C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 11:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsJ8c-0003dI-2M; Fri, 07 Aug 2026 07:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wsJ8a-0003d2-EZ
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:53:20 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wsJ8Y-00063U-0I
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:53:20 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-495b98b4f6aso1172226b6e.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 04:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786103597; cv=none;
 d=google.com; s=arc-20260327;
 b=W6lG42SM5sMBLw1h5N8SW/258KR1mMXc3CUnHl8tPrH9tWN7oSbq+xWY71/k8eqjSq
 bWZr9KMCed/VDeXpLLcbN47zEL++bDXl2IUP26eDmO0/n44W/73U1SRgdp1YOGNBglQn
 9awlz+9+aqCYx/bPIBjtq3VOeYU4J/FhLq3qbFWxNWex/NsjH/Wii8dNa5yeu1nEJTbT
 dllfvajiTlTM+u6m6MMlj1qqSVAnEz9zAC2V+XBY9e+cLYCZWKynCZOHSPyKPCXOngHc
 A6DZkQi/F3qp5286bcC/Mxmz/g5OGpa5TuM64UzErIbazp9Bx1b0kk7ZEL2OkHrjrbbu
 wK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jgZ129qSa6YPsR67db8G8tzzWv8D+LT0KHM5qnYXlJE=;
 fh=Jvypda19Iegka9uF40CgxSTesrbBRRnSXtMgjTMnWaU=;
 b=ZKA8xKys9ia/1gYfWvHLK7uGdThPUyFD1WV12ITj4jmKv8T3uINAYe+MsnYD7K9Ubr
 h1ALJ990hFew+n/vVuqyMFOInHvCgycxlmRnV7gbHnDnlqkmOoIKXNWetsIsiji1czrj
 uo7j12Itiu8eXWpNBV7luNhn3zB8yQSR9qeaTUzHi4XT24qCxYuqmgDJMB9m7Z4QwToj
 2bYpd4bxS+8NoEpbq4BxUaZ4JRWJEpHhZIjcV6XdxFbLF6YCIXkgxJMdiFMrV8vyfUD7
 29J7Fz0gP3Cd8ZwMEWmJL6cjSi42jhjpStr+uzGwONIgYI56SPkIzfzTQT+7dg7/QgCE
 v4/g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786103597; x=1786708397; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jgZ129qSa6YPsR67db8G8tzzWv8D+LT0KHM5qnYXlJE=;
 b=PsdV+X+t9M/7Fwi4K0A4wR+QAMla4wX39u4i78x8x2CUTOBL6UpofYq0juWqJ1afPT
 fK0NWN51DCTYMI0x1T6S4oFpxwfU9rHyM5WEpHBgIf56PZxdndpjQWJvUfOxIgj3WFOq
 JOOTxMcplhttkh3uUwFeXaWzZ/1NdmgCf8cDqC8FDeDoRAXH5/23Ow2rbjhJkOpLMKiU
 GnsiHOXztStoDMEzQQXKdKLHLCoZQPISmK9KqSsqF93PTmnfbdqKTGpNfY7dHObFZjoe
 msu/n9HPWZBpf3Bb1iJvWoySzd0fi9E1B6F51MvqYhOXG8l4kyuPkEWlgD6EcfZP/lEt
 +Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103597; x=1786708397;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jgZ129qSa6YPsR67db8G8tzzWv8D+LT0KHM5qnYXlJE=;
 b=Y6pVtLDUn51r/JVjn1GwSa2klKk1Cp/hKy1qpyhyX7nmkP0uaYkM/WM1a7144jd5Yh
 DOYCNSFO39R5RucX2KMt5euxyzGpsxut4IBIlsCcCs3xzEueXxcE5tJTcMhHv8CrcfiB
 msHDR/1QeJBZ2QD0HmG5Hn/+U+cuixoGrydXHtSrFXtoNZULdt10HVOAAsBrlpY5yzQA
 3L/0OUl402feJwnsaUo+hvssQDFYzb7FPcdzE4wcNEjUQ4toBKQzUEbhFWoNfpUMwfa5
 5CILSa/V6Q9qDPP7+nFonom2Du8fjcGCmO4CIqDHhWjWbvsE6rcPMNZbuT2qjzXDvhX6
 ziZw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6zcNNy5bx3WchNQqt3M9E+l8vgMy2KkkvjsC6LSW1QSbp5hpSC0Wwk9DDkt8WZe6lNRBYewfSBUCg@nongnu.org
X-Gm-Message-State: AOJu0YynWg37ChkFEB7ZHHvFu0KIGWgBniOUgmBaN8sDNe0tPu5gb7NP
 KKhWKkSCUp1a1Fy3Cx6Ku6ny4tlIzook3eQem2fYLHwwlKZtPcSOZ7HAaZgh1PTsfr6E+RkTbjd
 d7zT5tp3UU+3IwAAbWU2ImPukmG32jaXhmUZgoSryaQ==
X-Gm-Gg: AR+sD129R7rMC1pH7k564fxc55lQGEGIL5t6yBTGLIuh3hyWjbSrtie2WU6+IMceDYM
 Y4slUYmASvgRbHlEQldCzRIYi2BZWE+ZO6HqnMClrj8cElegxI2TZFWJSm7q9ID2Biqd133NeB0
 Ho+2+WSOhIeP8QmphLdPSQg1fcc+8q2IdrgchiccNBrJf6IOJJLxsF/3aHeUvLLmz6DpGb5hEDO
 fq1onJiMG2eGMNKpl7UbJBe1hcvrUSyqdnQi8bPkp2//lHCp4UrdOzWMlhTleWxtfOsr5xjAh47
 XKefyyNH1YFn9zDJ4QBZRxxm653vOTs3osrjz7xs2M3Dn2WfoKG9RiJKe9+o4Mr+sth0SazOM36
 DVmw=
X-Received: by 2002:a05:6808:1792:b0:487:530f:5754 with SMTP id
 5614622812f47-4afae1a151bmr14123190b6e.20.1786103596072; Fri, 07 Aug 2026
 04:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260730181852.1622-1-ahshehab24@gmail.com>
In-Reply-To: <20260730181852.1622-1-ahshehab24@gmail.com>
From: Max Chou <max.chou@sifive.com>
Date: Fri, 7 Aug 2026 19:53:04 +0800
X-Gm-Features: AUfX_mzGTe7BD7onKwFBTDI8pWETrvlZ8J5HTRgvoExTl40pGPbc0JDQ39SrP3g
Message-ID: <CANiaA1v6qFSMMDBp7dHqKWhW3d7vRQUMXDB3+vDuaWqLGCk=xg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix PC sync in trans_sspopchk for CFI
 exception handling
To: A-Shehab <ahshehab24@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: multipart/alternative; boundary="0000000000006053aa065873a63a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=max.chou@sifive.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000006053aa065873a63a
Content-Type: text/plain; charset="UTF-8"

Thank you A-Shehab
I forgot to ping and update this patch

On Fri, Jul 31, 2026 at 02:20 A-Shehab <ahshehab24@gmail.com> wrote:

> From: Max Chou <max.chou@sifive.com>
>
> Move gen_update_pc call before conditional logic to ensure consistent
> PC state regardless of execution path.
>
> Previously, the host instructions generated to update the cpu_pc were
> only executed in the failure path when shadow stack validation failed.
> This created inconsistent PC synchronization.
>
> This inconsistency caused issues in CF_PCREL mode where subsequent
> instructions calculated wrong relative offsets from stale pc_save
> values, and could lead to incorrect exception return addresses.
>
> This fix ensures PC is always synchronized before any helper that
> might raise an exception, maintaining consistent translator state
> across all execution paths.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4118
> Signed-off-by: Max Chou <max.chou@sifive.com>
> [ahshehab: rebased on current master; file moved to
>  target/riscv/tcg/insn_trans/ and the ssp load is now 64-bit wide]
> Tested-by: A-Shehab <ahshehab24@gmail.com>
> Signed-off-by: A-Shehab <ahshehab24@gmail.com>
> ---
> This is a repost of Max Chou's patch from 2025-11-05 [1], which did not
> receive any review. Rebased onto current master: the file moved to
> target/riscv/tcg/insn_trans/ and the ssp load is now a 64-bit load, so
> the original patch no longer applies.
>
> I opened a GitLab issue (#4118) with a minimal, self-contained bare-metal
> reproducer for this bug. It runs an sspopchk that matches the shadow stack
> (the common case) followed by an auipc in the same translation block; on
> current master the auipc returns an address 4 bytes too low (exit 42) and
> with this patch it is correct (exit 0). The reproducer is included in the
> issue.
>
> [1]
> https://lore.kernel.org/qemu-devel/20251105134331.2865581-1-max.chou@sifive.com/
>
>  target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> index a813232887..d47a9f9c7d 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> @@ -32,6 +32,7 @@ static bool trans_sspopchk(DisasContext *ctx,
> arg_sspopchk *a)
>      TCGLabel *skip = gen_new_label();
>      uint32_t tmp = (get_xl(ctx) == MXL_RV64) ? 8 : 4;
>      TCGv data = tcg_temp_new();
> +    gen_update_pc(ctx, 0);
>      TCGv_i64 wide_addr = tcg_temp_new_i64();
>      tcg_gen_ld_i64(wide_addr, tcg_env, offsetof(CPURISCVState, ssp));
>      tcg_gen_trunc_i64_tl(addr, wide_addr);
> @@ -42,7 +43,6 @@ static bool trans_sspopchk(DisasContext *ctx,
> arg_sspopchk *a)
>      tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
>      tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
>                      tcg_env, offsetof(CPURISCVState, sw_check_code));
> -    gen_update_pc(ctx, 0);
>      gen_helper_raise_exception(tcg_env,
>                    tcg_constant_i32(RISCV_EXCP_SW_CHECK));
>      gen_set_label(skip);
> --
> 2.53.0
>
>

--0000000000006053aa065873a63a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you=C2=A0<span style=3D"font-size:inherit;backgroun=
d-color:rgba(0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204=
,204,204);color:rgb(0,0,0)">A-Shehab</span></div><div dir=3D"auto">I forgot=
 to ping and update this patch=C2=A0<br clear=3D"all"><br clear=3D"all"><di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr">On Fri, Jul 31, 2026 at 02:20 A-Shehab &lt;<a href=3D=
"mailto:ahshehab24@gmail.com">ahshehab24@gmail.com</a>&gt; wrote:<br></div>=
</div></div></div><div><div class=3D"gmail_quote gmail_quote_container"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Max Chou &lt;<a href=
=3D"mailto:max.chou@sifive.com" target=3D"_blank">max.chou@sifive.com</a>&g=
t;<br>
<br>
Move gen_update_pc call before conditional logic to ensure consistent<br>
PC state regardless of execution path.<br>
<br>
Previously, the host instructions generated to update the cpu_pc were<br>
only executed in the failure path when shadow stack validation failed.<br>
This created inconsistent PC synchronization.<br>
<br>
This inconsistency caused issues in CF_PCREL mode where subsequent<br>
instructions calculated wrong relative offsets from stale pc_save<br>
values, and could lead to incorrect exception return addresses.<br>
<br>
This fix ensures PC is always synchronized before any helper that<br>
might raise an exception, maintaining consistent translator state<br>
across all execution paths.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/4118" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/4118</a><br>
Signed-off-by: Max Chou &lt;<a href=3D"mailto:max.chou@sifive.com" target=
=3D"_blank">max.chou@sifive.com</a>&gt;<br>
[ahshehab: rebased on current master; file moved to<br>
=C2=A0target/riscv/tcg/insn_trans/ and the ssp load is now 64-bit wide]<br>
Tested-by: A-Shehab &lt;<a href=3D"mailto:ahshehab24@gmail.com" target=3D"_=
blank">ahshehab24@gmail.com</a>&gt;<br>
Signed-off-by: A-Shehab &lt;<a href=3D"mailto:ahshehab24@gmail.com" target=
=3D"_blank">ahshehab24@gmail.com</a>&gt;<br>
---<br>
This is a repost of Max Chou&#39;s patch from 2025-11-05 [1], which did not=
<br>
receive any review. Rebased onto current master: the file moved to<br>
target/riscv/tcg/insn_trans/ and the ssp load is now a 64-bit load, so<br>
the original patch no longer applies.<br>
<br>
I opened a GitLab issue (#4118) with a minimal, self-contained bare-metal<b=
r>
reproducer for this bug. It runs an sspopchk that matches the shadow stack<=
br>
(the common case) followed by an auipc in the same translation block; on<br=
>
current master the auipc returns an address 4 bytes too low (exit 42) and<b=
r>
with this patch it is correct (exit 0). The reproducer is included in the<b=
r>
issue.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/qemu-devel/20251105134331.2865581-1-=
max.chou@sifive.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/qemu-devel/20251105134331.2865581-1-max.chou@sifive.com/</a><br>
<br>
=C2=A0target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc b/target/ris=
cv/tcg/insn_trans/trans_rvzicfiss.c.inc<br>
index a813232887..d47a9f9c7d 100644<br>
--- a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc<br>
+++ b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc<br>
@@ -32,6 +32,7 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopch=
k *a)<br>
=C2=A0 =C2=A0 =C2=A0TCGLabel *skip =3D gen_new_label();<br>
=C2=A0 =C2=A0 =C2=A0uint32_t tmp =3D (get_xl(ctx) =3D=3D MXL_RV64) ? 8 : 4;=
<br>
=C2=A0 =C2=A0 =C2=A0TCGv data =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 gen_update_pc(ctx, 0);<br>
=C2=A0 =C2=A0 =C2=A0TCGv_i64 wide_addr =3D tcg_temp_new_i64();<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_ld_i64(wide_addr, tcg_env, offsetof(CPURISCVSta=
te, ssp));<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_trunc_i64_tl(addr, wide_addr);<br>
@@ -42,7 +43,6 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopch=
k *a)<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_BC=
FI_TVAL),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tcg_env, offsetof(CPURISCVState, sw_check_code));<br>
-=C2=A0 =C2=A0 gen_update_pc(ctx, 0);<br>
=C2=A0 =C2=A0 =C2=A0gen_helper_raise_exception(tcg_env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_co=
nstant_i32(RISCV_EXCP_SW_CHECK));<br>
=C2=A0 =C2=A0 =C2=A0gen_set_label(skip);<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div>

--0000000000006053aa065873a63a--

