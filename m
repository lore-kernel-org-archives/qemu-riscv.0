Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHdEi-0007hk-I8
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 20:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdEe-0007Y7-Dz
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdEd-0000jH-7m
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:20:16 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:28172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdEb-0007Pn-Ry
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:20:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570494015; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=drH/zB/QxuxLYhjag3TUJ8W6IlSD6+zPujsecelTy4g=;
 b=kxEIBLo44+3cWExSZlb+EBSk9ge3I/PgE6ox7vIQQgS4nHSU+DdDlxuQ0CjPN4iKU94j6Ji2
 EFYQreCE5odlEBRtgNXmG3LZIO5K4ijPYTBBTmsqesTPOIqVSuQga16VRS0tYJpbjMNR+i2I
 Qv/WCKEIBueFBA4w7N+FP9tLVQnFhgWe3amR85tlhVA1dgBUxOAFLEZ0J4qM2yv9HpG05iwb
 WqP71g5yxuAbcyUREhyIrg2zcsblCujFgWiUbYgcvKsF+8F8pNhZB8jm4pJ4n0Rhvp21iGIO
 T8V6t5zud7w6bBCvYdt1VEV9hvCrfFCJswBMJWVpFkAnUgM72/+/Ug==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mxa.mailgun.org with ESMTP id 5d9bd63b.7fc9290a6c30-smtp-out-n03;
 Tue, 08 Oct 2019 00:20:11 -0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id w6so10556672lfl.2;
 Mon, 07 Oct 2019 17:20:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUhAofdP49XOq537aOpyGukssYvSCTAbuj89AadGu+ynUge2+sI
 i8wTMVRZApVW6ppzV3v2kYjqagV0TyntxQTNTKY=
X-Google-Smtp-Source: APXvYqyBfTgEh0BR1rr35eQMwULpqoo7uR+NnF1tcafVlI6yVUFS16ok2BQc1xbL8vO1hsiesmig1EB7eHfcgekh8SA=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr18321025lfq.5.1570494009704; 
 Mon, 07 Oct 2019 17:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151614.81516-1-jonathan@fintelia.io>
 <5393a150-71b6-a729-7530-a50df05353bd@sifive.com>
In-Reply-To: <5393a150-71b6-a729-7530-a50df05353bd@sifive.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Mon, 7 Oct 2019 20:19:05 -0400
X-Gmail-Original-Message-ID: <CANnJOVG3=O8B0m12dJp7raGAgPPMt8eAvsJ58193A_yeEqPKrw@mail.gmail.com>
Message-ID: <CANnJOVG3=O8B0m12dJp7raGAgPPMt8eAvsJ58193A_yeEqPKrw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Expose "priv" register for GDB
To: Jim Wilson <jimw@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
X-List-Received-Date: Tue, 08 Oct 2019 00:20:18 -0000

On Mon, Oct 7, 2019 at 5:17 PM Jim Wilson <jimw@sifive.com> wrote:
> On 10/4/19 8:16 AM, Jonathan Behrens wrote:
> > diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
> > index 0d07aaec85..d6d76aafd8 100644
> > --- a/gdb-xml/riscv-32bit-cpu.xml
> > +++ b/gdb-xml/riscv-32bit-cpu.xml
> > @@ -44,4 +44,5 @@
> >     <reg name="t5" bitsize="32" type="int"/>
> >     <reg name="t6" bitsize="32" type="int"/>
> >     <reg name="pc" bitsize="32" type="code_ptr"/>
> > +  <reg name="priv" bitsize="32" type="int"/>
> >   </feature>
>
> Adding this to the cpu register set means that the gdb "info registers"
> command will now list a value for the mysterious undocumented "priv"
> register.  That is likely to result in user confusion, and a few gdb bug
> reports.
>
> Gdb incidentally already has support for a virtual priv register.  From
> gdb/riscv-tdep.c:
>
> static const struct riscv_register_feature riscv_virtual_feature =
> {
>   "org.gnu.gdb.riscv.virtual",
>   {
>     { RISCV_PRIV_REGNUM, { "priv" }, false }
>   }
> };
>
> So the correct way to fix this is to add a
> gdb-xml/riscv-32bit-virtual.xml file, along with code to handle this new
> xml file and the registers in it.  Likewise for the 64-bit support.
>
> The main advantage of doing things this way is that only people that
> care about the priv register will see it, and this will interoperate
> with other RISC-V debuggers and targets (if any) that already have
> virtual priv register support.
>
> Jim

Thanks for this suggestion, I've incorporated it into the next version.

Jonathan

