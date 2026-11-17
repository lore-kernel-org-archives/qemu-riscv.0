Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC764606A323
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=acfuR968
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTG9U-0005Lo-5b; Tue, 17 Nov 2026 05:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTG9R-0005LJ-VK
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 05:10:57 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTG9Q-0001AY-0H
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 05:10:57 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so783050766b.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794910254; x=1795515054; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XRG0of1hoB/vT6BmhYVlnUACQ1Af/rDzfjGnNwGAsNE=;
 b=acfuR968PqdXWTGOzVfhNO5T1dAGj4GbJsr5rTqs9gbYazccWcACXVkGdrzRM75ISm
 f5bGQGhVKYkEpa7aOx6UFZtvj01quKB11Ph49cmVOKAFEI5XcaKO5vXv87rJrfz2wKJg
 Jc9MdrLON9aA9FdD9M/H3ZMI3Xhmwzx6D5xHKuODl9JkFna8N08g4DbQIUB3fSoi7Tnu
 mmkCn8Q4gP9fuSvp57tPNWplVHTSnLsGx3eZJOm2ceaeQNufYmKz//BqjLyyngIM2nak
 J8y9U945YpGEdK8ffu8ZxesF6EG33yeEEaADIvPJvKm/oG+LZZ9fqlGPbBeEMqsNM6u2
 6Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794910254; x=1795515054;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XRG0of1hoB/vT6BmhYVlnUACQ1Af/rDzfjGnNwGAsNE=;
 b=J2hAhC1l/HICyu7CYRXq/sbAJt3cNxVLEsX7Bl3odzLBnK8su+ozwswOM/oTX8Khch
 y90EoBNkFtoIipE2JGeSqYTcuZMHwgoe8shDvvO3cTICvZEbMJooIacoybLaROBPJxCM
 OyJzkj2vvx7WFD0rpowrcCjb3PzeO3CQjMVKqpY2zsx9rv+GjGrhZbFP4LsXx9z/DXFI
 nfB44Oy1b92Q0C4jM3AkORw9S58pWa1TsUnfF2fzWxVhkf/lpnp9O8u3OY6MhRL73rNf
 ULLra6WwKNEe4XbpFjJ+rtbQIK30SYBWh/pMuK3YvyJp9OIbg4v5khGdGrbu3AvItkOW
 LErg==
X-Forwarded-Encrypted: i=1;
 AL+hErEemLI7a42IF3yTaLCvjkhMlgvWJOo1wInnmxHJIN9DJVs7ipCgrZMsfyuuONAtOumg41J6ul3NiCoK@nongnu.org
X-Gm-Message-State: APuU4Z/nD+wbfqh9VQJVZnIKlbwIHbw5vpcnrFHvLzjbKviX+xcTeHIU
 QIIL7R1RfjhOzKSIokmKvPSpTC+asU0rWyGCHoi6BboFFy+2oRj2PuO1hz2tQrYf4kvel8VB2K3
 YJ79U7faZIextmE2mKlxbJhMD2GM0Plnx7/oonWuoVfta+iGhVXty/V4nrUUKFpB+DsoUfXEEfu
 MqaeLnQ6y8rV+D/Snae6Sz5xf413UffAgQbnOZlC5k2eA=
X-Gm-Gg: AYBFou3EbFkms0sbRIhZcjN6hoC9FX8nrdPil1djg/b82ydgAcSveiuAq6Mf4T0baO/
 4UkUisKzXpXzw5sGqATtZOoaG4OEp5Lzm8s5k33xB6lZc8qU9qEDnYmitr0PbTzj3pyh3CwDFYr
 VW0Bu+T8ryRLhrNM4qnIEEz3tdnudfKao1/PV8yiBBojgJHVISLyTnEUyPel4S8k5vUyMwvOEya
 lTB8TD7oYB4Ec3UNdAhp1Yb2eLhl82wdcKJYpb+uoXeUY6tTDIuG1OF8NJ5EENgEzcVm5rQBkRK
 dXFTHGSVLzWk6X/OkpqazGnBns/rgqc1He7WcsQIJKElkiOK+gRj3Cy8Va4GjNh374N6PdAH+l9
 R8zOLiiLIKHuqrBmpscEq6gVdXsxg/8gto4+7JXr4oAjwA9QqPLquO71gzLzbYChJJhdc8aFVCo
 jdnt1E7bRPbC5O2rJ0jr/0xtxJMy1NlCOFftWdnzcibbznS+FYPh905Kj5WqIq8ayFub4U8xmP8
 cXaun0014kJ997k/9TBcIwNNDIKOhFqC7VLDSD8gimwcsrY1Wx84oRB6qkyiI9c9Mo3cZ8hSBel
 GFw5kgr85Wfbd+iqt2pu6NVBJRiAUhUNJyUcm4PWF7CJoewWVQLtdOkoizUrn1gGLpw7ZOKBo3B
 LsMgmNM6/VL7H
X-Received: by 2002:a17:906:6d02:b0:c51:5f6:cf70 with SMTP id
 a640c23a62f3a-c5105f6d8d6mr25214966b.1.1794910254005; 
 Tue, 17 Nov 2026 02:10:54 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23611bdsm5614095a12.8.2026.11.17.02.10.51
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 02:10:52 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so783030466b.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 02:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErGCdK0A1Yww3UWRh7msCF2g22P+q9c+uv24v1I19H0Jwl60nRUtNOWXo3Tl9+i5g+pNZ9BgsXHR5NWY@nongnu.org
X-Received: by 2002:a17:907:1b0a:b0:c50:5e0a:fbad with SMTP id
 a640c23a62f3a-c5096430d02mr1091376066b.39.1794910249512; Tue, 17 Nov 2026
 02:10:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-12-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-12-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 18:10:37 +0800
X-Gmail-Original-Message-ID: <CAMXXpfY78gE8yF3JtO2hZQZnnOk2tdOcRK1jmSghyP3SEUwRnA@mail.gmail.com>
X-Gm-Features: AclHuK9xeWnLO3wFTUj_NbICCo2aLMzi7A42H3UG-x9cW3ci5-RBGmNTibIBGNg
Message-ID: <CAMXXpfY78gE8yF3JtO2hZQZnnOk2tdOcRK1jmSghyP3SEUwRnA@mail.gmail.com>
Subject: Re: [PATCH 12/13] hw/riscv/trace-encoder.c: remaining fields to
 ram-sink as RO values
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d375f30660761b1b"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000d375f30660761b1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

>  - set trRamActive RO =3D 1 (always active)
>  - set trRamEnable RO =3D 1 (always enabled)
>  - set trRamMode RO =3D 1 (only SMEM mode)
>  - set trRamStopOnWrap RO =3D 0 (not supported)
>  - set trRamMemFormat RO =3D 0 (memory formatted as plain bytes)
>  - set trRamAsyncFreq RO =3D 0 (alignment synchronization packets disable=
d)
>  - set trRamHasSMEM =3D 1 (RAM sink supports SMEM)
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  hw/riscv/trace-ram-sink.c | 22 +++++++++++++++++++++-
>  hw/riscv/trace-ram-sink.h |  1 +
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/trace-ram-sink.c b/hw/riscv/trace-ram-sink.c
> index c273335fec..03ffa9caae 100644
> --- a/hw/riscv/trace-ram-sink.c
> +++ b/hw/riscv/trace-ram-sink.c
> @@ -40,13 +40,33 @@
>                                 R_TR_RAM_IMPL_HAS_SRAM_MASK | \
>                                 R_TR_RAM_IMPL_HAS_SMEM_MASK)
>
> -#define R_TR_RAM_IMPL_RESET (BIT(0) | 0x9 << 8)
> +#define R_TR_RAM_IMPL_RESET (BIT(0) | 0x9 << 8 |
> R_TR_RAM_IMPL_HAS_SMEM_MASK)
> +
> +static uint64_t tr_ramsink_ctrl_set_hardwire_vals(uint64_t input)
> +{
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, ACTIVE, 1);
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, ENABLE, 1);
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, MODE, 1);
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, STOP_ON_WRAP, 0);
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, MEM_FORMAT, 0);
> +    input =3D FIELD_DP32(input, TR_RAM_CONTROL, ASYNC_FREQ, 0);
> +
> +    return input;
> +}
> +
> +static uint64_t tr_ramsink_ctrl_prew(RegisterInfo *reg, uint64_t val)
> +{
> +    val =3D tr_ramsink_ctrl_set_hardwire_vals(val);
> +
> +    return val;
> +}
>
>  static RegisterAccessInfo tr_ramsink_regs_info[] =3D {
>      {   .name =3D "TR_RAM_CONTROL", .addr =3D A_TR_RAM_CONTROL,
>          .rsvd =3D R_TR_RAM_CONTROL_RSVP_BITS,
>          .reset =3D R_TR_RAM_CONTROL_RESET,
>          .ro =3D R_TR_RAM_CONTROL_RO_BITS,
> +        .pre_write =3D tr_ramsink_ctrl_prew,
>      },
>      {   .name =3D "TR_RAM_IMPL", .addr =3D A_TR_RAM_IMPL,
>          .rsvd =3D R_TR_RAM_IMPL_RSVP_BITS,
> diff --git a/hw/riscv/trace-ram-sink.h b/hw/riscv/trace-ram-sink.h
> index 0a7225642c..e516b73e00 100644
> --- a/hw/riscv/trace-ram-sink.h
> +++ b/hw/riscv/trace-ram-sink.h
> @@ -28,6 +28,7 @@ REG32(TR_RAM_CONTROL, 0x0)
>      FIELD(TR_RAM_CONTROL, MODE, 4, 1)
>      FIELD(TR_RAM_CONTROL, STOP_ON_WRAP, 8, 1)
>      FIELD(TR_RAM_CONTROL, MEM_FORMAT, 9, 2)
> +    FIELD(TR_RAM_CONTROL, ASYNC_FREQ, 12, 3)
>      /* reserved bits */
>      FIELD(TR_RAM_CONTROL, RSVP1, 2, 1)
>      FIELD(TR_RAM_CONTROL, RSVP2, 5, 3)
>
> --
> 2.43.0
>
>
>

--000000000000d375f30660761b1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0- set trRamActive RO =3D 1 (always active)<br>
=C2=A0- set trRamEnable RO =3D 1 (always enabled)<br>
=C2=A0- set trRamMode RO =3D 1 (only SMEM mode)<br>
=C2=A0- set trRamStopOnWrap RO =3D 0 (not supported)<br>
=C2=A0- set trRamMemFormat RO =3D 0 (memory formatted as plain bytes)<br>
=C2=A0- set trRamAsyncFreq RO =3D 0 (alignment synchronization packets disa=
bled)<br>
=C2=A0- set trRamHasSMEM =3D 1 (RAM sink supports SMEM)<br>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/trace-ram-sink.c | 22 +++++++++++++++++++++-<br>
=C2=A0hw/riscv/trace-ram-sink.h |=C2=A0 1 +<br>
=C2=A02 files changed, 22 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/trace-ram-sink.c b/hw/riscv/trace-ram-sink.c<br>
index c273335fec..03ffa9caae 100644<br>
--- a/hw/riscv/trace-ram-sink.c<br>
+++ b/hw/riscv/trace-ram-sink.c<br>
@@ -40,13 +40,33 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_TR_RAM_IMPL_HAS_SRAM_MASK | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_TR_RAM_IMPL_HAS_SMEM_MASK)<br>
<br>
-#define R_TR_RAM_IMPL_RESET (BIT(0) | 0x9 &lt;&lt; 8)<br>
+#define R_TR_RAM_IMPL_RESET (BIT(0) | 0x9 &lt;&lt; 8 | R_TR_RAM_IMPL_HAS_S=
MEM_MASK)<br>
+<br>
+static uint64_t tr_ramsink_ctrl_set_hardwire_vals(uint64_t input)<br>
+{<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, ACTIVE, 1);<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, ENABLE, 1);<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, MODE, 1);<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, STOP_ON_WRAP, 0)=
;<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, MEM_FORMAT, 0);<=
br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_RAM_CONTROL, ASYNC_FREQ, 0);<=
br>
+<br>
+=C2=A0 =C2=A0 return input;<br>
+}<br>
+<br>
+static uint64_t tr_ramsink_ctrl_prew(RegisterInfo *reg, uint64_t val)<br>
+{<br>
+=C2=A0 =C2=A0 val =3D tr_ramsink_ctrl_set_hardwire_vals(val);<br>
+<br>
+=C2=A0 =C2=A0 return val;<br>
+}<br>
<br>
=C2=A0static RegisterAccessInfo tr_ramsink_regs_info[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0.name =3D &quot;TR_RAM_CONTROL&quot;, .ad=
dr =3D A_TR_RAM_CONTROL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.rsvd =3D R_TR_RAM_CONTROL_RSVP_BITS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.reset =3D R_TR_RAM_CONTROL_RESET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ro =3D R_TR_RAM_CONTROL_RO_BITS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pre_write =3D tr_ramsink_ctrl_prew,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0.name =3D &quot;TR_RAM_IMPL&quot;, .addr =
=3D A_TR_RAM_IMPL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.rsvd =3D R_TR_RAM_IMPL_RSVP_BITS,<br>
diff --git a/hw/riscv/trace-ram-sink.h b/hw/riscv/trace-ram-sink.h<br>
index 0a7225642c..e516b73e00 100644<br>
--- a/hw/riscv/trace-ram-sink.h<br>
+++ b/hw/riscv/trace-ram-sink.h<br>
@@ -28,6 +28,7 @@ REG32(TR_RAM_CONTROL, 0x0)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_CONTROL, MODE, 4, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_CONTROL, STOP_ON_WRAP, 8, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_CONTROL, MEM_FORMAT, 9, 2)<br>
+=C2=A0 =C2=A0 FIELD(TR_RAM_CONTROL, ASYNC_FREQ, 12, 3)<br>
=C2=A0 =C2=A0 =C2=A0/* reserved bits */<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_CONTROL, RSVP1, 2, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_CONTROL, RSVP2, 5, 3)<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--000000000000d375f30660761b1b--

