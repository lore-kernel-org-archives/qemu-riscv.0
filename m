Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3AEC35FFC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 17:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tux4w-00020G-Ok; Wed, 19 Mar 2025 13:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tux4r-0001ts-UQ
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 13:19:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tux4o-0006NQ-EA
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 13:19:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso12164086a12.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742404772; x=1743009572; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9SRSY3jrkOn9x5eeoNPjo/upYoDQHJ3GIjwfWH+DP0s=;
 b=dTJjnzUKMbEjJDOL/5XVYZb7zwNZUdOLFHtdH17Yfo3efV9R0OAHLkSuYFA3hzwioT
 EgVw8hgEYWvjdPrqOtP0l5FxvxC6yNECFx0pVfbX4gjKiJHS/Q5nBxYTI9nY9nCr5Y4d
 w9ET1h0A/W73HmBhNW35n+Elr3uyijOXUkXwiuJKjK1frhCWHew20OX5L+iV7PaPOEIZ
 thmHCKBPQ0XgMnQdxATtF/+PicOvX5/Zqm53Hu/4tBJi6ADD7tKYcWAJRrPMAyWJmdjT
 psqg5JGmSnClmf+eh/6Db0j8PkYVeF66TFs2vGeYJ1VEV8WLNLX7gHNahpdqgVZNsomY
 lzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742404772; x=1743009572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SRSY3jrkOn9x5eeoNPjo/upYoDQHJ3GIjwfWH+DP0s=;
 b=kX3Bne2SN9aBlIzFOLYo6hQ7PGZG7Uqj3w1cNGWl1lYDg0y94mFt0xffKJTQ6ij/48
 wiDpWiYskIHoisjxUcKBQZ0lFhMh4Mj2bqJtt9PBM6R6j/sIxoGO/y6Sn9LWNnYqdhMa
 qJwvjSGjBYMx12jMlFUDqPUuYdTo23DM3eknQb3SC1oR4qr8wqiy0IMV5bHfVJ1rn/6M
 pRjK/BvoHDdaYR7MCoTJ/yPHDwOteaVJMXRM5JuFphr4LIOYQeG+Mcdu7ymGzdKbG+ro
 vbOZWj5KpGUWkTV3TGTM/sQvmxb465tVx01BSuWCnErk/+BJ+T53+k3fZNrt6xRnZ0nZ
 gwXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaKaWI6qtl62dRxyZaKaNcAmyl6qOAjLkuCqubwT4waw+5Ri/pc29jt8QM/xwTeCfs3WM1hoo9CXn5@nongnu.org
X-Gm-Message-State: AOJu0Yzu3yh1c3qJqi5S75od9gMNfBrHQ54+aRdvO/oIt4imVLtEirbw
 9iW8iwJZJR9QLIuYdm5I+8rI0WTG604GWqnwCHLtUIoEt7KdYF6haOtNH4Z/xnFsff1f84NgzuS
 AS5odyiEAl7mRVtCt544ubXSIa8BnwZmP1vewOw==
X-Gm-Gg: ASbGncvilfw25WcanftVSNy27R3rirwuL0Jepb2g92/awdk3dNLfJCKPjKkKyYrxxAw
 lebyWyAKmVvpNGuzFnPdeygYDGSMgMX3JFhZtD/ulGo6NkDhw06muxWpA4lE5ls/hnt7Zr5EB5C
 wNLvvuCrC5/15zHCapsWBLyno=
X-Google-Smtp-Source: AGHT+IF0AuiGxOMy/h0eJcb4T+DuMx0aJ4k42YEfNE3byNW8+5u9n4tY0OXPrxsmAHQ+wmWfYqtv6B8Im27SFFp8X7A=
X-Received: by 2002:a05:6402:26d4:b0:5e0:8937:6ef2 with SMTP id
 4fb4d7f45d1cf-5eb80d0ef20mr4021495a12.8.1742404771528; Wed, 19 Mar 2025
 10:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250307203952.13871-1-jason.chien@sifive.com>
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Thu, 20 Mar 2025 01:19:18 +0800
X-Gm-Features: AQ5f1JqZAlTLGxIqrg1Xli1h2HIPrLWalQEsGwmyMEFt4ifDschwS-jD0ovIUhs
Message-ID: <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007667080630b53981"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jason.chien@sifive.com; helo=mail-ed1-x52b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000007667080630b53981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

Jason Chien <jason.chien@sifive.com> =E6=96=BC 2025=E5=B9=B43=E6=9C=888=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A

> The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI host=
s
> also utilize it to implement their ATUs, preventing coexistence with
> IOMMUs.
> Overwriting a PCI host=E2=80=99s PCIIOMMUOps disrupts its translation rul=
es.
>
> This patch series introduces a mechanism to route inbound transactions fr=
om
> PCI hosts to the IOMMU, enabling proper integration.
>
> The final patch depends on another patch series:
> https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html
>
> Jason Chien (4):
>   include/hw/pci: Introduce a callback to set the downstream mr of PCI
>     hosts
>   hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
>     integration
>   hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
>   hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs
>
>  hw/pci-host/designware.c         | 18 +++++++++++++++---
>  hw/pci/pci.c                     |  8 ++++++++
>  hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
>  include/hw/pci-host/designware.h |  2 ++
>  include/hw/pci/pci.h             | 21 +++++++++++++++++++++
>  5 files changed, 56 insertions(+), 8 deletions(-)
>
> --
> 2.43.2
>
>

--0000000000007667080630b53981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Jason Chien &lt;<a href=3D"mailt=
o:jason.chien@sifive.com">jason.chien@sifive.com</a>&gt; =E6=96=BC 2025=E5=
=B9=B43=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:40=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI =
hosts<br>
also utilize it to implement their ATUs, preventing coexistence with IOMMUs=
.<br>
Overwriting a PCI host=E2=80=99s PCIIOMMUOps disrupts its translation rules=
.<br>
<br>
This patch series introduces a mechanism to route inbound transactions from=
<br>
PCI hosts to the IOMMU, enabling proper integration.<br>
<br>
The final patch depends on another patch series:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg0000=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-riscv/2025-03/msg00003.html</a><br>
<br>
Jason Chien (4):<br>
=C2=A0 include/hw/pci: Introduce a callback to set the downstream mr of PCI=
<br>
=C2=A0 =C2=A0 hosts<br>
=C2=A0 hw/pci: Introduce an API to set PCI host downstream mr for IOMMU<br>
=C2=A0 =C2=A0 integration<br>
=C2=A0 hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()<br=
>
=C2=A0 hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATU=
s<br>
<br>
=C2=A0hw/pci-host/designware.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++=
+++++++++---<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0hw/riscv/riscv-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +=
+++++++++-----<br>
=C2=A0include/hw/pci-host/designware.h |=C2=A0 2 ++<br>
=C2=A0include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 21 +++++++++++++++++++++<br>
=C2=A05 files changed, 56 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--0000000000007667080630b53981--

