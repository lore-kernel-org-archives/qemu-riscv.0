Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ga3KG-0001fN-07
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 13:45:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ga3KB-0001dG-WB
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 13:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ga3KB-0001uC-BR
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 13:45:35 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:41646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1ga3KB-0001sb-3E
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 13:45:35 -0500
Received: by mail-qt1-x841.google.com with SMTP id l12so2940676qtf.8
	for <qemu-riscv@nongnu.org>; Thu, 20 Dec 2018 10:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=mEkvHBq2khD4ut3Clc7oxeBWO1MXA3USsxfysFhpuvE=;
	b=CQWLSMozVwISpmc4P4o43NZIOVHWgMkyCLAVluojQk0xhDHzM9szdmbZZmHMUdc9K+
	rtzNGLCqUZ5d7xoXmmUl+/eUrGBewyopkH3A4Dcb7boOF8zlIVc/btUq8wVCsDQ2l6Qs
	gozcvXs3Q5lbhjyTbrikMms/CmAAxOYQFhuN40wVHRbIPbeLWyS+gMaskhFEaUo5vYiD
	NvvUNXpoZRb/anBwDDOnU89945R0IgzoNHdWiazZqwhM6SvlLstacQJ8He7NtYgwlxla
	L2UfRN4U0F2pOTN16heayNOOawDf0yQbXfDgRCROPpp+LVQlIVfijSOAH2TVpSLgtcs1
	Po6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=mEkvHBq2khD4ut3Clc7oxeBWO1MXA3USsxfysFhpuvE=;
	b=n0ApYQNhCh5j1uD7XTyX72cRXE8knQiOl7CkRvR9Mo4XTWsppv+XEL0myzB2U5ASCL
	sGqsss7Mwvqs1yaOnd/5aYfAxsn3PPAD3YWzXzRtVbA9yFERkxw3RiSf26jOLo3yMiyM
	NB1dQd8wGEe11Xi9HyKDQ52d6YW7PIfNp2nAAOT+7hUJ5JSBTmHz5oxl/WwIOU5lQsig
	Q+SmQKtpWzy373e2Gon9JDuxe1GJypYxHxNtekc2IXAvYqS87vXA/RcPZ5RQcyc+00r8
	SVQ5W9DsTCfWDvohf5fo2fcKcv5wVIt+U0zlRQw3c5Sv8cmoUgpJF91CxyR+QFlBsvRI
	TRCg==
X-Gm-Message-State: AA+aEWarRpstSQvXETeBE/F9emXmJP395bWC+ib1hv+hnSIcwYWZP8UP
	mx1PPwarmWo8dTeAusxtvjFBxA==
X-Google-Smtp-Source: AFSGD/VO0ky9WOGRF6F9A23pF4wnNqnzNEBd4dH+jf/Aaw7Y8Ym4s7zimKxOYMeRaGJEDEMrdwiEig==
X-Received: by 2002:ac8:468f:: with SMTP id g15mr27204105qto.363.1545331534104;
	Thu, 20 Dec 2018 10:45:34 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	q70sm5728161qkq.10.2018.12.20.10.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 10:45:32 -0800 (PST)
Date: Thu, 20 Dec 2018 10:45:32 -0800 (PST)
X-Google-Original-Date: Thu, 20 Dec 2018 10:45:25 PST (-0800)
In-Reply-To: <CAKmqyKNY4FCzXcpBMWawVA9RWGBZ7vctRLaQGhsODH6HCXkK9A@mail.gmail.com>
CC: richard.henderson@linaro.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-9f966fb7-686c-4427-a39c-850368f88f0e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/23] Add RISC-V TCG
 backend support
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
X-List-Received-Date: Thu, 20 Dec 2018 18:45:37 -0000

On Thu, 20 Dec 2018 09:20:05 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Dec 19, 2018 at 10:07 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 12/19/18 11:16 AM, Alistair Francis wrote:
>> > This patch set adds RISC-V backend support to QEMU. This is based on
>> > Michael Clark's original work with extra work on top.
>> >
>> > This has been somewhat tested and can run other architecture softmmu
>> > code. It seems that any complex OS will eventually hang, but we can
>> > run the BIOS and OS startup code for a number of different operating
>> > systems.
>> >
>> > I haven't tested linux user support at all yet. I think Michael had that
>> > working reliably though and hopefully my changes haven't broken it.
>> >
>> > There are still some todos in the code (there are missing instructions
>> > and byte swapping) but these should assert instead of generating invalid
>> > code.
>>
>> Queued to tcg-next, with the extrh fix.
>
> Thanks Richard!

Sounds good to me.  I'm still attempting to collect the RISC-V patches to get a 
PR out, a few things came up but I should have time now.  This was the biggest 
patch set, so it should be a lot easier now.

Thanks for picking this up!

>> Some of those todos are no longer todos, since e.g. bswap is now optional.
>> Those asserts should never fire (as a good assert should do, I suppose).
>>
>> The missing instructions are only for riscv32, which afaik is just now making
>> its way to glibc.  So a chroot complete enough to build qemu is a ways away.
>> I'm ok with leaving that incomplete for now.

We've decided to delay the rv32i glibc port until after the next glibc release, 
which is targeted for the beginning of February.  glibc should freeze at the 
end of the year, at which point we're going to do a rv32i glibc prerelease and 
try to build a proper userspace with the theory being that we'll shake out ABI 
bugs that way.

