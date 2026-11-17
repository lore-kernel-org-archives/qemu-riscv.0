Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37076606A31C
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NS03S/gg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFmN-00089N-P5; Tue, 17 Nov 2026 04:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFmF-00087x-GQ
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:47:00 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFmD-0000WK-PD
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:46:59 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c4203bbb1e9so752239966b.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794908816; x=1795513616; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=n5XubskUMNo7AUg8d0Mo/LKqvRp5YGsYaCRYiE27W6o=;
 b=NS03S/gg9IqZsXfo03+6FiIdc4TsNIf4sT5Jd7X2dupLrtfTr+FfxFUo2/3Jxkbtbg
 aqx12zep+9Js6EtBCfY0BtuBcsLBwtwfCm1N+JJlOSdN18itgtIvMtfhHdyE1YSk8POb
 bnJtS6NxniCvqw0kVGMTM9+lUiZZ07JEN4iHEyMWyLC7k145Qgt0c/F/4oR7VQrpH6MY
 rE8Cb9ilfQgLJtS06s5O8iYjxpKLRCeDyH+x8ntCskicCG98LL4wfO66KO2fcAVXUBbw
 xGWk1tC+Iu50zFuhUSG0e6G65T74UAnx1QlELCQDeaoQvB1BgkqaW8YQsWGtc6PLWeQ4
 4EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794908816; x=1795513616;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=n5XubskUMNo7AUg8d0Mo/LKqvRp5YGsYaCRYiE27W6o=;
 b=OYlvR758tEH1wAu595oV5KPljcHeVnjueNKlrUq9rIgvzS0YvVv6ZugomkwB6jbbWU
 pf0VdMKMjCfT2L+0pz1y+2E1xs2SBhE+IKQ4UIDkEooSftu9PHDD5we6zAgAE/IewBR/
 CKD0759qQrA7rV9PdleMaD1Ob/SPGy6MbjyH23R4PlhWzy62IqtiHG5OV6RdTOzSJH3H
 2eNpBpoBq0mia1F8yWisNIrPnFtURfbrEP7D/XzTQkQpCfh9gLW5ia//xFo+JbRYHZiU
 Aj/dpqb9MhtPwJV5o2z3TltGecwvF6h8jjoNxh3uFQMcHVNfPdq3EXDCiPHUHtyUSMba
 HBIw==
X-Forwarded-Encrypted: i=1;
 AL+hErH37g0jobt7NxMK+g66iEmZ8VAQ05SBmCIqXOXocok6FII25z+CNoXEyyAqCqHNysSrfDBFSEbzndNF@nongnu.org
X-Gm-Message-State: APuU4Z8xBZpQ1ieK0D+69+ve5b2kdzTgg6h3k3D+uObWEweF9zE44tNG
 F9mNKVDJnde0BGyzzpUBVesguPLAqwNdKXXOCZ5kKemZUCNqkkAM4Wpkp7K35x2nRmOTc8rOKy4
 xRprK++bN5hFky7gcD8s/yvy2T4y7fR4gKVTdZSAsP2q14GWyMI+t3iaoCt7U6hrhr8D5DT0TXe
 BVYsGOTjcHhvMbZiJNe9qUp1ozWYKTLanemTFLEKwIMSE=
X-Gm-Gg: AYBFou3gXQ1v/V5fWqFWKEin0Ai9D7ks9+pZtU/jCJ69kJkiKqS7eivEG9kKRw/emCZ
 d6ZryxUIacOwoC2FgoBHnryZLvgYdObpM2hmzNaTgdlWmV2gptmD1i11a5y/AEtxNB81jNTc6Ca
 OyfBFISl2pYAr9kf0kg5G9aVfJ05yO669ButoZnKngeaGrnsR5OeY7kAmE/FM+8ejEDqogKPXqZ
 GwToY+I7mTN2+gYIfd2Lku92rV2PmfqCrsvAVCDxDXW0awuwSxHdihnRes0HGnQEk5aVMFs8aWb
 9y1sjQmR7AJPowx4lcWU3/P3rgA6zveuszQylK34/FytKbxuEUeJfgaaw5k6bUIQ3GhLwzJXQTa
 gQQpvpEGRGVgy2AJSGdywJfSOH1JigPO6V6YPBLAeuYSvsXCSim4Rbbz+txUVWQ00MzWygFqIob
 ECZ7w9HsKrfGCdclSokTugzaEwt2LyGcDmBIa94xAi8l9Rjlk/NZxLNPjR/PH0q4R4XuOYZexEU
 2v6XlpwOEdIg4GT2P6g+BaLX1dYx30lkasWZj4Dyctjk7VWe/HHdF7d0lXdgXHQsjyEXm8gqTNt
 yTCvn5sm/uGcB0xGiVWPsSxH0I37zrnlNKPEO0cKpF4eaaFuqms3ORcalCbsLBMWvyc=
X-Received: by 2002:a17:907:3e07:b0:c4d:4d5b:849b with SMTP id
 a640c23a62f3a-c50963408demr1181485366b.19.1794908815953; 
 Tue, 17 Nov 2026 01:46:55 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095a5c00fsm520809566b.3.2026.11.17.01.46.54
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:46:54 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6b547d6c07bso5902733a12.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErGbOyuZ+URn81vXOTwjogjt0CznRtJIpkNkE24NMU9X97VzO2ozVNyXY2jpTSGZ2bOrDs1Ku4UBVo9z@nongnu.org
X-Received: by 2002:a05:6402:a513:10b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b7c0891425mr7829110a12.5.1794908813794; Tue, 17 Nov 2026
 01:46:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-11-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-11-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:46:42 +0800
X-Gmail-Original-Message-ID: <CAMXXpfbkuD1f2xpqARBsMn1aozLWWzPjm0AgjGkhMDutGmrM2A@mail.gmail.com>
X-Gm-Features: AclHuK9IwHkVr6pd3OVhjDk3qCS0MOS6uxv_zmoQerlcRW-wc-ZQLY7_2TtFA_I
Message-ID: <CAMXXpfbkuD1f2xpqARBsMn1aozLWWzPjm0AgjGkhMDutGmrM2A@mail.gmail.com>
Subject: Re: [PATCH 11/13] hw/riscv/trace-encoder.c: add remaining fields to
 trace-encoder
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000402072066075c6a0"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000402072066075c6a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

> Add remaining unsupported register bits to trace-encoder as read-only zer=
o
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  hw/riscv/trace-encoder.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
> index c36d205f50..58ed4b2646 100644
> --- a/hw/riscv/trace-encoder.c
> +++ b/hw/riscv/trace-encoder.c
> @@ -68,6 +68,8 @@ REG32(TR_TE_CONTROL, 0x0)
>      FIELD(TR_TE_CONTROL, EMPTY, 3, 1)
>      FIELD(TR_TE_CONTROL, INST_MODE, 4, 3)
>      FIELD(TR_TE_CONTROL, CONTEXT, 9, 1)
> +    FIELD(TR_TE_CONTROL, INST_TRIG_ENABLE, 11, 1)
> +    FIELD(TR_TE_CONTROL, INST_STALL_OR_OVERFLOW, 12, 1)
>      FIELD(TR_TE_CONTROL, INST_STALL_ENA, 13, 1)
>      FIELD(TR_TE_CONTROL, INHIBIT_SRC, 15, 1)
>      FIELD(TR_TE_CONTROL, INST_SYNC_MODE, 16, 2)
> @@ -161,6 +163,8 @@ static uint64_t
> trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
>  {
>      input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_MODE, 0x6);
>      input =3D FIELD_DP32(input, TR_TE_CONTROL, CONTEXT, 0);
> +    input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_TRIG_ENABLE, 0);
> +    input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_OR_OVERFLOW, 0=
);
>      input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_ENA, 0);
>      input =3D FIELD_DP32(input, TR_TE_CONTROL, INHIBIT_SRC, 1);
>
>
> --
> 2.43.0
>
>
>

--000000000000402072066075c6a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd remaining unsupported register bits to trace-encoder as read-only zero<b=
r>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/trace-encoder.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c<br>
index c36d205f50..58ed4b2646 100644<br>
--- a/hw/riscv/trace-encoder.c<br>
+++ b/hw/riscv/trace-encoder.c<br>
@@ -68,6 +68,8 @@ REG32(TR_TE_CONTROL, 0x0)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, EMPTY, 3, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, INST_MODE, 4, 3)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, CONTEXT, 9, 1)<br>
+=C2=A0 =C2=A0 FIELD(TR_TE_CONTROL, INST_TRIG_ENABLE, 11, 1)<br>
+=C2=A0 =C2=A0 FIELD(TR_TE_CONTROL, INST_STALL_OR_OVERFLOW, 12, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, INST_STALL_ENA, 13, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, INHIBIT_SRC, 15, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, INST_SYNC_MODE, 16, 2)<br>
@@ -161,6 +163,8 @@ static uint64_t trencoder_te_ctrl_set_hardwire_vals(uin=
t64_t input)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_MODE, 0=
x6);<br>
=C2=A0 =C2=A0 =C2=A0input =3D FIELD_DP32(input, TR_TE_CONTROL, CONTEXT, 0);=
<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_TRIG_ENABLE,=
 0);<br>
+=C2=A0 =C2=A0 input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_OR_OVE=
RFLOW, 0);<br>
=C2=A0 =C2=A0 =C2=A0input =3D FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_E=
NA, 0);<br>
=C2=A0 =C2=A0 =C2=A0input =3D FIELD_DP32(input, TR_TE_CONTROL, INHIBIT_SRC,=
 1);<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--000000000000402072066075c6a0--

