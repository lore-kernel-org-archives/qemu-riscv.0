Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o4Fex-0007cO-Pq
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jun 2022 01:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o4Fet-0007bL-UI
 for qemu-riscv@nongnu.org; Thu, 23 Jun 2022 01:45:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o4Fer-0004nz-Ha
 for qemu-riscv@nongnu.org; Thu, 23 Jun 2022 01:45:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso1511696pjg.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jun 2022 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWz0LA67r29wjHthfsOu8xny+5yYxBCD/ywrDtdUDjk=;
 b=EaZ4rO3qp3uh5OsiAjzDUtkAz1n5wl+qCsGNn/yplF9lmQTbIQSzwWeyQOVtzyxY/0
 DbRJMZpjBkXdJjR7hwSF+Rk5ZXLyGCXDcA9p1znpzYnR7LgntlQyjCEVwXfQYPrBVOAf
 hX5g0wUEPJoN+AnrHIeXI0IKzUK9Ds8m8zCtmnIDlQ2M8VvJDP9phIuop4BM1jzVLBzq
 GwmEuSuscvg7w7oanIlCCVbi5WxVS17bMz7P10WX5z+iRuAQg1j58//lqVZplcJdfnH6
 TdlYina32YMCyJ6cRVQFBdIKxpenRpJsityBhmUsXhbmzbl41AAK5aaxi47vreEAa1fC
 6Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWz0LA67r29wjHthfsOu8xny+5yYxBCD/ywrDtdUDjk=;
 b=RjMrqGdC1YtlsrCK2fD/LEUvL3BAs67BuDHJKLOs6x0DKyykfx/ZSggPb3QsZutkH0
 7QyF27O39ePYAUQJFxpRUsVwc4qAx917TmLyru0xcejlxVJNCviPKWjjtLhqkgXWe5xi
 Z7/a8fL2xTfXNYhHXW5XKeCGoOfB+DlOmt0GCyHM1sZYqSc6sh6e6qWoSiGQ+LbSq22W
 BxUbtXGa2HUWB7iV4LH/fRn0/94JycqeHET4Y9ESmKf8ct/L4A/mFfpsMiHPgLWRgdBx
 IuCzMizBARSQPa4ium3puSmHSYviQVciDNBuqGbqIKjRN1MfKta7wG+A87LxBDK7lkFF
 N81Q==
X-Gm-Message-State: AJIora8nMmSppacKxJXmpHQ9rGeOwZAIXKHzyEifqITlAytWAuQ7YQWN
 iR2eJIxr5+Gnzhby3RaEFFjxkfZvJKvCUyEvtUvLFA==
X-Google-Smtp-Source: AGRyM1tOW/UiRItsacpDLwCF4FqrZ6ZhyfXT2rtPrTJyjmlvYuLnk455aFYcYPwipYJjkvYYH7zdpOHonAKEOpGax+I=
X-Received: by 2002:a17:902:e747:b0:16a:58f2:1d1e with SMTP id
 p7-20020a170902e74700b0016a58f21d1emr1660304plf.17.1655963134621; Wed, 22 Jun
 2022 22:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
 <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
In-Reply-To: <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 22 Jun 2022 22:45:23 -0700
Message-ID: <CAHBxVyHd4LXAv6OY7mOzAbfww8tMxARpgTkrx2LBJc9_UCbNfw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jun 2022 05:45:40 -0000

On Wed, Jun 22, 2022 at 9:15 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 4:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > +Atish
> >
> > On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > We previously stored the device tree at a 16MB alignment from the end of
> > > memory (or 3GB). This means we need at least 16MB of memory to be able
> > > to do this. We don't actually need the FDT to be 16MB aligned, so let's
> > > drop it down to 2MB so that we can support systems with less memory,
> > > while also allowing FDT size expansion.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  hw/riscv/boot.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > index 57a41df8e9..e476d8f491 100644
> > > --- a/hw/riscv/boot.c
> > > +++ b/hw/riscv/boot.c
> > > @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> > >      /*
> > >       * We should put fdt as far as possible to avoid kernel/initrd overwriting
> > >       * its content. But it should be addressable by 32 bit system as well.
> > > -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> > > +     * Thus, put it at an 2MB aligned address that less than fdt size from the
> > >       * end of dram or 3GB whichever is lesser.
> > >       */
> > >      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> > > -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> > > +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> > >
> >
> > @Atish Patra  may have some pointers about the 16MiB alignment requirement.
>

Sorry. I missed this patch for some reason. 16MiB alignment was just
chosen as a safe option.
We couldn't put it at the end of DRAM and I just wanted to place it at
 a reasonable distance.

2MB should be totally okay.

> Any thoughts?
>
> Alistair
>
> >
> > Regards,
> > Bin

