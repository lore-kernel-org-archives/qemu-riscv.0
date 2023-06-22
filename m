Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1548EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9TK-0005GA-4P; Wed, 21 Jun 2023 21:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9TI-0005Fp-Dm; Wed, 21 Jun 2023 21:50:52 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9TF-0006oY-T9; Wed, 21 Jun 2023 21:50:51 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-78cdb90aa66so2468869241.3; 
 Wed, 21 Jun 2023 18:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687398648; x=1689990648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Stfnyt1qTHZZ6QBjYoPcN6QWJnANHXdlyPwGT6cP/PI=;
 b=coVjCPT1hvFsiz8q7wSVQ15QSwF3jDqEZNVCppAthUCoQ2eMSPJiegQ6hhEyRCBCeX
 GXarHnpFMfgqny7oUROI+WShvEPuR+93tFjTUeHGL1Rlt/yhWwCfKnfZXTRl2TLPYQrw
 pVw+zk3I3eyWohUSnDTpy1Mb1o4NsSJq+Y7gdmmZxS4E7lhjN5iEbNeoJr3gRynMuB/e
 dHkTOi6xFuE08MGGh44c/9lNi696gepsD2LoaeIB+UK7HEHJYDRO/A9oI0dlQAkKTOCC
 3Bx6vmgQgw7RvV95rO1ERrDmI3Iro1C/tZoC2SdeRNUlunuY7O+V3zc4m5ZrkMV9tapz
 u7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687398648; x=1689990648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Stfnyt1qTHZZ6QBjYoPcN6QWJnANHXdlyPwGT6cP/PI=;
 b=PwjgGjk8dKdtyTZKqqbjdX47haQ0t+QQVPcUhM9qe1Pus9X4W0uIK7d2wn0SitVl2C
 uFtlgx70jXa7D1iA+Q5QpNKxJbBorNy0M82b+jlMp8rFNeKluIxrzJ6vhFlV0Lgmh2sp
 hd+EOHuvPEEWNZEOa2ioZgmHLaCPJBXrTDsHF6uqaQbD6DDImiRDZQjeOb5eRKE7FUvq
 eJ5Z8DAPXZ7vTg0/InP72D5wEvXGwdE/hwIbFJzbvkz9ZpgLbbyXFrnCG6wls/1dirPD
 BfY2fQMzkqsnqpV6RJ1Sote7YPxABzQ8wQdou8fJcN4RnV6S6HTuMjS0t5dxZ4Yr7neE
 +E+g==
X-Gm-Message-State: AC+VfDypxf2eOkJialhBioON8K9dQTKdMhZuc5USWZ1BL1j/NbOANMBD
 Tr7Ihu5+Y6LcsfObDlgYonmbhBhJkEkMwWchrV1rg/B8Ib0=
X-Google-Smtp-Source: ACHHUZ5fDyQNhMLMwHApsl8BExVFQPHSoBDa2H5EpjMpGwxJUpZ936xR0PjDIoxOVPMQpdc0bnR5Cn6wNXcS9uie2Ww=
X-Received: by 2002:a67:fa4c:0:b0:43f:61cd:7c74 with SMTP id
 j12-20020a67fa4c000000b0043f61cd7c74mr6184923vsq.21.1687398647953; Wed, 21
 Jun 2023 18:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230609055936.3925438-1-tommy.wu@sifive.com>
 <CAKmqyKMoeAn_7h=S0S=QR6YcYmvTd5VfT749Umm1BprUTrAjeg@mail.gmail.com>
 <CAFEAcA83+kaM9r4PqWks8tjCncnMS_Mh3NW=RyGFULV6wE5LMA@mail.gmail.com>
In-Reply-To: <CAFEAcA83+kaM9r4PqWks8tjCncnMS_Mh3NW=RyGFULV6wE5LMA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:50:21 +1000
Message-ID: <CAKmqyKOi23Lqug9Fi2OHCNPsfoT-upN7N1UVtt-dKvZM1-kdXw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: If mmsiaddrcfgh.L == 1, smsiaddrcfg and
 smsiaddrcfgh are read-only.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Mon, Jun 19, 2023 at 7:24=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 12 Jun 2023 at 05:12, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Fri, Jun 9, 2023 at 4:01=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> w=
rote:
> > >
> > > According to the `The RISC-V Advanced Interrupt Architecture`
> > > document, if register `mmsiaddrcfgh` of the domain has bit L set
> > > to one, then `smsiaddrcfg` and `smsiaddrcfgh` are locked as
> > > read-only alongside `mmsiaddrcfg` and `mmsiaddrcfgh`.
> > >
> > > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
>
> If it hasn't gone in already, would you mind tweaking the
> subject line so that it says which interrupt controller
> the change is for ? (ie "hw/intc/riscv_aplic", not just "hw/intc".)

Sorry Peter, it's already in. I'll try to keep a closer eye on the
commit titles in future

Alistair

>
> thanks
> -- PMM

