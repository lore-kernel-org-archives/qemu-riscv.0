Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg3FC-0001Wh-N6
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 04:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg3F9-0001S6-Jw
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg3F8-0002rz-7B
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40597)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg3F8-0002rV-0O
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so859958pgj.7
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 01:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=h8oU2b5N/pf/gNarMwQOz8ETjwfR+tQx32syhVexM+k=;
 b=ZEDwHCaBo8L1kgYXu/a4vkbB9XmVdwtQ9buFgOTLAqfovm9gXmZP8QwfQFKdE8sX1p
 dmyc4FtDa2KurLg3/hobNKBjQwXDFskNy9U6Oa6thM1+Dt5KIZCm695/2cIiXQ3iLlMF
 tCT505m7zqUT2yWJT5/dshpiE1V2flxr9Q/No/aIpdK79OR/ZsBeHCpobUKKUbu0apGh
 GQnNWfueUjNV0keeRq0teNrYUA6owhQe6SAlNHgXQBvqYPksMdFzSaHCRn8I1hLcsHo/
 sPvmOcaxEm4I3Gj7Rt322mWoDtbb0XwZQ1NySz11U2xbtgFDfobb9WK0D88UVB9ZFgAV
 YiLw==
X-Gm-Message-State: APjAAAXgS2SgzvGnKRtHM1yh21mjq+OUUJU2xFLxFbIGAyVGjhqwUXMq
 4sjNEqilJY4Rmyrc7NuxSlT+Zw==
X-Google-Smtp-Source: APXvYqzkJMiLNh9vqIy3aFQPO/lWLatci+1Bvxkz5o5ncbbsmFQggrxvkxVcAcyx89wxiJPITIv3gw==
X-Received: by 2002:a63:2323:: with SMTP id j35mr1767083pgj.166.1561537524533; 
 Wed, 26 Jun 2019 01:25:24 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id d12sm16914631pfd.96.2019.06.26.01.25.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:25:23 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:25:23 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:03:33 PDT (-0700)
In-Reply-To: <CAEUhbmVdVXaFhM2b1U2d5G0My5Gq3cMM1zhQKU3n051KuXu4HQ@mail.gmail.com>
CC: fintelia@gmail.com, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 sagark@eecs.berkeley.edu, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-667253d2-f664-40a4-8849-fc1a08ffeaf7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3] target/riscv:
 Expose time CSRs when allowed by [m|s]counteren
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
X-List-Received-Date: Wed, 26 Jun 2019 08:25:29 -0000

On Tue, 25 Jun 2019 23:54:06 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Tue, Jun 25, 2019 at 5:57 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 24 Jun 2019 16:03:20 PDT (-0700), fintelia@gmail.com wrote:
>> > Apparently my previous message didn't make it out onto the list (sorry
>> > about all these email glitches!). I've included the message again below.
>> > Hopefully either a patch like this one or something simpler that just hard
>> > codes mcounteren.TM to zero (so QEMU is at least conformant) can be merged
>> > in time for 4.1.
>> >
>> > On Fri, Jun 14, 2019 at 8:55 AM Jonathan Behrens <jonathan@fintelia.io>
>> > wrote:
>> >
>> >> I'm not sure that is accurate. Based on the discussion here
>> >> <https://forums.sifive.com/t/possible-bug-in-counteren-csrs/2123> the
>> >> HiFive Unleashed actually does support reading the timer CSR from
>> >> unprivileged modes (from that discussion it does so a little too well...
>> >> but it should presumably be fixed in later iterations of the processor).
>> >> And even if no real hardware supported this capability, it still might make
>> >> sense to provide it in QEMU as an optimization.
>>
>> time and cycle are different registers: rdtime should trap, but rdcycle should
>> work.  The hardware traps rdtime into machine mode and emulates it via a memory
>> mapped register.  The bug in the FU540-C000 appears to be related to the
>> counter enables, not the presence of the counters.
>
> I don't think rdtime is required to mandatorily trap.
>
> Per privileged spec v1.10, chapter 3.1.17 Counter-Enable Registers
> ([m|h|s]counteren), it says:
>
> "When the CY, TM, IR, or HPMn bit in the mcounteren register is clear,
> attempts to read the cycle, time, instret, or hpmcountern register
> while executing in S-mode or U-mode will cause an illegal instruction
> exception."
>
> In the same chapter, it also says:
>
> "Implementations can convert reads of the time CSR into loads to the
> memory-mapped mtime register, or hard-wire the TM bits in mxcounteren
> to 0 and emulate this functionality in M-mode software."
>
> So per my understanding when mcounteren.TM is set, rdtime should NOT trap.

Implementations are allowed to implement the instruction, but all the exsting
implementations trap to M-mode.

