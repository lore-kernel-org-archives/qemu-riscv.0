Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9BSW-0004av-PA
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 12:31:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9BSV-0004a4-94
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 12:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9BSU-0001bb-7f
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 12:31:23 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:32855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h9BSQ-0001WY-27; Wed, 27 Mar 2019 12:31:18 -0400
Received: by mail-lj1-x241.google.com with SMTP id f23so15014206ljc.0;
	Wed, 27 Mar 2019 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=weThoRLMZcZjCtrtU9lpWP3feIP56UQq8lRcq3yhIpE=;
	b=A8pKPAxwDpOXS7ocosNMz22wcfCT2Z7COngjjhHmBPfvFVYaVmxJLXSBhJyk/DrKmi
	lvnuE10RMyf/Qr/+j0ewKSP1UAAKphyObI3S0kDtNxX7KqPamdqWfc7vPeMTj5nVX3WW
	7BjSql7yPX/d1Arb+EPVhdbA/z6uK3IvLCaKyZeScwgwDfP1ffQit+w42BgNmEK/iLZ1
	kBEwhsEWWUg3QygBnv3Rl+3zLHuq0NQ+UFKbhvAZ6AYDMTYUISt2VdX3XaSWtgFrYwhs
	q31OZXMqII859qgsBzpsgHi2ijX5oSTM2h56yTq0KQKdBsC3QPGHBr5FiCv9Z+tG4Kbn
	s62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=weThoRLMZcZjCtrtU9lpWP3feIP56UQq8lRcq3yhIpE=;
	b=QyX2cOMWoHOb5UXcb+aI9D4CUlz4QujxC4dQxDs/jGoMi5zoj96WGR2II0Mz49YIoF
	SeT8kd9xKog5cH3o4qhCkX3RRJ50GbSGiyfJs/w/0IGaPn1WmmMYhZE/abR90vZw7XsU
	R4g/71wbvNoHNsHA+8SYZ/mlFTVC/ad1l9v+w56y5AR6RdV5OHt/yFSLSvroTDORQ09k
	JmfYfOxh1MKBPrADzAlTmaivMc8rgrE1Oj5xJdYVgdz2AEaOKPNXoSJOmRgCqe7IVRZh
	9rEJxyValO0uwZSxKo8dIO4XJjt/CGTLqYZ+3T63cOJmMExxfHxrVW63Kw4nH8rxW35Z
	DaeA==
X-Gm-Message-State: APjAAAV37NwRVCcdx5XDiwwSB6PiQRdOa4WWF6ssepU0yoRDXtejfxb9
	qnJ2NHfVxBoieXw0UL3V+gyfD12cyb6Nj5+TcIQ=
X-Google-Smtp-Source: APXvYqzihzYJftyjj+o5Ps7RdbI+pQN/M1Ue1+ABtNcrIrBY/zf19LCfRH5ATCe0f5o74NR+sUJFXw/PrjjkzZOVTjg=
X-Received: by 2002:a2e:380c:: with SMTP id f12mr19837879lja.116.1553704276466;
	Wed, 27 Mar 2019 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <7efcf90aa1cc78d1ce2c5f823a7ff9ac96c379ed.1553129005.git.alistair.francis@wdc.com>
	<mhng-5414d791-e26f-4d3d-aec0-1d11191ddace@palmer-si-x1c4>
In-Reply-To: <mhng-5414d791-e26f-4d3d-aec0-1d11191ddace@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Mar 2019 09:29:56 -0700
Message-ID: <CAKmqyKN_HvvJQJ9uTRuA2G0rCk-Ri0VSmWW-zV79QxMJLzZ3ZA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Wed, 27 Mar 2019 16:31:24 -0000

On Wed, Mar 27, 2019 at 3:29 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 20 Mar 2019 17:46:09 PDT (-0700), Alistair Francis wrote:
> > The irq is incorrectly calculated to be off by one. It has worked in the
> > past as the priority_base offset has also been set incorrectly. We are
> > about to fix the priority_base offset so first first the irq
> > calculation.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/sifive_plic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> > index 1c703e1a37..70a85cd075 100644
> > --- a/hw/riscv/sifive_plic.c
> > +++ b/hw/riscv/sifive_plic.c
> > @@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
> >      if (addr >= plic->priority_base && /* 4 bytes per source */
> >          addr < plic->priority_base + (plic->num_sources << 2))
> >      {
> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> >          if (RISCV_DEBUG_PLIC) {
> >              qemu_log("plic: read priority: irq=%d priority=%d\n",
> >                  irq, plic->source_priority[irq]);
> > @@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
> >      if (addr >= plic->priority_base && /* 4 bytes per source */
> >          addr < plic->priority_base + (plic->num_sources << 2))
> >      {
> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> >          plic->source_priority[irq] = value & 7;
> >          if (RISCV_DEBUG_PLIC) {
> >              qemu_log("plic: write priority: irq=%d priority=%d\n",
>
> I think this breaks bisectability and should be merged with the
> *_PLIC_PRIORITY_BASE modifications as otherwise we'll end up the priority being
> set for the brong IRQ.

Good point, I can merge them together.

>
> I'm also not sure how this fixes the bug listed in the OpenSBI PR.  As far as I
> can understand it, all this does is ensure that source 0 is actually treated as
> illegal (and shrinks the number of sources to match what's actually there, but
> that shouldn't fix the bug).  That looks more like a cleanup than an actual fix.

The problem is that before we where off by one. We supported 0 - (n -
1) and this patch set changes QEMU to support 1 - n. This is because
of the "addr < plic->priority_base + (plic->num_sources << 2)"
comparison. As priority_base is now 0x04 instead of 0x00 the
comparison will work correctly.

Alistair

>
> Am I missing something?

