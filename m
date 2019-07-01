Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhwH9-0006jd-Dn
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 09:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anup@brainfault.org>) id 1hhwH6-0006dI-Gp
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 09:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1hhwH5-0007gv-CF
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 09:23:16 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1hhwH4-0007fO-Uh
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 09:23:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id p11so2649265wro.5
 for <qemu-riscv@nongnu.org>; Mon, 01 Jul 2019 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ziosd74qZsVijVIqdc9xtnOkOcze7h+1KOaH7g6GIG0=;
 b=Y+F2BRM4kBpCaIFGW4xLqlUm4jFNbaI4J6L5cR15HB4k11/SuUSyTNaEa5Im7x4P5K
 8MA+Sg1Z12758vCCasdeHMnXnkpp1qzbQOakWuGWcvCQfMo47ZQvsTGyTK59rN0X1SLb
 sTDdgLergbCRsKS0VQNoXiIRaUqd3lxRkuJRq01nrXd5b9itsoEfIzsDUw1MQ8m4Nky1
 QqkMKvfk1HCWnbSKk+8fdtR0Uw5D3zds3pZVumJrZu1Wh1p/Nz9z+ISn9szaHGbN332R
 j55fKCc5rm4wAfPC42x8mp0tE0jVB5oDejqGCjHIWb1TXzNGoBQAzJEMzkMiRtvO8Rto
 KXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ziosd74qZsVijVIqdc9xtnOkOcze7h+1KOaH7g6GIG0=;
 b=PL235Jgc4kj+ayTEBAFs39Qj4P9AbTOJuEb0V7M6B59pDgBx1LZdXUyydp8ztIc81w
 RD0PjdbV91+bGRCna3RFRel0ZA0C8VYlp72q/xeLMe5OSWEagZzlnHq95J7Mttlai7th
 sP0xRf6ixOWfbSJA6eJTTcoEnZ5JqrRGUifhKb/C6X93VTdqFb/6bzP1qP70SpteXud/
 03UkBITKfaMPY+Vdctcq71K5n08mEtwMi6fZElnpZUTIgbqG+lPxZECCuXpZj3yiBslw
 IlUj50Aclrlgu6rzhJcNWPEmMLXwRsyWyZwQ3Oq3nvugbZtmnHbN73oMZS5et4B7C3kg
 srqA==
X-Gm-Message-State: APjAAAWQMfXmW/EJOXr6molinr18JL/I2DcpSo4H1BXvMavdwPjjO3hv
 OBRyUEzon2bWt/ZmF+9UalUFo3Px9yL2gB93qO5KIg==
X-Google-Smtp-Source: APXvYqwmY9ADqvCBaSD7YNoyOl5M0zME1fQpbWFLmUA1ZfRLr0fBpjDi1FmpRxRSXoUwbAXopgfYcArCnJS3dVJhK2I=
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr19580039wrt.227.1561987392759; 
 Mon, 01 Jul 2019 06:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <20190628104605.000062c4@huawei.com>
 <CAKmqyKP1c5GHKaDuOvu11UtCwnrUosxTtoDAeW7GOS=s+h27aw@mail.gmail.com>
 <20190701134029.00004b97@huawei.com>
In-Reply-To: <20190701134029.00004b97@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jul 2019 18:53:02 +0530
Message-ID: <CAAhSdy1c47+MaD4GixWB+u-+1Rb9ULAj0NweSzyzy+VdCXns0Q@mail.gmail.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 33/34] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Mon, 01 Jul 2019 13:23:17 -0000

On Mon, Jul 1, 2019 at 6:12 PM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 28 Jun 2019 09:12:45 -0700
> Alistair Francis <alistair23@gmail.com> wrote:
>
> > On Fri, Jun 28, 2019 at 2:47 AM Jonathan Cameron
> > <jonathan.cameron@huawei.com> wrote:
> > >
> > > On Thu, 27 Jun 2019 08:20:10 -0700
> > > Palmer Dabbelt <palmer@sifive.com> wrote:
> > >
> > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > >
> > > I sent a late bug report on this one.. Hence posting here as well
> > > to make sure it doesn't fall through the cracks!
> > >
> > > Right now you can't actually build the opensbi64-virt firmware
> > > due to cut and paste error in the Makefile.
> >
> > Ah, thanks for the bug report.
> >
> > @Palmer Dabbelt I'm just going to send you a fixup commit. Can you
> > apply it to your tree and send a PRv2?
> >
> > >
> > > As a side note, I hit this because OpenSBI 0.3 is resulting in a login
> > > loop on a debian test image and the current upstream isn't.  I haven't
> > > debugged yet, but someone else may hit that problem.
> >
> > Unfortunately OpenSBI 0.3 is a little old now, in saying that I didn't
> > know there are bugs in it? Which kernel are you using?
>
> Mainline 5.2.0-rc5.
>
> Just in case I also checked 5.2.0-rc7
>
> I tried doing an odd git bisect with good and bad reversed to figure out
> what fixed the problem, but boot wedged at "Run /sbin/init as init process."
>
> The wedge was bisected to:
>
> 4e2cd47820 ("lib: Flush everything when remote TLB flush range is too large")
>
> Which the patch correctly identifies as a problem introduced this kernel cycle.
> 5.2-rc1.
>
> So on that basis alone I'd suggest we want to move to a more recent openSBI
> asap, after all the 5.2 kernel will be out in a week or so.
>
> I'm a bit short on time (flight to catch), so haven't pushed that fix that
> far back in the tree yet in order to figure what is causing the login loop.
> Won't have access to relevant build machines until Wednesday.
>
> That patch cherry-picked on lib: Optimize TLB flush IPIs
> seems fine, so it is before that point...
>
> Passing that point would require real effort though as the two patches
> are changing the same code.
>
> So I had a go from the other end (0.3) to see if it was fixed quickly.
> Ran out of time, but at
> "firmware: Reset all registers and flush the icache" it superficially all
> seems to be working with no TLB related hang, or login loop.

We plan to release OpenSBI 0.4 in couple of days. It would be best
to pick-up OpenSBI 0.4 FW_JUMP binaries.

Regards,
Anup

