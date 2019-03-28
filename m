Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Lk7-00070N-TH
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 23:30:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9Lk4-0006ot-Pi
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9LVh-00037Y-Lg
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:15:23 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h9LVf-00035k-Mx
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:15:21 -0400
Received: by mail-pf1-x443.google.com with SMTP id 188so5224457pfd.8
	for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2019 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=YumsMEv4a3D0YfGBaKxGhyW1i/APuHVX/CnXJOh853U=;
	b=e5eQNcXpf9bFoWhJwNWxTQSR4D1X0jslT3tou5RXI6vj2I1WFMGi3XdAB5bpUWn9wf
	OzdTnN3UhXdASer/oUz3IsWg5tuY44Q4EBorJ92jXNRLEGU+S8j4tD29QALMEb9yE5YF
	dG83xdVjr/VzVZ1mx9C0ZIvUHryPnm53iiMMXSdlxxfviWKs+je/hwDVwZ7q97fP+Z0J
	vmUI1UlQu45rOZNlN269YoeEpQzO4CtjzrO2OV2wHcBesdqn1ElUgKjLD+8pjOhJ4qiR
	H8RIwmw++pUTrncdTcLYu+dmNhBLZUGcln5/R3tbbZcUnwuaICibHHU7FJFrtUAcGzMl
	HfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=YumsMEv4a3D0YfGBaKxGhyW1i/APuHVX/CnXJOh853U=;
	b=h3cHzLfBlFcwkpibWrNRLK2jndC3AcaC+sGLr8WjA3tfVdcNjfglIWS6SceE9/3k7N
	VStpwOsSX8qbr8mOgeMN8+w5l7GKiRNXqHzbAVUTVOsfAfW/TSCUKVWGjS0P8NEP1Uc+
	WzIfrM/RWLTbEWEFtxhFswlQ6UtzdDmRyGqhkau8d1bL70aU1nXq6nvMXJ5SiTYMtXbj
	N91gkKyxkiD2ML3Bze7+wU6mwRZHaTqgJ9WKEWS/RkM4o3tT6fC1TZxRm15agZTLvmfu
	g+ZCl0EPIytZQS7omyWuVoUV/nQr3RY9kBIC9FlWyQDjf57Xlhc3iTbt3Xas3oTz/ugo
	XALw==
X-Gm-Message-State: APjAAAVnE2vngcmzC7CnYZSGdNCwrzOqSlMOBgZtucpP/H9xz5F0Kn3d
	/91L3wOpeQmvQF2XI0BN1Iy9eA==
X-Google-Smtp-Source: APXvYqzCHmKyIgLE2zhTB23KX1EnINthWhCmoEmUqkMtW2Dru69KtbYDca3BdCSI4eg/cdEvJQJtwA==
X-Received: by 2002:a62:1193:: with SMTP id 19mr38356060pfr.82.1553742917679; 
	Wed, 27 Mar 2019 20:15:17 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id s5sm21726136pgv.8.2019.03.27.20.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 20:15:16 -0700 (PDT)
Date: Wed, 27 Mar 2019 20:15:16 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2019 20:13:58 PDT (-0700)
In-Reply-To: <CAKmqyKN_HvvJQJ9uTRuA2G0rCk-Ri0VSmWW-zV79QxMJLzZ3ZA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-e6f9e7b4-11e0-486f-9d9d-60874c0a71b9@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Thu, 28 Mar 2019 03:30:14 -0000

On Wed, 27 Mar 2019 09:29:56 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 27, 2019 at 3:29 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 20 Mar 2019 17:46:09 PDT (-0700), Alistair Francis wrote:
>> > The irq is incorrectly calculated to be off by one. It has worked in the
>> > past as the priority_base offset has also been set incorrectly. We are
>> > about to fix the priority_base offset so first first the irq
>> > calculation.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  hw/riscv/sifive_plic.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
>> > index 1c703e1a37..70a85cd075 100644
>> > --- a/hw/riscv/sifive_plic.c
>> > +++ b/hw/riscv/sifive_plic.c
>> > @@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>> >      if (addr >= plic->priority_base && /* 4 bytes per source */
>> >          addr < plic->priority_base + (plic->num_sources << 2))
>> >      {
>> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
>> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>> >          if (RISCV_DEBUG_PLIC) {
>> >              qemu_log("plic: read priority: irq=%d priority=%d\n",
>> >                  irq, plic->source_priority[irq]);
>> > @@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>> >      if (addr >= plic->priority_base && /* 4 bytes per source */
>> >          addr < plic->priority_base + (plic->num_sources << 2))
>> >      {
>> > -        uint32_t irq = (addr - plic->priority_base) >> 2;
>> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>> >          plic->source_priority[irq] = value & 7;
>> >          if (RISCV_DEBUG_PLIC) {
>> >              qemu_log("plic: write priority: irq=%d priority=%d\n",
>>
>> I think this breaks bisectability and should be merged with the
>> *_PLIC_PRIORITY_BASE modifications as otherwise we'll end up the priority being
>> set for the brong IRQ.
>
> Good point, I can merge them together.
>
>>
>> I'm also not sure how this fixes the bug listed in the OpenSBI PR.  As far as I
>> can understand it, all this does is ensure that source 0 is actually treated as
>> illegal (and shrinks the number of sources to match what's actually there, but
>> that shouldn't fix the bug).  That looks more like a cleanup than an actual fix.
>
> The problem is that before we where off by one. We supported 0 - (n -
> 1) and this patch set changes QEMU to support 1 - n. This is because
> of the "addr < plic->priority_base + (plic->num_sources << 2)"
> comparison. As priority_base is now 0x04 instead of 0x00 the
> comparison will work correctly.

So something in OpenSBI is going through the entire set of sources and 
initializing the priorities?  That makes sense for the off-by-one, I was just 
wondering because the array shrank so the specific offset in that error would 
still be invalid with the new patch set.

>
> Alistair
>
>>
>> Am I missing something?

