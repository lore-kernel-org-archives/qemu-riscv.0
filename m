Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuyPG-0006fH-FG
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 07:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuyPD-0006Z0-64
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:49:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuyPA-00014P-Iy
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:49:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46866
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuyPA-000124-E3
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579870183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaVr7FaAPrzlakHju3fBTVcglRGeU5edmafiCiWxbx4=;
 b=bK8kRROdQAwLJ3w0B9PQJUTzk53uLWrwlWk+dUS2nYJvp/2sW6tI6P4D//v0Z4J32sVu3X
 t2gGCt3Alpw+9p4KdsA7g/u73wj+qGXX6uEkaaat5DclYqJFKHIbY6V4misU/cSFFAldwj
 2N1TYPiFuj4tcn6yKvOXMMoayvRxOGQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Sc5_P8r9NkKf3SK04886-A-1; Fri, 24 Jan 2020 07:49:41 -0500
Received: by mail-wr1-f69.google.com with SMTP id r2so1100800wrp.7
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 04:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAvV1dC5xoQRUBS2/CTV2GT9Qa0yMY+Lz/g8I+J+m00=;
 b=G1QNwd3FubRTGqyN0aW8mt/RrGHDRN5ITYeGfGfcPIYOSZM+HvKT76Alnw07IBKYwW
 hwEMXlsqCpy/5RjqstPtAqXhp31wXNmDPBPzsJrOXs6lTM6LgujdKeWYqBMRXK7TD0WQ
 OrwV29w6SEl0zbfURO+N1SCVp5bYOm48ANUEiAgLINGM22BaBwX+A/lSdKjSt/QQVt2J
 bO4zMyQs6vngdNhXuUXJCaHr8+HzLkFvvGHXCFxr6PMI+wTbuSIU1Q4v3WQEO77b8zBh
 RDwlg+5sYX1s7+KmXsuQDjyGrlo2goU8Pnsr1gFuzxlSGLQcyOgO3KJ5dhbvlBKj5E/O
 RBAA==
X-Gm-Message-State: APjAAAUZiijjM7Ok4ymmoyHvAyX8Hp5arqDXyKlqiFt2ScGlXhuLpLu2
 a4pk6i+jSHtobLF9QT+QLTl27sA/4qjmfiQ5Z60550IXEHO2WtkZsNeA8XldfOVSSt/GGEG7pPb
 zJtajHt/odLoy6ig=
X-Received: by 2002:a5d:4085:: with SMTP id o5mr4113708wrp.321.1579870180631; 
 Fri, 24 Jan 2020 04:49:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+1NKwwKukHPGIajVcd16qteybc1uuPclxRSM4A0ejDE+j2k6zu7p/oZJIG94pSatZ6dTDOg==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr4113646wrp.321.1579870180113; 
 Fri, 24 Jan 2020 04:49:40 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id t81sm6911368wmg.6.2020.01.24.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 04:49:39 -0800 (PST)
Subject: Re: [PATCH rc2 00/25] target/avr merger
To: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake
 <eblake@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Eduardo Habkost <ehabkost@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200124005131.16276-1-f4bug@amsat.org>
 <CAK4993iG+t7fZS=cekXfJVpDQ_L7jLu8i2V4mHVLbS-r69=AVg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00c08b6d-6ca2-7fa6-3dab-b834aea5a8d3@redhat.com>
Date: Fri, 24 Jan 2020 13:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAK4993iG+t7fZS=cekXfJVpDQ_L7jLu8i2V4mHVLbS-r69=AVg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Sc5_P8r9NkKf3SK04886-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 24 Jan 2020 12:49:49 -0000

On 1/24/20 12:41 PM, Michael Rolnik wrote:
> Tested-by: Michael Rolnik <mrolnik@gmail.com <mailto:mrolnik@gmail.com>>

Thanks a lot!

> The only thing I want to change is instead of -kernel put -bios in=20
> qemu-doc.texi file. Should I send a new series?

Please do NOT :)

Richard can do the trivial fixup directly.

> On Fri, Jan 24, 2020 at 2:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org=20
> <mailto:f4bug@amsat.org>> wrote:
>=20
>     This is the AVR port from Michael release (merge) candidate 2.
>=20
>     Since v1 [1]:
>     - Addressed Thomas comments
>     - Fixed a non-critical bug in ATmega (incorrect SRAM base address)
>     - Added ELF parsing requested by Aleksandar
>     - Dropped default machine (as with the ARM port)
>=20
>     Change since rc1:
>=20
>     $ git backport-diff -u avr-rc1 -r origin/master..
>     Key:
>     [----] : patches are identical
>     [####] : number of functional differences between
>     upstream/downstream patch
>     [down] : patch is downstream-only
>     The flags [FC] indicate (F)unctional and (C)ontextual differences,
>     respectively
>=20
>     001/25:[----] [--] 'target/avr: Add outward facing interfaces and
>     core CPU logic'
>     002/25:[----] [--] 'target/avr: Add instruction helpers'
>     003/25:[----] [--] 'target/avr: Add instruction translation -
>     Registers definition'
>     004/25:[----] [--] 'target/avr: Add instruction translation -
>     Arithmetic and Logic Instructions'
>     005/25:[----] [--] 'target/avr: Add instruction translation - Branch
>     Instructions'
>     006/25:[----] [--] 'target/avr: Add instruction translation - Data
>     Transfer Instructions'
>     007/25:[----] [--] 'target/avr: Add instruction translation - Bit
>     and Bit-test Instructions'
>     008/25:[----] [--] 'target/avr: Add instruction translation - MCU
>     Control Instructions'
>     009/25:[----] [--] 'target/avr: Add instruction translation - CPU
>     main translation function'
>     010/25:[----] [--] 'target/avr: Add instruction disassembly function'
>     011/25:[----] [--] 'hw/char: Add limited support for Atmel USART
>     peripheral'
>     012/25:[0045] [FC] 'hw/timer: Add limited support for Atmel 16 bit
>     timer peripheral'
>     013/25:[----] [--] 'hw/misc: Add Atmel power device'
>     014/25:[0024] [FC] 'target/avr: Add section about AVR into QEMU
>     documentation'
>     015/25:[----] [--] 'target/avr: Register AVR support with the rest
>     of QEMU'
>     016/25:[----] [--] 'target/avr: Add machine none test'
>     017/25:[0002] [FC] 'target/avr: Update MAINTAINERS file'
>     018/25:[down]=C2=A0 =C2=A0 =C2=A0 'hw/core/loader: Let load_elf popul=
ate the
>     processor-specific flags'
>     019/25:[down]=C2=A0 =C2=A0 =C2=A0 'hw/avr: Add helper to load raw/ELF=
 firmware
>     binaries'
>     020/25:[0015] [FC] 'hw/avr: Add some ATmega microcontrollers'
>     021/25:[0040] [FC] 'hw/avr: Add some Arduino boards'
>     022/25:[----] [--] 'target/avr: Update build system'
>     023/25:[----] [--] 'tests/boot-serial-test: Test some Arduino boards
>     (AVR based)'
>     024/25:[----] [--] 'tests/acceptance: Test the Arduino MEGA2560 board=
'
>     025/25:[----] [--] '.travis.yml: Run the AVR acceptance tests'
>=20
>     Repo: https://gitlab.com/philmd/qemu/commits/avr-rc2
>=20
>     [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg672926.html
>     Supersedes: <20200123000307.11541-1-richard.henderson@linaro.org
>     <mailto:20200123000307.11541-1-richard.henderson@linaro.org>>
>=20
>     Michael Rolnik (20):
>      =C2=A0 target/avr: Add outward facing interfaces and core CPU logic
>      =C2=A0 target/avr: Add instruction helpers
>      =C2=A0 target/avr: Add instruction translation - Registers definitio=
n
>      =C2=A0 target/avr: Add instruction translation - Arithmetic and Logi=
c
>      =C2=A0 =C2=A0 Instructions
>      =C2=A0 target/avr: Add instruction translation - Branch Instructions
>      =C2=A0 target/avr: Add instruction translation - Data Transfer Instr=
uctions
>      =C2=A0 target/avr: Add instruction translation - Bit and Bit-test
>      =C2=A0 =C2=A0 Instructions
>      =C2=A0 target/avr: Add instruction translation - MCU Control Instruc=
tions
>      =C2=A0 target/avr: Add instruction translation - CPU main translatio=
n
>      =C2=A0 =C2=A0 function
>      =C2=A0 target/avr: Add instruction disassembly function
>      =C2=A0 hw/char: Add limited support for Atmel USART peripheral
>      =C2=A0 hw/timer: Add limited support for Atmel 16 bit timer peripher=
al
>      =C2=A0 hw/misc: Add Atmel power device
>      =C2=A0 target/avr: Add section about AVR into QEMU documentation
>      =C2=A0 target/avr: Register AVR support with the rest of QEMU
>      =C2=A0 target/avr: Add machine none test
>      =C2=A0 target/avr: Update MAINTAINERS file
>      =C2=A0 target/avr: Update build system
>      =C2=A0 tests/boot-serial-test: Test some Arduino boards (AVR based)
>      =C2=A0 tests/acceptance: Test the Arduino MEGA2560 board
>=20
>     Philippe Mathieu-Daud=C3=A9 (5):
>      =C2=A0 hw/core/loader: Let load_elf populate the processor-specific =
flags
>      =C2=A0 hw/avr: Add helper to load raw/ELF firmware binaries
>      =C2=A0 hw/avr: Add some ATmega microcontrollers
>      =C2=A0 hw/avr: Add some Arduino boards
>      =C2=A0 .travis.yml: Run the AVR acceptance tests
>=20
>      =C2=A0qemu-doc.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A051 +
>      =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +
>      =C2=A0default-configs/avr-softmmu.mak=C2=A0 |=C2=A0 =C2=A0 5 +
>      =C2=A0qapi/machine.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-
>      =C2=A0hw/avr/atmel_atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A048 +
>      =C2=A0hw/avr/boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A033 +
>      =C2=A0include/disas/dis-asm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A019 +
>      =C2=A0include/elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +
>      =C2=A0include/hw/char/atmel_usart.h=C2=A0 =C2=A0 |=C2=A0 =C2=A093 +
>      =C2=A0include/hw/elf_ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 6 +-
>      =C2=A0include/hw/loader.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 6 +-
>      =C2=A0include/hw/misc/atmel_power.h=C2=A0 =C2=A0 |=C2=A0 =C2=A046 +
>      =C2=A0include/hw/timer/atmel_timer16.h |=C2=A0 =C2=A094 +
>      =C2=A0include/sysemu/arch_init.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +
>      =C2=A0target/avr/cpu-param.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A037 +
>      =C2=A0target/avr/cpu-qom.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A054 +
>      =C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 259 +++
>      =C2=A0target/avr/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A029 +
>      =C2=A0arch_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +
>      =C2=A0hw/avr/arduino.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 151 ++
>      =C2=A0hw/avr/atmel_atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 470 +++++
>      =C2=A0hw/avr/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A074 +
>      =C2=A0hw/char/atmel_usart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 320 ++++
>      =C2=A0hw/core/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +-
>      =C2=A0hw/misc/atmel_power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 112 ++
>      =C2=A0hw/riscv/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-
>      =C2=A0hw/timer/atmel_timer16.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 605 ++++++
>      =C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 826 ++++++++
>      =C2=A0target/avr/disas.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 246 +++
>      =C2=A0target/avr/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A084 +
>      =C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 347 ++++
>      =C2=A0target/avr/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 121 ++
>      =C2=A0target/avr/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2997 ++++++++++++++++++++++++++++++
>      =C2=A0tests/qtest/boot-serial-test.c=C2=A0 =C2=A0|=C2=A0 =C2=A011 +
>      =C2=A0tests/qtest/machine-none-test.c=C2=A0 |=C2=A0 =C2=A0 1 +
>      =C2=A0.travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-
>      =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A030 +
>      =C2=A0gdb-xml/avr-cpu.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A049 +
>      =C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 9 +
>      =C2=A0hw/avr/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 3 +
>      =C2=A0hw/char/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +
>      =C2=A0hw/char/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 1 +
>      =C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +
>      =C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 2 +
>      =C2=A0hw/timer/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +
>      =C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +
>      =C2=A0target/avr/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A034 +
>      =C2=A0target/avr/insn.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 182 ++
>      =C2=A0tests/acceptance/machine_avr6.py |=C2=A0 =C2=A050 +
>      =C2=A0tests/qtest/Makefile.include=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
 2 +
>      =C2=A050 files changed, 7539 insertions(+), 13 deletions(-)
>      =C2=A0create mode 100644 default-configs/avr-softmmu.mak
>      =C2=A0create mode 100644 hw/avr/atmel_atmega.h
>      =C2=A0create mode 100644 hw/avr/boot.h
>      =C2=A0create mode 100644 include/hw/char/atmel_usart.h
>      =C2=A0create mode 100644 include/hw/misc/atmel_power.h
>      =C2=A0create mode 100644 include/hw/timer/atmel_timer16.h
>      =C2=A0create mode 100644 target/avr/cpu-param.h
>      =C2=A0create mode 100644 target/avr/cpu-qom.h
>      =C2=A0create mode 100644 target/avr/cpu.h
>      =C2=A0create mode 100644 target/avr/helper.h
>      =C2=A0create mode 100644 hw/avr/arduino.c
>      =C2=A0create mode 100644 hw/avr/atmel_atmega.c
>      =C2=A0create mode 100644 hw/avr/boot.c
>      =C2=A0create mode 100644 hw/char/atmel_usart.c
>      =C2=A0create mode 100644 hw/misc/atmel_power.c
>      =C2=A0create mode 100644 hw/timer/atmel_timer16.c
>      =C2=A0create mode 100644 target/avr/cpu.c
>      =C2=A0create mode 100644 target/avr/disas.c
>      =C2=A0create mode 100644 target/avr/gdbstub.c
>      =C2=A0create mode 100644 target/avr/helper.c
>      =C2=A0create mode 100644 target/avr/machine.c
>      =C2=A0create mode 100644 target/avr/translate.c
>      =C2=A0create mode 100644 gdb-xml/avr-cpu.xml
>      =C2=A0create mode 100644 hw/avr/Kconfig
>      =C2=A0create mode 100644 hw/avr/Makefile.objs
>      =C2=A0create mode 100644 target/avr/Makefile.objs
>      =C2=A0create mode 100644 target/avr/insn.decode
>      =C2=A0create mode 100644 tests/acceptance/machine_avr6.py
>=20
>     --=20
>     2.21.1
>=20
>=20
>=20
> --=20
> Best Regards,
> Michael Rolnik


