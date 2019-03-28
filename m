Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9YwE-0004Hx-6I
	for mharc-qemu-riscv@gnu.org; Thu, 28 Mar 2019 13:35:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9YwC-0004Gx-5r
	for qemu-riscv@nongnu.org; Thu, 28 Mar 2019 13:35:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9YwB-0008JL-26
	for qemu-riscv@nongnu.org; Thu, 28 Mar 2019 13:35:36 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h9Yw8-0008IC-CS; Thu, 28 Mar 2019 13:35:32 -0400
Received: by mail-lj1-x244.google.com with SMTP id j89so18444243ljb.1;
	Thu, 28 Mar 2019 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WybbRToxfAkOUGF01jJRALOCsMCiRJKspfCeaCLctRA=;
	b=ezzWeGuHR/qsU/EOU+Zzajy5dTdzhSN4TMPVpqQV1blhBHyweDw9CY+sZB04vVBEkO
	16VM82ITG79oDBBs6P8W2Xp/v4fydLZBW3sisYiD1K5B1+hjJ6563CDLOToUy5IySJ74
	oh+AUlhnnpb+xC+XZR1GgALJ5GBvjxnMQ876DKEuggKVxRPAcoGFBhOn2nQYjYmCKw4h
	hNwwXlO0T4iJn5RM9r/X/MS2V/CHNXS9OV5dAeQtqEuH1ulrfHtmQfZSf3yKsF+IsD4/
	w3FJrIrZ7chQuvftBofvqnpUdpVChv1YdO+mAuO6Ls4D592zjut8wRXE+NUCK3QGGaLt
	OcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WybbRToxfAkOUGF01jJRALOCsMCiRJKspfCeaCLctRA=;
	b=R2wvb+L/6laiUSj8kaJtRXiY/JZCvmxQ9YFJQbYO99d7VUSToUJwR41MnPPNJxInYN
	N5KnxyovMmGUCzEvjwy9QGTVhW9YyTP7YhXljj1mAlEt4dSp7gvB5w6QbjLLGuQ0zAPU
	25x4IMEKDow+tSrWcz0xMggrlB9dMYgE+LJJnq2mBLzpBs3mg+ZCj2zRYXe6Yq65ruqU
	gaLkmmVZ08i1vRMDudhqphSm15u4eKIvhR4soBAVUP0XmMBgOVSziZdfpp2he2rr/L1F
	tjv8KqhpryWZO+HaNUGmYZUAEIbTDVCkIRww+F4DwvZNOlo0pEsZo9YSNLPZ4+UR6IJm
	JQUA==
X-Gm-Message-State: APjAAAWc0I5MVIMTb9ANHyJ4A3pZmEX1JOALfdJhyX3nAYRO5x9uEvhh
	9eAQGS3VBWE0zc1Kl+P6vUlQtMFYAOi24c12Dgk=
X-Google-Smtp-Source: APXvYqwsR45qFQt8XYuPffC9w98b4POlsO25J/xowt9Y+VXxA1h2dZs8nQ9wgTOH/ee9NgjuWjlxKLZc5rubg2ugrzc=
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr23119790ljj.128.1553794530478;
	Thu, 28 Mar 2019 10:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKN_HvvJQJ9uTRuA2G0rCk-Ri0VSmWW-zV79QxMJLzZ3ZA@mail.gmail.com>
	<mhng-e6f9e7b4-11e0-486f-9d9d-60874c0a71b9@palmer-si-x1c4>
In-Reply-To: <mhng-e6f9e7b4-11e0-486f-9d9d-60874c0a71b9@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Mar 2019 10:34:08 -0700
Message-ID: <CAKmqyKPxHCGovfw6ajs0ZPt4qSXn9+CwX-j0g9z4qqCS0JX+7g@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v1 1/5] riscv: plic: Fix incorrect
 irq calculation
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2019 17:35:37 -0000

On Wed, Mar 27, 2019 at 8:15 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 27 Mar 2019 09:29:56 PDT (-0700), alistair23@gmail.com wrote:
> > On Wed, Mar 27, 2019 at 3:29 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Wed, 20 Mar 2019 17:46:09 PDT (-0700), Alistair Francis wrote:
> >> > The irq is incorrectly calculated to be off by one. It has worked in the
> >> > past as the priority_base offset has also been set incorrectly. We are
> >> > about to fix the priority_base offset so first first the irq
> >> > calculation.
> >> >
> >> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> > ---
> >> >  hw/riscv/sifive_plic.c | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> >> > index 1c703e1a37..70a85cd075 100644
> >> > --- a/hw/riscv/sifive_plic.c
> >> > +++ b/hw/riscv/sifive_plic.c
> >> > @@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
> >> >      if (addr >= plic->priority_base && /* 4 bytes per source */
> >> >          addr < plic->priority_base + (plic->num_sources << 2))
> >> >      {
> >> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
> >> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> >> >          if (RISCV_DEBUG_PLIC) {
> >> >              qemu_log("plic: read priority: irq=%d priority=%d\n",
> >> >                  irq, plic->source_priority[irq]);
> >> > @@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
> >> >      if (addr >= plic->priority_base && /* 4 bytes per source */
> >> >          addr < plic->priority_base + (plic->num_sources << 2))
> >> >      {
> >> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
> >> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> >> >          plic->source_priority[irq] = value & 7;
> >> >          if (RISCV_DEBUG_PLIC) {
> >> >              qemu_log("plic: write priority: irq=%d priority=%d\n",
> >>
> >> I think this breaks bisectability and should be merged with the
> >> *_PLIC_PRIORITY_BASE modifications as otherwise we'll end up the priority being
> >> set for the brong IRQ.
> >
> > Good point, I can merge them together.
> >
> >>
> >> I'm also not sure how this fixes the bug listed in the OpenSBI PR.  As far as I
> >> can understand it, all this does is ensure that source 0 is actually treated as
> >> illegal (and shrinks the number of sources to match what's actually there, but
> >> that shouldn't fix the bug).  That looks more like a cleanup than an actual fix.
> >
> > The problem is that before we where off by one. We supported 0 - (n -
> > 1) and this patch set changes QEMU to support 1 - n. This is because
> > of the "addr < plic->priority_base + (plic->num_sources << 2)"
> > comparison. As priority_base is now 0x04 instead of 0x00 the
> > comparison will work correctly.
>
> So something in OpenSBI is going through the entire set of sources and
> initializing the priorities?  That makes sense for the off-by-one, I was just
> wondering because the array shrank so the specific offset in that error would
> still be invalid with the new patch set.

Yep, that is what caught this. The array only shrinks for the FU540
board, the virt board doesn't shrink and that is the board that
OpenSBI caught the bug with.

Alistair

>
> >
> > Alistair
> >
> >>
> >> Am I missing something?

