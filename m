Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ga3iN-0005ak-2N
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 14:10:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ga3iL-0005XT-4V
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 14:10:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ga3iK-0001I3-4P
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 14:10:33 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:36587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1ga3iJ-00018P-L7
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 14:10:31 -0500
Received: by mail-qt1-x843.google.com with SMTP id t13so3056465qtn.3
	for <qemu-riscv@nongnu.org>; Thu, 20 Dec 2018 11:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=E9BIoWzrQFWcGlK/Kj6q8GWQ1hpuyQ4/7QXNMWUjkDI=;
	b=d9UGncavxLqAZYOt4Wjm8yhCJNc1+hwyY2Orfwwh8mI7/eoBLg4lPDnMgM8i2xPw8h
	7zZykXYGRBMswEuAP46e3dWyATYru+zUryxUcXjT3qUKBSV72NK0z+hSQovSpUBxGsrU
	x4UKa5noytvrKL61BrfRmxXMqdICMZs/OO3qBzcpD7Qq641b4efWIBv/fM1ckSg4do0x
	g3HG+f99NvxOh8CsdcZMh95jsof5qAQWf9ep6zJNa2LwCs0wZgaiqbIfbqrL4S9lE//H
	+iPUF+zPhEN04Eh6mJuoVhe7OHAx1Rp8q8mblEpqdok50hMYZ5WnQw2QbFlylUq8r2sA
	Yn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=E9BIoWzrQFWcGlK/Kj6q8GWQ1hpuyQ4/7QXNMWUjkDI=;
	b=W48Nl5WCCpA1a9KenWWcVIwKXAfwK9gtmTM8EK87yb56ti11BkWOUWLMnqTHHg9ugk
	4q+1pw/J2T1COVyftOCu09dI+nWhNwC9ybSPj4GIyp30ai/uVcltc667FbSYj0EQ5Kto
	eYG6CT3hjx2CMn0y/NMLQioDqStCHGD4xZe/+uuXUbX+JGpo5xjymEQUfPPm+L+xzI0/
	A3ppyNsMvOeTDPv9m+hA+iTWr97KmWmucp7IldLdPx+JgGzGeJUkIL/Wq0c5pvMRbCX9
	sULbfQP4b7NawYi1sozMEeVNkJxsFGOf8JKhoxWP1ya7Uu1IsSXf0CIb2wYL/E18s7zZ
	ZfXQ==
X-Gm-Message-State: AA+aEWaKn0LMwsvpzo7mKt0yzSoxKDd0BghrIVbQGgs9a/N2/TaBRC0s
	XNYuR6OQ919isda0Lf+1odWvzw==
X-Google-Smtp-Source: AFSGD/VlQsAxNuVcDHfzg6UCX5MREhCwqUQPfGR3jtz6uy0ypw+92rzthZI+PPBQ5IZWkhL4JkAybg==
X-Received: by 2002:ac8:2d53:: with SMTP id o19mr26239027qta.21.1545333025006; 
	Thu, 20 Dec 2018 11:10:25 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id 46sm4733288qtv.22.2018.12.20.11.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 11:10:24 -0800 (PST)
Date: Thu, 20 Dec 2018 11:10:24 -0800 (PST)
X-Google-Original-Date: Thu, 20 Dec 2018 11:10:17 PST (-0800)
In-Reply-To: <CAKmqyKPXri6faCRjXnp7WCyRYcuBhiEU=W_VrW4LYUe1O_c4Pw@mail.gmail.com>
CC: richard.henderson@linaro.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-2a2d74bc-32ef-4a14-adb7-c1556269a686@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-List-Received-Date: Thu, 20 Dec 2018 19:10:34 -0000

On Thu, 20 Dec 2018 11:04:41 PST (-0800), alistair23@gmail.com wrote:
> On Thu, Dec 20, 2018 at 10:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Thu, 20 Dec 2018 09:20:05 PST (-0800), alistair23@gmail.com wrote:
>> > On Wed, Dec 19, 2018 at 10:07 PM Richard Henderson
>> > <richard.henderson@linaro.org> wrote:
>> >>
>> >> On 12/19/18 11:16 AM, Alistair Francis wrote:
>> >> > This patch set adds RISC-V backend support to QEMU. This is based on
>> >> > Michael Clark's original work with extra work on top.
>> >> >
>> >> > This has been somewhat tested and can run other architecture softmmu
>> >> > code. It seems that any complex OS will eventually hang, but we can
>> >> > run the BIOS and OS startup code for a number of different operating
>> >> > systems.
>> >> >
>> >> > I haven't tested linux user support at all yet. I think Michael had that
>> >> > working reliably though and hopefully my changes haven't broken it.
>> >> >
>> >> > There are still some todos in the code (there are missing instructions
>> >> > and byte swapping) but these should assert instead of generating invalid
>> >> > code.
>> >>
>> >> Queued to tcg-next, with the extrh fix.
>> >
>> > Thanks Richard!
>>
>> Sounds good to me.  I'm still attempting to collect the RISC-V patches to get a
>> PR out, a few things came up but I should have time now.  This was the biggest
>> patch set, so it should be a lot easier now.
>>
>> Thanks for picking this up!
>>
>> >> Some of those todos are no longer todos, since e.g. bswap is now optional.
>> >> Those asserts should never fire (as a good assert should do, I suppose).
>> >>
>> >> The missing instructions are only for riscv32, which afaik is just now making
>> >> its way to glibc.  So a chroot complete enough to build qemu is a ways away.
>> >> I'm ok with leaving that incomplete for now.
>>
>> We've decided to delay the rv32i glibc port until after the next glibc release,
>> which is targeted for the beginning of February.  glibc should freeze at the
>> end of the year, at which point we're going to do a rv32i glibc prerelease and
>> try to build a proper userspace with the theory being that we'll shake out ABI
>> bugs that way.
>
> Yocto/OE has full support for building 32-bit userspaces with the
> latest 32-bit glibc patchset so that is probably a good place to start
> testing. It even runs QEMU!

That's my plan.  The issue is less on the distro side and more on the "go 
through the whole rv32i glibc ABI to make sure it's sane" side.

