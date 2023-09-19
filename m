Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0CBCD3437
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 05:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiTBw-0004nd-3V; Tue, 19 Sep 2023 01:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiTBv-0004nN-1a; Tue, 19 Sep 2023 01:22:31 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiTBk-0004QE-Ku; Tue, 19 Sep 2023 01:22:30 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-79a2216a2d1so1945243241.2; 
 Mon, 18 Sep 2023 22:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695100939; x=1695705739; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=efdcRSm1nwUO1VwaGzeoCFWe+njO6UA3N/oO4I+h38g=;
 b=RSMg/OyJ06E5OxJSZTj50ffx3LWjWoutdjUbxl2iwbfKQrp5+T8HUG3Z/L8Kg23aax
 ilcH4vWQ0eVmwqoRLyjtYjMma/Z/1z9mf+/3F+WSOVwHerFWnWaXM+oj9ZonZifPIxeX
 dNbd7Mo4iGOT4HPtGvFUFhM8qSiUXPIl2QjS0/ti9WN6kFjR6a7QosbiyNUZ5ho8wJj2
 nwCBMDBu96/KZjd9xAz6RpbhAMEjhF+6L3V7OK+ME8ZhxXUu0w36wLlOFmICTLoAseDJ
 yXrdV9S36IO44kqpnpMCDeo6kS40xzunWMZ7+bvUxuCtlHZrKK3bFcAQhGEwjy+mjuGf
 rA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695100939; x=1695705739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efdcRSm1nwUO1VwaGzeoCFWe+njO6UA3N/oO4I+h38g=;
 b=gI9PB6EOs0UTmg5ec6CwyzM5cWoBPHMjA3ppwODkjtE/o6Za8FOvN9QHeV9ELgEp8r
 6AdzMhO6XhbfDWLwmMEmLVwlyxM964eiRb7Iivjll7k0o3WjlMOwxi17hUTdJpm+3sLW
 7G0xMxO5+/CHYNhSK+qnD7wzxI0bL1kATLXx18aH9jYPs5WZC/TVIn0S8S5UVL1uJULO
 /ALIlYeqDRBZTXQYI0gNgGspiTfW72MH+6UQcPIbuK0FEFHPpV3hiRSIfJGdz0pPUHOR
 bD2YaeiY+kQ9rtT6WAOQR77SxeYBH2ecPxAhnjOWiyleUgNQYNhY/wfA3gvoEpH+Va5u
 eK7Q==
X-Gm-Message-State: AOJu0Yzl2oAiS7BgpW9eiwPJ5PJxSc0pi0Vf/A1cP5ZlbDfL774GhgQx
 PxD1wpg6lDQcGrQl11UsdcGKxRUFtSWfv9Eo3tU=
X-Google-Smtp-Source: AGHT+IH22HGVd2+enw4zOTZ2CubQIHrv4FkR4jtnzSKTGFGSMSCC0vpKlzuqWutWx3c6iUZp+x2YnJhUHA4pqsY6Dp4=
X-Received: by 2002:a05:6102:d7:b0:44d:47c2:7471 with SMTP id
 u23-20020a05610200d700b0044d47c27471mr8676785vsp.27.1695100938874; Mon, 18
 Sep 2023 22:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAEV2DRqFS+UvqvgrW=6R=ahj+akKcmvH3MtAarJ70RphARMNdQ@mail.gmail.com>
In-Reply-To: <CAEV2DRqFS+UvqvgrW=6R=ahj+akKcmvH3MtAarJ70RphARMNdQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Sep 2023 15:21:52 +1000
Message-ID: <CAKmqyKN_z7Q=mmsp41ycFbgW+N4PRmv4UB4sUrs=i6ziuHywmg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg for
 Smepmp
To: Chang Alvin <vivahavey@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

On Tue, Sep 19, 2023 at 3:08=E2=80=AFPM Chang Alvin <vivahavey@gmail.com> w=
rote:
>
>  > -----Original Message-----
>
> > From: Alistair Francis <alistair23@gmail.com>
>
> > Sent: Tuesday, September 19, 2023 12:42 PM
>
> > To: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andestec=
h.com>
>
> > Cc: qemu-riscv@nongnu.org; qemu-devel@nongnu.org;
>
> > alistair.francis@wdc.com; ajones@ventanamicro.com
>
> > Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg f=
or
>
> > Smepmp to version 1.0
>
> >
>
> > On Fri, Sep 15, 2023 at 6:32=E2=80=AFPM Alvin Chang <alvinga@andestech.=
com> wrote:
>
> > >
>
> > > Current checks on writing pmpcfg for Smepmp follows Smepmp version
>
> > > 0.9.1. However, Smepmp specification has already been ratified, and
>
> > > there are some differences between version 0.9.1 and 1.0. In this
>
> > > commit we update the checks of writing pmpcfg to follow Smepmp versio=
n
>
> > > 1.0.
>
> > >
>
> > > When mseccfg.MML is set, the constraints to modify PMP rules are:
>
> > > 1. Locked rules cannot be removed or modified until a PMP reset, unle=
ss
>
> > >    mseccfg.RLB is set.
>
> > > 2. From Smepmp specification version 1.0, chapter 2 section 4b:
>
> > >    Adding a rule with executable privileges that either is M-mode-onl=
y
>
> > >    or a locked Shared-Region is not possible and such pmpcfg writes a=
re
>
> > >    ignored, leaving pmpcfg unchanged.
>
> > >
>
> > > The commit transfers the value of pmpcfg into the index of the Smepmp
>
> > > truth table, and checks the rules by aforementioned specification
>
> > > changes.
>
> > >
>
> > > Signed-off-by: Alvin Chang <alvinga@andestech.com>
>
> > > ---
>
> > > Changes from v2: Adopt switch case ranges and numerical order.
>
> > >
>
> > > Changes from v1: Convert ePMP over to Smepmp.
>
> >
>
> > Did this part get lost?
>
> >
>
> > Alistair
>
> >
>
>
> Sorry, do you mean that the term "ePMP" should be changed to "Smepmp" in =
source code?

We still call it epmp to users and it's still marked as experimental.

See this line in the QEMU source:

MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),

Alistair

