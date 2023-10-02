Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A076AE784AF
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 09:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnFI2-00086k-4L; Mon, 02 Oct 2023 05:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnFI0-00085w-Ju
 for qemu-riscv@nongnu.org; Mon, 02 Oct 2023 05:32:32 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnFHw-00018h-Vp
 for qemu-riscv@nongnu.org; Mon, 02 Oct 2023 05:32:31 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-277564f049dso8680203a91.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Oct 2023 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1696239146; x=1696843946; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVK8KbungCJV+yDhJRH5x5PqtIP8iDGaf/PcGmcA/Bs=;
 b=EC8RIRvQBIa0+A/HxyOs1XRjynCMtbXLgIJ5dO/RybTU/wnPgNCoxP7epvr8LahRtA
 Au/l56TPUuaDwMhKfsfUZyRlxuhFOCboZlhoIc4Ahlx6HXYr+TY7B1m3InpWQRJ6dk2a
 CkX4Y/HCp2T2uYqqBBYrloQqghfCqZ6rt7bSKZ/aU+VKMno7X3KBv4Ke6mtOtNbK30HV
 WDgtK+A2a48lWra54WMGb6F3Bsh7O3FqUlOYo8PsIUplHWxuUEcq6nbTEwTOs3hbrX3D
 C0pyC4U1Xjh2xKZKWS9x+451v9noTpJw85ChJc0kytKjL4fIMmx+mgNeNjBKikr77Obd
 Bf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696239146; x=1696843946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVK8KbungCJV+yDhJRH5x5PqtIP8iDGaf/PcGmcA/Bs=;
 b=tGLAglIwuenU7wOy+pVYi0Bf+uf3V9jjWWvDLQRl/l+M3dycYDPK4iY1BL36ZU0hbt
 rKgslVuhobcLO2BTR05C5p+wyL34fdj7rtmxpgtfN3ipgxQ2up9fAJ13mvjZl/+q0wPI
 QLrwJZMx8qm4Kuqzk4HDSujLXtQXJK18rnyQ4zThHqfEUZeFXg0+CKGYeOUny/870Z0B
 aWyIIm+KTFMrd7KrNzREKd8ZSJJdW2vQWtV0bjWDWa36w7AqV0cfCulv9m7xXHV2suwa
 WtAGcaIiZzhHCPmPia7b5kxAoWXn5l42+2Dy3UkwHRaRsWP9kxuxZ5ywdjj2AYC1xI+d
 Ahcw==
X-Gm-Message-State: AOJu0Yxl7UGAgE6DwWPKt9FSdVZ5kCXxgnD7ic80tiwXs4duQmQrhgcV
 ekmMrh4oJ7mqYrQrKvE9Ks1jzAmgMg8L6y/Tp0w0t/eBnNvTe+Yu
X-Google-Smtp-Source: AGHT+IF/tb/Bku5fvZHS+ILdrIV2PGNmtFCB7Zbs6kxr1x/J3ag05QYpRo/xXe4HA+HYtfRR1FsGivA9ki4ddNW1waI=
X-Received: by 2002:a17:90b:3696:b0:274:6839:6a89 with SMTP id
 mj22-20020a17090b369600b0027468396a89mr7707991pjb.27.1696239146203; Mon, 02
 Oct 2023 02:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230907112640.292104-1-chigot@adacore.com>
 <20230907112640.292104-5-chigot@adacore.com>
 <CAKmqyKMnEofVntirOX+a+r26CNjfMqSzTUDbkfRhwkreu7JyMQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMnEofVntirOX+a+r26CNjfMqSzTUDbkfRhwkreu7JyMQ@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Mon, 2 Oct 2023 11:32:14 +0200
Message-ID: <CAJ307EizmMZDP2ujNkd7EduNf5aLb7khUXtfhZHPo+_yvzk7PA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/char: riscv_htif: replace exit calls with
 proper shutdown
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=chigot@adacore.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Sep 22, 2023 at 7:20=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Thu, Sep 7, 2023 at 9:26=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacor=
e.com> wrote:
> >
> > This replaces the exit calls by shutdown requests, ensuring a proper
> > cleanup of Qemu. Otherwise, some connections like gdb could be broken
> > before its final packet ("Wxx") is being sent. This part, being done
> > inside qemu_cleanup function, can be reached only when the main loop
> > exits after a shutdown request.
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
>
> Do you mind rebasing this on:
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Thanks for the review.
Just a quick question on the procedure side, is there any special tag
or something to say in the cover letter to state that it has been
rebased on riscv-to-apply instead of the usual master?

Cl=C3=A9ment

> Alistair
>
> > ---
> >  hw/char/riscv_htif.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> > index 37d3ccc76b..7e9b6fcc98 100644
> > --- a/hw/char/riscv_htif.c
> > +++ b/hw/char/riscv_htif.c
> > @@ -31,6 +31,7 @@
> >  #include "qemu/error-report.h"
> >  #include "exec/address-spaces.h"
> >  #include "sysemu/dma.h"
> > +#include "sysemu/runstate.h"
> >
> >  #define RISCV_DEBUG_HTIF 0
> >  #define HTIF_DEBUG(fmt, ...)                                          =
         \
> > @@ -205,7 +206,9 @@ static void htif_handle_tohost_write(HTIFState *s, =
uint64_t val_written)
> >                      g_free(sig_data);
> >                  }
> >
> > -                exit(exit_code);
> > +                qemu_system_shutdown_request_with_code(
> > +                    SHUTDOWN_CAUSE_GUEST_SHUTDOWN, exit_code);
> > +                return;
> >              } else {
> >                  uint64_t syscall[8];
> >                  cpu_physical_memory_read(payload, syscall, sizeof(sysc=
all));
> > --
> > 2.25.1
> >

