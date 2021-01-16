Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0pjH-0008Fm-2n
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 12:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0pjF-0008EH-0C; Sat, 16 Jan 2021 12:51:13 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0pjD-0007fL-E3; Sat, 16 Jan 2021 12:51:12 -0500
Received: by mail-io1-xd35.google.com with SMTP id e22so24608054iom.5;
 Sat, 16 Jan 2021 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCh2shL2KOKnU0/0NoSqFfNY1k10Gvr85WCrafsCPN8=;
 b=DGdpl6bEvcLgwLynBDCC5VyjIm2YqRwoN2Ri1bHMqR/tmNnT+PMJt7QZxgrr5+tCbd
 PiTjgrta8r5YRZiq/tCIT9lrVKFPjUw/8rinVOUkqsyUgFTPQej/+wIxwcGzC8F8OFaq
 e188z26J7i3htJy6N8SxJjdvwdoifRaQInQUGICf28wtNk9cPHcmdJpiSNM7fIFwBbtz
 C0YZ+sXUJTQtzsUVZnJ8izu/IBMJ6wcSstHqx+mWM2H51dcgYMC70FY+1kcWwtqj8AO3
 RqLCmrQ1lz9IsZ2YjmZNHGVL0E81oxaIctzhFUbgpylYoYY25RCAdO0Ncn4/oom4NJfY
 0WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCh2shL2KOKnU0/0NoSqFfNY1k10Gvr85WCrafsCPN8=;
 b=H0MbXBd/CGBHHj+AJtV6NxdWewfSl7vDqLk7cHLDIY0J0WCEylvVle9Gf1b/XH1Azq
 lATxgIx2DDgsYPQH5yorLOf64Of3YACC8CCOIkMpfdXEsF6eJYt7XpbyvOMx3/e5Xptv
 A4Q2a73xSYfKeSqVY5twkZ70dfq6UZyWI3LwhUHdcMRnMK8UXvR/b8jvLIl2wpLycAru
 0GSWzzjcRfxUDemseNSysIxpPicF3xqp78ctnbtT/3TT+9FkW28QAccXHOOcScqgb2lZ
 RlVWP6LumgyorNVSUgOMSOH7JLSOLGrSmzM3hPmyMVPBIXDIis6qxFKx/RoP2tuYRXH8
 NgdA==
X-Gm-Message-State: AOAM532wNKvDISbXCMFc62C3VqP0Ty9f3n35cJtpLpw+lvFY14oBPWwS
 rIobK5/TXQ46dhezGYzNn0neRLwSD7eqhcKfEkY=
X-Google-Smtp-Source: ABdhPJxxXJId63mWUj58b5K/BoE2QiKcBWuafyWDPFXUBbsgG1mJYm6MRgwBPyssi8P2Ztlbybx+hxKqyn52BA2h32w=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr6567289ilv.131.1610819469560; 
 Sat, 16 Jan 2021 09:51:09 -0800 (PST)
MIME-Version: 1.0
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
 <CAEUhbmWC5CDqK3QuuLY9PFAxr=OcePsJqsUQjhw3em5GOH+Ccg@mail.gmail.com>
In-Reply-To: <CAEUhbmWC5CDqK3QuuLY9PFAxr=OcePsJqsUQjhw3em5GOH+Ccg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 16 Jan 2021 09:50:42 -0800
Message-ID: <CAKmqyKNV0v9RJ_57UrD9Xsnexh9SMh47VZ2Zsp0xQXN0i9-3sg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jan 2021 17:51:13 -0000

On Sat, Jan 16, 2021 at 8:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Jan 16, 2021 at 7:00 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > We were accidently passing RISCVHartArrayState by value instead of
> > pointer. The type is 824 bytes long so let's correct that and pass it by
> > pointer instead.
> >
> > Fixes: Coverity CID 1438099
> > Fixes: Coverity CID 1438100
> > Fixes: Coverity CID 1438101
>
> Where can I look at the Coverity report for QEMU?

I don't think you can. I think there are only a few people who can see
them and they just report them to everyone else.

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/boot.h |  6 +++---
> >  hw/riscv/boot.c         |  8 ++++----
> >  hw/riscv/sifive_u.c     | 10 +++++-----
> >  hw/riscv/spike.c        |  8 ++++----
> >  hw/riscv/virt.c         |  8 ++++----
> >  5 files changed, 20 insertions(+), 20 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Alistair

