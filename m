Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27001C83F2C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd660-00081y-51; Mon, 04 Sep 2023 05:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd65y-00081J-KT
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:42:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qd65w-0003DI-2C
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:42:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52e297c7c39so1022936a12.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693820526; x=1694425326; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LptqVxTJ6NVqTuYVKx88iEnT9ke8XsZsjtPuzi5a2Kc=;
 b=Gk/j49OkjVZnA7SYhm5f3drXmH0IjBndffvxxq4BDb6LgC03zGIP5kd4809/h51UZb
 eHWSUu+5j7maGfSodx7EqQpYkXPoXsHD54llP055/ngoJYRfpfwzsXB+lyZvqX/9U0d1
 B+mWmDWoD+LiiFlCMFtVj0n0zdMjY21dqxC8C37kxHj9BYg2UGgs1mOwPF1vHPEuYvcJ
 yMkY+IW0B+P7UNlm9Ge2NIcAD9Gbp7s4M/PtP6k7joWVa7p+w6Q+ueHPBZ050RAPzE/m
 Y6OSqm6PsVSsDZ903x4LqHoQRuCSdIKWPK7goBIy3Ji0W6FcZGx4Nph4YeWkCbql5uxj
 b2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693820526; x=1694425326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LptqVxTJ6NVqTuYVKx88iEnT9ke8XsZsjtPuzi5a2Kc=;
 b=Z/sGq2y71HQnPGcMCh77nwgQkQUYDYNSfHmVhV7F5AvA9Z7kuU8ZE4Sb3Z3Yh2dQe4
 QQhucpO8Hlen40KPctWPMSvOhjujs7JHuFuTDthFpB+h87u/ILlj8KBGIPu4hpJhba22
 sX+nvA91HqSu0iXs3XubqQ2726aPaGonK3k+LJ+mqn0hrQhiw/PQ2FTc19W4R3UBXXXj
 nU8PspKm2/vP00GSNZeaWrCYAak62DFaUcItQpgAN+NlYN1aXuNNanioCIijNJeO0d9X
 CQBpgSZvdT60LRQQIrLv6ytDyhCLoalLZzSpynGxaP1TJG2Rws8BRWssDuYDF1H+WJpu
 M2fg==
X-Gm-Message-State: AOJu0Yzmh4CJEuCAWjXqOVfsIYqEHWMZjVFgGx6CQzTDzw62s/8k/oBP
 z+DZRojtB0uS9Jh9xk5G+p04p529RNbA50I4u/re4A==
X-Google-Smtp-Source: AGHT+IETeEUA4C3+X5gjw1/Yci0lPbUWIb4fdseJq1IdP56pQhj2MJDpRivuo71qHyvzQRwAd6V4MSm/Xz1RxPWDkbs=
X-Received: by 2002:aa7:d3c3:0:b0:523:10c0:9dc with SMTP id
 o3-20020aa7d3c3000000b0052310c009dcmr7119980edr.8.1693820526443; Mon, 04 Sep
 2023 02:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230823070735.363197-1-chigot@adacore.com>
 <CAFEAcA9EHpyPuJOCAbLCn8=F+aaSZ=yzwDPwT70VUyCgMDLmYw@mail.gmail.com>
 <CAJ307EjBudxJTFo9HQMttKzKwQN0WaRzenhDKRL_wDGTHCtdhg@mail.gmail.com>
In-Reply-To: <CAJ307EjBudxJTFo9HQMttKzKwQN0WaRzenhDKRL_wDGTHCtdhg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 10:41:55 +0100
Message-ID: <CAFEAcA-BBAHQy944JKS8ZSf5mJTxK0V2+p6XO8W9dpArKtc-_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gdbstub: replace exit(0) with proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 4 Sept 2023 at 10:36, Cl=C3=A9ment Chigot <chigot@adacore.com> wrot=
e:
>
> On Mon, Sep 4, 2023 at 11:23=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Wed, 23 Aug 2023 at 08:07, Cl=C3=A9ment Chigot <chigot@adacore.com> =
wrote:
> > >
> > > This replaces the exit(0) call by a shutdown request, ensuring a prop=
er
> > > cleanup of Qemu. Otherwise, some connections could be broken without
> > > being correctly flushed.
> > >
> > > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

> > > +    /*
> > > +     * Shutdown request is a clean way to stop the QEMU, compared
> > > +     * to a direct call to exit(). But we can't pass the exit code
> > > +     * through it so avoid doing that when it can matter.
> > > +     * As this function is also called during the cleanup process,
> > > +     * avoid sending the request if one is already set.
> > > +     */
> > > +    if (code) {
> > > +        exit(code);
> > > +    } else if (!qemu_shutdown_requested_get()) {
> > > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > > +    }
> > >  }
> >
> > This definitely doesn't look right. Either exit() is OK
> > to call, or it is not. We shouldn't be exiting one way
> > if the exit status is 0 and another way if it is non-0.
>
> I do agree but AFAIK, this isn't possible to pass the exit code using
> qemu_system_shutdown_request.

That would mean that we should add a mechanism to do so.

But my opinion is still what I said about the first version
of this patchset: we should fix whatever the problem is
that means that gdb_exit() is not correctly ensuring that
gdb gets the packet response, not paper over it like this.

thanks
-- PMM

