Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpQj-0006mc-IE
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:53:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpQe-0006Zo-GN
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:53:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpQU-0001YH-Uw
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:53:14 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKpQT-0000zg-SH
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:53:10 -0500
Received: by mail-pl1-x644.google.com with SMTP id f12-v6so8768489plo.1
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 10:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=p9BYXFASlYnSNIRlIfAQwT5FGrmB1VY77GEJxHFhsQ8=;
	b=GCIUuNS4nB+pHwYtcaX/aI78Hp/arejI2Kr9wdze6cn4mu0DKRKYeOV1ylpvmWA7mD
	NXPWm1govbv7Hxt9k3sORIcEXUmT0ta/WxOSBzLV/XvHa5I08ik+8R9IPmFW6MpfKcPf
	Li215haKQigUSdv9bmjkgs6FQ28Zee8W0ta5GaVNQ70HXL1W3DF69uDhhqwQ+bScLBiG
	wVx3+mJt5jgbbwv0dC+2R0q5LZFOVvTPujjjmj/UiprsyrLzCk2Qe5gcs4yF368SJKxK
	NQrfUOhnt15kkYi2t/VGxxZGtj5SbBqCpJ5euWHJLuBCHAVoi/yy2w5VXq6SdzoKY9Ws
	z4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=p9BYXFASlYnSNIRlIfAQwT5FGrmB1VY77GEJxHFhsQ8=;
	b=EE/xIhFkdeI65GAqPWIfSV5aBsLmBMivIS4wxGQsTmjZAkpLmlW0QkW/08Rn6TAmkt
	Yvc1gS8YN/9dcCgfZ+zRIitLAFZXCTpMuDRy0Rm2AyzyAQRUwcYbJDlRQMy0Mmf1Egzr
	IxZYuGNXezjbS6AGJHzGOF2VmH3TwFzBs497Q0xMuHVSosfQaeRxOwPH7XjMV4180gqC
	elnS4VGBgLBhWMRmeEwOniYm8evEJg17tyIs+mz+0pCkuzJ81e9QBxsIja3fX0VxrWz8
	kJ4SWwzc2T9TmsxeKZVloUe4HL49MndzP8PZjO5NejkJqxfwWzI3n22cMqvprbAUOCD6
	KrPQ==
X-Gm-Message-State: AGRZ1gL69MJgJG1Gc9TNkaHQFXr5ZzBf2gSEHF8MjH6mZ9gvAZWulKWf
	NhH3Yg53zJr60FAyeGpo3/dj4dvEHMM=
X-Google-Smtp-Source: AJdET5e3WaMDI9wwgxFJ5P0G32HqeZFZ1sfs2sI3LzeyEFZLaLmsiW2YPN77y11iJl35T8havfjktQ==
X-Received: by 2002:a17:902:8543:: with SMTP id
	d3-v6mr5672194plo.313.1541703138252; 
	Thu, 08 Nov 2018 10:52:18 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r137-v6sm7212003pfc.105.2018.11.08.10.52.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 10:52:17 -0800 (PST)
Date: Thu, 08 Nov 2018 10:52:17 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 10:52:15 PST (-0800)
In-Reply-To: <CAKmqyKPHDx7iTQRaY7+5v13oE-ARzpqFDOo4e98Y4bHGH7s+Ww@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com, Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-10e50b53-fc97-4315-9a4d-6934d7acd223@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Thu, 08 Nov 2018 18:53:24 -0000

On Thu, 08 Nov 2018 10:38:51 PST (-0800), alistair23@gmail.com wrote:
> On Thu, Nov 8, 2018 at 10:35 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The following changes since commit a7ce790a029bd94eb320d8c69f38900f5233997e:
>>
>>   tcg/tcg-op.h: Add multiple include guard (2018-11-08 15:15:32 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc1
>>
>> for you to fetch changes up to 00a014ac01feac875468d38c376f7e06f050f992:
>>
>>   riscv: spike: Fix memory leak in the board init (2018-11-08 08:41:06 -0800)
>>
>> ----------------------------------------------------------------
>> A Single RISC-V Patch for 3.1-rc1
>>
>> This tag contains a single patch that I'd like to target for rc1: a fix
>> for a memory leak that was detected by static code analysis.
>>
>> There are still three patch sets that I'd like to try to get up for 3.1:
>>
>> * The patch set Basian just published that contains fixes for a pair of
>>   issues he found when converting our port to decodetree.
>> * An as-of-yet-unwritten fix to the third issue that Basian pointed out.
>> * A fix to our fflags bug, which is currently coupled to some CSR
>>   refactoring that I don't think is OK for 3.1.
>
> There is one more patch fixing a memory leak in the virt board as well.

Oh, sorry about that -- I thought they were the same patch!

Peter: let me know if you want me to submit a new copy of this PR with both 
patches or a follow-on PR.  Sorry for the noise!

>> I'm at Plumbers next week (and I think Alistair is there too?), but I'll
>> try to find a way to squeeze in as much as possible.
>
> Yep! I'll be there.
>
> Alistair
>
>>
>> ----------------------------------------------------------------
>> Alistair Francis (1):
>>       riscv: spike: Fix memory leak in the board init
>>
>>  hw/riscv/spike.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>

