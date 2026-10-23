Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28A606A320
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=b1SMyCxk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKCpG-0006GM-0h; Fri, 23 Oct 2026 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xKCpE-0006Fw-6P
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 06:48:40 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xKCpC-00085U-I1
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 06:48:39 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso116840066b.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1792752516; x=1793357316; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GOL5cZuTt/MBKBHB8JFSxAemcVtQtS8v4xrphYk6+sM=;
 b=b1SMyCxkX5kLcWGfvhxsgdlAbBKsmX+WmSZnu+yw1EvBh9SzON60AX/cIRfRg30HLq
 WOhQfguiwW5L/LUGpcMHPMzxXTU8AdieN4qTJhvfYiFasohE5Uq6WSg9f25wclT9JmLw
 1VoFLF3L5RjeOCTuaBvmP2fjzJEUdZygs8IMkG/xl9fGSchj1PcJN4/YHI0Qyy2IEGAt
 q3s7jnAGVyojeOm//lfVlh7S8v6C1JYzZ5ke38D1ZubDlI8OaZN7CNseuDFPAIrc48vY
 ZZqugATWOQNupFBz/Fjsw6uGRoasajanxmYnaaxhyoyMYKkX5GBOGiR2r89/PydrG09r
 ONyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792752516; x=1793357316;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GOL5cZuTt/MBKBHB8JFSxAemcVtQtS8v4xrphYk6+sM=;
 b=qyCp+YHMR8dJNYyX4LECcHe+UF/FVr/nmCkXTuz8nBRRY0rZ6+Mts8Cj9O7+zOR0s9
 Y5WpouShdOrF9xb7wL+FDTpswdi/fWBwwZS7/YryK3iDQ3YUXkKCCSZkKakWRPKl5az/
 +OzBq8Ux+CLdufJDSq/7PvoWFnvV4wSJ+rsfKY8hEnEimilYCWOZhnuPdTdoc87aXP3a
 k2SGIJ7Y4nQxWB1nWlZM/DQCQS63Ik+O9yiMFeJ5OR9ooFIjFD/F/BAQdzBNAcd0iR40
 sTZtVMKU9aDU5z/ztZwGKyYF+2Wmb3PvjMmIkJlVA6+DnblIBnunXH5ez8pyqpqqp5lM
 oDkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxduLl0kR40HjkLe/J03cqP6dfkVNp4PpNSE7seOi/u+74nrlA+guvorcQBITqvfncpTEdrr3/e22Lj@nongnu.org
X-Gm-Message-State: AFq9FYLgmeglTX8qFSypJLRpqdJ0cvMXQWw9HVtZjHk+ecsZDoNEZYxO
 SzBf9dEp2cq2xwyLecLAPTn6FntsC53azDdwuRNHPMqY0n3RDCLtiqmaLwzrW6l7g2/RqN4z4Wf
 89AyiPS896dbjIY1VWZzEC/YX0nKm6XNtMBkZLvlo3LZz+Uri7/bQyD87mlqRi05+aNrz6A/AcV
 1xDplxLBI4olec9yCeJ5pYexa3EiCz6VS69zKvEX1SaOI=
X-Gm-Gg: AYBFou0enYPa+oV3pb43NOmAmCLIvzES4AV6fslnSI73tyVLF7ChswaAngOkO0+oTJa
 iOgICO+jR/LyVXXAGq/b6TAYHlPJAGpwwSy+lf5PKyOW8wEbghggCOOuRsG9oA5T6seccj/p8je
 d5EHPWE9SLSDs3VFaMl5+vTztTgfxm6slvixPHNYKSOLlo5rS6sgkfT7ycX0XsmX9xCZ2UWs2CX
 LRlLgpnpgmFhtbnTnCRYN/mBafTUhYPKdsqk2V81CNAYcts9jbRiuSBXToMlv/hr/jaBn+sRxB0
 HTDf7pvLTNyiezdAzDcXCeIDo9uQW5nLZzBd2BQQCVW8hTqfz1UfEgIKQp3kYPZvvv9drOEEghs
 A25Bx8fmYbpAtLdQwxPa7rwDPIDqUvBP9WZbYDfBlwng3XAgckEFlQaBTvqkG52z4C8J9zn98iE
 NksEdYKMv4xw8jHV3xF0n6O74kBVKWahvnLcD4qkxqXLekqRua78pAVKzlyhkeDR/6rp1osifqU
 Bgynx4XhXJXbV5eEmxH383ktLInTmDOGkEvLRHkNK1hF6j4kWjf9QSLhv/wqatK5aqclJdZITRa
 tNVvwb5hQ8S/+fa03Q==
X-Received: by 2002:a17:907:da7:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c46a9008aefmr279367366b.4.1792752516411; 
 Fri, 23 Oct 2026 03:48:36 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46a5ceaf0dsm89513466b.72.2026.10.23.03.48.34
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 03:48:35 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c3f8d72d7ceso107234166b.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 03:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzrbjdMFedtEukkCEOe+VQmv/AHZnejp20HysBw6ioT4h6mFvXBzKXZS0L/9Qa3HDQxZB1Jjv7G5HaI@nongnu.org
X-Received: by 2002:a17:907:60cb:b0:c41:5a0e:3356 with SMTP id
 a640c23a62f3a-c46a946bc33mr257510266b.41.1792752514283; Fri, 23 Oct 2026
 03:48:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-2-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Fri, 23 Oct 2026 18:48:22 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZoU2jU2y=SWdjk3jWNZ6qiSaRvsdQ+_es3YFRL0h+K2A@mail.gmail.com>
X-Gm-Features: AclHuK9m5snQAdLRdRHa6ofxtGV0xwnXiWQ-k7MsoLeFNrXKhgT8sGBBwkhRyoQ
Message-ID: <CAMXXpfZoU2jU2y=SWdjk3jWNZ6qiSaRvsdQ+_es3YFRL0h+K2A@mail.gmail.com>
Subject: Re: [PATCH v4 01/18] hw/riscv: Trace Encoder initial impl
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000c8c0b9065e7fb8ae"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x632.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000c8c0b9065e7fb8ae
Content-Type: text/plain; charset="UTF-8"

>
> +#include "hw/core/sysbus.h"
> +#include "hw/core/register.h"
> +#include "system/dma.h"
> +#include "qom/object.h"
> +#include "cpu.h"
> +
> +#define TRACE_R_MAX (0xFFF / 4)
>

The Trace Control Interface register map covers offsets 0x000 through 0xFFF,
i.e. a 4-KiB window. Here 0xFFF / 4 evaluates to 1023,
which is the last valid index, not the number of 32-bit entries.
Since TRACE_R_MAX is later used as the default reg-mem-size via TRACE_R_MAX
* 4, the default MMIO region is only 0xFFC bytes long.
It therefore covers offsets 0x000 through 0xFFB, leaving the final word at
0xFFC through 0xFFF outside the region.

Thanks
Jay Chang

--000000000000c8c0b9065e7fb8ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+#include &quot;hw/core/sysbus.h&q=
uot;<br>
+#include &quot;hw/core/register.h&quot;<br>
+#include &quot;system/dma.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+<br>
+#define TRACE_R_MAX (0xFFF / 4)<br></blockquote><div><br></div><div><span =
style=3D"background-color:transparent">The Trace Control Interface register=
 map covers offsets </span><code style=3D"background-color:transparent">0x0=
00</code><span style=3D"background-color:transparent"> through </span><code=
 style=3D"background-color:transparent">0xFFF</code><span style=3D"backgrou=
nd-color:transparent">, i.e. a 4-KiB window. Here </span><code style=3D"bac=
kground-color:transparent">0xFFF / 4</code><span style=3D"background-color:=
transparent"> evaluates to 1023,</span></div><div><span style=3D"background=
-color:transparent">which is the last valid index, not the number of 32-bit=
 entries.</span></div><div><span style=3D"background-color:transparent">Sin=
ce </span><code style=3D"background-color:transparent">TRACE_R_MAX</code><s=
pan style=3D"background-color:transparent"> is later used as the default </=
span><code style=3D"background-color:transparent">reg-mem-size</code><span =
style=3D"background-color:transparent"> via </span><code style=3D"backgroun=
d-color:transparent">TRACE_R_MAX * 4</code><span style=3D"background-color:=
transparent">, the default MMIO region is only </span><code style=3D"backgr=
ound-color:transparent">0xFFC</code><span style=3D"background-color:transpa=
rent"> bytes long.</span></div><div><span style=3D"background-color:transpa=
rent">It therefore covers offsets </span><code style=3D"background-color:tr=
ansparent">0x000</code><span style=3D"background-color:transparent"> throug=
h </span><code style=3D"background-color:transparent">0xFFB</code><span sty=
le=3D"background-color:transparent">, leaving the final word at </span><cod=
e style=3D"background-color:transparent">0xFFC</code><span style=3D"backgro=
und-color:transparent"> through </span><code style=3D"background-color:tran=
sparent">0xFFF</code><span style=3D"background-color:transparent"> outside =
the region.</span>=C2=A0<br><br>Thanks<br>Jay Chang</div></div></div>

--000000000000c8c0b9065e7fb8ae--

