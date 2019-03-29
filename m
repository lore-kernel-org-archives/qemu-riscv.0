Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9kTG-000055-Ix
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 01:54:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9kTE-0008TP-QZ
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 01:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9kTD-0005Ev-Iu
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 01:54:28 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h9kTD-0005Dk-90
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 01:54:27 -0400
Received: by mail-pl1-x641.google.com with SMTP id g12so483082pll.11
	for <qemu-riscv@nongnu.org>; Thu, 28 Mar 2019 22:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=C2jCN+0kG1yXpvOWzoQITKq8KKHgl7ZkePT2FFbwZWM=;
	b=hzUQj+XmuECyteRT7e4D+56Tam2I1iRH6TW5O2PbydqcqjBmGB55Nw/ZAncZ4e05/i
	QREUs5JXpl8Dl5xdKlQgCRVwAEua5x8gaDq9rbjMau7G3LBNm6CBODkLxGV1iLV0cjGf
	Kprnqc/HAvnDe854IM4geJq4Zi1zqq2yFjczsw2+r7zVWm3jEVZlEIPROhDDE9fPQuBl
	I9qluq7ci3qOo5+NAMXIaJErwgj9ubX3q9/GEJy8ulMHRDpvokdpYf9V6B+Ik21R0wf8
	aZu39SOVf1CZRMrOk5HOxZltZN5fH2RCY6/LTOyuH9f9l53U1G4QrBZjyi0y4gxVneUX
	xiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=C2jCN+0kG1yXpvOWzoQITKq8KKHgl7ZkePT2FFbwZWM=;
	b=V05dWFsC0f9oNjUf52kxB6A7qnGtzeWv1JZUBaXuZPOLWzIrAumaPbAomr1i/L6nZR
	SfqC/u6GXAp9KFY6Dq3s2mt6wMFhbcbSjdYJlXQLDzTQ3O7/tltCmxRv5KH9xUJAGyg/
	o28bHpgXq3cTFj6qo4zR4EqKeKBtVpTavuZ++6WYWUxdcRFwdZhf0HxW9OmJfNvneLKT
	LnJe9reNYmnfYPFAYOkCWSCJYG+2zq86PikuTO18PT54eDUIh0mQLD+AsMb3R3SsB1cD
	fVd/O+p9+ZwGiCsO9q6O5C2ZhqGe1omBdxm+EdBUi8gMqeeA9UPr4bx6ybJrqJpkuwNO
	N8iA==
X-Gm-Message-State: APjAAAUp69sV3g+MxvmNcujBUxVMvbo+5EJm2nBC5fY6nuewlGPEamfs
	+hq1YF1fNopG36LG1OgJE40ccg==
X-Google-Smtp-Source: APXvYqzGF/zDA1p9n80Ee+lL98AlSgTpmFrP5X6lIj7IHn59fM88HFv606UeaNnTpOKKZz4DydxCUw==
X-Received: by 2002:a17:902:121:: with SMTP id
	30mr47629882plb.315.1553838865514; 
	Thu, 28 Mar 2019 22:54:25 -0700 (PDT)
Received: from localhost ([64.62.193.194]) by smtp.gmail.com with ESMTPSA id
	c134sm1988287pfc.87.2019.03.28.22.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 22:54:24 -0700 (PDT)
Date: Thu, 28 Mar 2019 22:54:24 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Mar 2019 22:45:52 PDT (-0700)
In-Reply-To: <CAKmqyKPxHCGovfw6ajs0ZPt4qSXn9+CwX-j0g9z4qqCS0JX+7g@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-8499a667-ec3d-4208-bfbe-e08ba29994de@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Fri, 29 Mar 2019 05:54:30 -0000

On Thu, 28 Mar 2019 10:34:08 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 27, 2019 at 8:15 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 27 Mar 2019 09:29:56 PDT (-0700), alistair23@gmail.com wrote:
>> > On Wed, Mar 27, 2019 at 3:29 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >>
>> >> On Wed, 20 Mar 2019 17:46:09 PDT (-0700), Alistair Francis wrote:
>> >> > The irq is incorrectly calculated to be off by one. It has worked in the
>> >> > past as the priority_base offset has also been set incorrectly. We are
>> >> > about to fix the priority_base offset so first first the irq
>> >> > calculation.
>> >> >
>> >> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> > ---
>> >> >  hw/riscv/sifive_plic.c | 4 ++--
>> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
>> >> > index 1c703e1a37..70a85cd075 100644
>> >> > --- a/hw/riscv/sifive_plic.c
>> >> > +++ b/hw/riscv/sifive_plic.c
>> >> > @@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>> >> >      if (addr >= plic->priority_base && /* 4 bytes per source */
>> >> >          addr < plic->priority_base + (plic->num_sources << 2))
>> >> >      {
>> >> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
>> >> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>> >> >          if (RISCV_DEBUG_PLIC) {
>> >> >              qemu_log("plic: read priority: irq=%d priority=%d\n",
>> >> >                  irq, plic->source_priority[irq]);
>> >> > @@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>> >> >      if (addr >= plic->priority_base && /* 4 bytes per source */
>> >> >          addr < plic->priority_base + (plic->num_sources << 2))
>> >> >      {
>> >> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
>> >> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>> >> >          plic->source_priority[irq] = value & 7;
>> >> >          if (RISCV_DEBUG_PLIC) {
>> >> >              qemu_log("plic: write priority: irq=%d priority=%d\n",
>> >>
>> >> I think this breaks bisectability and should be merged with the
>> >> *_PLIC_PRIORITY_BASE modifications as otherwise we'll end up the priority being
>> >> set for the brong IRQ.
>> >
>> > Good point, I can merge them together.
>> >
>> >>
>> >> I'm also not sure how this fixes the bug listed in the OpenSBI PR.  As far as I
>> >> can understand it, all this does is ensure that source 0 is actually treated as
>> >> illegal (and shrinks the number of sources to match what's actually there, but
>> >> that shouldn't fix the bug).  That looks more like a cleanup than an actual fix.
>> >
>> > The problem is that before we where off by one. We supported 0 - (n -
>> > 1) and this patch set changes QEMU to support 1 - n. This is because
>> > of the "addr < plic->priority_base + (plic->num_sources << 2)"
>> > comparison. As priority_base is now 0x04 instead of 0x00 the
>> > comparison will work correctly.
>>
>> So something in OpenSBI is going through the entire set of sources and
>> initializing the priorities?  That makes sense for the off-by-one, I was just
>> wondering because the array shrank so the specific offset in that error would
>> still be invalid with the new patch set.
>
> Yep, that is what caught this. The array only shrinks for the FU540
> board, the virt board doesn't shrink and that is the board that
> OpenSBI caught the bug with.

OK, that makes sense.

>
> Alistair
>
>>
>> >
>> > Alistair
>> >
>> >>
>> >> Am I missing something?

