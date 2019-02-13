Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtzBZ-0000NU-Rx
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 13:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtzBX-0008W2-AR
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtz14-0004aB-4U
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:12:15 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtz13-0004Xp-Ip
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:12:14 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s1so1546361plp.9
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 10:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=30AOoz1urnSeFSCYmiq/noHISHPgocbUGMlNz5MWmC4=;
	b=XzBMUPbsOJFjLu7v66Y3KVTGO2SXVUtbaatytuMeB6uDeiDC1t9wUSLSSaiJt/fRqa
	kq4xu3iHI7sCCQqUZR6QewvEn+c2GEDfC2SpeT9WlX8ftwC09ZQ9Z4PnZqYmQCC0KiEq
	9/SfTIUQCZ7D2VA3SPkiQPivAN3Z0TQa1NXLa9ePksIzjL4dOnGsVWdTlEtfcqW3y1/m
	b35uBoD5INjHVal5GpFfwJlIHJ9Vw0W90IbZbgk5X632hAoL7d0hVyIqkH6Hgqc3i0vR
	HbdQyCWt82qQX8g9Y452q3aH9QL+fT+0Dv5Fz81vePZGil+3vO3rsoqlpeCoEpuFmmHM
	P/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=30AOoz1urnSeFSCYmiq/noHISHPgocbUGMlNz5MWmC4=;
	b=Gn4I9itwOF3EPqeIdZHMQhDQI9y8m08oCO4QBuLXvKr0dwhlwGIFZiS2gHbNjwsgQR
	pWizurgB+wRLSibJV46gx7FVNjsYvRxfSzg6beR9kNKSWAr3lIozAcyyMXOpQOmkIIbT
	1oFdqqmzid9ifICIbO+01t93IpUb/PSDvvhUYKinxuMIhLDyjzFZzAKi2ir7Wb0eibvK
	OnR1tkWBGO5NXP77WWIZwPoxcWEIg3hLLoOJ2vhGxRa8gQF2hPQqRCrSqDeyi+jUCU6E
	ZpvJx5URm6SCYXEvu8jExzuHnn9GbXkawi6wUqkts82mTXmRJJYIFU/0R7yshlVhfHVR
	qROA==
X-Gm-Message-State: AHQUAubFS6RutHgK/G7Ohw/aCrPAmkzSMI7Hnn69+dgAC9eJcgQvS/4K
	4FvqrgXR5fRSr72YVd2X3Qzs4g==
X-Google-Smtp-Source: AHgI3IZ4isP9+nCvnSTuV5AadyhyQlKhI0yPMF4q0T+nfUd76uzdCm8rblVmJ+lNtCr3jJc68ZBtJg==
X-Received: by 2002:a17:902:b182:: with SMTP id
	s2mr1758943plr.89.1550081531571; 
	Wed, 13 Feb 2019 10:12:11 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a6sm12717043pfn.147.2019.02.13.10.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 10:12:10 -0800 (PST)
Date: Wed, 13 Feb 2019 10:12:10 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 10:03:26 PST (-0800)
In-Reply-To: <CAKmqyKMWuqYD-_nYFR1dwvw7ZqPTqqsBdF_V0FBzryuWOgL4zQ@mail.gmail.com>
CC: chouteau@adacore.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org, mjc@sifive.com, 
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-40d9ba8a-37f0-43af-8a37-d56716c48630@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/sifive_clint.c:
 avoid integer overflow in timecmp write
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
X-List-Received-Date: Wed, 13 Feb 2019 18:23:04 -0000

On Fri, 08 Feb 2019 10:41:17 PST (-0800), alistair23@gmail.com wrote:
> On Thu, Feb 7, 2019 at 2:08 AM Fabien Chouteau <chouteau@adacore.com> wrote:
>>
>> Hello Alistair,
>>
>> On 07/02/2019 01:42, Alistair Francis wrote:>
>> > Can you describe what this fixes?
>> >
>>
>> I encountered this problem when I tried to write 0xffffffffffffffff in timecmp.
>>
>> With the integer overflow in QEMU, writing this value means that the QEMU timer
>> will be set in the past.
>>
>> > Won't an overflow be ok as we then just wrap around anyway? I guess
>> > there is a problem if we want a value so large that we wrap around
>> > past our current time though.
>> >
>>
>> The overflow was in the computation of the value `next_ns`. It is used to set
>> the QEMU timer:
>>
>> timer_mod(cpu->env.timer, next_ns);
>>
>> A negative `next_ns` -because of the overflow- means that the timer
>> triggers immediately instead of far in the future.
>
> Ah you are right here. The expired time of the timer will be set to
> zero (it looks like QEMU ensures it can't be negative) but then it
> detects that as being in the past and will trigger the timer event as
> timer_expired_ns() will return true.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks.  I'll target this for the next PR.

