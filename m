Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHsjV-0001Fe-EB
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 11:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHsjT-0001EO-G9
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 11:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHsjO-0001TZ-TS
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 11:48:35 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHsjN-0001Ef-7A
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 11:48:29 -0400
Received: by mail-pg1-x541.google.com with SMTP id r9-v6so7570671pgv.6
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=OcgNfJdVWHn2YTdWvwmlI6vDaWYD8veV3uKfYqHbDWk=;
	b=YLNvuVaNeMOoY1FW7x3p8KN/3lka+A32hxqoaHtvhTKJ0mvgbmlRAPTOe/dReF7Ftq
	T8t33XHBcKvbzj0LwJhLcMa9nBL5sQ36wiqsKm8nSu0qagJM1C1ntOzDGvKyMVyYoYrD
	vKjpEF2pBoEYIj9dcQ++kGd38xTii/GLnz5zBR0ajQToZFf0Y3vxfZI/I03LF/lncfVG
	7T1VVV3JJxCYTH8lln4+LZL8t6ij/idlXH/QluhP780MbclC8Ysu8zMW4v0Yj/W7A+AK
	dWFxIHSmWNkw/pfM1huZhusA3p8fpidr/rBGP+pTltPL3nyrUmrXgxe1p0r3WOfF/PKO
	+/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=OcgNfJdVWHn2YTdWvwmlI6vDaWYD8veV3uKfYqHbDWk=;
	b=d9xizw4E1NaqHQ9UEJM3y9J1bWdALrBr1m7tbizKSK1BpL9DTx2in/5Ok5HSe+1pRe
	Id8XHm79cScUnTK78mH+3Zif+n+49sS91juzDMTHKxql893pSHf0TSYzNSp8S0lukLuI
	ptQkW/FO9DH1FpWg9UDQmg60tywhxJSfDWFjc9jImbnsSV38GFas1IDPdW9ZqiLlj9zb
	EaxnN7jwnx7lAa+Bu1otsX29hQjiAe7xs3UebOpfiyrD0te3CN594sn0j5EAbrYdxlo4
	eulklNQBH97d8/Ml3GxIrij1P+U4axj1xk+aPghXOlpN6mzgIC9tTp+W17mtPZ5d2O5r
	AUCQ==
X-Gm-Message-State: AGRZ1gKMwru6qXq3OcQs4tqTlNm6MXFI7Ws4paJfRSkIuNb7qGw9azU9
	kGtTs/UAPV6WTRLFzQqgwXf3TQWVYrs=
X-Google-Smtp-Source: AJdET5eYOF76eFEgG0DqJaZZsNGbWhKMu5A/S8aa1szSayxWPS/HrYhLWJB/pqcrG6+75UnnkPCVWg==
X-Received: by 2002:a63:a84a:: with SMTP id i10mr3724256pgp.263.1541000899030; 
	Wed, 31 Oct 2018 08:48:19 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	i189-v6sm11619351pfg.156.2018.10.31.08.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 08:48:17 -0700 (PDT)
Date: Wed, 31 Oct 2018 08:48:17 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 08:46:05 PDT (-0700)
In-Reply-To: <CAKmqyKP8sic_SEiqugH2=119GcyZQthv=QVds0c00J0W5uXc2A@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-6c6dfbeb-7205-45c2-a533-15badb047dd1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 2/3] Add Alistair as a RISC-V
 Maintainer
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
X-List-Received-Date: Wed, 31 Oct 2018 15:48:36 -0000

On Tue, 30 Oct 2018 14:33:23 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Oct 30, 2018 at 2:23 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> Alistair has been contributing to the RISC-V QEMU port for a while now
>> so I'd like him to be officially listed as a maintainer.  I've checked
>> with the other RISC-V maintainers and there are no objections, and I've
>> also checked with Alistair so he knows I'm volunteering him.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Hey Palmer,
>
> It looks like you dropped a Reviewed by here. It's not super important
> in this case but for future patches it could be an issue.
>
> If you use QEMU's patches it should apply the tags for you:
> https://github.com/stefanha/patches

Sorry about that.  I'll take a look at patches.

>
> Alistair
>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d794bd7a66fe..d550fd8b809c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -241,6 +241,7 @@ F: disas/ppc.c
>>  RISC-V
>>  M: Michael Clark <mjc@sifive.com>
>>  M: Palmer Dabbelt <palmer@sifive.com>
>> +M: Alistair Francis <Alistair.Francis@wdc.com>
>>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>  S: Maintained
>> --
>> 2.18.1
>>
>>

