Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D60CA0FED
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 09:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuSL1-000601-42; Fri, 05 Sep 2025 05:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uuSKz-0005wz-Ls
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 05:02:29 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uuSKo-0005Ar-I4
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 05:02:27 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-74381e207a0so1462989a34.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Sep 2025 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757062934; x=1757667734; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ce9aRh4vsKWroT5mV5jGSfybTzO3OJePW9XqpwOKz0=;
 b=J2Cs0ronVB01efLctuLObigM1ebIXNeD49liWHcxKrEF05wgkUptHsWUEukJAFPWpk
 Sd81/rGVMmURo7ghcQLDdyEq77394H3vFVQ7txd2JKffa92lrnrDlfgAbtifa8XhTd3G
 e3LA8ErOS6rFz6YecgU/Ejio+sTpvqRRvAsEba7vrPkv0doNNw4r0jnnnaOrQlj2MreQ
 wN1dtTQWHklQkbSk/eBSStW8zvipT0z5bAR9txLOBoJtA/WQiBvxGrdNGGeHQcuFKxOX
 muqAyrrZdsmfDa+OZwiaTRsP7MBUm7o/4nqUnKlKfFMzVab/xwfzfPkEC19La7jt1SXi
 3VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757062934; x=1757667734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Ce9aRh4vsKWroT5mV5jGSfybTzO3OJePW9XqpwOKz0=;
 b=ifbBMyElZCTnlbn+8DUoauHlUYTk8vUJThGKMBhcm+q3OUxjv9FcxTZ12j7gDXXvlE
 3Sd6DQ2D8npxpuo6aOb3G5b/iZ0oP9P2KU4Z/+UwEpjy4378EyBlIEE6xYV6L+RhBSRF
 eRTDEubOjGZLly8+H69CXz8n5s2NDr7Gy5+kSi4XjuLhA7JswCvxCb5StfXYrPSmrz0I
 /7chFgRMkMl1B/mYt+1yxXmmlY/F/HQF3ObvCMU5NMKvG6KX6Z7d8OZ/6gQYDmhMd5Ae
 nYYuM3Mf9IBwEpYbG6iCppgydZRxMc8Z1HyBSvam9PmZa4R8H6UKge1vepo6Ku63VHcH
 5vgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsoBFSPtpxq2BdFDOCype7tkrNg4eSrr+b/9sN6rwugi0P/V0C0Y72wXVG8VcFTpZ0vnZz+C/AH8WW@nongnu.org
X-Gm-Message-State: AOJu0Yzg2uvSHHyqXzzMIQyQX6RpPRdDJV2vP7abIge227Efhz5rk8Ib
 FTOXgw/iXxsXcr9FdWJPl93EuIsr+h1XVHbIfLSKIU+CIDqs3AyA3/RhRyyvOZhSbSvu8b626dk
 NkgEr3iizT/aVrCv1+oYeBpktZc6GQAx4w3Gujl5XqA==
X-Gm-Gg: ASbGnctm8NyicJmMeBQxlojrQ9XjICsNkAV/qPMhgSynoW8U/7YMb/vcManuQSq/qB3
 /CiknEfLoeFAvYuClddE6X4qsFb9otd+A6GdWoMaALui5QsVUZigK/p0lUm7apOR7f9ENbLlRQe
 dm/ANCRgA7pJvdn0AUyOKuw9M6DcP6ASUECh7QFKHmxmq2yvCipPYaAKkuWFryv2WM40GqoNCxT
 JQM1ULFKCMf8PvxGqw=
X-Google-Smtp-Source: AGHT+IERucbWGI/cplq0L5ncWMX6UDYo1kzLTg77oEwWIxpZvC77P9+GeASYnYs5UNyEEcKSc3VWoTb2IHOccU7NRfQ=
X-Received: by 2002:a05:6808:d4c:b0:439:acee:9a77 with SMTP id
 5614622812f47-439aceea5c3mr1922222b6e.37.1757062934047; Fri, 05 Sep 2025
 02:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250903140308.1705751-1-max.chou@sifive.com>
 <20250903140308.1705751-2-max.chou@sifive.com>
 <da524d10-fee5-45f2-ba9e-23f66a754e9b@ventanamicro.com>
In-Reply-To: <da524d10-fee5-45f2-ba9e-23f66a754e9b@ventanamicro.com>
From: Max Chou <max.chou@sifive.com>
Date: Fri, 5 Sep 2025 18:02:02 +0900
X-Gm-Features: Ac12FXwQN4Z-JgbvMZvY_SikSy21Oz_Zk3UPc8TpwKNTNXZXd5rQhf5mwbObHek
Message-ID: <CANiaA1vs9Z9FHj8u8HLzb_gpTiSorG5FkYdS0ep9cDa4ER9HRA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] target/riscv: Add Zvqdotq cfg property
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="000000000000084281063e0a18e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=max.chou@sifive.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

--000000000000084281063e0a18e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 7:14=E2=80=AFPM Daniel Henrique Barboza <
dbarboza@ventanamicro.com> wrote:

>
>
> On 9/3/25 11:03 AM, Max Chou wrote:
> > The Zvqdotq extension is the vector dot-product extension of RISC-V.
> >
> > Signed-off-by: Max Chou <max.chou@sifive.com>
> > ---
> >   target/riscv/cpu.c                | 1 +
> >   target/riscv/cpu_cfg_fields.h.inc | 1 +
> >   target/riscv/tcg/tcg-cpu.c        | 5 +++++
> >   3 files changed, 7 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d055ddf462..95edd02e68 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >       ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
> >       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
> >       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
> > +    ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_12_0, ext_zvqdotq),
>
> Is this really 1.12? If it's marked as experimental I would expect it be =
a
> new
> extension, e.g. 1.13.
>
>
> Thanks,
>
> Daniel
>

Thanks for pointing out this part. I=E2=80=99ll update v4 for this.

Thanks,
Max

--000000000000084281063e0a18e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Thu, Sep 4, 2025 at 7:14=E2=80=AF=
PM Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventanamicro.com"=
>dbarboza@ventanamicro.com</a>&gt; wrote:<br></div></div><div class=3D"gmai=
l_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On 9/3/25 11:03 AM, Max Chou wrote:<br>
&gt; The Zvqdotq extension is the vector dot-product extension of RISC-V.<b=
r>
&gt; <br>
&gt; Signed-off-by: Max Chou &lt;<a href=3D"mailto:max.chou@sifive.com" tar=
get=3D"_blank">max.chou@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_cfg_fields.h.inc | 1 +<br>
&gt;=C2=A0 =C2=A0target/riscv/tcg/tcg-cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 =
+++++<br>
&gt;=C2=A0 =C2=A03 files changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index d055ddf462..95edd02e68 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_=
0, ext_zvksg),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_=
0, ext_zvksh),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0=
, ext_zvkt),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_12_0, ext_zv=
qdotq),<br>
<br>
Is this really 1.12? If it&#39;s marked as experimental I would expect it b=
e a new<br>
extension, e.g. 1.13.<br>
<br>
<br>
Thanks,<br>
<br>
Daniel<br></blockquote><div><br></div><div>Thanks for pointing out this par=
t. I=E2=80=99ll update v4 for this.</div><div><br></div><div>Thanks,</div><=
div>Max=C2=A0</div></div></div>

--000000000000084281063e0a18e7--

