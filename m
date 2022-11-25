Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyQOp-0003zy-Ba
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 23:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQOn-0003zk-LJ; Thu, 24 Nov 2022 23:33:13 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQOk-0006XI-TQ; Thu, 24 Nov 2022 23:33:13 -0500
Received: by mail-vs1-xe29.google.com with SMTP id d185so3174377vsd.0;
 Thu, 24 Nov 2022 20:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GN5X4gYOM3C6Gc64wIOM3IsrqwoK2gNJp5pdVzLmXRc=;
 b=e+bZ0ZadYL/tcZBIP4w5Ne/KCIVDLk7pF7L0oFpF1dO5Ir1BgjOmsA3Jgf99HERuds
 RQeT83o0i8H9KFN3UrvGpG2moatLMYg0qcCS5nkHxNS+NPk07gNLEH9Xu1IcRZChnQrt
 oaRLDneWZ+C0Yql0Vsdh0ppxtIqSqJhfHxl4++rW2xmMW3tY3DA/idn3f6G0pE7t7W+X
 RpRrSM0gu61c36r93bL97I5PcA/gSbq0RPt7eeHEBaBCM3UC46aj3X5PW0KSJ04esewT
 XSx2jzcAzbK3d2igghYQ3X2YUy/6nJpTAdTWa3j5JdAYgvAqx8goISo4S16kFI/tNq4L
 YWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GN5X4gYOM3C6Gc64wIOM3IsrqwoK2gNJp5pdVzLmXRc=;
 b=asLUx3NFO2Njf+yICPG5aJT1Cg4GwJc69cuJE0JGZmBeCIlTU20zUexUzvqNdntGc3
 i/f5VZ0omDipL8/7jbDzkSTn4qyCZlQOp7aRqyM68iUnGaX9o4swUmAS87LX/o80ctNI
 mvb1LvS9cCqX/km4LqKltLafmh/BWzNWqjDsuKvBhLqRBhRf3TwHKDZ3iojdG797agPz
 X5nzMVfEvyvC3SiKkLS5S0bpPWuqsBHvuzEvuYWLr6Manz7XOVmK4RPTjhd8bgFDEp1d
 VfpWfCeieGL+AsQ6PWK2dtVUl3kZ/gz97EbS3zA/59Gd2zIYEAfBcFDXwAhP/chPZe/E
 pyGw==
X-Gm-Message-State: ANoB5pnWGhRqOXGrclTh7R5RzTU81ogYWAghvPz4M7FWm+quQMjrAP+p
 YLt4z8sfUJbxzjPZpSyq9UibEDb5YBy2c8YzxtI=
X-Google-Smtp-Source: AA0mqf5evVei5GcdMMqEqBOWqGokbNIYvTvAYtt4bm8gMM3DjVT/ZzLT0+1jXjHHKEOcP5H+CsjELVLoeQbqs5Dlvco=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr8897329vsv.72.1669350789216; Thu, 24 Nov
 2022 20:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20221122154628.3138131-1-bmeng@tinylab.org>
 <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
 <CAEUhbmXFwhpFv=PwEJBfYsbiViuB=GE_4r6MCjfBQ+UpHgkhqA@mail.gmail.com>
 <CAKmqyKNoHFfABeWqatGSzTAkPr8FZubnOMwU-rFsSj91g2f37g@mail.gmail.com>
 <CAEUhbmUVL3qsyxJ8OATfM9mYGSB50bMZXpVkEBRV=O8_M0Y1zA@mail.gmail.com>
In-Reply-To: <CAEUhbmUVL3qsyxJ8OATfM9mYGSB50bMZXpVkEBRV=O8_M0Y1zA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 14:32:42 +1000
Message-ID: <CAKmqyKO+JbjkghE3VN2kcrv4WTyFBGaBg154Opnb8vxRcKmofQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 04:33:14 -0000

On Fri, Nov 25, 2022 at 1:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Nov 25, 2022 at 7:58 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Nov 23, 2022 at 2:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > On Wed, Nov 23, 2022 at 8:03 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Wed, Nov 23, 2022 at 2:07 AM Bin Meng <bmeng@tinylab.org> wrote:
> > > > >
> > > > > sstatus register dump is currently missing in riscv_cpu_dump_state().
> > > > >
> > > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
> > > > > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > > > >
> > > > > ---
> > > > >
> > > > >  target/riscv/cpu.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > index d14e95c9dc..80d76f0181 100644
> > > > > --- a/target/riscv/cpu.c
> > > > > +++ b/target/riscv/cpu.c
> > > > > @@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > > > >              CSR_MHARTID,
> > > > >              CSR_MSTATUS,
> > > > >              CSR_MSTATUSH,
> > > > > +            CSR_SSTATUS,
> > > >
> > > > I don't think we need this. mstatus contains all of the information
> > > > already and there is limited space to print all of this information
> > > > out.
> > > >
> > >
> > > I am not sure what limited space restricts this? This is CPU state
> > > dump, and printing sstatus CSR seems reasonable to me. We do the
> > > similar thing in the gdb stub too.
> >
> > Limited space in that there is only so much text we want to dump to
> > the screen. As new extensions are added this will continue to grow,
> > and sstatus doesn't provide any more information then the mstatus
> > register that we already show.
> >
>
> On a screen, yes, but we can log to a file so there is no size limitation.

And this function is commonly used as part of the HMP `info registers`
command. Which is dumped to the screen.

>
> > GDB is a little different as people can interactively probe the
> > registers they are interested in.
>
> The dump routine is one of the debug methods too. If gdb stub provides
> $sstatus directly I think we should do the same for dump_state for
> consistency. Otherwise we can just provide $mstatus in gdb stub and
> let user figure out sstatus value.

I feel like GDB and text register dumping are different debugging tools.

When using GDB a user should be able to probe all of the registers.
They can read/write to the CSRs and write scripts to interact with
them if they want.

When dumping the CPU state as text, we can't dump all CSRs. There are
too many, it becomes unmanageable. So we have to select a small number
that are the most important and most useful. As sstatus is a copy of
mstatus, which is described in the priv spec, it seems redundant to
print the same information twice.

I feel this list is only going to become longer and longer as we
enable other extensions, so we should try to avoid populating it with
redundant information. It is always clear what bits are propagated to
sstatus, as it's described in the spec.

Alistair

>
> Regards,
> Bin

