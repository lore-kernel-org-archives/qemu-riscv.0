Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA3ACCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 02:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBOi0-0002Rc-5i; Tue, 21 Oct 2025 22:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOhx-0002RB-Uf
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:36:13 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOhv-0001qz-KJ
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:36:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b6271ea3a6fso4227289a12.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761100569; x=1761705369; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NbC/Dg6egHpHrsXeagZ1FMj4cmx4er7JR2DfdlsDB/w=;
 b=PBPK2o/Oo0eMtys3KWvriS4/hWi5t/pKFOtlyLlOTZy+w3LGP4TWElIfUP0omGJ2mE
 RuwuIyt4P05VV33WdjN4QgatOuVGFAG1SKQiN487qT9sEpLerDJ3aQEYE4FI+72EKyEl
 78OQd8RkuhaDCLHDbbjD3bYzi2706xxFt6xc3Or4Q5+XP4LoQXlL6dISufV/Y4v4+YXR
 8U+F5lQEN+3nerF6Tw6Np/I9vYIH7yZjlylIQfCkR2wUe++VmDx1SuPQ8kXYt4dhel/e
 oiA9osWWwsL2mSdCWYO9kzcTtmIZd/akT/eWtDvcc+lMiUNmR+B9QTaRa92/kbfYaVs0
 UGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100569; x=1761705369;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NbC/Dg6egHpHrsXeagZ1FMj4cmx4er7JR2DfdlsDB/w=;
 b=PoMbje1JZChBpYJ/a7kmLq5FMZJ+R343joXXqbWqbAx+DxqR+Y0pAcLqjgrJghVnM5
 5BCWo2o6CXN3R6yElJjlilqmpus9wFRU8B+BRrFo75904s5Fb4X0mssuZpkLj5B4UttS
 Syc6dtTHK4iySZwIVRBUT735fefXl0p+hj5C4l4ZkdtBR4OcB6AL3mj9JxbGq+9Jw3FV
 9WgpBqX4U60amESBWG2fCVf1fDH/srllR09IdHXJFd8lYat7bF+GL/kBPsCp38iN0Ic/
 ayK3ct7XojJvBe1ryfJd3CRtnaCJeVUioZw9s+eZGFi5SO+BuazCPA1Ie6zUkgomeEfr
 RO3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEgE/87L8ujpAKRmRqKDC+3pLuedKGpFqnee7kfjuCiZA9WKdXuo2lkCW2YyYE6++WKLVXPgVWU52X@nongnu.org
X-Gm-Message-State: AOJu0Ywx79RUVlOu9mQDCgNPfEwvFNRMh2dt7ZKlomvy2deQLC1Nf6fq
 sXsP9oNVGgy89oApCKaU52ig0P0GVpb7q9bZiSeoph51C+4qiKxO3scQR/tDrEf1B3Xfw9I2+Vn
 GV19lMBqOnezqeTMDT47Y4dAh+0BSaj9y0sOs/NrUaA==
X-Gm-Gg: ASbGncsdeswlYQ0g5pWKWDRHpV6s9v6sGO6pXnmGfEjP/FuS2EALhUVecmNCg67nWou
 7SaRVmOzy0fFo/p8GvaggiwGKHOAfyUVeqJrUb3E52ayQh+jC4QIq6GukOSe2OsivRXu043vDjB
 QFiPy345Wakx2bV3Ems4v/zopxzbpD1gjxMN+gVgYvZXFUkdIpzgUMgca10tmE+Lrc3DKk6mU5r
 7Eqe+MhylECdL2YNLOS9L7yR6nJs2Y3kd7P7+JZQbOx6mPMm6FEL/ER7AZ/ioc=
X-Google-Smtp-Source: AGHT+IHtf6EbA8qH6Nv7Z/MiKeW5tns03M+Bo8/g89qXcHRWuy10o0drAVo/DElWri9vGyH1Xuq6F6Spaxu8LWxTGAE=
X-Received: by 2002:a17:902:c950:b0:292:fc65:3584 with SMTP id
 d9443c01a7336-292fc6538acmr29816965ad.50.1761100569434; Tue, 21 Oct 2025
 19:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251022022628.41307-1-jay.chang@sifive.com>
 <20251022022628.41307-4-jay.chang@sifive.com>
In-Reply-To: <20251022022628.41307-4-jay.chang@sifive.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 22 Oct 2025 10:35:57 +0800
X-Gm-Features: AS18NWAqcIFfGg8-E53Sl1CUOD7Hxh-jewZ9WNVCnx6eRriPYYE6V2lxsN2SoHQ
Message-ID: <CACNNAjNkQssbwxwhnLjLQKQO=zaboEwnc=3aW4a98NqTvcANsg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Make PMP granularity configurable
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000daeafa0641b62dde"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=jay.chang@sifive.com; helo=mail-pg1-x530.google.com
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

--000000000000daeafa0641b62dde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the error version,  please ignore it.

Thanks & Regards

On Wed, Oct 22, 2025 at 10:26=E2=80=AFAM Jay Chang <jay.chang@sifive.com> w=
rote:

> This patch series enhances QEMU's RISC-V PMP support to conform with
> the RISC-V Privileged Specification regarding PMP granularity and WARL
> constraints.
>
> Previously, QEMU always used a fixed minimum PMP granularity of 4 bytes.
> This series introduces a configurable "pmp-granularity" parameter, allowi=
ng
> platforms to specify larger granularity values. In addition, the handling
> of
> pmpcfg and pmpaddr CSRs has been updated to follow WARL constraints. For
> example, when NA4 is not valid due to a larger granularity, it is silentl=
y
> ignored. TOR and NAPOT address ranges are also properly aligned according
> to
> the configured granularity.
>
> A new CPU parameter `pmp-granularity` is now available on the QEMU comman=
d
> line. For example:
>
>     -cpu rv64,g=3Dtrue,c=3Dtrue,pmp=3Dtrue,pmp-granularity=3D1024
>
> If not provided, the default remains 4 bytes.
>
> ---
>
> Patch summary:
>
> 1. target/riscv: Make PMP granularity configurable
>    - Introduce CPU property `pmp-granularity` for platforms to configure
>      PMP granularity.
>    - Default remains 4 bytes if unspecified.
>
> 2. target/riscv: Make PMP CSRs conform to WARL constraints
>    - Update pmpcfg and pmpaddr handling to follow WARL semantics.
>    - Align start and end addresses of TOR regions to PMP granularity.
>    - Ensure software can read back correct values per the spec.
>
> PATCH v2 update
> Change UL type to ULL to prevent bit-width errors.
>
> Jay Chang (2):
>   target/riscv: Make PMP granularity configurable
>   target/riscv: Make PMP CSRs conform to WARL constraints
>
>  target/riscv/cpu.c                | 39 ++++++++++++++++++++++++++
>  target/riscv/cpu.h                |  1 +
>  target/riscv/cpu_cfg_fields.h.inc |  1 +
>  target/riscv/pmp.c                | 46 +++++++++++++++++++++++++++++++
>  4 files changed, 87 insertions(+)
>
> --
> 2.48.1
>
>

--000000000000daeafa0641b62dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the error version,=C2=A0 please ignore it.=C2=A0=
<br><br>Thanks &amp; Regards</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 22, 2025 at 10:26=E2=80=AFAM Jay =
Chang &lt;<a href=3D"mailto:jay.chang@sifive.com" target=3D"_blank">jay.cha=
ng@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This patch series enhances QEMU&#39;s RISC-V PMP support to co=
nform with<br>
the RISC-V Privileged Specification regarding PMP granularity and WARL<br>
constraints.<br>
<br>
Previously, QEMU always used a fixed minimum PMP granularity of 4 bytes.<br=
>
This series introduces a configurable &quot;pmp-granularity&quot; parameter=
, allowing<br>
platforms to specify larger granularity values. In addition, the handling o=
f<br>
pmpcfg and pmpaddr CSRs has been updated to follow WARL constraints. For<br=
>
example, when NA4 is not valid due to a larger granularity, it is silently<=
br>
ignored. TOR and NAPOT address ranges are also properly aligned according t=
o<br>
the configured granularity.<br>
<br>
A new CPU parameter `pmp-granularity` is now available on the QEMU command<=
br>
line. For example:<br>
<br>
=C2=A0 =C2=A0 -cpu rv64,g=3Dtrue,c=3Dtrue,pmp=3Dtrue,pmp-granularity=3D1024=
<br>
<br>
If not provided, the default remains 4 bytes.<br>
<br>
---<br>
<br>
Patch summary:<br>
<br>
1. target/riscv: Make PMP granularity configurable<br>
=C2=A0 =C2=A0- Introduce CPU property `pmp-granularity` for platforms to co=
nfigure<br>
=C2=A0 =C2=A0 =C2=A0PMP granularity.<br>
=C2=A0 =C2=A0- Default remains 4 bytes if unspecified.<br>
<br>
2. target/riscv: Make PMP CSRs conform to WARL constraints<br>
=C2=A0 =C2=A0- Update pmpcfg and pmpaddr handling to follow WARL semantics.=
<br>
=C2=A0 =C2=A0- Align start and end addresses of TOR regions to PMP granular=
ity.<br>
=C2=A0 =C2=A0- Ensure software can read back correct values per the spec.<b=
r>
<br>
PATCH v2 update<br>
Change UL type to ULL to prevent bit-width errors.<br>
<br>
Jay Chang (2):<br>
=C2=A0 target/riscv: Make PMP granularity configurable<br>
=C2=A0 target/riscv: Make PMP CSRs conform to WARL constraints<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 ++++++++++++++++++++++++++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A0target/riscv/cpu_cfg_fields.h.inc |=C2=A0 1 +<br>
=C2=A0target/riscv/pmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 46 +++++++++++++++++++++++++++++++<br>
=C2=A04 files changed, 87 insertions(+)<br>
<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div>

--000000000000daeafa0641b62dde--

