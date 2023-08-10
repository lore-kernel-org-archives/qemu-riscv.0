Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51122C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9Eo-0007lp-89; Thu, 10 Aug 2023 13:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9El-0007ky-Qr; Thu, 10 Aug 2023 13:14:15 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Ek-0007We-3F; Thu, 10 Aug 2023 13:14:15 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7948c329363so401351241.0; 
 Thu, 10 Aug 2023 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691687652; x=1692292452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PwYl3RufS59rYFOLJhjSizdGxmIooWkZuj9aJSrZd9o=;
 b=qmGhNEWXpwGMq3WLE5hLy8x5TkTil6o/g/TWuMmK54lapMjy0kp8okbgTIi43k9TWl
 /lp2h+twXP214QgYB5E5eDxePeVcKlOlYTCNOv6NN8rvmbtgTQGq+4Gn83cltOayHmS0
 XAfoAO5OHKqO/6VATs/i0M1C2N3CXGP60xWGBNjYaCcdTYQSK8twTvzaVNWUPb/1VLkg
 u8U88cnLxKnuVOLLdCgpzqtDUstLRhGmD3Yy3ukyveEcqsRut09hH6BCMOO7E38eLcDp
 q7EdLzyB0YnvJZUchv8ry4alfxgVXyv9LvMWm7X6fUiWveCWxDy+ZznwjMwCqA7kfI6M
 yT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691687652; x=1692292452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PwYl3RufS59rYFOLJhjSizdGxmIooWkZuj9aJSrZd9o=;
 b=X5vrHm50IGPPsCsqDgy6rkk6crIHzXF0ijq+1Kp0TP/xwrr+WSK5YlEXvfp2KfesFL
 OrsOWdECMmJbNAEqZn+DRjv4qrSMGIH6vxUZWLJn6oXRIhAYYmp5hCuEX+PoFwR6MhT4
 E1+kk7bZEEkv/AGlDDRYPQJkB6N8lRPaqxpfbNPwxspg3cgwuoP3XZR73uSDvD1eWfCX
 OILjxx6hjxEwEyfX/jxGp3I0GZczeGaUjHn29cAb0atFdqa66vQOX0X0jTKTVikfIgvi
 Evf32I6OUj3WCxE6qbeJrxQysQhsPeXErWTAUHofi2AXu/8Ao7ATyOQ2IXuR1Tv5uGGA
 TNuA==
X-Gm-Message-State: AOJu0YxFtpHklGTE3E7lkXJZq9bblUbB/yBipfoTKvJZxFEsURYAcZ9C
 Y7Ulg/CBeb458Vpdgcc55LRZBozvc66eQQt4cB8=
X-Google-Smtp-Source: AGHT+IFM8PANJ03bxIJLjYrm6tEN3B6EQHqR9QcvAIodUKUU+50pDLj5tRb11B+7Fh7Aic/jZQbRR7m4RUU9qNuklcA=
X-Received: by 2002:a67:ee5a:0:b0:443:5809:ec21 with SMTP id
 g26-20020a67ee5a000000b004435809ec21mr2339011vsp.17.1691687652387; Thu, 10
 Aug 2023 10:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <d734a730-f41f-4d3e-01fb-a0876d05c9e2@ventanamicro.com>
 <mhng-973b4687-69f6-4c32-976a-60bc068eca86@palmer-ri-x1c9a>
In-Reply-To: <mhng-973b4687-69f6-4c32-976a-60bc068eca86@palmer-ri-x1c9a>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:13:46 -0400
Message-ID: <CAKmqyKN4a4wa1LrBtVinDTgZ-p5kWj6jCFAPqprf-Y9BOANO3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: zicond: make non-experimental
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Vineet Gupta <vineetg@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Kito Cheng <kito.cheng@gmail.com>, jeffreyalaw@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Aug 8, 2023 at 5:16=E2=80=AFPM Palmer Dabbelt <palmer@rivosinc.com>=
 wrote:
>
> On Tue, 08 Aug 2023 14:10:54 PDT (-0700), dbarboza@ventanamicro.com wrote=
:
> >
> >
> > On 8/8/23 17:52, Palmer Dabbelt wrote:
> >> On Tue, 08 Aug 2023 11:45:49 PDT (-0700), Vineet Gupta wrote:
> >>>
> >>>
> >>> On 8/8/23 11:29, Richard Henderson wrote:
> >>>> On 8/8/23 11:17, Vineet Gupta wrote:
> >>>>> zicond is now codegen supported in both llvm and gcc.
> >>>>
> >>>> It is still not in
> >>>>
> >>>> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions
> >>>
> >>> Right, its been frozen since April though and with support trickling =
in
> >>> rest of tooling it becomes harder to test.
> >>> I don't know what exactly QEMU's policy is on this ?
> >>
> >> IIUC we'd historically marked stuff as non-experimental when it's froz=
en, largely because ratification is such a nebulous process. There's obviou=
sly risk there, but there's risk to anything.  Last I can find is 260b594d8=
a ("RISC-V: Add Zawrs ISA extension support"), which specifically calls out=
 Zawrs as frozen and IIUC adds support without the "x-" prefix.
> >
> > If that's the case then I think it's sensible to remove the 'experiment=
al' status
> > of zicond as well.
> >
> >>
> >> I can't find anything written down about it, though...
> >
> > As soon as we agree on an official policy I'll do a doc update. Thanks,
>
> Thanks.  We should probably give Alistair some time to chime in, it's
> still pretty early there.

Frozen should be enough to remove the `x-`. We do have it written down
at: https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Foundation_E=
xtensions

Alistair

>
> >
> >
> > Daniel
> >
> >>
>

