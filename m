Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CACD54AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:28:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiX1V-0008Ed-SE; Tue, 19 Sep 2023 05:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiX1T-0008C8-A9; Tue, 19 Sep 2023 05:28:00 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiX1Q-0002Ee-7c; Tue, 19 Sep 2023 05:27:59 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7a8b522ae46so1226040241.0; 
 Tue, 19 Sep 2023 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695115674; x=1695720474; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=br1J3mPTdbG34BBHAfaxhhTXM5M8+Wwfb2Sv6AF0UkQ=;
 b=cHbFzBPYiNOxptYW99T0kObCIZ11jOOdpYge5f8P6vppsglT3vJnoMNKIlBDXsONf+
 bEtZ6qF/pYVKcGw88Zdj48LxvF0BMM1IQiIY0mA9Yomj/FDhd6E7qXHkItzaJ9Ode+ak
 sEXE8JLYIE7tTLcAytCoFbOzUGuapQh+ZQ4OupuXRpenvVjj1lbXYXzl0pMsoS+JyjLv
 fTx3HDXOjHsCgDU2g4Rr0Rc81lgLKJtsy1xX0RTV83uytbE6lnuxsG2dGaZKyMvLdas6
 YPpSMCbV1WdFQ66kHPkGENXBsULZaxAWzWqlwgrtZxRlRNucPDYFb5wwT58oLFFNMLLx
 3Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695115674; x=1695720474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=br1J3mPTdbG34BBHAfaxhhTXM5M8+Wwfb2Sv6AF0UkQ=;
 b=Q0lZpPPqH0S6Akv3JiH1i0yrE6Xp2ybs1wIg+PocbCvfqVKf4UJuNfvdJ8jl6l7cZp
 zLbs1+cI9C/8H6SxCOfoqPpwdk6NVz6B2F9OlpVn013+Y+9xq3XRPPS7fGhlt4cbtqK+
 boXq8oOBR1S7Vytjr42EGA4FfDRhHvzf+f+5HOkTN+cwjMZTL7lck9I0iyr4M22ZowcY
 I40cuD1W/Q7jpAIFPs7ywMUAqyqhzOA+PWIWlolCdUmoyqH+TL0E4/1H1cPHbb+a533u
 iSicbPM16cO2fE10USN7U8/9ufh2cIGoKc1Dc0P7CLDutbYsCtQelArTd7J0qasbgQbC
 A4/Q==
X-Gm-Message-State: AOJu0YxDEKnmFdtqMKUQr37gDBZCIv+Y46zsnfuKIqnFLjVEJ+wizNQL
 MRnIccOcmHNVqJmb6niW5wP8+gDaTAHahzI9j5c=
X-Google-Smtp-Source: AGHT+IFhK1Lgg3RCaMCndKgFEmqx+zcyXXyUC6ngSX7O4lA0OVT7cn/cPyUmMHTdPxoTk+3OBtktcv/DCsJC/hQaL44=
X-Received: by 2002:a1f:4a41:0:b0:493:7c76:bbac with SMTP id
 x62-20020a1f4a41000000b004937c76bbacmr9660584vka.2.1695115674571; Tue, 19 Sep
 2023 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAEV2DRqFS+UvqvgrW=6R=ahj+akKcmvH3MtAarJ70RphARMNdQ@mail.gmail.com>
 <CAKmqyKN_z7Q=mmsp41ycFbgW+N4PRmv4UB4sUrs=i6ziuHywmg@mail.gmail.com>
 <D9FFB2CE-0F2D-4CFA-B4F8-CCBE33D44339@ventanamicro.com>
In-Reply-To: <D9FFB2CE-0F2D-4CFA-B4F8-CCBE33D44339@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Sep 2023 19:27:27 +1000
Message-ID: <CAKmqyKP5cHzYXO5kBTK9qQYOjdWxRqZeRhVrxRWJBLFDFzgoxA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg for
 Smepmp
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Chang Alvin <vivahavey@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 alistair.francis@wdc.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Tue, Sep 19, 2023 at 3:43=E2=80=AFPM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
>
>
> > On 19-Sep-2023, at 10:51 AM, Alistair Francis <alistair23@gmail.com> wr=
ote:
> >
> > On Tue, Sep 19, 2023 at 3:08=E2=80=AFPM Chang Alvin <vivahavey@gmail.co=
m> wrote:
> >>
> >>> -----Original Message-----
> >>
> >>> From: Alistair Francis <alistair23@gmail.com>
> >>
> >>> Sent: Tuesday, September 19, 2023 12:42 PM
> >>
> >>> To: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andest=
ech.com>
> >>
> >>> Cc: qemu-riscv@nongnu.org; qemu-devel@nongnu.org;
> >>
> >>> alistair.francis@wdc.com; ajones@ventanamicro.com
> >>
> >>> Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg=
 for
> >>
> >>> Smepmp to version 1.0
> >>
> >>>
> >>
> >>> On Fri, Sep 15, 2023 at 6:32=E2=80=AFPM Alvin Chang <alvinga@andestec=
h.com> wrote:
> >>
> >>>>
> >>
> >>>> Current checks on writing pmpcfg for Smepmp follows Smepmp version
> >>
> >>>> 0.9.1. However, Smepmp specification has already been ratified, and
> >>
> >>>> there are some differences between version 0.9.1 and 1.0. In this
> >>
> >>>> commit we update the checks of writing pmpcfg to follow Smepmp versi=
on
> >>
> >>>> 1.0.
> >>
> >>>>
> >>
> >>>> When mseccfg.MML is set, the constraints to modify PMP rules are:
> >>
> >>>> 1. Locked rules cannot be removed or modified until a PMP reset, unl=
ess
> >>
> >>>>   mseccfg.RLB is set.
> >>
> >>>> 2. From Smepmp specification version 1.0, chapter 2 section 4b:
> >>
> >>>>   Adding a rule with executable privileges that either is M-mode-onl=
y
> >>
> >>>>   or a locked Shared-Region is not possible and such pmpcfg writes a=
re
> >>
> >>>>   ignored, leaving pmpcfg unchanged.
> >>
> >>>>
> >>
> >>>> The commit transfers the value of pmpcfg into the index of the Smepm=
p
> >>
> >>>> truth table, and checks the rules by aforementioned specification
> >>
> >>>> changes.
> >>
> >>>>
> >>
> >>>> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> >>
> >>>> ---
> >>
> >>>> Changes from v2: Adopt switch case ranges and numerical order.
> >>
> >>>>
> >>
> >>>> Changes from v1: Convert ePMP over to Smepmp.
> >>
> >>>
> >>
> >>> Did this part get lost?
> >>
> >>>
> >>
> >>> Alistair
> >>
> >>>
> >>
> >>
> >> Sorry, do you mean that the term "ePMP" should be changed to "Smepmp" =
in source code?
> >
> > We still call it epmp to users and it's still marked as experimental.
> >
> > See this line in the QEMU source:
> >
> > MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
> >
> > Alistair
>
> I had sent a patch to rename epmp to Smepmp
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html

Thanks! That patch has some comments that need a v2. Do you mind sending a =
v2?

Alistair

>
>
> Regards
> Himanshu
>
>

