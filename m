Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D6C678DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 10:04:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWwLP-0001V1-Jy; Fri, 18 Aug 2023 06:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWwJW-00019A-Jl
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 06:02:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWwJT-0001wc-83
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 06:02:41 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26b1adbd655so509504a91.1
 for <qemu-riscv@nongnu.org>; Fri, 18 Aug 2023 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692352957; x=1692957757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31GINzzYQwcFhLtFADq2qE3kGAZ7hCDuvdbkdYG3ZG4=;
 b=Hub7cTPQ4vN50w76b0/v3w79+ptQJrCl5m2gZw4S54f6LDyMQnRe1dFxYjlyteuIwL
 tojbHpYrZeTg9zrdvEfy/Q40IC4Z988yzr4mv9GBu09faLEbQ3nKHUHNEhpuTCdhLf+Y
 snRi7ModfTVBD2V4/QUyUpGm5SZaY62LoWQRsyxuceHAjfGcNaqhErc/nZrJGph1j+EK
 S7+vD8B6ch5NLqRp1Pmh5oWCyzCF8YiVQI2vZV5c2Nd6YGr25aPRBNxuEMhAE6wJRffZ
 aI08Dg7d+4ciBXij0zUg6NotWs2/44I9yxoNnV4UJi2ha0I+rWvebknNBMNL1bABwc5a
 StUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692352957; x=1692957757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31GINzzYQwcFhLtFADq2qE3kGAZ7hCDuvdbkdYG3ZG4=;
 b=UvBoV4f1fvH/2DFl+cHQGRiyhH8SzvUmbh+Ob9Ch9HaiXjzny/gaE3sn/RtP2LJJyd
 kP9EpCPY7LTyMCCuecNg9lF2heCmXUVR/6jZi3Yo55Y+fYrXnqAYXyXBuY4zGNZIqNd8
 vk4WFPsdEP1EwZdKAJ3BspFRXpIR6Ml0ElfF7SwSWCdy3g9cz4MxMhbKz7Mvc7kxUB3M
 Q0o9zu5Ycku5MrRjLb/rzmLS8mzYVicebml6G+06OyhTHZ+q+XVqbcCpNx0+uSJ3WVPS
 uBxMGHhcEr1qEYH1QyIsUMc4FovrthdL3Vv4zTm0AFNWzY3IaQmaDKnM/gOIrFu/546x
 H8ZA==
X-Gm-Message-State: AOJu0YzFGdiFfW5IFBgNqUa/VUb9AwT/HzeKH94NKN5WGsBhAXXumnRZ
 Y9cLmEqd3fQp82f59k70+Y31xL4igT87vRsaSxtn1A==
X-Google-Smtp-Source: AGHT+IE6rNpSw5TwL5XaRfZnlR+euKR85FYMHegC0NFntgq5m8KLCkl1WNdKFIZuuqZeZc6Gx1qWZ067g7DCSBI5co0=
X-Received: by 2002:a17:90b:3d1:b0:26d:506e:24a3 with SMTP id
 go17-20020a17090b03d100b0026d506e24a3mr577997pjb.38.1692352957042; Fri, 18
 Aug 2023 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230818090224.409192-1-chigot@adacore.com>
 <20230818090224.409192-4-chigot@adacore.com>
 <CAFEAcA_1SdA_BH_u01FAYaZkABbCB2EcSf329=-GpZ2canjP7A@mail.gmail.com>
In-Reply-To: <CAFEAcA_1SdA_BH_u01FAYaZkABbCB2EcSf329=-GpZ2canjP7A@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Fri, 18 Aug 2023 12:02:26 +0200
Message-ID: <CAJ307Ei_nx9T_p105W7hR8JTuosHQ2WXf7Pn=qELG=Y59nt7EA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gdbstub: replace exit(0) with proper shutdown
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=chigot@adacore.com; helo=mail-pj1-x1033.google.com
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

On Fri, Aug 18, 2023 at 11:10=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Fri, 18 Aug 2023 at 10:03, Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
> >
> > This replaces the exit(0) call by a shutdown request, ensuring a proper
> > cleanup of Qemu. Otherwise, some connections could be broken without
> > being correctly flushed.
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> > ---
> >  gdbstub/gdbstub.c |  3 +--
> >  gdbstub/softmmu.c | 11 +++++++++++
> >  gdbstub/user.c    |  2 ++
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> > index 5f28d5cf57..358eed1935 100644
> > --- a/gdbstub/gdbstub.c
> > +++ b/gdbstub/gdbstub.c
> > @@ -1298,7 +1298,6 @@ static void handle_v_kill(GArray *params, void *u=
ser_ctx)
> >      gdb_put_packet("OK");
> >      error_report("QEMU: Terminated via GDBstub");
> >      gdb_exit(0);
> > -    exit(0);
> >  }
> >
> >  static const GdbCmdParseEntry gdb_v_commands_table[] =3D {
> > @@ -1818,7 +1817,7 @@ static int gdb_handle_packet(const char *line_buf=
)
> >          /* Kill the target */
> >          error_report("QEMU: Terminated via GDBstub");
> >          gdb_exit(0);
> > -        exit(0);
> > +        break;
> >      case 'D':
> >          {
> >              static const GdbCmdParseEntry detach_cmd_desc =3D {
> > diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> > index f509b7285d..9ca7ae10bc 100644
> > --- a/gdbstub/softmmu.c
> > +++ b/gdbstub/softmmu.c
> > @@ -434,6 +434,17 @@ void gdb_exit(int code)
> >      }
> >
> >      qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
> > +
> > +    /*
> > +     * Shutdown request is a clean way to stop the QEMU, compared
> > +     * to a direct call to exit(). But we can't pass the exit code
> > +     * through it so avoid doing that when it can matter.
> > +     */
> > +    if (code) {
> > +        exit(code);
> > +    } else {
> > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +    }
> >  }
> >
> >  /*
> > diff --git a/gdbstub/user.c b/gdbstub/user.c
> > index 5b375be1d9..f3d97d621f 100644
> > --- a/gdbstub/user.c
> > +++ b/gdbstub/user.c
> > @@ -113,6 +113,8 @@ void gdb_exit(int code)
> >          gdb_put_packet(buf);
> >          gdbserver_state.allow_stop_reply =3D false;
> >      }
> > +
> > +    exit(code);
> >  }
>
> These are not the only places that call gdb_exit().
> Notably, qemu_cleanup() calls it, and I'm pretty sure
> it does not expect that gdb_exit() will either call
> exit() or qemu_system_shutdown_request(), because it's
> already in the process of cleaning up and stopping
> the system.

Indeed, I did miss that. I used to have it directly in
gdb_handle_packet and in handle_v_kill. But now that the support of
softmmu and user has been splitted, I thought putting it in gdb_exit
was a solution.
However, IIUC the code, the second request will simply be ignored, the
main loop (where the requests matter) have been already exited.
I see what I can do anyway to avoid this double request.

> If we send the "we're exiting" report to the gdb process,
> that ought to be sufficient. If we're not actually managing
> to send that last packet to gdb because we don't flush
> the data out to the file descriptor, then it seems to me
> that the fix ought to be to ensure we do do that flush
> as part of gdb_exit() not to rearrange or try to avoid
> all the subsequent calls to exit().

Here, I'm seeing the symptoms with a gdb connection being closed too
sharply and a fd not being flush. But looking at the qemu_cleanup(),
many things could require a proper cleanup which will be skipped by a
simple exit(0). This could lead to many unexpected side effects.

Thanks,
Cl=C3=A9ment

