Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHdDX-00062c-Va
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 20:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdDU-0005yc-VJ
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdDT-0007RR-Td
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:19:04 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:28172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdDT-0007Pn-5l
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:19:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493943; h=Content-Type: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=uLHPZ3inYgR0ekzItq37zmHAjInrmkGiIU3vQZUyEGs=;
 b=WObDzRb/FtvZ+4q5v5heuN7TK5BV1WPvRtKW+wCODUC04qVZc8fD9huuSNQrzwbOV8tX/GVZ
 SvJyzxZZLqPNFVJGWR/RYME9OMNjpMTjcLE8/mm+xy+PvAF5d69ArYLOJE74YMkOD8tAZQnm
 v+afcpEZn1ZE3eKOcQJBPT/k7+ptnNHV+87gLp9xK1tvMb/k7Vj9eFZV4Q5mj0VQoKmuM5PX
 YmDaPlB6g7Yy56OmOMwn9rtMxwLv+3vKqapf8Vfyp7YxMqp1crZmWiKKyCUtmfjiZw4AYn3a
 DtENFTcKYLeyVc3Y9OumOSCMA1/MMQW3T84r3qNDasGYhBFLhL3YMQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mxa.mailgun.org with ESMTP id 5d9bd5f1.7f6d1d5f6070-smtp-out-n02;
 Tue, 08 Oct 2019 00:18:57 -0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id m7so15604050lji.2;
 Mon, 07 Oct 2019 17:18:56 -0700 (PDT)
X-Gm-Message-State: APjAAAXoTVYzzkyjJ7Lyb6KzGQ7Pxqlv80ykC2g0xzxmAoTHefClrxAJ
 ieJjO01NBYKZ1+GLdHSf8R/M2xl2chZHNcyWoyk=
X-Google-Smtp-Source: APXvYqzFYtKZZv/TUGaGywkZPnWF953fsuVfK9s8y2kUpkMLYZxv9t3rAX7U4uFbodaeBtYoI/hcVkd2JPtfIeUl7BQ=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr17463468ljc.99.1570493934970; 
 Mon, 07 Oct 2019 17:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
In-Reply-To: <20191008001318.219367-1-jonathan@fintelia.io>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Mon, 7 Oct 2019 20:17:50 -0400
X-Gmail-Original-Message-ID: <CANnJOVG2cwFtg64xmmVzTWHkLsxLcjshqkb59OhXbkt4mS8R6g@mail.gmail.com>
Message-ID: <CANnJOVG2cwFtg64xmmVzTWHkLsxLcjshqkb59OhXbkt4mS8R6g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: Expose "priv" register for GDB
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Tue, 08 Oct 2019 00:19:06 -0000

The first paragraph seems to have gone missing. Repeated below:

> This series adds a new "priv" virtual register that reports the current
> privilege mode. This is helpful for debugging purposes because that information
> is not actually available in any of the real CSRs.


On Mon, Oct 7, 2019 at 8:15 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> The third patch in this series makes the priv virtual register writitable. I'm
> not entirely sure this is a good idea, so I split it out into its own patch. In
> particular, this change will conflict with the hypervisor extension work which
> assumes that the privilege mode does not change in unexpected cases.
>
> As pointed out in a previous version of this series, GDB actually contains some
> support already for the accessing the privilege mode via a virtual "priv"
> register, including to convert the values into human readable forms:
>
> (gdb) info reg priv
> priv           0x3      prv:3 [Machine]
>
> Changlog V3:
> - Break patch into series
> - Make priv a virtual register
>
> Changelog V2:
> - Use PRV_H and PRV_S instead of integer literals
>
> Jonathan Behrens (3)
>   target/riscv: Tell gdbstub the correct number of CSRs
>   target/riscv: Expose priv register for GDB for reads
>   target/riscv: Make the priv register writable by GDB
>
>  configure                       |  4 ++--
>  gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
>  gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
>  target/riscv/gdbstub.c          | 36 ++++++++++++++++++++++++++++++++++--
>  4 files changed, 58 insertions(+), 4 deletions(-)
>
>

