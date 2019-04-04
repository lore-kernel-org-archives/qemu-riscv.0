Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC71i-00026E-LH
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 14:23:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hC71d-00022r-Mn
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:23:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hC6yv-0005ZW-BN
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:20:59 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hC6yu-0004t7-Ru; Thu, 04 Apr 2019 14:20:57 -0400
Received: by mail-lf1-x143.google.com with SMTP id 10so2479720lfr.8;
	Thu, 04 Apr 2019 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WZusMym3HKJ+EkmyvRgOx0dWmnIaqnBKS2jgF8hmeF8=;
	b=ldTWrdZcL/3hlPmeKRhbpfO5f055gPqpzojpnBoXXxT3Rxyi8WvRRwKSaQ6cWDQKOI
	bOVUUorgP3RnBP6+mCL2FRbmCoBFsReGOOXLuEhaDmjxTovgjDKIpct2dEbDwmBwc2y6
	91f3sRB91WvV1QUww9iA3D5BYRUW4RHC6eFw2ePWxl/ku5buDc4CMEgbHKpNFyH95PeP
	iTSQuPCGWmOmnTII3NX0dltfXTbJe4GkclFnGAbEvR0KjkeTBm2lMgG03QiAsUDOHYU9
	SCxPnDbDhIbDSrfQmgbRKWIkJ5clT7yNA1+sBgkodPjEsXkLKgo8qmXvemoPJGPlrbbL
	6Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WZusMym3HKJ+EkmyvRgOx0dWmnIaqnBKS2jgF8hmeF8=;
	b=VRZWABtCx/fUBdVxX0XcVvIkDCkox/qALfNAaUb8EyKboEDr0T9+zt7zQK34ZkUeYW
	Hk+aT5lXZOuWsCxdCXuM5loF+q6+VKON/mZZ5fCZwrDM/uvFJ2FXjMhEbZTTEq4Kr07s
	Mh2EYYwanMG3rrjf7zKbxvAJNQ4TjvPYRzNJ8ZvHqTB08CO+jDPxdN/zNj/DPv6tSDjD
	n1v29zSz1eFZV0T9rPijHO8jzMVBrHos+FQl0jkQtQrE7jmV3uQsZPRjyXwvvonF7qxa
	idko6yzlZQbB6KkdNrX89JnrzhmzvGTJ+eagjIUjP6XBsqX6uSSO8LHDetBsgswV4idy
	BVLw==
X-Gm-Message-State: APjAAAUkNUmtCd3QiocoBU71jilDSe0laIckoLamzVdpxhMNdi9FLKK6
	+NX9igc/Awh0CXSvxuthiN30iWnid2tzMxUe1Ig=
X-Google-Smtp-Source: APXvYqynm5x0rFmQNvgjSBAzTOJIA8ci5ht39a5d4exUF7pVrTkkYfMCYZe8pYiKv0L9pW49hvoj4bPtrSieuMVqur8=
X-Received: by 2002:a19:9107:: with SMTP id t7mr4136644lfd.48.1554402023791;
	Thu, 04 Apr 2019 11:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190404005523.6513-1-palmer@sifive.com>
	<CAFEAcA8Appw-0e+RLu0ezFxVnKra6eXRLsN+mCxurFD8XBySgg@mail.gmail.com>
In-Reply-To: <CAFEAcA8Appw-0e+RLu0ezFxVnKra6eXRLsN+mCxurFD8XBySgg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Apr 2019 11:18:52 -0700
Message-ID: <CAKmqyKNrdJA55m1sZDM=cFXJV1-0KU-52qE40anNDH227bzEaw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc3
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
X-List-Received-Date: Thu, 04 Apr 2019 18:23:49 -0000

On Thu, Apr 4, 2019 at 1:45 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 4 Apr 2019 at 08:00, Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > The following changes since commit 49fc899f8d673dd9e73f3db0d9e9ea60b77c331b:
> >
> >   Update version for v4.0.0-rc1 release (2019-03-26 17:02:29 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc3
> >
> > for you to fetch changes up to b84ffcecdb7a6a3e9946d0d6d24703199c4880b3:
> >
> >   riscv: plic: Log guest errors (2019-03-27 20:23:03 -0700)
> >
> > ----------------------------------------------------------------
> > RISC-V Patches for 4.0-rc3
> >
> > This patch set contains a pair of tightly coupled PLIC bug fixes:
> >
> > * We were calculating the PLIC addresses incorrectly.
> > * We were installing the wrong number of PLIC interrupts.
> >
> > The two bugs togther resulted in a mostly-working system, but they're
> > impossible to seperate because fixing one bug would result in
> > significant breakage.  As a result they're in the same patch.
> >
> > There is also a cleanup to use qemu_log_mask(LOG_GUEST_ERROR,...) for
> > error reporting.
> >
> > As far as I know these are the last outstanding RISC-V patches for 4.0.
>
> Hi; I'm afraid this fails 'make check':
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=riscv32-softmmu/qemu-system-riscv32
> QTEST_QEMU_IMG=qemu-img tests/qom-test -m=quick -k --tap < /dev/null |
> ./scripts/tap-driver.pl --test-name="qom-test"
> PASS 1 qom-test /riscv32/qom/virt
> PASS 2 qom-test /riscv32/qom/none
> PASS 3 qom-test /riscv32/qom/spike_v1.10
> Broken pipe
> /home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:143:
> kill_qemu() detected QEMU death from signal 11 (Segmentation fault)
> (core dumped)
> Aborted (core dumped)
> ERROR - too few tests run (expected 6, got 3)
> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:903:
> recipe for target 'check-qtest-riscv32' failed

I managed to reproduce the problem and I have sent a v3 with the fix.

What is strange is that I didn't see this in my make check runs, I'll
check to see what I'm missing.

What is also strange is that the SiFive U machine should only be
64-bit, it seems odd to run it with 32-bit RISC-V (unless I'm missing
something). That's probably something we should fix for 4.1.

Alistair

>
> The sifive_u machine seems to dump core on startup:
>
> $ gdb --args riscv32-softmmu/qemu-system-riscv32 -M sifive_u -display none
> [...]
> (gdb) r
> Starting program:
> /home/petmay01/linaro/qemu-for-merges/build/alldbg/riscv32-softmmu/qemu-system-riscv32
> -M sifive_u -display none
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> [New Thread 0x7fffd7dc4700 (LWP 29908)]
> [New Thread 0x7fffd526f700 (LWP 29909)]
>
> Thread 1 "qemu-system-ris" received signal SIGSEGV, Segmentation fault.
> 0x0000555555ba1df7 in object_get_canonical_path_component
> (obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:1797
> 1797        g_hash_table_iter_init(&iter, obj->parent->properties);
> (gdb) bt
> #0  0x0000555555ba1df7 in object_get_canonical_path_component
> (obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:1797
> #1  0x0000555555ba1ed6 in object_get_canonical_path
> (obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:1823
> #2  0x0000555555ba0b72 in object_property_set_link
> (obj=0x5555567e2e50, value=0x5555559b3018
> <qdev_get_hotplug_handler+24>, name=0x555556919b60 "sysbus-irq[0]",
> errp=0x5555566b6d28 <error_abort>)
>     at /home/petmay01/linaro/qemu-for-merges/qom/object.c:1302
> #3  0x00005555559b37f4 in qdev_connect_gpio_out_named
> (dev=0x5555567e2e50, name=0x555555e52b62 "sysbus-irq", n=0,
> pin=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
> /home/petmay01/linaro/qemu-for-merges/hw/core/qdev.c:460
> #4  0x00005555559b9d7b in sysbus_connect_irq (dev=0x5555567e2e50, n=0,
> irq=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
> /home/petmay01/linaro/qemu-for-merges/hw/core/sysbus.c:116
> #5  0x000055555590a9e9 in riscv_sifive_u_soc_realize
> (dev=0x5555567e2820, errp=0x7fffffffdc80) at
> /home/petmay01/linaro/qemu-for-merges/hw/riscv/sifive_u.c:393
> #6  0x00005555559b457e in device_set_realized (obj=0x5555567e2820,
> value=true, errp=0x5555566b6d28 <error_abort>) at
> /home/petmay01/linaro/qemu-for-merges/hw/core/qdev.c:834
> #7  0x0000555555ba276a in property_set_bool (obj=0x5555567e2820,
> v=0x5555567e9360, name=0x555555e28139 "realized",
> opaque=0x5555567e1220, errp=0x5555566b6d28 <error_abort>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:2074
> #8  0x0000555555ba09e6 in object_property_set (obj=0x5555567e2820,
> v=0x5555567e9360, name=0x555555e28139 "realized", errp=0x5555566b6d28
> <error_abort>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:1266
> #9  0x0000555555ba3aac in object_property_set_qobject
> (obj=0x5555567e2820, value=0x5555567e9340, name=0x555555e28139
> "realized", errp=0x5555566b6d28 <error_abort>) at
> /home/petmay01/linaro/qemu-for-merges/qom/qom-qobject.c:27
> #10 0x0000555555ba0ccb in object_property_set_bool
> (obj=0x5555567e2820, value=true, name=0x555555e28139 "realized",
> errp=0x5555566b6d28 <error_abort>) at
> /home/petmay01/linaro/qemu-for-merges/qom/object.c:1332
> #11 0x000055555590a1f3 in riscv_sifive_u_init (machine=0x55555671b8d0)
> at /home/petmay01/linaro/qemu-for-merges/hw/riscv/sifive_u.c:270
> #12 0x00005555559bcfa8 in machine_run_board_init
> (machine=0x55555671b8d0) at
> /home/petmay01/linaro/qemu-for-merges/hw/core/machine.c:1030
> #13 0x00005555559406fd in main (argc=5, argv=0x7fffffffe1d8,
> envp=0x7fffffffe208) at
> /home/petmay01/linaro/qemu-for-merges/vl.c:4479
>
>
> Running under valgrind shows use of uninitialised values, invalid reads, etc:
>
> ==29912== Conditional jump or move depends on uninitialised value(s)
> ==29912==    at 0x5677A8: qdev_connect_gpio_out_named (qdev.c:450)
> ==29912==    by 0x56DD7A: sysbus_connect_irq (sysbus.c:116)
> ==29912==    by 0x4BE9E8: riscv_sifive_u_soc_realize (sifive_u.c:393)
> ==29912==    by 0x56857D: device_set_realized (qdev.c:834)
> ==29912==    by 0x756769: property_set_bool (object.c:2074)
> ==29912==    by 0x7549E5: object_property_set (object.c:1266)
> ==29912==    by 0x757AAB: object_property_set_qobject (qom-qobject.c:27)
> ==29912==    by 0x754CCA: object_property_set_bool (object.c:1332)
> ==29912==    by 0x4BE1F2: riscv_sifive_u_init (sifive_u.c:270)
> ==29912==    by 0x570FA7: machine_run_board_init (machine.c:1030)
> ==29912==    by 0x4F46FC: main (vl.c:4479)
>
>
> thanks
> -- PMM

