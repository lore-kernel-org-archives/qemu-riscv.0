Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o4EFF-0001tG-HA
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jun 2022 00:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o4EFD-0001t3-UB; Thu, 23 Jun 2022 00:15:03 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o4EFC-0008Og-00; Thu, 23 Jun 2022 00:15:03 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d129so17977055pgc.9;
 Wed, 22 Jun 2022 21:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eN6dbIbFIVd3cwePYcnosVGmg3QBrIR12t+VTFoleF8=;
 b=HVhNEmdIU7JhwKJ3T1Gcu8GQk3zMHoYlJM5PKDUnE8bMxjDX+oL3T6pYbUGGYX3HKp
 eqgAcswqsvcLlA+kjrOqb6NdNMzVcJqfhYTSHcy0oiV3CsQqTO+ycOUMmpyAHDvhQUnW
 yCXjU2B2ZAcGHpZsoBdI8QxPdZckHkxrnrpffbWzLQDzC6dwQYyRBVjtzUeZQc8As1Y7
 FXX2cGOuGX4V20B8BAv0vgisyzxfLio/LEpSFPii2TIjLlSgzdzjtiTtCYdlaaxJz1M+
 a+TBQRdv1wRk5eO3q2B7KsGBJFEBOoWfOoMpr+qmaC/5XOokA9BjT5BQFOqIe6oLw58O
 CaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eN6dbIbFIVd3cwePYcnosVGmg3QBrIR12t+VTFoleF8=;
 b=Dt2yP35JivbFb0H0rsm/PMNVDJBfU8GZ5hJtaJ6UZUgE0sNsPg/6n+lj54TZ39rh4E
 mgG7KSfAm13HPsx6eIiyJTGgNePlwuRsr5IU+AaNdeH1XIJDF0A2UPSJfX+7ba2PMym0
 5oaWEMGS1MbVXwFcRZQR71b9mH6nofpDgTXjqiQXMQdxZ9toQqyhkM0g3cz+VK0eOWNR
 AmtobuZJdpIFlqNKLBC9HTuo88m0PFoFwQ0l4zP9TMG1xqBmiZaHmo9b3H9qMrfoPIOs
 Rz1IRemNV9Aosn///LIUk0FESSAcJ3oAReCHLQqm7RJq+gtoRr7mKR0EZns+1Vlpn7fp
 sG9A==
X-Gm-Message-State: AJIora+zhc2PDzxhGljGSWEOiAyOAgJ2ZBrClw3oRdNF6PYa1MIEPpFd
 kVMT7McVAIymnQMtqhDRzVm0UVFzFvUSn0pyWw8=
X-Google-Smtp-Source: AGRyM1t8SbHPSJPD/+x5lE1dBQlfdy/sEtHefuPEQB2rAoTzwhkiaJBrBD1LZPMJ6CFIyFEUljnZvC/2RyyBGudJrcI=
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr39204028pfu.79.1655957698578; Wed, 22
 Jun 2022 21:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
In-Reply-To: <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Jun 2022 14:14:32 +1000
Message-ID: <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Atish Patra <atishp@rivosinc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jun 2022 04:15:04 -0000

On Wed, Jun 8, 2022 at 4:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +Atish
>
> On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > We previously stored the device tree at a 16MB alignment from the end of
> > memory (or 3GB). This means we need at least 16MB of memory to be able
> > to do this. We don't actually need the FDT to be 16MB aligned, so let's
> > drop it down to 2MB so that we can support systems with less memory,
> > while also allowing FDT size expansion.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 57a41df8e9..e476d8f491 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> >      /*
> >       * We should put fdt as far as possible to avoid kernel/initrd overwriting
> >       * its content. But it should be addressable by 32 bit system as well.
> > -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> > +     * Thus, put it at an 2MB aligned address that less than fdt size from the
> >       * end of dram or 3GB whichever is lesser.
> >       */
> >      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> > -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> > +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> >
>
> @Atish Patra  may have some pointers about the 16MiB alignment requirement.

Any thoughts?

Alistair

>
> Regards,
> Bin

