Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11B3C25B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:00:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s79Vf-0002uH-3g; Wed, 15 May 2024 03:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79VA-0002D1-8G
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 03:56:44 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79V8-0003OQ-7e
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 03:56:39 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4df29c84f60so3596668e0c.1
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715759797; x=1716364597; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lbH8/dOJ5y301ZXpd3v1qvIMj+WH+2byIFwiJYYUSck=;
 b=NVwjIZN87bY4c2lfl6qetRgiGzBICIBQUKteDjTlRxnttXnKOaAWRJcm8q9jkqqPnR
 HQP998r0lKqyV9ZQJVpxUK66+XTNk7/q91/4FB6BKdztEGDJFEi0gfnbPHVWGx9itW0X
 lh8LkUHfvypH3wrrUAXe7QWzpGHtEvmFn2cKlWEWsOxZWRk327v8JzrSu0sQ1mbJsgCJ
 XmWae5G4a3Yu2qaRHq3KV1J3EjnUj2EzxcW3/ylpRwDiZYL47EqWjsszuCaX6gomqzKz
 /lgVvD9cjp/DyxX5fj7rhLcSXmBWkDwJOUuf/W7KkwgQSf+NWhRU8t6p7NCTjmbPXFZs
 3qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715759797; x=1716364597;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lbH8/dOJ5y301ZXpd3v1qvIMj+WH+2byIFwiJYYUSck=;
 b=lSTsOnh8YLCCGnAfoCv/WImWolp3h07idu9hqny4hwLCJMgD+DxQ786x2BPU4wKMNi
 9xF43c6EsgKIN6KKsHq7BOB9J2vxyGbt/C+qWYqU9q1gb0kTdHTK8/9LPNumFBJdwkYU
 QYRI7Ygq5FMNhf7W4pf/TXUZj+vii4I9cqQMP8J8SRX0UB1b6N9oKkFZxo+vf5WMfGVi
 XDdKvx554erJfCZcDtjXIW9R+W7n9CttvfQKspOSwaJSyLCkaUKBivYI8oO8q0Xc9y1i
 SrPHrz2MenwZx5jL5pkL+xjLnECgXge45baPBaK22M28HRnUPFSB47qFj0MVAEqW3sDb
 1OZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNV4ISLrjWdpyGvjqNvB/zlBRGVliDmgOtILSEU2ZgSDv1HnPE/8qJrYB34KOOG5SfyzWcXtdX5Hs9be9MHfaSf093/+c=
X-Gm-Message-State: AOJu0Yw1BeXIsfvFXj7dSZj52hGEOcC3jbC6m6PERzcuoObGN3oxfM+v
 Oo0fLktfNYlV5aaLmsfQ/hnQ7WL8CW3RhB6qWcpYvJbK1JrIOsE/z1GLVKPHxXz2VGbfjf/Ae+/
 x1xOJCSMjj/Gt54sOo0ZyTf+LHtP3WH7Nq6YSx3xMgrugQmUU
X-Google-Smtp-Source: AGHT+IEyI42oQZF13xkANaE/H0dTJFYwPyHXGI0WO1/f+K4RCRQA/UKm/68rQ190fhsIp/m6p//4A07hq39KZx1OBHU=
X-Received: by 2002:a05:6122:178f:b0:4d4:4ff8:c367 with SMTP id
 71dfb90a1353d-4df883697f1mr11977813e0c.6.1715759795979; Wed, 15 May 2024
 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240515075340.2675136-1-fea.wang@sifive.com>
In-Reply-To: <20240515075340.2675136-1-fea.wang@sifive.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Wed, 15 May 2024 15:56:24 +0800
Message-ID: <CAKhCfseSAZmg++fW6TbZfFXP80HXs5A-XY7OS2HTTSUzt-7woA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] target/riscv: Support RISC-V privilege 1.13 spec
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000028dc5706187975f8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=fea.wang@sifive.com; helo=mail-vk1-xa33.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000028dc5706187975f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry that I only put the patch version on the cover letter.
I will resend the patches.

Sincerely,
Fea

Fea.Wang <fea.wang@sifive.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8815=E6=97=A5=
 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A

> Based on the change log for the RISC-V privilege 1.13 spec, add the
> support for ss1p13.
>
> Ref:
> https://github.com/riscv/riscv-isa-manual/blob/a7d93c9/src/priv-preface.a=
doc?plain=3D1#L40-L72
>
> Lists what to do without clarification or document format.
> * Redefined misa.MXL to be read-only, making MXLEN a constant.(Skip,
> implementation ignored)
> * Added the constraint that SXLEN=E2=89=A5UXLEN.(Skip, implementation ign=
ored)
> * Defined the misa.V field to reflect that the V extension has been
> implemented.(Skip, existed)
> * Defined the RV32-only medelegh and hedelegh CSRs.(Done in these patches=
)
> * Defined the misaligned atomicity granule PMA, superseding the proposed
> Zam extension..(Skip, implementation ignored)
> * Allocated interrupt 13 for Sscofpmf LCOFI interrupt.(Skip, existed)
> * Defined hardware error and software check exception codes.(Done in thes=
e
> patches)
> * Specified synchronization requirements when changing the PBMTE fields i=
n
> menvcfg and henvcfg.(Skip, implementation ignored)
> * Incorporated Svade and Svadu extension specifications.(Skip, existed)
>
>
> Fea.Wang (4):
>   target/riscv: Support the version for ss1p13
>   target/riscv: Add 'P1P13' bit in SMSTATEEN0
>   target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32
>   target/riscv: Reserve exception codes for sw-check and hw-err
>
> Jim Shu (1):
>   target/riscv: Reuse the conversion function of priv_spec
>
>  target/riscv/cpu.c         |  8 ++++++--
>  target/riscv/cpu.h         |  5 ++++-
>  target/riscv/cpu_bits.h    |  5 +++++
>  target/riscv/cpu_cfg.h     |  1 +
>  target/riscv/csr.c         | 39 ++++++++++++++++++++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c | 17 ++++++++---------
>  6 files changed, 63 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>
>

--00000000000028dc5706187975f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry that I only put the patch version on the cover lette=
r.<br>I will resend the patches.<div><br></div><div>Sincerely,</div><div>Fe=
a</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com">fea.wang@sifive.=
com</a>&gt; =E6=96=BC 2024=E5=B9=B45=E6=9C=8815=E6=97=A5 =E9=80=B1=E4=B8=89=
 =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Based on the change log for the RISC-V p=
rivilege 1.13 spec, add the<br>
support for ss1p13.<br>
<br>
Ref:<a href=3D"https://github.com/riscv/riscv-isa-manual/blob/a7d93c9/src/p=
riv-preface.adoc?plain=3D1#L40-L72" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/riscv/riscv-isa-manual/blob/a7d93c9/src/priv-preface.adoc?=
plain=3D1#L40-L72</a><br>
<br>
Lists what to do without clarification or document format.<br>
* Redefined misa.MXL to be read-only, making MXLEN a constant.(Skip, implem=
entation ignored)<br>
* Added the constraint that SXLEN=E2=89=A5UXLEN.(Skip, implementation ignor=
ed)<br>
* Defined the misa.V field to reflect that the V extension has been impleme=
nted.(Skip, existed) <br>
* Defined the RV32-only medelegh and hedelegh CSRs.(Done in these patches)<=
br>
* Defined the misaligned atomicity granule PMA, superseding the proposed Za=
m extension..(Skip, implementation ignored)<br>
* Allocated interrupt 13 for Sscofpmf LCOFI interrupt.(Skip, existed) <br>
* Defined hardware error and software check exception codes.(Done in these =
patches)<br>
* Specified synchronization requirements when changing the PBMTE fields in =
menvcfg and henvcfg.(Skip, implementation ignored)<br>
* Incorporated Svade and Svadu extension specifications.(Skip, existed) <br=
>
<br>
<br>
Fea.Wang (4):<br>
=C2=A0 target/riscv: Support the version for ss1p13<br>
=C2=A0 target/riscv: Add &#39;P1P13&#39; bit in SMSTATEEN0<br>
=C2=A0 target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32<br>
=C2=A0 target/riscv: Reserve exception codes for sw-check and hw-err<br>
<br>
Jim Shu (1):<br>
=C2=A0 target/riscv: Reuse the conversion function of priv_spec<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++-=
-<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++-<b=
r>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0target/riscv/cpu_cfg.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 ++++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0target/riscv/tcg/tcg-cpu.c | 17 ++++++++---------<br>
=C2=A06 files changed, 63 insertions(+), 12 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000028dc5706187975f8--

