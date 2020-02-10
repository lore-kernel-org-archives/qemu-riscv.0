Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1FA3-0002Fk-UC
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 14:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1FA0-0002Eh-Go
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 14:56:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1F9z-0001I7-Ce
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 14:56:00 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42175)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1F9z-0001GM-4d
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 14:55:59 -0500
Received: by mail-pf1-x443.google.com with SMTP id 4so4209517pfz.9
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2020 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=6kF9UfsZ1jw1wbmZv09k+yzUSsgoqRNX+mimxCpXgYk=;
 b=k+DKdY4KWK6qnSn1YnOCiQssHprcn/USicBrd/6JrYhKH7sL0dGUwBUHKEavtgLkMN
 3CXgNUQMXO3EX81FLOB7HWB/2tsa8V9jX11lIbrDQ2osUPs1ZKzliK5FNudGuQnRmZDA
 y+meFqMtr9hnP4g3p9BmDDmhINsnB4IBZLnp3Kn//HT0x32v9IwjAhAl+T8/2rsS84mR
 5tqOL46L6sQ39zCARYMdpqRsvBIqC1FEx+KbB3YBNwsUgduWhb8w48e2tq4JbCQGEwlG
 /3ADvznznghqjVee4uhi8WUNj2RjDl2ApLG0rT6IbAnWkXGVD8NV9WmXjJGIZWpJ5i8V
 M05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=6kF9UfsZ1jw1wbmZv09k+yzUSsgoqRNX+mimxCpXgYk=;
 b=T37krUFSMVf67uoyupWJsnyRLRp36cH96cfG1n91o7HtdKGRpodcohR4ybu7eEDU7Q
 MrB3utjPwPPKH3fpYENWyXu4G2MijOrGmrWczY5eSzP5n+l19D0Tuvr7RQ2mYtJ6+dsB
 5leybgB7TkMNNMT06EiU4a6kotFu2oOIW4U8qcu2i+o7snTUgAvQonHTVnEBXI/jwsyH
 a9ccO2+yoGyT/Go7GmC0U0e22GnkpfCIHtEbT/CssNoFQdOTP9G+KUTbm0BZZwxpHqKa
 WKx2YQdmhu+GiwcKMYkwLyj7e34WuYHzX5hPk2gcRtPFVLd08Aqqtxt7mgtnmiWkaPtP
 g1EA==
X-Gm-Message-State: APjAAAWN/LA/OP3LGybCBfq+avSjqBQTXzUutqm9vxa3aPmhnLeng0/9
 KjBYSRq9xUkeSMdX5p4Wg55Chg==
X-Google-Smtp-Source: APXvYqwsJvz4M1fEusHUVJ97adnxPpEouJLd4aIa4zi1ocBlGUZ9kyK+WtvLpHQtS5N//KI1ECh1Vw==
X-Received: by 2002:a63:b047:: with SMTP id z7mr3272214pgo.431.1581364556758; 
 Mon, 10 Feb 2020 11:55:56 -0800 (PST)
Received: from localhost ([2600:1012:b161:af3e:21a9:6308:301b:ae65])
 by smtp.gmail.com with ESMTPSA id a17sm245795pjv.6.2020.02.10.11.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 11:55:56 -0800 (PST)
Date: Mon, 10 Feb 2020 11:55:56 -0800 (PST)
X-Google-Original-Date: Mon, 10 Feb 2020 11:55:53 PST (-0800)
Subject: Re: [PATCH] riscv: sifive_u: Add a "serial" property for board serial
 number
In-Reply-To: <mhng-e3089574-e78c-4b6c-961e-cac55f0f23d4@palmerdabbelt-glaptop1>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-3370fb0c-3076-4a05-8bcd-ac7fce08d408@palmerdabbelt-glaptop1>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Mon, 10 Feb 2020 19:56:02 -0000

On Wed, 29 Jan 2020 07:29:11 PST (-0800), Palmer Dabbelt wrote:
> On Fri, 10 Jan 2020 07:52:05 GMT (+0000), bmeng.cn@gmail.com wrote:
>> Hi Palmer,
>>
>> On Fri, Nov 22, 2019 at 10:38 AM Palmer Dabbelt
>> <palmerdabbelt@google.com> wrote:
>>>
>>> On Thu, 21 Nov 2019 17:10:18 PST (-0800), bmeng.cn@gmail.com wrote:
>>> > On Sat, Nov 16, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> >>
>>> >> At present the board serial number is hard-coded to 1, and passed
>>> >> to OTP model during initialization. Firmware (FSBL, U-Boot) uses
>>> >> the serial number to generate a unique MAC address for the on-chip
>>> >> ethernet controller. When multiple QEMU 'sifive_u' instances are
>>> >> created and connected to the same subnet, they all have the same
>>> >> MAC address hence it creates a unusable network.
>>> >>
>>> >> A new "serial" property is introduced to specify the board serial
>>> >> number. When not given, the default serial number 1 is used.
>>> >>
>>> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> >> ---
>>> >>
>>> >>  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
>>> >>  include/hw/riscv/sifive_u.h |  1 +
>>> >>  2 files changed, 21 insertions(+), 1 deletion(-)
>>> >>
>>> >
>>> > ping?
>>>
>>> Sorry, it looks like I dropped this one.  I've put it in the queue for 5.0,
>>> with a
>>>
>>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Has this been applied somewhere?
>
> Weird, not sure how I managed to screw this up again.  It's actually on for-master as
>
>     * a828041ba6 - riscv: sifive_u: Add a "serial" property for board serial number (50 seconds ago) <Bin Meng>
>
> with any luck I'll manage to avoid screwing it up a third time.

Ah, OK -- the issue here is that this fails "make check", specifically

    $ make check-qtest-riscv64
    make[1]: Entering directory '/home/palmerdabbelt/life/riscv/qemu/slirp'
    make[1]: Nothing to be done for 'all'.
    make[1]: Leaving directory '/home/palmerdabbelt/life/riscv/qemu/slirp'
            CHK version_gen.h
      TEST    check-qtest-riscv64: tests/qtest/cdrom-test
      TEST    check-qtest-riscv64: tests/qtest/device-introspect-test
    /home/palmerdabbelt/life/riscv/qemu/hw/riscv/sifive_u.c:406:riscv_sifive_u_soc_init: Object 0x55baf3feea00 is not an instance of type sifive_u-machine
    Broken pipe
    tests/qtest/libqtest.c:149: kill_qemu() detected QEMU death from signal 6 (Aborted)
    ERROR - too few tests run (expected 6, got 5)
    make: *** [/home/palmerdabbelt/life/riscv/qemu/tests/Makefile.include:630: check-qtest-riscv64] Error 1

which is probably how it kept getting disappeared -- I just forgot to reply on
the list.  I'm going to hold it back from the PR I'm staging right now, LMK if
you have a fix.

>
>>
>> Regards,
>> Bin

