Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8mOK-0003Sr-7A
	for mharc-qemu-riscv@gnu.org; Fri, 13 Sep 2019 10:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44351)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i8mOH-0003QR-Av
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i8mOG-0004yA-2u
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:17:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i8mOF-0004xc-UH
 for qemu-riscv@nongnu.org; Fri, 13 Sep 2019 10:17:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id f19so13285255plr.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Sep 2019 07:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GdYA4qhZJ9ndjnRlvQ/KWIY8FcUOBsbtcuThm73Lxio=;
 b=K+IXC2rh6NWSfgJRnz7/6GbxQyKfQWfCC/SwoM3QQlQR5zdYvO+2PT1haHWtGsGrAt
 AbHBQbf0L0cNGkp1XcNPnDjgfIxF4I4lf25ULNzxqwr9MDj3XV75Fp0worhmGoOqlF/8
 eLMSOMX2hHgvuKPg12o9YjW8JGUwg/KJWfxehlOrZo7Mwux37GloRXUZHJMjROX1RNfa
 L0OCTdMQEwOAj0ET/Y0p1J4+yUnVk/LWDLmBcRsiCUf9gLdf7IMy8Z/kxkvpRqQ3H2iB
 jEQOTVQHorzgPo/Pm4DwoxCc51w196OSIYCKpCIIKbrFqFxqzRbVlXh5wTDuwUfk4naT
 /ZFA==
X-Gm-Message-State: APjAAAX/EZrx0cWktcBj8p/dE3jMbwdR5/tClmeUbwSuEwyLT8U67GlF
 NEI6LY9Hc5jjxN42FPjMdL0oMjDP7cmyEw==
X-Google-Smtp-Source: APXvYqw9d7GHORuKjJcRzrkYpx2B5vxhphFYWbwpuJljQKgdqEIcDEsnS8wTyfA2/BkBeKyTMj2G/A==
X-Received: by 2002:a17:902:8e8b:: with SMTP id
 bg11mr48441139plb.93.1568384253982; 
 Fri, 13 Sep 2019 07:17:33 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id c62sm40302366pfa.92.2019.09.13.07.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 07:17:33 -0700 (PDT)
Date: Fri, 13 Sep 2019 07:17:33 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 07:17:05 PDT (-0700)
In-Reply-To: <CAFEAcA94wuW4koj9+v4bbNH+omZQfqkw=JMUjvyDwbu_Eevgag@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-89941bf7-1034-44fe-956f-a949910f2b52@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.196
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.2 Soft Freeze,
 Part 1
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
X-List-Received-Date: Fri, 13 Sep 2019 14:17:38 -0000

On Fri, 13 Sep 2019 02:17:32 PDT (-0700), Peter Maydell wrote:
> On Wed, 11 Sep 2019 at 09:24, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The following changes since commit 89ea03a7dc83ca36b670ba7f787802791fcb04b1:
>>
>>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/m68k-pull-2019-09-07' into staging (2019-09-09 09:48:34 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-sf1
>>
>> for you to fetch changes up to 1b2d0961bfaaa2db3a237f53273527b6c5e3498a:
>>
>>   target/riscv: Use TB_FLAGS_MSTATUS_FS for floating point (2019-09-10 06:08:42 -0700)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 4.2 Soft Freeze, Part 1
>>
>> This contains quite a few patches that I'd like to target for 4.2.
>> They're mostly emulation fixes for the sifive_u board, which now much
>> more closely matches the hardware and can therefor run the same fireware
>> as what gets loaded onto the board.  Additional user-visible
>> improvements include:
>>
>> * support for loading initrd files from the command line into Linux, via
>>   /chosen/linux,initrd-{start,end} device tree nodes.
>> * The conversion of LOG_TRACE to trace events.
>> * The addition of clock DT nodes for our uart and ethernet.
>>
>> This also includes some preliminary work for the H extension patches,
>> but does not include the H extension patches as I haven't had time to
>> review them yet.
>>
>> This passes my OE boot test on 32-bit and 64-bit virt machines, as well
>> as a 64-bit upstream Linux boot on the sifive_u machine.
>>
>
> Hi; this fails 'make check' on all platforms:
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=riscv32-softmmu/qemu-system-riscv32
> QTEST_QEMU_IMG=qemu-img t
> ests/qom-test -m=quick -k --tap < /dev/null | ./scripts/tap-driver.pl
> --test-name="qom-test"
> PASS 1 qom-test /riscv32/qom/spike
> PASS 2 qom-test /riscv32/qom/virt
> PASS 3 qom-test /riscv32/qom/none
> PASS 4 qom-test /riscv32/qom/spike_v1.10
> qemu-system-riscv32: Invalid SMP CPUs 1. The min CPUs supported by
> machine 'sifive_u' is 2
> socket_accept failed: Resource temporarily unavailable
> **
> ERROR:/home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:266:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
> /home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:135:
> kill_qemu() tried to terminate QEMU process but encountered exit
> status 1
> ERROR - Bail out!
> ERROR:/home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:266:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
> Aborted (core dumped)
> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:900:
> recipe for target 'check-qtest-riscv32' failed

Sorry about that, I ran the tests on the wrong branch.  I'll submit another PR 
with the issue fixed.

