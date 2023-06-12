Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E0C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:16:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Y23-0001wO-0V; Sun, 11 Jun 2023 23:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1q8Y21-0001w3-Pj
 for qemu-riscv@nongnu.org; Sun, 11 Jun 2023 23:15:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1q8Y20-00020P-2S
 for qemu-riscv@nongnu.org; Sun, 11 Jun 2023 23:15:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5149c76f4dbso6943662a12.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Jun 2023 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686539745; x=1689131745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6Yhmi3nvIfSWzpIU2tWQ4e4bo1mNrp5KCS+oge4ScQ=;
 b=g3l0PopU3MmsYmYzYQzdeNUy1nmLDLRN1Dvt46dZxXkgyzYGAIItfMaEyPVRRNrvrG
 Qwf2CWa1R2HIlF2WKtd62FJoAmVUPicXcTDW7fU29dPlot+GP6GWPN6QMqZZQFV7f7W+
 V4GdX4lE8IGUFtcowS1mbvwMbSPcusZUF8T5lQ8mHIlWFShR6frneaYt0tQipkmpI/XV
 BpQTXrqrqFDllVYoRkLDchkCuF6QBL2bPSo/cJl/cMtehR9WAp+JHsohNcgJsQHoISxy
 u952EPeIZhJlWDYAO2sL5XoiBvbSOtKgd9oD5v11ZMEFpFnBZRF+OQGIUCQ+6U9wF1jG
 tRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686539745; x=1689131745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6Yhmi3nvIfSWzpIU2tWQ4e4bo1mNrp5KCS+oge4ScQ=;
 b=i5iP80DlfN/ejYv8jCZ/NcIqHh0HxT8IYXCfHg9CBayHXn1TQo/QzSeDLOFH4yb3bM
 +c7K0j/OeeKXHdxtbeUZlm0Ei/OAiYMAtM1DBVcNPIslm8kFUo6AhHTOhKHWtvPOJ54Q
 R/xS5Dq1q+HI9Y54WdSLivqmMhO7eV9EirRCU2/smCY3bECMnOC+VgwtH//dx7Xura7V
 UukJyROU1iT6APTcnbu3PSh/vGf//Vv7hjMYjw2faQA337FaJQUPxQ9/TRwdAE+YfKDs
 YfUFOutgC9Qy4Rmulfr+frB2a8Ja+hncw9/oTWgZj3BF2xXB1iiw53wxrvOgpesLhgOU
 pwDg==
X-Gm-Message-State: AC+VfDxybpjb4QEgvYkUd+5qH+Zg1Go1JXaEH0Ks9kSamm8CSkzyKe5a
 FMNIgtWaz1s+X+jXTFFlX4M0+GKA1dAOkKQILuo1gw==
X-Google-Smtp-Source: ACHHUZ5BxTiFLcPaBOvA3d6xP6Ur26OdRWC3SdJlQrhIx7+GQy2jr4BrvztnghjJH3U6wo1rzW+mX5BKP93eevUbdqs=
X-Received: by 2002:a17:907:3e81:b0:977:eed1:453c with SMTP id
 hs1-20020a1709073e8100b00977eed1453cmr10723266ejc.73.1686539744612; Sun, 11
 Jun 2023 20:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609055936.3925438-1-tommy.wu@sifive.com>
In-Reply-To: <20230609055936.3925438-1-tommy.wu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jun 2023 08:45:31 +0530
Message-ID: <CAAhSdy02+0gVm2PYijB3r8rb6wqCzWBauQK4O2RfaF_9Pg+GmA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: If mmsiaddrcfgh.L == 1, smsiaddrcfg and
 smsiaddrcfgh are read-only.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=anup@brainfault.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 9, 2023 at 11:29=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wrot=
e:
>
> According to the `The RISC-V Advanced Interrupt Architecture`
> document, if register `mmsiaddrcfgh` of the domain has bit L set
> to one, then `smsiaddrcfg` and `smsiaddrcfgh` are locked as
> read-only alongside `mmsiaddrcfg` and `mmsiaddrcfgh`.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

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

