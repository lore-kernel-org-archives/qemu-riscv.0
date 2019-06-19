Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdhlX-0006CA-4H
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 17:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hdhlS-0006B8-UV
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 17:05:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hdhlR-00058d-MC
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 17:05:06 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hdhlI-0004VF-Vc; Wed, 19 Jun 2019 17:04:57 -0400
Received: by mail-lj1-x242.google.com with SMTP id 131so585794ljf.4;
 Wed, 19 Jun 2019 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zVaF0JjBdEd/4wIOWuHmkCNVxJRgNVPs1CRVDceolEU=;
 b=WZEdBg9A8A8XBhIMFfru8hmtsn2zIfdTTkXCuxqy/3HIhY/gIYSc1vpyUqI1nbEkBU
 3O6EDmWDFPQ8dEP4pPN9w0ZOJ5Tuu2N1NiM2/7Sj521cMLgxr+51kSAAThcR+lzfC4ER
 8YjxQy7xBz9Cvc/k5INyRRiTo5478EYM4Qn82M5n3U/R8tco4mtNr+qACRTORQjlGX79
 nRw33XLPjEDdm1CjVFTdvgTzPrJ38GXn0poTE/8bHV7l4fZFHqa9mSdmIXkqDL55z8xt
 JQ6FYfmNbdTTctJnTaR0EUu1mqkLnlDSulWQzOAdVG8TAgYXeaHdNtPl5cC5/KWBg71D
 WM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zVaF0JjBdEd/4wIOWuHmkCNVxJRgNVPs1CRVDceolEU=;
 b=oJ3Md87+7MRzbWn0RnmMEtMaaGDsuWuvqc9LNZGO9qlZcdIHqjitX2IdqwZqGhxxnd
 esqx3cdIkMyIFhE6K18oPbKxOMJ5cL7or22P5TH3+PW17LFbVLV2z3fVhBHjdBN0SqF1
 izlOH40zyi7V54m2Cnw+PALD3njHNIcWxky4+n8MY32U1ZefUQ1l65AfX3p6RNZGDiWs
 FzHA0P+bs3moGaH3/FO7NPy8vr28536aOSPsxkM/c7iUkf/L/rP9IVRfffsWjzawIU7J
 wfP0nxaC12ro2aQgmOoVllk+BHnBE/YsVSNO+HzshTQkFF8JmNOodqp8J2vs/JpprqmE
 a+PA==
X-Gm-Message-State: APjAAAXLQVM7bcwlxsuTlOJhqDZiuupFDrpgxX1RlRMzmX7N3hHUKCXf
 1ZMu8BHxXi/kxecdeRy4IdlR28nloi4OOAzc/34=
X-Google-Smtp-Source: APXvYqxRzG6BY/Y1uS2SBEBulhPxggOSZmwrTXHVrjQUKgFiG+CR/lrjpp/VnV0GB04MUFNHTISjiKpdrbKaH4Hv1Gc=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr42489324ljg.119.1560978270958; 
 Wed, 19 Jun 2019 14:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <99fc8fe28f2a0493f248d50d32d4b1bc649536ab.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmXKv7-r3KyDGnq8ysmyccy1tVgBDqwLcf46U96BZOiKYw@mail.gmail.com>
In-Reply-To: <CAEUhbmXKv7-r3KyDGnq8ysmyccy1tVgBDqwLcf46U96BZOiKYw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jun 2019 14:01:41 -0700
Message-ID: <CAKmqyKMqWcx4-EhTrtLMdfLtid742=8exDNSQHmuxPf_7tHkaw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 3/5] hw/riscv: Extend the
 kernel loading support
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
X-List-Received-Date: Wed, 19 Jun 2019 21:05:08 -0000

On Wed, Jun 19, 2019 at 8:16 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jun 19, 2019 at 8:56 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Extend the RISC-V kernel loader to support uImage and Image files.
> > A Linux kernel can now be booted with:
> >
> >     qemu-system-riscv64 -machine virt -bios fw_jump.elf -kernel Image
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 392ca0cb2e..7f68035a3f 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -67,13 +67,22 @@ target_ulong riscv_load_kernel(MachineState *machine,
> >      uint64_t kernel_entry, kernel_high;
> >
> >      if (load_elf(kernel_filename, NULL, kernel_translate, machine,
> > -                 &kernel_entry, NULL, &kernel_high,
> > -                 0, EM_RISCV, 1, 0) < 0) {
> > -        error_report("could not load kernel '%s'", kernel_filename);
> > -        exit(1);
> > +                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
> > +        return kernel_entry;
> > +    }
> > +
> > +    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
> > +                       kernel_translate, machine, NULL) > 0) {
>
> We should not set the 'kernel_translate' here for uImage.
>
> In fact, the whole kernel_translate() is not necessary.

I have removed the kernel_translate() function. I tested loading
uImage files though and they don't seem to work as the image is loaded
at the wrong address.

I have removed uImage loading support from this series. We can look at
it in the future if we decide we want it.

Alistair

>
> > +        return kernel_entry;
> > +    }
> > +
>
> Regards,
> Bin

