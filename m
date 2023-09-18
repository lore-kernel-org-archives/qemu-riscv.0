Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C8CD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:17:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi2sl-0003of-9T; Sun, 17 Sep 2023 21:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi2sb-0003nj-Jk; Sun, 17 Sep 2023 21:16:51 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi2sX-0005yT-Px; Sun, 17 Sep 2023 21:16:48 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso262296e87.2; 
 Sun, 17 Sep 2023 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694999804; x=1695604604; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfjmkizNEHc6f4yKdvNiQXox1H6fHnTAQlyWblbNoV8=;
 b=AjhP9IfRjGjwglEK2U6gf0ZFi3ohTyeBVa2z3oXVY3aquLA7K1mMDeJABbQB0zfAgc
 MttVmdlDXXBlcwWKLvab2B4NTgvj4kj0SMMg6gyn+bgvv0nxkV1S0GNMfRQS0sQLANpb
 QpskMwMYWHlc0nGu3mB6afCS+PcnrwHR0LWxC2JgToI3D+dQKh2G9tw7Mn1mstuHITKM
 HX6Vy+AsrLQ6NBR+2ePMMbml61acbEP2IkDlWab4N8h5ITOci52oaMeA05aNlneN2Clt
 i2xiTeR/chOsOt7SQ4tJcHj78Ld36ibyQTqF83LS/TL+8ygB196ZipeZvjwWMSKtdkYf
 HtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694999804; x=1695604604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfjmkizNEHc6f4yKdvNiQXox1H6fHnTAQlyWblbNoV8=;
 b=xEVwBEDheliGd21je5NGrb7OyUIJmOneKdNMRKUhanm7PyfWQjFzKYYZzR4rk4mnUA
 AR4nRa0FUvzMCBKsESCxRvI7SnJZoQDl34iDT7i91x3n/4iqRoSx3jitaV9/b+tfjEQ+
 UXPcRaClaZxcPdtmmH76yge5TFv/uQfT9lMnAgXw1qXTVw9K7nCNVgwDnnUhsmtOaG7t
 8ZLwNjInaQYbCzUTHOcaLCSfugtmNwrtMrDBvwd7uRZYMXYOKqAG1VAFdMnisGfcEru+
 187EXYsc0v3WyxJ+U+/mL7AnM+hGW3XOOMn5IJ78DHOanHHi/LWIBubcaQldVQPmJO1F
 FGgg==
X-Gm-Message-State: AOJu0Yyk9gmHmV4II8zMhZRsRBTuj3JbPP8SisUURvRrvVGHeL1P80qT
 5ZHI0KPO8GoJyIYH2rm4OOVASiKfcJDhyrVNGJo=
X-Google-Smtp-Source: AGHT+IFODcD01fGwef9mSyVvhtRsaDsL1XEQsgljXIgxzNgdn0wP6qxz8aI1dkCmYrPQlUl6S+iNXJbNUUNB+ttit0s=
X-Received: by 2002:ac2:5e2f:0:b0:4ff:83b2:42b7 with SMTP id
 o15-20020ac25e2f000000b004ff83b242b7mr5619767lfg.42.1694999803421; Sun, 17
 Sep 2023 18:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <10817413.NyiUUSuA9g@pinacolada>
 <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
 <4344798.atdPhlSkOF@pinacolada> <6353228.kQq0lBPeGt@pinacolada>
In-Reply-To: <6353228.kQq0lBPeGt@pinacolada>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:16:15 +1000
Message-ID: <CAKmqyKP2cSh-U8s9hJfLH1GSsEHXQaL0xjd=s19WCzLdeyOPTA@mail.gmail.com>
Subject: Re: qemu-riscv32 usermode still broken?
To: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 LIU Zhiwei <baxiantai@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-lf1-x12b.google.com
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

On Sun, Sep 17, 2023 at 8:38=E2=80=AFAM Andreas K. Huettel <dilfridge@gento=
o.org> wrote:
>
> Am Donnerstag, 14. September 2023, 03:22:49 CEST schrieb Andreas K. Huett=
el:
> > > > https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00119.html
> > > > ^ Here I'm trying to find out more.
> > > >
> > > > Bash tests apparently indicate that argv[0] is overwritten, and tha=
t
> > > > reading through a pipe or from /dev/tty fails or loses data.
> > > >
> > > > Apart from the bash testsuite failing, symptoms are as follows:
> > > >
> > > > * Something seems wrong in the signal handling (?):
> > >
> > > If it is wrong for signal handling and for 32-bit, I guess it may be
> > > fixed by this patch
> > >
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg981238.html
> > >
> > > And this patch has been merged into master branch yesterday.
> > >
> > > May be you can have a try based on the master branch.
> >
> > I added the patch to 8.0.3 (easier for the moment), and this did
> > unfortunately *not* lead to any improvements.
>
> Also with the patch on top of 8.1.0 no improvement or change.
>
> > However, in the meantime on the GNU Make tracker Alejandro Colomar
> > pointed me to another detail based on my oddities [1]:
> >
> > > I think [make] it's failing here:
> > >
> > > <https://git.savannah.gnu.org/cgit/make.git/tree/src/job.c#n757>
> > >
> > > But it's failing with ENOENT, which is not one of the documented
> > > errors for wait(2):
> >
> > So maybe another point to look at would be the origin of the return
> > values of wait, and whether that's wired correctly for rv32...
> >
> > [1] https://savannah.gnu.org/bugs/?64664
>
> In the meantime I tried to nail down a reproducible hang in bash on this
> frankensystem with qemu's gdb interface. This also pointed towards
> child handling and wait [2].

RV32 only has the time64 wait syscall, so it's possible there is a bug
there which then wouldn't appear on other arches.

You can see the glibc implementation of wait here [1] to give you an
idea of how complex it ends up being.

It would be great to get a strace of the failure to narrow down what
it is. From there it should be not too hard to find and fix.

1: https://github.com/bminor/glibc/blob/bb5bbc20702981c287aa3e44640e7d2f2b9=
a28cf/sysdeps/unix/sysv/linux/wait4.c#L26

Alistair

>
> [2] https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00128.html
>
> Some time ago we already debugged that corner, and Alistair Francis
> came up with a fix that improved the riscv32 situation back then [3].
> Maybe that fix was somehow incomplete? Just speculating...
>
> [3] https://bugs.launchpad.net/qemu/+bug/1906193
>
>
> --
> Andreas K. H=C3=BCttel
> dilfridge@gentoo.org
> Gentoo Linux developer
> (council, toolchain, base-system, perl, libreoffice)

