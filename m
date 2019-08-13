Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxfWl-0000Bo-43
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 18:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55383)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxfWi-0000AA-AW
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxfWh-0003EY-9p
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:44:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxfWh-0003ED-4W
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:44:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id b24so1909550pfp.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 15:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sJIocxls5v7/F9lnrVCDJBoHU+q1YnklqThtqdk9Kz4=;
 b=QFKNjiw7oxcl9u8S8twTQh3Pwv2msnIMDln20aYPTzYi9SvWk0+sKCaD5vpPorjTnI
 hBBLln1PcpWr+cKbJWsJmJ5KLz2MbC/LMZ/jSUcmSiL3+uTs8/faun++EJ5aaME5Z+sN
 RpkEanHMeL+GkZbNw19v5SV5/+2ptUKlH5pWh1tDEt1CAJiY6MvNAo4ZZcq3YMtuU0Lm
 Ial19PUwdLzBvRgd5rys+88Cu4N5JdxXfNm9q3/gI/DULk/klS+uflPcRuknplVRP2Lo
 5hpDrti20GJeLjw2j6IZSU9ltsKPCkhO+i625Ex77N7c+t2DqSIgH2/twn2QKGVz2+nY
 10sQ==
X-Gm-Message-State: APjAAAWikRNtLSxyMb4Pu/OgQwSjtyOS1f4JAitVTT6MkxO8FJUOnp67
 nKCr8jU8C5CiqvwiS2pMnm4zzQ==
X-Google-Smtp-Source: APXvYqwbvxlulGm8svsBkzFA7P0HPvrJDdmkuIdJTPi+TOwWwrnvSUdLJhVlQcAG/3cWMcLVHnspdQ==
X-Received: by 2002:a63:2b8e:: with SMTP id r136mr6818998pgr.216.1565736261420; 
 Tue, 13 Aug 2019 15:44:21 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u7sm99025672pgr.94.2019.08.13.15.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 15:44:20 -0700 (PDT)
Date: Tue, 13 Aug 2019 15:44:20 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Aug 2019 15:43:48 PDT (-0700)
In-Reply-To: <CAFEAcA-A5P+2XE49dg582CRtDPH0CXevyYfkGkaDH3HN=NFYcg@mail.gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-19b0dd58-7f8d-45a6-ac6b-049be291d2a7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 22:44:25 -0000

On Thu, 01 Aug 2019 08:39:17 PDT (-0700), Peter Maydell wrote:
> On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> From: Michael Clark <mjc@sifive.com>
>>
>> This patch adds support for the riscv_cpu_unassigned_access call
>> and will raise a load or store access fault.
>>
>> Signed-off-by: Michael Clark <mjc@sifive.com>
>> [Changes by AF:
>>  - Squash two patches and rewrite commit message
>>  - Set baddr to the access address
>> ]
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Oops, I missed seeing this go by. The do_unassigned_access
> hook is deprecated and you should drop this and use
> the do_transaction_failed hook instead.
>
> The distinction between the two is that do_unassigned_access
> will end up being called for any failing access, including
> not just "normal" guest accesses but also for bad accesses
> that happen during page table walks (which often want to
> be reported to the guest differently) and also accesses
> by random devices like DMA controllers (where throwing a
> cpu exception is always a bug).
>
> Changing the hook implementation itself should be straightforward;
> commit 6ad4d7eed05a1e23537f is an example of doing that on Alpha.
> You also want to check all the places in your target code that
> do physical memory accesses, determine what the right behaviour
> if they get a bus fault is, and implement that (or at least put
> in TODO comments).

Sorry, updating that has been on my TODO list for a while now.  I figured it 
was better to have the deprecated version in there than nothing at all.  I've 
written some patches to fix this, but I want to give them another look before 
sending them out.

