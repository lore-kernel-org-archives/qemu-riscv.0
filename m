Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gLC2N-0006VO-3C
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 14:01:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLC2K-0006Tv-4J
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLC2E-0002CU-H3
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:01:42 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gLC29-0001xa-Qu
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:01:37 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y18-v6so1338637pfn.1
	for <qemu-riscv@nongnu.org>; Fri, 09 Nov 2018 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=rs7sFZ/po+arrVkH57mppYh5z1g3CQK6H7wNphhCn50=;
	b=m1YkiflyFqRI58bdl/aFdGaXm/qnIOLMnPE/2MQoQtpqlsiRkz6tNDfE4Y7Gh38UJ0
	v63DvYzscmTCjSqQrK/X+S+tosWta8VhwF6cwIAVwAKCrpvW6wgG/QH0X30hzz5SUFQs
	JGrxzTBkAZtwFXXdbJKuoi4KnGn+JCWqFJ6ykcbuMjQgEwFY49jvzeUbNvpgHZdk5eBT
	Hp1BVXsEP8/2PAymJXdctBMwGOrFUdsJxBy0s96o9hBfS43zlZRGbGgaObV8UeFBeFrA
	CayjsgRKavxyQFwWFviUaGznAeQVRxGpq9BPQFh1cNNoUhrSrew66/WclWoU8XSnpX97
	PnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=rs7sFZ/po+arrVkH57mppYh5z1g3CQK6H7wNphhCn50=;
	b=PqFuxBA4I7VLR8eVr+Pr9Mi5l00pPdpXjHEkRs4+M6k8Z6Dnbi3DOtgeEsg+0UHzoD
	+QbZgkNt+2O/RWBJABWXIQ+1F4VRQ/g0GRKt+kfZiXn1W24Hxj6eiznGhU7N5xFtO0hk
	/CkxSywCMGzt0m6PjkGYI6IeiK5nMUOrNjpv/PtBPuBqtHyvzI0j7nar/DGfbDE7FYMF
	fm3GWGjniaG8EhotEF+sRAdgLcUCgMh9L05EadlTofC94XZXGpoEvdCDxfT3wJUL3AvL
	LOkTtPY6PTfyU66KIo2zAJ4GD8Lcx5ErSmB4e91b6RlQyCdn2JrBYEIk9qoxEfuY+W6z
	Sq3Q==
X-Gm-Message-State: AGRZ1gJqPFNhUU4MDR2nzwd9PKItDNThl+GdQUh5Cp0Zjas3BNEu5Jdf
	hppCoIeTstRJlXeJEkE77Ps2QA==
X-Google-Smtp-Source: AJdET5fOJ2ivRO8JlbxkD9z4f4OJJ2i+Kuim8NKsWQ7DbyUeZ3ZN9KncV8Dt8dq/sgZNvmdX0COO/A==
X-Received: by 2002:a63:9845:: with SMTP id l5mr8532309pgo.142.1541790085330; 
	Fri, 09 Nov 2018 11:01:25 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	s144sm7803014pgs.87.2018.11.09.11.01.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 11:01:24 -0800 (PST)
Date: Fri, 09 Nov 2018 11:01:24 -0800 (PST)
X-Google-Original-Date: Fri, 09 Nov 2018 11:01:10 PST (-0800)
In-Reply-To: <CAFEAcA-nxzDGCPEXzWTf4MrJYc8nWk5_hxvczm26=V8O9K60vg@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-3b841457-4c6d-482d-bd48-38bcfaa2f2f1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] A Single RISC-V Patch for
 3.1-rc1
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
X-List-Received-Date: Fri, 09 Nov 2018 19:01:45 -0000

On Fri, 09 Nov 2018 02:53:45 PST (-0800), Peter Maydell wrote:
> On 8 November 2018 at 18:52, Palmer Dabbelt <palmer@sifive.com> wrote:
>> On Thu, 08 Nov 2018 10:38:51 PST (-0800), alistair23@gmail.com wrote:
>>>
>>> On Thu, Nov 8, 2018 at 10:35 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>>
>>>>
>>>> The following changes since commit
>>>> a7ce790a029bd94eb320d8c69f38900f5233997e:
>>>>
>>>>   tcg/tcg-op.h: Add multiple include guard (2018-11-08 15:15:32 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc1
>>>>
>>>> for you to fetch changes up to 00a014ac01feac875468d38c376f7e06f050f992:
>>>>
>>>>   riscv: spike: Fix memory leak in the board init (2018-11-08 08:41:06
>>>> -0800)
>>>>
>>>> ----------------------------------------------------------------
>>>> A Single RISC-V Patch for 3.1-rc1
>>>>
>>>> This tag contains a single patch that I'd like to target for rc1: a fix
>>>> for a memory leak that was detected by static code analysis.
>>>>
>>>> There are still three patch sets that I'd like to try to get up for 3.1:
>>>>
>>>> * The patch set Basian just published that contains fixes for a pair of
>>>>   issues he found when converting our port to decodetree.
>>>> * An as-of-yet-unwritten fix to the third issue that Basian pointed out.
>>>> * A fix to our fflags bug, which is currently coupled to some CSR
>>>>   refactoring that I don't think is OK for 3.1.
>>>
>>>
>>> There is one more patch fixing a memory leak in the virt board as well.
>>
>>
>> Oh, sorry about that -- I thought they were the same patch!
>>
>> Peter: let me know if you want me to submit a new copy of this PR with both
>> patches or a follow-on PR.  Sorry for the noise!
>
> As it happens, I'd just run this pullreq through testing overnight,
> so I've pushed it to master; you can send another one with the other
> patch.

OK, works for me.  Thanks!

