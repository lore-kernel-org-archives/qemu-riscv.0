Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyO3W-0007kS-Tg
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 18:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1hyO3U-0007ja-07
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 18:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hyO3S-0007pp-Ps
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 18:17:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hyO3S-0007pU-Kp
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 18:17:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so1903850pgg.8
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2019 15:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YVirCP/wK9IyZyH3ZSQbonCtPxOQEusl6JFK9HyLBwA=;
 b=PsBrUJ4KhngLb1mFLOHHSnJiqHXA6TDuxXd3Vl4IHMhIo02kQkVEL/fWDYtbMMJCMu
 KFtTT/NAZwPutXBg4al172n5wYft7mj5NR0hTnUOVB0WCALkWx+xtf0U6SpAj9XiCB+s
 N8z44tLU/LpddX0Hgj9fmxzjnLRexfqwmRU40nw9IH6P1tvo3EtJlOwGO0LvdNoOzv/b
 0xWgWrwFYhfdqvPiVEAFKhgzUEj0CbnN8q0mqfqjh/s/o1/M9gn5nhkFtMClaegOkWWe
 ZvbiEUOxTDegn7LtDDRgBuSEHjPuU8tGf6nZSd8OpFuHDEEoVzkaBI5gW6JWBd4howN0
 lWNA==
X-Gm-Message-State: APjAAAVcGI3ii8up1Ak+OnwUBOGKeQkQmFw/dXAMd6z6RC/VM0Q0UBUO
 7FsAw+BqVyq51HfE2O70QJLTBw==
X-Google-Smtp-Source: APXvYqwNhJywlsHPQ+I8TCvbA+E+RiFinB11dRr2U1oJCFjCqC1fssz38o/z3IBfY6tLKZSBSBj//A==
X-Received: by 2002:a63:7e17:: with SMTP id z23mr5227166pgc.14.1565907428480; 
 Thu, 15 Aug 2019 15:17:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 14sm4100740pfy.40.2019.08.15.15.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 15:17:07 -0700 (PDT)
Date: Thu, 15 Aug 2019 15:17:07 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Aug 2019 15:17:03 PDT (-0700)
In-Reply-To: <CAKmqyKMyv8gt8Gb6y0DMktnWnSKBw4ePwOXBzWkEpw5GVmyG0A@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-f7096b78-f11e-425e-8ade-d20c77ee1de6@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 04/32] target/riscv: Implement
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
X-List-Received-Date: Thu, 15 Aug 2019 22:17:13 -0000

On Thu, 15 Aug 2019 14:39:18 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Aug 13, 2019 at 3:44 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Thu, 01 Aug 2019 08:39:17 PDT (-0700), Peter Maydell wrote:
>> > On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
>> >>
>> >> From: Michael Clark <mjc@sifive.com>
>> >>
>> >> This patch adds support for the riscv_cpu_unassigned_access call
>> >> and will raise a load or store access fault.
>> >>
>> >> Signed-off-by: Michael Clark <mjc@sifive.com>
>> >> [Changes by AF:
>> >>  - Squash two patches and rewrite commit message
>> >>  - Set baddr to the access address
>> >> ]
>> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>> >> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> >
>> > Oops, I missed seeing this go by. The do_unassigned_access
>> > hook is deprecated and you should drop this and use
>> > the do_transaction_failed hook instead.
>
> Argh!
>
>> >
>> > The distinction between the two is that do_unassigned_access
>> > will end up being called for any failing access, including
>> > not just "normal" guest accesses but also for bad accesses
>> > that happen during page table walks (which often want to
>> > be reported to the guest differently) and also accesses
>> > by random devices like DMA controllers (where throwing a
>> > cpu exception is always a bug).
>> >
>> > Changing the hook implementation itself should be straightforward;
>> > commit 6ad4d7eed05a1e23537f is an example of doing that on Alpha.
>> > You also want to check all the places in your target code that
>> > do physical memory accesses, determine what the right behaviour
>> > if they get a bus fault is, and implement that (or at least put
>> > in TODO comments).
>>
>> Sorry, updating that has been on my TODO list for a while now.  I figured it
>> was better to have the deprecated version in there than nothing at all.  I've
>> written some patches to fix this, but I want to give them another look before
>> sending them out.
>
> I was going to start looking into this, but if you already have
> patches I won't bother. Let me know if you want a hand with the
> conversion.

You're more than welcome to take them over.  I've got something that boots 
Linux on my unassigned_access branch (github.com/palmer-dabbelt/qemu), but I 
haven't sanitized the whole port for physical accesses and I haven't convinced 
myself that my hook implementation is correct.

