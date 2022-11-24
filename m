Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyM6W-0005lB-RZ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 18:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyM6V-0005kh-NH; Thu, 24 Nov 2022 18:58:03 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyM6U-0003Yd-6M; Thu, 24 Nov 2022 18:58:03 -0500
Received: by mail-vs1-xe31.google.com with SMTP id l190so2755870vsc.10;
 Thu, 24 Nov 2022 15:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AMaCs/Z1AyVsS1nxWxcV3PxL+cpyQViP/5WbDkpLjoA=;
 b=LDj2zRmE0c50zQLXWC0tcXX8yMGpMbvgs6sfrgp/Huj2MzBoA3ryHz0MSmbZVgS16o
 j29rUC29Tjk+QWqFSuUgQJACwua1raBOCo260qkv3Sb+wJl6+e/jzGIzx4fZwy+BwUMB
 n5jj1Yqou43jHiHoT4hLILjVApqShwc41Yk03cKcglZXYdyqvbaOq1PHkMp5hPk69fPb
 ST9sxkwhrIz4rOGC/C76BbUhoMtNhiY+EAsBnbWf8gv8pwvj0oQxV7pKcQd7lEr+/XFy
 pk+F1Z82H9ruElZCn4mpPeVSkQEo9U9r/yWZX+6dzJ7a8Pwz+NtnxJCOuQFBBZLzf015
 mHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AMaCs/Z1AyVsS1nxWxcV3PxL+cpyQViP/5WbDkpLjoA=;
 b=od70FDnpp65Sgmhkp6EO1oBqDKO5nde/o5DmPtvijOcjwHimQtGU81nmIy9mVOh6wX
 +1iP9n5z3s3yq7+3yyurygT+7lz9IsSI2LBPEnUOfo6VEI25NxpB2RRIHSgiPW9MZbaQ
 Rv/BJ7Ja9jp+9sL6R4chCUfArP/2nRo06fQKoyyqn/rXRdHmH1BE/dq7nKJ9Q3r1sX6Y
 ASv+lsrBljZ8jphZEtU85+5WN5ljbDts5gGcuE5a+dQLaGGU/yLNRUZN7E7K8WT1O7f/
 WpAyu6L2YDEArMtnIMhylYUmtXQK/XfI9MrdksmtcKHa751IIlwGWJ72RUDjREGUVJ3J
 6+lw==
X-Gm-Message-State: ANoB5plAWvghigOTOkOaAgzW7J8XBhdhC/V3IP7gYSyVP7zAQXB1tITi
 bOoi49ER0xDJ7bFSxALEWdFBiynD5Q/o6N5Qp2Q=
X-Google-Smtp-Source: AA0mqf5Sm2sP9RfszRlq7hlfHJqIixZIXGTCPmzvFGfJOsP53n5rYvZTWWDKaCWUC/XL08MSm2FW+MK5KxxzA7BBsTs=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr18927594vss.64.1669334280531; Thu, 24
 Nov 2022 15:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20221122154628.3138131-1-bmeng@tinylab.org>
 <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
 <CAEUhbmXFwhpFv=PwEJBfYsbiViuB=GE_4r6MCjfBQ+UpHgkhqA@mail.gmail.com>
In-Reply-To: <CAEUhbmXFwhpFv=PwEJBfYsbiViuB=GE_4r6MCjfBQ+UpHgkhqA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 09:57:34 +1000
Message-ID: <CAKmqyKNoHFfABeWqatGSzTAkPr8FZubnOMwU-rFsSj91g2f37g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 23:58:04 -0000

On Wed, Nov 23, 2022 at 2:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Wed, Nov 23, 2022 at 8:03 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Nov 23, 2022 at 2:07 AM Bin Meng <bmeng@tinylab.org> wrote:
> > >
> > > sstatus register dump is currently missing in riscv_cpu_dump_state().
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
> > > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > >
> > > ---
> > >
> > >  target/riscv/cpu.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index d14e95c9dc..80d76f0181 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > >              CSR_MHARTID,
> > >              CSR_MSTATUS,
> > >              CSR_MSTATUSH,
> > > +            CSR_SSTATUS,
> >
> > I don't think we need this. mstatus contains all of the information
> > already and there is limited space to print all of this information
> > out.
> >
>
> I am not sure what limited space restricts this? This is CPU state
> dump, and printing sstatus CSR seems reasonable to me. We do the
> similar thing in the gdb stub too.

Limited space in that there is only so much text we want to dump to
the screen. As new extensions are added this will continue to grow,
and sstatus doesn't provide any more information then the mstatus
register that we already show.

GDB is a little different as people can interactively probe the
registers they are interested in.

Alistair

>
> Regards,
> Bin

