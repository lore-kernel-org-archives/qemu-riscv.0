Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h91pT-0001Bm-46
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 02:14:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h91pN-00011u-De
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 02:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h91pK-0001SH-RD
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 02:14:20 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h91pI-0001PI-Id
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 02:14:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id p6so9441637pgh.9
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=NG3U8l6PTExzO8ehD15RMDYt3Nlbh6uSbA3dK2I+Ps8=;
	b=bpnniuobQ8uM6D+okhlkbo+czJ1uRffJ5QT3Zt8OuPZAITjvfjEeCSEuUQWLcjoQMm
	UJhpn0w6Aj/0fL6/7igt3ikFjFkHkpjtQ3U/IqNssQl0YAOX8dv6av8JMgyyh4tBAIi1
	8qAxZXB18REf470595btvy0qhlxihA1tcy8QxAFgE0OCk+a5b0v2wNls1Z+CnMQA8iyM
	lieud7RPV4kPFYzMQ3vUUvDW9ZCPSDxXR0OUFLn/tr5VO9M8ogmYDdY/0OQ+wcXVfUV8
	E/WBw5ILnM3KnE1N9dU0PXS0f9XbBx2J868VbFTXHELn4IHt5mjrDweLOCKBMD0hlNvX
	ixdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=NG3U8l6PTExzO8ehD15RMDYt3Nlbh6uSbA3dK2I+Ps8=;
	b=dzGg3AUuc8LBs+s2XPNu764exQlJrYV4jX2rg1RnEQBuYaWYJy7TgjSakGpyWY9R/c
	2KgAA4AbqMf8DSWrELGCv4mG5VxAH2TYhMZpB50zzKlnaRNzS1mbQn/pzVh+HSq/sS8G
	xb9nlK77eabYtch2pqNNGs4vyK56TyXGamtK8RKNEyM/UF5JrVwbt6xX+Z97vdhAGxOr
	LQxdL95oybJUAm9RNmls+D9oPHgNTCoSVPFg0Bn5mexQ+3LH9adPygkUckZHUeO0hfBq
	rTzUKVMxe69FiDMbxS8L9IDA7JJtCTkR8b+ZaUbWaAFuhCbOAwENkTgjUq2MDLJZlYeB
	zTRw==
X-Gm-Message-State: APjAAAXznoFfrU8R+ByBiN3Br9fuUSu90dqdFdIwHhgMEYtm2Ghcd5fB
	CF9XaebGOkN7zw1fTVxFaoziLQ==
X-Google-Smtp-Source: APXvYqxZgXm1QiJtEtoH9iu76kULwFV6NsjZyjm+98zLA3l8HGrrwJio8spPw2es5QC4+ZfCsiOBhA==
X-Received: by 2002:a65:6085:: with SMTP id t5mr33347365pgu.257.1553667252180; 
	Tue, 26 Mar 2019 23:14:12 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id
	p63sm29559441pfb.4.2019.03.26.23.14.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 23:14:11 -0700 (PDT)
Date: Tue, 26 Mar 2019 23:14:11 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Mar 2019 22:57:50 PDT (-0700)
In-Reply-To: <CAKmqyKNwBe+mfDDDw3gW_avKCpNAfb=0Y6kngb4fJ+jEHpSuVg@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-715db02a-044a-4da8-b091-7671d5cb17f1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v1 0/5] Update the QEMU PLIC
 addresses
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
X-List-Received-Date: Wed, 27 Mar 2019 06:14:23 -0000

On Tue, 26 Mar 2019 15:19:25 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 20, 2019 at 5:45 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
>>
>> This series updates the PLIC address to match the documentation.
>>
>> This fixes: https://github.com/riscv/opensbi/issues/97
>>
>> Alistair Francis (5):
>>   riscv: plic: Fix incorrect irq calculation
>>   riscv: sifive_u: Fix PLIC priority base offset and numbering
>>   riscv: sifive_e: Fix PLIC priority base offset
>>   riscv: virt: Fix PLIC priority base offset
>>   riscv: plic: Log guest errors
>
> Ping! Can this make it into 4.0?

Sorry, I missed this one.  I'll take a look.

>
> Alistair
>
>>
>>  hw/riscv/sifive_plic.c      | 16 +++++++++++-----
>>  hw/riscv/sifive_u.c         |  2 +-
>>  include/hw/riscv/sifive_e.h |  2 +-
>>  include/hw/riscv/sifive_u.h |  4 ++--
>>  include/hw/riscv/virt.h     |  2 +-
>>  5 files changed, 16 insertions(+), 10 deletions(-)
>>
>> --
>> 2.21.0
>>

