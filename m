Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPe3J-0004lw-4X
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 20:45:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPe3G-0004li-TS
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:45:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPe3C-00004x-9T
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:45:06 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPe3C-0008Un-14
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:45:02 -0500
Received: by mail-pl1-x643.google.com with SMTP id b5so8016996plr.4
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 17:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=oXSv+RzTJQNcC9y2Ptcf4BzMd35bS4ht12EhWMH13Q0=;
	b=MH8hn2DS+A5U1Zc3kw/Mo08pnFAHZOb4ej2RpqLN3UvQfwdXeuqFh3Ay+4oKcG+Irc
	Xm3c8bvqySeBsmJFsGqEtkZTK7pgLz5elypKeE1qu7NRYKTQBACTKxG0Ianba/xCKod9
	VpQNX3EOlzcP+gkuQ1Gg1jpCj5/9cDWJ+0L94SfRCMKB+XlPG1lB6A9f2FL/ahGC01Ly
	gYYr4w3NmexyELjRMxzS8Hugp925KcfUXgAR107yiEBST5n2U9z568vj0qpORd557Q51
	q99rD5vBwK0YHr7m1ZVfSRG74dB+rILQmKeO6Pqkw594zJ1p5j71sz7S3PCDGCMDy65k
	dlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=oXSv+RzTJQNcC9y2Ptcf4BzMd35bS4ht12EhWMH13Q0=;
	b=U75nJvPuAakcWr6/vKbgRE4XpXCRzA0M3sXWfLgHXcC/aF9GcKPF72WMEPlDkpi/qN
	4ucRR5gwxFzgiAiV8IN1voOF3S4RJvDJNjvxNB4EJjVxgCT1mLaIntA+idJr3rkMhPMe
	spoQr75INAo8ApUxuA0ar3dPEf9V5Dvsjw0gqs/qMREiuFxbndkXTauVQIIHW88yr/mD
	7Cq/RKkxTr9TB2g13hDGUuGiyVT+bRKHhnVdevk2M03L23QvqT7CJMw0rS5Kpqg14zcL
	/ku5Z4O7cy5y3ZcnoGaN4yQ22PqV8zV9iLRqsIdZxf+MTYzjgcjXlhLNQZ2cKBlDwzc0
	ZDTQ==
X-Gm-Message-State: AGRZ1gIQl26+lSK0zWA8lnrQTMK+OpGVlwwc76WGyv6JgIVsbS15xX/X
	qKiUCRqqRUain3dqB+8DWf4yRA==
X-Google-Smtp-Source: AJdET5c2BVaGHW2VJze2d3zFH3j/Bmhay++MDU8jW6mIF4QQ1KJc6OX89MGbtjWWtUTVZYZ6bzmmIA==
X-Received: by 2002:a62:3046:: with SMTP id
	w67-v6mr9331631pfw.177.1542851100688; 
	Wed, 21 Nov 2018 17:45:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	o13sm22887631pfk.57.2018.11.21.17.44.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 17:44:59 -0800 (PST)
Date: Wed, 21 Nov 2018 17:44:59 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 17:44:02 PST (-0800)
In-Reply-To: <201f1cf4-30af-03c5-393b-0eab6ac7eb87@redhat.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: philmd@redhat.com
Message-ID: <mhng-ce1dc513-eb34-4ace-b3a2-248347025887@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.1 1/2] MAINTAINERS: Any
 file with "riscv" in the name is a RISC-V file
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
X-List-Received-Date: Thu, 22 Nov 2018 01:45:07 -0000

On Wed, 21 Nov 2018 16:29:09 PST (-0800), philmd@redhat.com wrote:
> On 22/11/18 0:46, Palmer Dabbelt wrote:
>> There was a recent thread about unmaintained files in QEMU where it was
>> noted that a few RISC-V related files had slipped through the patterns
>> in our MAINTAINERS file entry.  This patch adds some more aggressive
>> pattern matching in an attempt to rectify this situation.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1032406c5607..e89adc81d5d5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -255,6 +255,8 @@ F: target/riscv/
>>   F: hw/riscv/
>>   F: include/hw/riscv/
>>   F: disas/riscv.c
>> +K: riscv
>> +N: riscv
>
> QEMU doesn't support the 'N' tag.
> I see from the Linux kernel:
>
>    N: Files and directories with regex patterns.
>       N:   [^a-z]tegra     all files whose path contains the word tegra
>       One pattern per line.  Multiple N: lines acceptable.
>       scripts/get_maintainer.pl has different behavior for files that
>       match F: pattern and matches of N: patterns.  By default,
>       get_maintainer will not look at git log history when an F: pattern
>       match occurs.  When an N: match occurs, git log history is used
>       to also notify the people that have git commit signatures.
>
> Should we add this feature to checkscript?

Ah, I didn't check because I just copied this from our Linux entry.  It's 
pretty much the core of what I'm trying to do here so if it's easy then that'd 
be great.

Unfortunately I don't know how to do so.

>
>>
>>   S390
>>   M: Richard Henderson <rth@twiddle.net>
>>

