Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA95C77B7A
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8XoV-0006ML-ES; Sun, 11 Jun 2023 23:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XoT-0006Lb-Nx; Sun, 11 Jun 2023 23:01:49 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XoS-0005R1-C0; Sun, 11 Jun 2023 23:01:49 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78cdb90aa66so83921241.3; 
 Sun, 11 Jun 2023 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686538907; x=1689130907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7O+LAq3X1OyxE0LDgjuyBbdczJ0gkfSPA9IPN8ldyc=;
 b=NrHpza70YHxn4GiDkM0PYog9lq20sX3cGXVwLfNNqHoeZoKbY9K5kEDfdP3FAAuASx
 A+8He8VH+3W2h1jhGOcIg24DEmbRsYZ2/0v5goSZlVAfBuzMDssauWpn/2LLJyZtV6zN
 ld8m5olrGqetiUGQymJIXD/YTBczqitR9bIbvbrCJHrZTNQBUChJrvCY6mtFA8F2kCer
 k8mpidGhO0RXS46CXvhWpretlptKKejkevQL+NActxoXbGUWSznnyUcbqs+JZLI1imDf
 hwpPYCUi6N3kBkJc/kxF2zyS0/SKu0AnchdxqdTP1ty1eYVzhlUg2+mRzxLLJ8qbCi8D
 o2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686538907; x=1689130907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7O+LAq3X1OyxE0LDgjuyBbdczJ0gkfSPA9IPN8ldyc=;
 b=QBo6NLG2DFQ6EgJBggfONFQ8RH9487Z2R5gYe0jJjfIatSLpct1Y3TvIbYUKZq/9nE
 XOZJmIedNUWQbrkivS+YWgGQoidxp18xSEGvBE37C98rwLv7JlzpfMDgoN2a7yOX+sXo
 Ffq+ilBB04gKTLnTvTa5vp9jP55cEriseHhBHRb5Gzrz7iiPWiNdXN1lAkGujFaqKK5e
 lGe3JXmzgFHbhGlrv5JgY6EinJGTaTc2ASyoKGwy1phnNl8ntqobPz4RBqIr2KVuTv0X
 1e/T9Jj4KgyG7Bob4hb8NA2I6lWZkrv8vr44YeWbbnLWUBjmhrT/rcuNc29pZ7LxdoYR
 U+OQ==
X-Gm-Message-State: AC+VfDx77eMpizDC+nB8VXGvVge4jAb5Na+sALDxi4qNXNldoDsashid
 dDcZ8VCU3DEHCy/HqC9l3vnQlzxAFzptDtw2VcU=
X-Google-Smtp-Source: ACHHUZ4pLuaFzPOdp2cZToBLafKVhFhm/0o428sIvvnhi78s1Mt9n8vPqvc5dxZ6J0j0VSACHKDTLg+8Y52k5kxFc+U=
X-Received: by 2002:a1f:3f49:0:b0:45c:8ef0:e351 with SMTP id
 m70-20020a1f3f49000000b0045c8ef0e351mr3239166vka.4.1686538906632; Sun, 11 Jun
 2023 20:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230609055936.3925438-1-tommy.wu@sifive.com>
In-Reply-To: <20230609055936.3925438-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:01:20 +1000
Message-ID: <CAKmqyKNsdq7tJA2e1XdtrihyGq2DuYB56JnS-C1aLm63tW1XVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: If mmsiaddrcfgh.L == 1, smsiaddrcfg and
 smsiaddrcfgh are read-only.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 9, 2023 at 4:01=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> According to the `The RISC-V Advanced Interrupt Architecture`
> document, if register `mmsiaddrcfgh` of the domain has bit L set
> to one, then `smsiaddrcfg` and `smsiaddrcfgh` are locked as
> read-only alongside `mmsiaddrcfg` and `mmsiaddrcfgh`.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aplic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index afc5b54dbb..4bdc6a5d1a 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -688,13 +688,13 @@ static void riscv_aplic_write(void *opaque, hwaddr =
addr, uint64_t value,
>           * domains).
>           */
>          if (aplic->num_children &&
> -            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>              aplic->smsicfgaddr =3D value;
>          }
>      } else if (aplic->mmode && aplic->msimode &&
>                 (addr =3D=3D APLIC_SMSICFGADDRH)) {
>          if (aplic->num_children &&
> -            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>              aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
>          }
>      } else if ((APLIC_SETIP_BASE <=3D addr) &&
> --
> 2.31.1
>
>

