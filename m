Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jmAIH-0004Og-0e
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jun 2020 02:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jmAIF-0004K9-9G; Fri, 19 Jun 2020 02:14:27 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jmAID-0007Uy-I9; Fri, 19 Jun 2020 02:14:27 -0400
Received: by mail-il1-x141.google.com with SMTP id a13so8261807ilh.3;
 Thu, 18 Jun 2020 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eebD7N5iZMNvpDSTRHabX8tggHEe3JXaxwj/8p+1Dw=;
 b=lvdKQOVmQ3A8+k2jEXA1OzFs8k4UsI8TasG/9Vn3EE1S+KWd9DSwZcuW7dtIj/wNLG
 zY65lNwXbREb5OWmUMyXDkxPa+GIwgHNpQOhpy4vLEDivCyk0g0UqL94v+HQgAa9VekA
 gqOyRGV8L9dPgyzFhQM1YJKGaMZNJECVTC8Iv92ZLOcK/WjUF2hQsJtDpo+hd7+nwLKm
 nDqpNiTOs7WMAAOUMqAFXmyjKWiE4DBBjLWX/ppsKALAVAScVJwlxaAB0BjO+NtOwCg9
 QRwjePp0IXQks0NOHXuPlIuTdAYBAgFsgTPotCStKNk/Cdrwsyjkt22+DCRvWpc6pfUO
 9Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eebD7N5iZMNvpDSTRHabX8tggHEe3JXaxwj/8p+1Dw=;
 b=ZFdJJLjSD9sG+pg8lMiKB/oVEz6r2eq41f/7v3BWYlUupSyE5O2Zs7AqG+b6fXMAbJ
 HA+mEN+8lX1jgrPMMQui9hqtXeAORBDyLVr8aXIXrLzJGlhobvN+QGdqOWvuWrv/hpyC
 Qn6Ar7ABo6VgpyuSdGWtVkTfsshH4X/2VNy7+KAjgaeOYZs2lZRJ5J04vozm+i2jp0VV
 4uPJAIsO1TYNRt5vwCOne23tB3LRriU07RW5ER7cEupYTHNzzxaQrIetNBipl86Y5Q8m
 LPRIVgXJMU1yA+eGnp1rLvUuLmNAF95WP1FS0/Pt3WDDVtUaMkFXPb+2EgOocr5T8tXm
 zUDw==
X-Gm-Message-State: AOAM533MQ2lXS+pwvnsKkANnS0XIWlkfc0n13LvV689VoJfg4eJHpF5u
 iqqWRUAlm6JHV8cXYsqNuEU81430vLHIqrGnjEE=
X-Google-Smtp-Source: ABdhPJz4lC21EcdKd3OMrB/N9cUXHCfcBeMxbrZhhawF7RW64BlzShXWKYFAudWwRo7C4Odd1IqYxryoiSRSIfo5Glw=
X-Received: by 2002:a92:d647:: with SMTP id x7mr2165462ilp.267.1592547263870; 
 Thu, 18 Jun 2020 23:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
 <1592268641-7478-3-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKNovTf3F+t9WFCWXvAgT_CRa5dbDuQExzbqxkM-z3ufqw@mail.gmail.com>
 <CAEUhbmVq8kVfZRQSF-LT_bDib9e1xBL-7zifmHpQgdvehcNzFA@mail.gmail.com>
 <CAEUhbmU3ouNn=PfXLwZx_Pu49zmWY1ddsSqKONdh6X5atXcncg@mail.gmail.com>
In-Reply-To: <CAEUhbmU3ouNn=PfXLwZx_Pu49zmWY1ddsSqKONdh6X5atXcncg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Jun 2020 23:04:57 -0700
Message-ID: <CAKmqyKN+QjohXJQ81Tpu9+VDzgAHVbyOKs-vxC3d7wGvZKMWvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/riscv: sifive: Change SiFive E/U CPU reset
 vector to 0x1004
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 19 Jun 2020 06:14:27 -0000

On Wed, Jun 17, 2020 at 10:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, Jun 18, 2020 at 8:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Thu, Jun 18, 2020 at 12:40 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Mon, Jun 15, 2020 at 5:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Per the SiFive manual, all E/U series CPU cores' reset vector is
> > > > at 0x1004. Update our codes to match the hardware.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > This commit breaks my Oreboot test.
> > >
> > > Oreboot starts in flash and we run the command with the
> > > `sifive_u,start-in-flash=true` machine.
> >
> > Could you please post an Oreboot binary for testing somewhere, or some
> > instructions so that I can test this?
> >
>
> I have figured out where the issue is. The issue is inside the Oreboot
> codes that its QEMU detecting logic should be updated to match this
> change.
>
> I've sent pull request to Oreboot to fix this:
> https://github.com/oreboot/oreboot/pull/264

Thanks for that.

>
> > >
> > > I have removed this and the later patches from the RISC-V branch. I
> > > want to send a PR today. After that I'll look into this.
> >
>
> I don't think we should drop this patch and later ones in this series.

Applied again then.

Alistair

>
> Regards,
> Bin

