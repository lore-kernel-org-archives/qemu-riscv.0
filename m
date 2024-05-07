Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF360C10F1A
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s4Msc-0006wP-89; Tue, 07 May 2024 11:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4Msa-0006vA-Cf
 for qemu-riscv@nongnu.org; Tue, 07 May 2024 11:37:20 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4MsY-0006nt-Or
 for qemu-riscv@nongnu.org; Tue, 07 May 2024 11:37:20 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51ffff16400so4717181e87.2
 for <qemu-riscv@nongnu.org>; Tue, 07 May 2024 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715096237; x=1715701037; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgoV9bukd4nP3pnHx4FhFgdLsPpBNatHdDaYCvChi+k=;
 b=CgEYZc4CPuBlbwcWEtEX6/u9cjYrHYMdNslR9piWphdGBMQ6laAG++Wja1xpy+7lLv
 QaC1r/nJGh2EoQDE1BRfNz3y+WnCVIBeyLeERNGZEAt8q1W6GeT7yZ6F3QO0SJHICItL
 NS2Fg5ttj18xZ70BH6aL8TbC/4E1jWnjnIbBaYo2bsaOFaMs6zun54+pdCdUWqpxTUlv
 xdkaEmtRtfJLKbyo9TJGE7fJFMF8+ix8yl0eFEiaUgaH5w3pdaWTZjgF47h6R3qyldrO
 QGeAHBVDN6ekd1YCeIJWKqEYC1fKRJAhZkhvgDU+qlW+S9cJS85O4VYQJezc5zF94tAX
 FxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715096237; x=1715701037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgoV9bukd4nP3pnHx4FhFgdLsPpBNatHdDaYCvChi+k=;
 b=V4xInjLDIqNn78K4LTI0DF4WET+KYytGj9Bt+xrVWGoeOLpcIaE2nQ6+L/+oH8wTKy
 huFx7xFJkkLPB9uILOYEqkmOel5gpgpEExhe+tmHis7b9zXaB5viSvKQpy6WRmN+KQm+
 4MnoO/6uxtYJPFQxlRUDayhryiuzSK7Xgc77vIJ+9elLDXFHLywRL1tn8pXw0dhXfoa5
 AIbmxd5fRVNgBNlJoYvfbcrP6M9GNo0Bd+al94AWtkzJvSTArnokDJZ2HhI0NvSEp0cX
 TgVUXvhhr9cAgRR5rMX2QEd0jvCybu0F5DVhG4bzAwU3zMVp/nyyxLL4V24/WXWBG32w
 rkCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPr7JLHiYKC+bC5cjiyVvGIVVMQbMoG1JlI35rsQU1VQxPa98pG8hmsl/Odpl4MiGCMphZ5ogJNq1GJ5aGLx29ZuMJan0=
X-Gm-Message-State: AOJu0YyDkrQeR9c7l7OySb1x6ASKl2fLG/ZEwWIkgUEVxrgcl97SZJFs
 y0G0JN3DFXqrXfoWgNIA3bg7YhBuW1tkM5Z3+n4qnixFac1f5JtQKc5SO4fi9I3rocWZDdIfCBJ
 x7gs=
X-Google-Smtp-Source: AGHT+IERvtTMEbjZK7crezzpPTBVtLGwgeqShDTHdGYjc904gdVj5ct9SO9J6ED+/U1MGCsrAKMj+w==
X-Received: by 2002:ac2:532a:0:b0:51f:3e0c:ace3 with SMTP id
 f10-20020ac2532a000000b0051f3e0cace3mr9674155lfh.16.1715096236789; 
 Tue, 07 May 2024 08:37:16 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 e12-20020a05651236cc00b0051b88cfa076sm2124871lfs.237.2024.05.07.08.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 08:37:16 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e428242a38so9055801fa.2; 
 Tue, 07 May 2024 08:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeQqYuLTlfFIInskoBrAaN7G2sYyM6picH8qmohj/CjHb+9xFwGJ0WghUuMUFzg2QfYXfCnQ81bB8TfFUqP2fpXtSxVUY=
X-Received: by 2002:a2e:a365:0:b0:2de:ca7f:c849 with SMTP id
 i5-20020a2ea365000000b002deca7fc849mr10900872ljn.43.1715096236217; Tue, 07
 May 2024 08:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240503124244.8804-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240503124244.8804-1-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 7 May 2024 23:37:05 +0800
X-Gmail-Original-Message-ID: <CANzO1D0g=AoPkyFS_5d5mJwmwDX8hpaj0fjeFy9xt4xi70fh1A@mail.gmail.com>
Message-ID: <CANzO1D0g=AoPkyFS_5d5mJwmwDX8hpaj0fjeFy9xt4xi70fh1A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] pci: allocate a PCI ID for RISC-V IOMMU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Daniel,

Daniel Henrique Barboza <dbarboza@ventanamicro.com> =E6=96=BC 2024=E5=B9=B4=
5=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:43=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hi,
>
> In this RFC I want to check with Gerd and others if it's ok to add a PCI
> id for the RISC-V IOMMU device. It's currently under review in [1]. The

Is the link [1] missing?

Regards,
Frank Chang

> idea is to fold this patch into the RISC-V IOMMU series if we're all ok
> with this change.
>
> Gerd, we picked the ID right after the PCI UFS device. Let me know if
> you want another ID instead.
>
>
> Daniel Henrique Barboza (1):
>   pci-ids.rst: add Red Hat pci-id for generic IOMMU device
>
>  docs/specs/pci-ids.rst | 2 ++
>  include/hw/pci/pci.h   | 1 +
>  2 files changed, 3 insertions(+)
>
> --
> 2.44.0
>
>

