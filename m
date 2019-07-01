Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi3VG-00064R-LY
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 17:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hi3VE-0005zW-8A
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 17:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hi3VC-0004uL-Tr
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 17:06:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hi3VC-0004sH-JP; Mon, 01 Jul 2019 17:06:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so14657167ljh.6;
 Mon, 01 Jul 2019 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CiQddWFCGIJ0zGgct0o78x4tAwZKPanPdL187jV3a1o=;
 b=Z3Mrfp2jyaXqOFVpgYFMVQrj0y8JCxTLRN1Nv+9fjFOrq1/9aD+kg/L7vexn5ofbzD
 WTDjVuIufH8/idNYio9sibkSh3fU79NtFyLVtzZmX0sWO+zTsur8JlsknfE4gVr1EiHC
 TWTB392XmZu/Thq9fO8uDbZXaFc05gw1TOwReoaY2DygkPVNufpf2FMaLxmdfieeePqO
 sUnSznJG5owPtLTUq7l5/AuGnJeNs95FwKG/ty1Hjf3qJ3rhGLgo5842srpiiqMOBNo9
 sugEtc2/cgXoP0uoiwVuqsjJhVX6twTCZiCgOT/l9qrttIrO7+VJcm24WggODS0SOTdy
 b//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CiQddWFCGIJ0zGgct0o78x4tAwZKPanPdL187jV3a1o=;
 b=PbtEd8FFKBuz9P8eVKyGHw/d4fa1mxs/Fubio3ECaSRURXDclgIp5fenQwYAM5XUBE
 DrTu9n5ZaigOJJzJymM96FXArqAW5G6gD86OndjJ13W+XUT/cHaqMGHV0wSizi8SeWB+
 0+kUGWeuiOwSZs96imJovLzJjOHwDx8lcqxEbYaWkuNcntWcTiQUvGDzoizrIRz1ET5A
 LeS09pivxzt8F21Ttuwo/NZct37Y85tfFlSBiEsnGoF6RWFHx6NmHarc0KlTe43oySoh
 hxc+m3st5Umf8DtHJ7ES0JU91cJRGNSaSgBqsDU1c8omEALeyjBJe9pvRs+8f2x7aHPz
 woOg==
X-Gm-Message-State: APjAAAWK1mQj8C1++fDjB3kRVMAnrW3UIUbzsynJtcuVCNTOm15E/KOC
 lB7tVcVpRm/bjMHvY55UJtg9X/DhIoc/zb/PPt1AKW1J
X-Google-Smtp-Source: APXvYqzf5tSQUl2CAsaQ08aD4OLB15/XDuQ+qxM4ZgM/CW3I6jZJ6LteZ+5lLbWzRK2M+gks95vk/sBXuCkwK+WDjKw=
X-Received: by 2002:a2e:5d5a:: with SMTP id r87mr14641276ljb.196.1561999329481; 
 Mon, 01 Jul 2019 09:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <20190628104605.000062c4@huawei.com>
 <CAKmqyKP1c5GHKaDuOvu11UtCwnrUosxTtoDAeW7GOS=s+h27aw@mail.gmail.com>
 <20190701134029.00004b97@huawei.com>
 <CAAhSdy1c47+MaD4GixWB+u-+1Rb9ULAj0NweSzyzy+VdCXns0Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1c47+MaD4GixWB+u-+1Rb9ULAj0NweSzyzy+VdCXns0Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jul 2019 09:39:07 -0700
Message-ID: <CAKmqyKN4-ec9DYRvUK4vOUiE_yer48xXghTdkmYWeLAzezE+LA@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.195
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
X-List-Received-Date: Mon, 01 Jul 2019 21:06:21 -0000

On Mon, Jul 1, 2019 at 6:23 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jul 1, 2019 at 6:12 PM Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
> >
> > On Fri, 28 Jun 2019 09:12:45 -0700
> > Alistair Francis <alistair23@gmail.com> wrote:
> >
> > > On Fri, Jun 28, 2019 at 2:47 AM Jonathan Cameron
> > > <jonathan.cameron@huawei.com> wrote:
> > > >
> > > > On Thu, 27 Jun 2019 08:20:10 -0700
> > > > Palmer Dabbelt <palmer@sifive.com> wrote:
> > > >
> > > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > > >
> > > > > Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
> > > > >
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > >
> > > > I sent a late bug report on this one.. Hence posting here as well
> > > > to make sure it doesn't fall through the cracks!
> > > >
> > > > Right now you can't actually build the opensbi64-virt firmware
> > > > due to cut and paste error in the Makefile.
> > >
> > > Ah, thanks for the bug report.
> > >
> > > @Palmer Dabbelt I'm just going to send you a fixup commit. Can you
> > > apply it to your tree and send a PRv2?
> > >
> > > >
> > > > As a side note, I hit this because OpenSBI 0.3 is resulting in a login
> > > > loop on a debian test image and the current upstream isn't.  I haven't
> > > > debugged yet, but someone else may hit that problem.
> > >
> > > Unfortunately OpenSBI 0.3 is a little old now, in saying that I didn't
> > > know there are bugs in it? Which kernel are you using?
> >
> > Mainline 5.2.0-rc5.
> >
> > Just in case I also checked 5.2.0-rc7
> >
> > I tried doing an odd git bisect with good and bad reversed to figure out
> > what fixed the problem, but boot wedged at "Run /sbin/init as init process."
> >
> > The wedge was bisected to:
> >
> > 4e2cd47820 ("lib: Flush everything when remote TLB flush range is too large")
> >
> > Which the patch correctly identifies as a problem introduced this kernel cycle.
> > 5.2-rc1.
> >
> > So on that basis alone I'd suggest we want to move to a more recent openSBI
> > asap, after all the 5.2 kernel will be out in a week or so.
> >
> > I'm a bit short on time (flight to catch), so haven't pushed that fix that
> > far back in the tree yet in order to figure what is causing the login loop.
> > Won't have access to relevant build machines until Wednesday.
> >
> > That patch cherry-picked on lib: Optimize TLB flush IPIs
> > seems fine, so it is before that point...
> >
> > Passing that point would require real effort though as the two patches
> > are changing the same code.
> >
> > So I had a go from the other end (0.3) to see if it was fixed quickly.
> > Ran out of time, but at
> > "firmware: Reset all registers and flush the icache" it superficially all
> > seems to be working with no TLB related hang, or login loop.
>
> We plan to release OpenSBI 0.4 in couple of days. It would be best
> to pick-up OpenSBI 0.4 FW_JUMP binaries.

Great! When the 0.4 release comes out I'll send a patch to update the
QEMU binaries and submodules. If this PR is merged before then we can
just update on top of this (as 5.1 and earlier kernels will work with
0.3) and it not it can be squashed into this PR.

Alistair

>
> Regards,
> Anup

