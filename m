Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHq4r-0001Lz-Db
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 10:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHq4o-0001Ja-BB
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 10:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHq4n-0000gT-5E
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 10:02:58 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:12094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHq4m-0000eZ-PI
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 10:02:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570543376; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=8zNle5/VxdvMH7fjCV+Jj0vLf54BpetbGDTm4WTua4o=;
 b=cpdzqGxUqWTnd6xOkP8O3mUyGCaUnhjjzfxdlS9ZQt9GuMqRu0Nw6EXcU7xjvXRBsr4jiWfL
 2JHu0ft+6PNmZDWFtq1bUWkb5eTf0zBB75aXB14fk+Ou1EMCbbMNuPrG9Rj73/3JCFifq5h1
 EPJAigfTJ5GEeMMj5yX2Vq5O4WwLuvY2MZ06QIxyNU2JYFoENaQVkntpn6sP1FHoHBRbkU2h
 CYM2tCqNVAy4bC0oy0VCli8xpk/nH0TB1K8b3EKocbZGtx5HY3zCeq4GmhqTXUcZg1neZsiN
 VfBiMkd3oKH+qi3lV3xcfYzAUtlqPON5MiPsdlGvABkStuxG4S4YeQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mxa.mailgun.org with ESMTP id 5d9c970f.7f81ed39b3b0-smtp-out-n02;
 Tue, 08 Oct 2019 14:02:55 -0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 7so17680467ljw.7;
 Tue, 08 Oct 2019 07:02:54 -0700 (PDT)
X-Gm-Message-State: APjAAAU0mzrKgzx168lPJGkNyDop/LMV5Ymbny2GjpAxukmoru7h+Zja
 P3YBrtljV3mblaUzLUAmn48gRYkvlEw+u31DcHA=
X-Google-Smtp-Source: APXvYqz98wF5Iiu8KibDWCUnQLdRlYUwWHT4FdlWRbKL/t5JuS9VIdDG+bXXVdDPMUkTBehqFWTpdWg0dYKlKWoVPX8=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr19408425ljc.99.1570543372757; 
 Tue, 08 Oct 2019 07:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-2-jonathan@fintelia.io>
 <CAEUhbmXHdj=-28inH5-ToS4tOAYOva1Lc1QCz6RGijkMrWhFdg@mail.gmail.com>
In-Reply-To: <CAEUhbmXHdj=-28inH5-ToS4tOAYOva1Lc1QCz6RGijkMrWhFdg@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Tue, 8 Oct 2019 10:01:47 -0400
X-Gmail-Original-Message-ID: <CANnJOVH6a5m=bVhyk=cKbJ51TRv2XnimfrxHQEY4LmWD7sKXCQ@mail.gmail.com>
Message-ID: <CANnJOVH6a5m=bVhyk=cKbJ51TRv2XnimfrxHQEY4LmWD7sKXCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: Tell gdbstub the correct number of
 CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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
X-List-Received-Date: Tue, 08 Oct 2019 14:03:00 -0000

On Tue, Oct 8, 2019 at 5:54 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 8, 2019 at 8:15 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
> >
> > If the number of registers reported to the gdbstub code does not match the
> > number in the associated XML file, then the register numbers used by the stub
> > may get out of sync with a remote GDB instance.
>
> I am not sure how to trigger the out of sync issue. Do you know how?

Try applying the next patch in the series without this one. Attempting
to access the priv register will return E14 because GDB will think
that priv has register number 309 (since the last register with an
assigned regnum is fcsr=68 and then none of the 240 CSRs have assigned
numbers) while the GDB stub will think that the number is 4165 (=33 +
36 + 4096).

