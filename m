Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbne7-0004yq-AF
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 12:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbndw-0004uR-2V; Thu, 21 May 2020 12:02:02 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbndk-0004Y6-27; Thu, 21 May 2020 12:01:55 -0400
Received: by mail-io1-xd44.google.com with SMTP id k18so8035014ion.0;
 Thu, 21 May 2020 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTHTIfmNBf76SWC/ADq3fQt/dNmanjgMWjPMSWG66gs=;
 b=qVUMJPylQt/gJadtzON+UgGN3yxHKWAuBvi+M/QNmmIr0YafgmDoPMd38Xe9B+WVsc
 Q4AOScajlmB7LHlxQKpo6+9AP+bU9ZBReDWjH+ivTjdsk4xaAkD7lNqpKnXy5oFl5/AP
 Hj0pqJBloT5QhlGKSzBsihOiY1sI0Dys86wcKOLDIdXoaat+tXgmer5qU3J7lD3rGGfy
 CZsbGkv7ycKN+nifbqRXEetoDbMPjfBfDWO/ZKisZHuGt5l7kiPSVl7Zd5OAqDlIAhcn
 6BxR113UioExTivMxTia4ezbTXid+vu4jeSjqKNOS9exLou2KdejXoba6BFg18sNkfXx
 mv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTHTIfmNBf76SWC/ADq3fQt/dNmanjgMWjPMSWG66gs=;
 b=nE8bvZZMQObKIPTEM1cS43nsIBuSJbLrP5g8kIQD+VM4nmvHRVCoeEZqderEjvL0HI
 3l4560Yv46eOOJnX5V0pD8YAZExu0H109uBSrsLcCWR61ZndrCg2pSY5wK8ap8G8uH9Z
 i/V4L0/AqiK7qQnRoLzKx5fUtX4YSwtICmBgGi0ay2gSUm+H9mrx3ZJcV/FTHqPhf7C0
 XaCphPJalgOHMTfK/lHwsQoTOfSuhI/WrofSL0DxqlsInSL7XeJMNSc0H3pDFDg0lq5H
 nKizEVvfpXgVEx8DG1OePtIPfZQtWKFdhNZw9TEIp4zS1aVowRes/iSoTfDf6devbCdr
 o1Wg==
X-Gm-Message-State: AOAM531lT50t0blgIjq1R6p2SGj8nw8m2LeRHxkr7lmLzD36TWSjcq+E
 qA6P1lyzFXkfsZYePHB/ShY0zWjPXVViwHM/66I=
X-Google-Smtp-Source: ABdhPJxShgMMu6A9SuWD+GwsjM+R6WUkYtn2izYoMLlACqvJATUUwqIePO/5/IjZg7uW3tDJTen+9mypvMCOmPqkNjg=
X-Received: by 2002:a02:a118:: with SMTP id f24mr4530548jag.8.1590076906254;
 Thu, 21 May 2020 09:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <1588335545-649-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKMdmVrvYDNVtm6_iviDT_mofGZO9DC2vtZdZaHN31T07A@mail.gmail.com>
 <CAKmqyKO6HGQrMxsNovPkoB4TncEmeD=uFV_oXEpQ0t+=g20Wfw@mail.gmail.com>
 <CAEUhbmVTg+521EHutukOod_PKx0RQ-s=EgnKu=JM-vduMn4mNA@mail.gmail.com>
 <CAKmqyKPdjBFmPcQY+O4zsaTHYeLVC9zanXhS5CBovfn4LLRdJg@mail.gmail.com>
 <CAEUhbmXPRN=1QCfr=ekG_m5wiWkQoG7pb-OzR-guixRutYJOEg@mail.gmail.com>
In-Reply-To: <CAEUhbmXPRN=1QCfr=ekG_m5wiWkQoG7pb-OzR-guixRutYJOEg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 May 2020 08:52:50 -0700
Message-ID: <CAKmqyKO+Yowc57izjx_5V6u8ncj1VZ897dTQNmkhWi9yT-PESg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Change the default behavior if no -bios option is
 specified
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 16:02:10 -0000

On Wed, May 20, 2020 at 6:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, May 7, 2020 at 5:02 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, May 5, 2020 at 6:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > On Wed, May 6, 2020 at 6:37 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Tue, May 5, 2020 at 1:34 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > > >
> > > > > On Fri, May 1, 2020 at 5:21 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > Per QEMU deprecated doc, QEMU 4.1 introduced support for the -bios
> > > > > > option in QEMU for RISC-V for the virt machine and sifive_u machine.
> > > > > > The default behavior has been that QEMU does not automatically load
> > > > > > any firmware if no -bios option is included.
> > > > > >
> > > > > > Now 2 releases passed, it's time to change the default behavior to
> > > > > > load the default OpenSBI firmware automatically. The firmware is
> > > > > > included with the QEMU release and no user interaction is required.
> > > > > > All a user needs to do is specify the kernel they want to boot with
> > > > > > the -kernel option.
> > > > > >
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Thanks!
> > > > >
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > >
> > > > > Applied to the RISC-V tree.
> > > >
> > > > This fails `make check`
> > > >
> > > > qemu-system-riscv64: Unable to load the RISC-V firmware
> > > > "opensbi-riscv64-spike-fw_jump.elf"
> > > > Broken pipe
> > > > /scratch/alistair/software/qemu/tests/qtest/libqtest.c:166:
> > > > kill_qemu() tried to terminate QEMU process but encountered exit
> > > > status 1 (expected 0)
> > > > ERROR - too few tests run (expected 7, got 2)
> > > > make: *** [/scratch/alistair/software/qemu/tests/Makefile.include:637:
> > > > check-qtest-riscv64] Error 1
> > > >
> > >
> > > Please apply this patch to fix the "make check" as well.
> > >
> > > [5/5] riscv: Suppress the error report for QEMU testing with
> > > riscv_find_firmware()
> > > http://patchwork.ozlabs.org/project/qemu-devel/patch/1588348254-7241-6-git-send-email-bmeng.cn@gmail.com/
> >
> > In future please send all related patches in a single series.
> >
> > I have applied those two patches.
>
> I checked https://github.com/alistair23/qemu/ but could not find where
> these 2 patches applied. Just make sure I was not looking at the wrong
> place?

That's the right place, I just hadn't pushed it there yet.

I have an internal Git instance that does all the testing so I usually
push it there.

Alistair

>
> Regards,
> Bin

