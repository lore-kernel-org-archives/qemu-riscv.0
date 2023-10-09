Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCEAE95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpext-0007v5-Uj; Sun, 08 Oct 2023 21:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpexr-0007uQ-Ud; Sun, 08 Oct 2023 21:21:43 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpexq-0001rI-9K; Sun, 08 Oct 2023 21:21:43 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-4547428694dso1497638137.3; 
 Sun, 08 Oct 2023 18:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814501; x=1697419301; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKGfdpwjxoalMZ1onRt05LIH5tcVGNzrRCN6jW5qKZA=;
 b=HOjuI5IfILsMB6IBdjWkz3T7ci4fcKaVyephTEzSOaGVTUTpFo88GQLWWqlN/LcGpW
 qWiyOynk19tCW6NEdjchg6IUuH5UdQthdIQvIhFXxEsn5oQ7uX68hWLKpXnNEW4mlIvN
 4M0PWvygbfUDCQnz6OUhism24Q+/Ldi1XM8EN0WRwgoO+/4R5vB9W0+anP2VUh0C+3ND
 Oar+qAVslt1SpxcrRDYaLUjMC2hUfZNxAZaXmXRNBzaljbp66TAj0IrrSJwkM/1HhxHM
 tM5vGk1WfgcDGy2nLuwPl3H5jVuThU5IN2WmsZf9yTtvemSrSqKubnsYE9oMD4g08pd7
 MTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814501; x=1697419301;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKGfdpwjxoalMZ1onRt05LIH5tcVGNzrRCN6jW5qKZA=;
 b=MVv+pKtCHSHzQiX6HzJ19P5bh9G9OM85y2VuB9Z8zmKtB1pL2VfCIGxMojY44GJuZG
 M7OwBSfo5NKguMKwNwj2sEnGxe6hSoUhWRVSVsl8MSuAlgLlCKunSB2MKiG61NNR0dlW
 sOH1qX2TyJSVpU4Q6Ag4WrO5obxEmZcysMKvLh4MFKzvxFRk6KXl0jvgAqvDtLCThyeu
 kcQwxBvu2OOgY2Bs0YkHx1lb1ol9ooAnSfrEQbKnb1zn+se0Sm7M0rK7r5mm8QF1WyVw
 0hNPNp+qIuTfgOOiewM0H8CIuzzvOm2OaN5kYBGXFfaisAXglDzVgJ6/Vzi//lJxSd9R
 szcw==
X-Gm-Message-State: AOJu0Yw0S2Mj5rZU5jW90pRbLasHydOwF5okOaDsXAuxXk3f99jR+2im
 NqWgBk/JIBh3U2BpLohM0AgXQXynyELqbdZ5EQS+Ll/whNZnAw==
X-Google-Smtp-Source: AGHT+IEppYM5o1rSajAasaqm7mO0m+NvLRjnTD0xB4k/BW6MMm9QuMIey5H9Eab4dHCflD64YtMpf7EJ6LmmoyE6yc4=
X-Received: by 2002:a67:c510:0:b0:457:670b:1810 with SMTP id
 e16-20020a67c510000000b00457670b1810mr2933805vsk.31.1696814500177; Sun, 08
 Oct 2023 18:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-5-chigot@adacore.com>
 <CAKmqyKMnEofVntirOX+a+r26CNjfMqSzTUDbkfRhwkreu7JyMQ@mail.gmail.com>
 <CAJ307EizmMZDP2ujNkd7EduNf5aLb7khUXtfhZHPo+_yvzk7PA@mail.gmail.com>
In-Reply-To: <CAJ307EizmMZDP2ujNkd7EduNf5aLb7khUXtfhZHPo+_yvzk7PA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:21:13 +1000
Message-ID: <CAKmqyKNKEYJsnoWoDZvmnA8knHWeBSEB7NgWBVyg6JP+MLhT5Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/char: riscv_htif: replace exit calls with
 proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Mon, Oct 2, 2023 at 7:32=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacore.=
com> wrote:
>
> On Fri, Sep 22, 2023 at 7:20=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com> wrote:
> >
> > On Thu, Sep 7, 2023 at 9:26=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adac=
ore.com> wrote:
> > >
> > > This replaces the exit calls by shutdown requests, ensuring a proper
> > > cleanup of Qemu. Otherwise, some connections like gdb could be broken
> > > before its final packet ("Wxx") is being sent. This part, being done
> > > inside qemu_cleanup function, can be reached only when the main loop
> > > exits after a shutdown request.
> > >
> > > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> >
> > Do you mind rebasing this on:
> > https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> Thanks for the review.
> Just a quick question on the procedure side, is there any special tag
> or something to say in the cover letter to state that it has been
> rebased on riscv-to-apply instead of the usual master?

You can use the "Based-on" tag. There is some more details here:

https://www.qemu.org/docs/master/devel/submitting-a-patch.html#id33

Alistair

>
> Cl=C3=A9ment
>
> > Alistair
> >
> > > ---
> > >  hw/char/riscv_htif.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> > > index 37d3ccc76b..7e9b6fcc98 100644
> > > --- a/hw/char/riscv_htif.c
> > > +++ b/hw/char/riscv_htif.c
> > > @@ -31,6 +31,7 @@
> > >  #include "qemu/error-report.h"
> > >  #include "exec/address-spaces.h"
> > >  #include "sysemu/dma.h"
> > > +#include "sysemu/runstate.h"
> > >
> > >  #define RISCV_DEBUG_HTIF 0
> > >  #define HTIF_DEBUG(fmt, ...)                                        =
           \
> > > @@ -205,7 +206,9 @@ static void htif_handle_tohost_write(HTIFState *s=
, uint64_t val_written)
> > >                      g_free(sig_data);
> > >                  }
> > >
> > > -                exit(exit_code);
> > > +                qemu_system_shutdown_request_with_code(
> > > +                    SHUTDOWN_CAUSE_GUEST_SHUTDOWN, exit_code);
> > > +                return;
> > >              } else {
> > >                  uint64_t syscall[8];
> > >                  cpu_physical_memory_read(payload, syscall, sizeof(sy=
scall));
> > > --
> > > 2.25.1
> > >

