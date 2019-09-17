Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAGYe-0002Zt-VA
	for mharc-qemu-riscv@gnu.org; Tue, 17 Sep 2019 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iAGYa-0002YC-IG
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 12:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iAGYZ-00055L-GW
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 12:42:24 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iAGYZ-00053i-6z; Tue, 17 Sep 2019 12:42:23 -0400
Received: by mail-lj1-x243.google.com with SMTP id e17so4184241ljf.13;
 Tue, 17 Sep 2019 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PT7WC9Ntgt70WpmTJ/oxijeRYB/n/kAA83GM9NAKuik=;
 b=neTQ1Ck8ndtV43bqpGl3P7j97NvNyaXhyNdPkKDNBnALsvyZacFx4BETQtHrpTuU3V
 ULtXkkPaKgJ7NNyuiJtMC3VQ+meqIkq0TmsI4crdyNZvJxwZaLFCXY1zA+z5FC2BMs8f
 lnG3EJCkM6h9NJyvtYaMwDzwEzVwcNd+jNNmYSdIXYdxHJVD5bbh5WJSDYN3sJ9Xp+p5
 5hjHlg4OLL3NIuPw5CvF8aLihBFkCX/CPabqnAgTixpMoSV/HjR0s/9J6w79v5m2Bu1B
 ONt1t8os1aQrn+tR0Dp5IHCQcy34mdNk1SJ+2A84fo+SoKCx5HJy6Xs9rxMlQScpSviN
 ECYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PT7WC9Ntgt70WpmTJ/oxijeRYB/n/kAA83GM9NAKuik=;
 b=VrLXfy1xvy0ab8yKqncSk5MbGetNPuiHYCPgFRz8QrDbNYXBbJ86oWZOz4bwLAxII4
 h9eeE2z13Xz/PrjT4u06Q1S13H91LOBoPHXLoMxziNFVhgdCX6ZtI9iPjaJeI+thC/V+
 PNoYWpEEzgVPr3Z2Yc9g5ln79MTzQ2UJ3jX3vj59cxGj2vEdE++BkZFtTfxeQw/o5fIC
 62Z1M2n9V7xY3pXxLkUckrThTOtIfvtcx96KrFYRerGaaqd5sEILiVmvXDUKEUIj2+of
 0zJH3eNmH1iuFDI5wK1dI2JOBg+Cy7tFfuffSfBASaHC2zeCQ1++t528sYje2O/e6kme
 zazw==
X-Gm-Message-State: APjAAAVC5/nR70Pb2mD1AcRI8GFXUlQ8Mq+Byu85UxODi2+X1y51Peby
 rTmoHlkwvmB5diOza/h6Bmn/PvgUGv5qegTW7EY=
X-Google-Smtp-Source: APXvYqx7VB8K/hIfdoQgIrpz61WGCnfox1/xs4d4atELq5Xqw/KQpLzCGomdAe87ltO1OI/AiFXsKDEQN4/+8pkez68=
X-Received: by 2002:a2e:3902:: with SMTP id g2mr2441988lja.196.1568738540895; 
 Tue, 17 Sep 2019 09:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMyv8gt8Gb6y0DMktnWnSKBw4ePwOXBzWkEpw5GVmyG0A@mail.gmail.com>
 <mhng-f7096b78-f11e-425e-8ade-d20c77ee1de6@palmer-si-x1e>
 <CAFEAcA_gpS3odPN_1sxCjV+0bRrNn+=xmS=5JgUFvz2A332LEw@mail.gmail.com>
 <CAFEAcA-r5nr3xF6A5C6mdt2rakB8TXPSp+s_g6sd-aUy566LrQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-r5nr3xF6A5C6mdt2rakB8TXPSp+s_g6sd-aUy566LrQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Sep 2019 09:37:47 -0700
Message-ID: <CAKmqyKPPqzo+dKqXoqmBpuaHp3hbdzA=mpgqECMLGX+whn2pcw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Tue, 17 Sep 2019 16:42:26 -0000

On Tue, Sep 17, 2019 at 6:56 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 16 Aug 2019 at 09:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 15 Aug 2019 at 23:17, Palmer Dabbelt <palmer@sifive.com> wrote:
> > > You're more than welcome to take them over.  I've got something that boots
> > > Linux on my unassigned_access branch (github.com/palmer-dabbelt/qemu), but I
> > > haven't sanitized the whole port for physical accesses and I haven't convinced
> > > myself that my hook implementation is correct.
> >
> > Rather than doing
> >    if (retaddr) {
> >        cpu_restore_state(cs, retaddr, true);
> >    }
> >
> > at the start of the hook I think you just want to pass 'retaddr'
> > as the final argument to riscv_raise_exception() instead of
> > using GETPC(). Other than that I think the hook itself is right.
> >
> > The 'git grep' regexes in docs/devel/loads-stores.rst are handy
> > for finding the places where the target code is doing physical
> > accesses. IIRC the only ones I found with a quick scan were the
> > PTE loads in get_physical_address() via ldl_phys/ldq_phys, which will
> > now return 0 and run into the 'invalid PTE' code path. I don't
> > know whether your architecture requires some different behaviour
> > for bus errors on page table walk than that (you might want to
> > specifically code the error path anyway or comment it even if the
> > behaviour is right, to be a bit more explicit that it can happen).
>
> Gentle ping -- would somebody like to have a go at the riscv
> do_transaction_failed hook conversion? I think it should be
> straightforward, and riscv is now the only architecture still
> using the old unassigned_access hook and preventing us from
> getting rid of it entirely.

Thanks for the ping Peter, I forgot about this.

@Palmer I have taken your patches, made some changes based on Peter's
comments and rebased them on your PR branch.

I'll double check, but the hook implementation looks correct and I
can't see any other obvious unsanitised physical accesses so it should
be ok. I'll send them out today if I don't find any issues.

Alistair

>
> thanks
> -- PMM

