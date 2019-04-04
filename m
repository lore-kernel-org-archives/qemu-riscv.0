Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBy01-0000Ny-0i
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 04:45:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBxzx-0000Mh-Di
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 04:45:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBxzs-0001i3-MB
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 04:45:23 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBxzm-0001d9-Hv
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 04:45:15 -0400
Received: by mail-ot1-x342.google.com with SMTP id o74so1623885ota.3
	for <qemu-riscv@nongnu.org>; Thu, 04 Apr 2019 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zVIxIeupO11Rr07cPrTwPm3uwctgvdtP9efW+VYpnfE=;
	b=wgcnBepqyRRsB/X+1GAOHj2rsvxQKUn5qH1mjCYzY6MKFOTBNKLNUL5sKlWlMFENM9
	8ODqZAroMWLAecNZZuHDBE4ZCsV/sTkrikHcl/MQHYwEVGdBf9yp+1H5jifrtA8Wpiaw
	xau9h4+mqDONmB0jFJb13GDjK0pNapzp85xw4cH/UjijPVFTrTeVf3yqjyd1lbSs5WHO
	kNXuLqeix6KrsOfRPImuErF7dXkS0KJCvJCLbwi6K0CI1xeYqqHwQYWnamb6IHGbljWZ
	9+jbhL7mXU8lvnTA6g2GAOpedkSs+ajQDd/pyRDR7+tEfTWkI3DLba7HRiDBN35BRQPP
	Z2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zVIxIeupO11Rr07cPrTwPm3uwctgvdtP9efW+VYpnfE=;
	b=DMiiMCMb4yxa3jTXkE8xGBEKhh76eEtkUNWIseR6AU/y+qRNV25t01bIZ0k6qq36ik
	KA08ncZbQ+xgzMbabXC0nxC1R3rtABvT+k53bj6w7YpYT7xATZjWuOhzPvVhofwwlc6g
	F0B+xh8X17Y7z+EQHDo8Klb+FSHKZHEgekLIJF1ptJ2v4SDwWk9zc7uZGsWjoyXJwKUK
	CTXI25dEBnBW/QEdxy6B48ZNH8jXRqXEHh/OuOmCYU3r7lSGNCfZrbWCcshejN152BWV
	74ywwGEF/OFFc4lakNnJpgNE/1P+qFzLbk3AUV4ebu95AhZ4s+7/zCMc8Gd84IQTtrB6
	mMuQ==
X-Gm-Message-State: APjAAAXLPliUBppvz06EqW4iddm3UvxYSdHc+lltMsYh51996ACkLNOO
	Y3J+RvhSG4YgFkcF/IK780yXVbA9nYr3jd/qmD92Sg==
X-Google-Smtp-Source: APXvYqwdv04Idxsyb+dCNmSU/Ip1AS7cR8UFDzvTumm50MNgkf3smNxiqRA12ecZ6Ph/JUMKQt0hPCLk3ReHUebw7e0=
X-Received: by 2002:a05:6830:1cb:: with SMTP id
	r11mr3191370ota.302.1554367513565; 
	Thu, 04 Apr 2019 01:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190404005523.6513-1-palmer@sifive.com>
In-Reply-To: <20190404005523.6513-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2019 15:45:01 +0700
Message-ID: <CAFEAcA8Appw-0e+RLu0ezFxVnKra6eXRLsN+mCxurFD8XBySgg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Thu, 04 Apr 2019 08:45:27 -0000

On Thu, 4 Apr 2019 at 08:00, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 49fc899f8d673dd9e73f3db0d9e9ea60b77c331b:
>
>   Update version for v4.0.0-rc1 release (2019-03-26 17:02:29 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc3
>
> for you to fetch changes up to b84ffcecdb7a6a3e9946d0d6d24703199c4880b3:
>
>   riscv: plic: Log guest errors (2019-03-27 20:23:03 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for 4.0-rc3
>
> This patch set contains a pair of tightly coupled PLIC bug fixes:
>
> * We were calculating the PLIC addresses incorrectly.
> * We were installing the wrong number of PLIC interrupts.
>
> The two bugs togther resulted in a mostly-working system, but they're
> impossible to seperate because fixing one bug would result in
> significant breakage.  As a result they're in the same patch.
>
> There is also a cleanup to use qemu_log_mask(LOG_GUEST_ERROR,...) for
> error reporting.
>
> As far as I know these are the last outstanding RISC-V patches for 4.0.

Hi; I'm afraid this fails 'make check':
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_BINARY=riscv32-softmmu/qemu-system-riscv32
QTEST_QEMU_IMG=qemu-img tests/qom-test -m=quick -k --tap < /dev/null |
./scripts/tap-driver.pl --test-name="qom-test"
PASS 1 qom-test /riscv32/qom/virt
PASS 2 qom-test /riscv32/qom/none
PASS 3 qom-test /riscv32/qom/spike_v1.10
Broken pipe
/home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:143:
kill_qemu() detected QEMU death from signal 11 (Segmentation fault)
(core dumped)
Aborted (core dumped)
ERROR - too few tests run (expected 6, got 3)
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:903:
recipe for target 'check-qtest-riscv32' failed

The sifive_u machine seems to dump core on startup:

$ gdb --args riscv32-softmmu/qemu-system-riscv32 -M sifive_u -display none
[...]
(gdb) r
Starting program:
/home/petmay01/linaro/qemu-for-merges/build/alldbg/riscv32-softmmu/qemu-system-riscv32
-M sifive_u -display none
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7fffd7dc4700 (LWP 29908)]
[New Thread 0x7fffd526f700 (LWP 29909)]

Thread 1 "qemu-system-ris" received signal SIGSEGV, Segmentation fault.
0x0000555555ba1df7 in object_get_canonical_path_component
(obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:1797
1797        g_hash_table_iter_init(&iter, obj->parent->properties);
(gdb) bt
#0  0x0000555555ba1df7 in object_get_canonical_path_component
(obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:1797
#1  0x0000555555ba1ed6 in object_get_canonical_path
(obj=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:1823
#2  0x0000555555ba0b72 in object_property_set_link
(obj=0x5555567e2e50, value=0x5555559b3018
<qdev_get_hotplug_handler+24>, name=0x555556919b60 "sysbus-irq[0]",
errp=0x5555566b6d28 <error_abort>)
    at /home/petmay01/linaro/qemu-for-merges/qom/object.c:1302
#3  0x00005555559b37f4 in qdev_connect_gpio_out_named
(dev=0x5555567e2e50, name=0x555555e52b62 "sysbus-irq", n=0,
pin=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
/home/petmay01/linaro/qemu-for-merges/hw/core/qdev.c:460
#4  0x00005555559b9d7b in sysbus_connect_irq (dev=0x5555567e2e50, n=0,
irq=0x5555559b3018 <qdev_get_hotplug_handler+24>) at
/home/petmay01/linaro/qemu-for-merges/hw/core/sysbus.c:116
#5  0x000055555590a9e9 in riscv_sifive_u_soc_realize
(dev=0x5555567e2820, errp=0x7fffffffdc80) at
/home/petmay01/linaro/qemu-for-merges/hw/riscv/sifive_u.c:393
#6  0x00005555559b457e in device_set_realized (obj=0x5555567e2820,
value=true, errp=0x5555566b6d28 <error_abort>) at
/home/petmay01/linaro/qemu-for-merges/hw/core/qdev.c:834
#7  0x0000555555ba276a in property_set_bool (obj=0x5555567e2820,
v=0x5555567e9360, name=0x555555e28139 "realized",
opaque=0x5555567e1220, errp=0x5555566b6d28 <error_abort>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:2074
#8  0x0000555555ba09e6 in object_property_set (obj=0x5555567e2820,
v=0x5555567e9360, name=0x555555e28139 "realized", errp=0x5555566b6d28
<error_abort>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:1266
#9  0x0000555555ba3aac in object_property_set_qobject
(obj=0x5555567e2820, value=0x5555567e9340, name=0x555555e28139
"realized", errp=0x5555566b6d28 <error_abort>) at
/home/petmay01/linaro/qemu-for-merges/qom/qom-qobject.c:27
#10 0x0000555555ba0ccb in object_property_set_bool
(obj=0x5555567e2820, value=true, name=0x555555e28139 "realized",
errp=0x5555566b6d28 <error_abort>) at
/home/petmay01/linaro/qemu-for-merges/qom/object.c:1332
#11 0x000055555590a1f3 in riscv_sifive_u_init (machine=0x55555671b8d0)
at /home/petmay01/linaro/qemu-for-merges/hw/riscv/sifive_u.c:270
#12 0x00005555559bcfa8 in machine_run_board_init
(machine=0x55555671b8d0) at
/home/petmay01/linaro/qemu-for-merges/hw/core/machine.c:1030
#13 0x00005555559406fd in main (argc=5, argv=0x7fffffffe1d8,
envp=0x7fffffffe208) at
/home/petmay01/linaro/qemu-for-merges/vl.c:4479


Running under valgrind shows use of uninitialised values, invalid reads, etc:

==29912== Conditional jump or move depends on uninitialised value(s)
==29912==    at 0x5677A8: qdev_connect_gpio_out_named (qdev.c:450)
==29912==    by 0x56DD7A: sysbus_connect_irq (sysbus.c:116)
==29912==    by 0x4BE9E8: riscv_sifive_u_soc_realize (sifive_u.c:393)
==29912==    by 0x56857D: device_set_realized (qdev.c:834)
==29912==    by 0x756769: property_set_bool (object.c:2074)
==29912==    by 0x7549E5: object_property_set (object.c:1266)
==29912==    by 0x757AAB: object_property_set_qobject (qom-qobject.c:27)
==29912==    by 0x754CCA: object_property_set_bool (object.c:1332)
==29912==    by 0x4BE1F2: riscv_sifive_u_init (sifive_u.c:270)
==29912==    by 0x570FA7: machine_run_board_init (machine.c:1030)
==29912==    by 0x4F46FC: main (vl.c:4479)


thanks
-- PMM

