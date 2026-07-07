Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3C3C43602
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:16:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1uW-0007dw-F1; Tue, 07 Jul 2026 05:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1uU-0007dW-AI
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:16:10 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1uS-0003QT-Iq
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:16:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c126eb4e228so439637566b.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783415767; cv=none;
 d=google.com; s=arc-20260327;
 b=ktxdEVBa721wX9kyGWMfEOUv3zIIwxHmBl2H2rq6NvqS/O4xcyHHpSYvFOpOjprQ66
 FBvvPwIOtcF8170eSgixMZ/2s4Zbz1/XNgbooGbu7BYqfN0lMSW807lhI1oCGE/1PXqg
 l+XKuAnjd2v2Qhz0aFe39wKccNuKWwgCCb8eKgc2t5Suho/5qPNKQ0CX7hQhU+tok4Q9
 5W+hgSgEX0YVMt3U4F9VTcGb2I31zxR7FG6sggfC6EzdJePWeTkJmKZAWYZKJ5nKlovt
 D5mDTIGbvwDfJJnid+T+MDRL26B1zE0XWLKOzAj7eeugIJvLErQ4RblIc00Gj1QgNRKy
 Nt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Iuls+r+vnvH3ocSncfDxHGVzWK66Xi3I9dCDug/HkRs=;
 fh=DqPOqtUCFLk+3aIDFrK7QWzlKOX8ndHg/cQ+of7p1+U=;
 b=krGwOFLTmTJxu9cnRaVVbd6wtLzeQH3Lvvf0TWPxnPFfDon53oKcBN/S30vk4z102v
 cgw4TLjTDZA1hzCR+WAVEy5oKEQW8uVgCkviqLCuPxRoPQW5s0DRICvt3D02oT18YfIS
 CnfaQMDekyxtabgpwnSrujMagprMtZF/wJzV36/k5maNjqv1mE3PSkxBZ6/aBABR9xVQ
 0oYSr5MUbvrjl7+o0469xxN1ncnI2kje3ymbWqlNsvedgkB+5OFsov9GtMOsDIFXFK6U
 ebE1rVZlhyjxic/8ZQ1PVbjurW/b5kU4rYaO5m/s3L4UWnnsLNZlYoJk6ColfDcYWFxn
 UJaA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415767; x=1784020567; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iuls+r+vnvH3ocSncfDxHGVzWK66Xi3I9dCDug/HkRs=;
 b=LeuV+Pg459tP9Wg4MPv3FABQRIy/+sT1RTHnms6NICr4ZiM3ZEjnnUz9qiu0ArGlCl
 jz+BmQGm+9A2GVWnSMlD9t++hH9akUylp52DxKGHKoJKdg9LVJ3dVdKqa6rJ2U5phtEF
 wqSk1dKeiRdN30kYv/yIBTHIxdbcsk7yWfVVCdf6lB//PNZJYqUY+BJGP+0onS6jb7d1
 5EmqVIoSCSFuNNEK5xH25A4loOirdLXWfFSN+mtl2K/4aV3xskSirMeINmOfeHB04H/y
 08i8qsFeEVqaOurgZn1AVWuKv2u/b4Z89LRwkfqbiyuWG2JKAUKKzBHZmLLERSoBRcEc
 hfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415767; x=1784020567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iuls+r+vnvH3ocSncfDxHGVzWK66Xi3I9dCDug/HkRs=;
 b=F28ksXhFusfbSzmxfnX7fuTVd7u6ife13VpNSMaaA6pcmgqTiciry2YOPCzq2HrtbK
 FQtiZKgw0lRd5wOZ0i6n2nEThAasGgV+SxzC2MHevGgtjfd+UYJyhSqMb03u5miIlovF
 qh6TYrHzc0+z3sa6/0/z7ugjeQEaXlGEm+9A/I045PQPy/DmkuyibSQ1WPuQGuUpn2CW
 B0vJJ+dIJDu8qaGmIVmKOLW/PMmVhVgcieWqN+8oVYaSmeASaXpLEcnbv5Ox6NhHJvFW
 /9ox5uyvuLn9sDiinFRxjPww2cTEVtNW6KMZcTaehWKr2+pEtVpOivpBkSO3iGqyw6EP
 UyiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNqMJHI7c7HixcFuhrzr7ofxGD0c0ac9UbL/TI2iyLrHmMJKTlpsjSqxt5EVUoxl/Gw9lZOxwmL4Pb@nongnu.org
X-Gm-Message-State: AOJu0YyRV77Fvl98FHUloY/+Monr22im6+jTKwmniLZaZHku0TZVDeMn
 MG2TimJ1Pi6rTVorfmdoEER8Y/iV8VhXTNU/f2zb3ZuCfGUsTuBoID+hldOc+qzq1I30RvonRrU
 V0YUwnLcYv7jtJdMvlcnQ0I9h9beNxNh/z7uV0LbiEA==
X-Gm-Gg: AfdE7cldBCf5CHKAYne4Xk3ECXN1SO5o4V4YEFRJ2nPbbu6dTEkmDbaWoxJAWkfui3C
 RNnre+lLUTgEkEleKkqqA8AFk7iPGjo74SLfhmFmVsyNEgLwLKhacxuZnxhPDGYci0KSb4m2KR3
 0klNnHuvGLUyB1iPdix8vQGPwn0urnBn76BjMjaRTGxGXujO8pszXRz3f+kFWEDEQRrHb/3sgR2
 vi+3kktjAROd3ayv5jPPcE2EdpXg4EEXOS/KY6jUi4r0KLcJGa5g5qcSsg3AhP9WUieGNVlqQ0=
X-Received: by 2002:a17:906:48cf:b0:c11:f4d6:48fc with SMTP id
 a640c23a62f3a-c15a693c9famr161887166b.45.1783415766847; Tue, 07 Jul 2026
 02:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260630104350.748267-1-frank.chang@sifive.com>
 <20260630104350.748267-3-frank.chang@sifive.com>
 <CAKmqyKPFV++zTuzWSWdMLbj1gb+VaLdrW6TEEo29+7jLz=0+ZA@mail.gmail.com>
In-Reply-To: <CAKmqyKPFV++zTuzWSWdMLbj1gb+VaLdrW6TEEo29+7jLz=0+ZA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 7 Jul 2026 17:15:55 +0800
X-Gm-Features: AVVi8CdMSHDKSm-Iu5RWEsYe78p99HEOw-ArsvkDMF6w7g7ch2jcdqwl4GzhSM0
Message-ID: <CAE_xrPi6qkqgZePKoH5UzrDYbtHcP9mLN7yvwRjANhDxPSoD8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] target/riscv: Support raising misaligned
 exceptions for scalar loads/stores
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000452b5f065601d74c"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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

--000000000000452b5f065601d74c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:32=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om>
wrote:

> On Tue, Jun 30, 2026 at 8:46=E2=80=AFPM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > When the Zicclsm extension is not enabled, raise misaligned load/store
> > exceptions for misaligned accesses from scalar load/store instructions.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Max Chou <max.chou@sifive.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> This patch breaks the `func-riscv64-opensbi` test, which you can run
> with `make check-functional-riscv64`
>

Thanks Alistair,

The issue is that we need to place the reset vector data at 8-byte-aligned
offsets.
Otherwise, QEMU would raise the misaligned load exception
as SiFive U doesn't support hardware misaligned access.
I've updated SiFive U's reset vector data and sent out the v6 patchset.

Regards,
Frank Chang


>
> Alistair
>
> > ---
> >  target/riscv/insn_trans/trans_rvi.c.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
> b/target/riscv/insn_trans/trans_rvi.c.inc
> > index e47b16a7fa2..cc1b5dbbadc 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -413,6 +413,9 @@ static bool gen_load(DisasContext *ctx, arg_lb *a,
> MemOp memop)
> >      if (ctx->cfg_ptr->ext_zama16b) {
> >          memop |=3D MO_ATOM_WITHIN16;
> >      }
> > +    if (!ctx->cfg_ptr->ext_zicclsm) {
> > +        memop |=3D MO_ALIGN;
> > +    }
> >      decode_save_opc(ctx, 0);
> >      if (get_xl(ctx) =3D=3D MXL_RV128) {
> >          out =3D gen_load_i128(ctx, a, memop);
> > @@ -524,6 +527,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a,
> MemOp memop)
> >      if (ctx->cfg_ptr->ext_zama16b) {
> >          memop |=3D MO_ATOM_WITHIN16;
> >      }
> > +    if (!ctx->cfg_ptr->ext_zicclsm) {
> > +        memop |=3D MO_ALIGN;
> > +    }
> >      decode_save_opc(ctx, 0);
> >      if (get_xl(ctx) =3D=3D MXL_RV128) {
> >          return gen_store_i128(ctx, a, memop);
> > --
> > 2.43.0
> >
> >
>

--000000000000452b5f065601d74c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"background-color:transpare=
nt">On Mon, Jul 6, 2026 at 1:32=E2=80=AFPM Alistair Francis &lt;<a href=3D"=
mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:</span></di=
v><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, Jun 30, 2026 at 8:46=E2=80=AFPM &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; When the Zicclsm extension is not enabled, raise misaligned load/store=
<br>
&gt; exceptions for misaligned accesses from scalar load/store instructions=
.<br>
&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Max Chou &lt;<a href=3D"mailto:max.chou@sifive.com" targe=
t=3D"_blank">max.chou@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
This patch breaks the `func-riscv64-opensbi` test, which you can run<br>
with `make check-functional-riscv64`<br></blockquote><div><br></div><div>Th=
anks Alistair,</div><div><br></div><div>The issue is that we need to place =
the reset vector data at 8-byte-aligned offsets.</div><div>Otherwise, QEMU =
would raise the misaligned=C2=A0load exception</div><div>as SiFive U doesn&=
#39;t support hardware misaligned access.</div><div>I&#39;ve updated SiFive=
 U&#39;s reset vector data and sent out=C2=A0the v6 patchset.</div><div><br=
></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvi.c.inc | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/in=
sn_trans/trans_rvi.c.inc<br>
&gt; index e47b16a7fa2..cc1b5dbbadc 100644<br>
&gt; --- a/target/riscv/insn_trans/trans_rvi.c.inc<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvi.c.inc<br>
&gt; @@ -413,6 +413,9 @@ static bool gen_load(DisasContext *ctx, arg_lb *a,=
 MemOp memop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zama16b) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memop |=3D MO_ATOM_WITHIN16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zicclsm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memop |=3D MO_ALIGN;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 decode_save_opc(ctx, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (get_xl(ctx) =3D=3D MXL_RV128) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D gen_load_i128(ctx, a, memop)=
;<br>
&gt; @@ -524,6 +527,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a=
, MemOp memop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zama16b) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memop |=3D MO_ATOM_WITHIN16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zicclsm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memop |=3D MO_ALIGN;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 decode_save_opc(ctx, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (get_xl(ctx) =3D=3D MXL_RV128) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gen_store_i128(ctx, a, memop)=
;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000452b5f065601d74c--

