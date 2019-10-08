Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHdIH-0002eu-D1
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 20:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdIE-0002ei-LJ
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdID-0002xQ-Pm
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:23:58 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:27100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHdIC-0002vj-GX
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:23:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570494237; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=OplKAgqTr65Hkpakpf37PaPcCQdfMS2D6asm2PWvOy4=;
 b=d+6AjTEQO9wGW9jKtJczeowzg+aXVds/alzGeAlcKUMvrRcNo9kfhdwetw8zbRfrC06+nzQt
 OdMBGupWKFkR5+Sf1VxQ8yXaLwgp7oNtRO1zDh2RwJ73VOL2XHc+SGMH8/WrdtM+DqTuJ20Q
 qGJ5tfqOtC97zI6vGYQokkEQfQrKS+VQFfiosydEJLfVlu/Abf10OHle0BKJrmbOm+bqzAjm
 LAxqzdr0gCpiu8DFr//R0rpB7m8Y5l9XIwQgVFFtP3GJc+GVdvkS0ES+yLPizQ9hzspuK/oi
 HNqHLMidF7dCMZ+zhyDq4gcnPHLJTjawkKLX93lxtgVBDdWlc8jzJA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mxa.mailgun.org with ESMTP id 5d9bd71a.7fbf7c6e7cb0-smtp-out-n03;
 Tue, 08 Oct 2019 00:23:54 -0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id w67so10577339lff.4;
 Mon, 07 Oct 2019 17:23:54 -0700 (PDT)
X-Gm-Message-State: APjAAAUmVjAbFKkA2fl7bG/oQ5NeAR9qWYTyqmwHax+/AnhVg3jX3aJl
 ULIkPS+p1Ie2mPZO5tBY3gbcy9Dyv+tGp6f4LwY=
X-Google-Smtp-Source: APXvYqxgwH0csB4WlZEBh4rxOfaL6INyur+bOXoUKRhgxa9t/gwefu6lc3XYGMJQtEbuL1/xeYYLfV0oZrRnUmXKeC0=
X-Received: by 2002:a19:2489:: with SMTP id k131mr17852210lfk.52.1570494232310; 
 Mon, 07 Oct 2019 17:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151614.81516-1-jonathan@fintelia.io>
 <CAKmqyKPFuyuC6sGCRGJGo2f_3=2z33MmuXHZov5R0pc7A9O9Jg@mail.gmail.com>
In-Reply-To: <CAKmqyKPFuyuC6sGCRGJGo2f_3=2z33MmuXHZov5R0pc7A9O9Jg@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Mon, 7 Oct 2019 20:22:47 -0400
X-Gmail-Original-Message-ID: <CANnJOVGDcGrM5FY12GBurSTWWD++EKdrkUB5o-ZEOPsBm8RhQg@mail.gmail.com>
Message-ID: <CANnJOVGDcGrM5FY12GBurSTWWD++EKdrkUB5o-ZEOPsBm8RhQg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Expose "priv" register for GDB
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Tue, 08 Oct 2019 00:23:59 -0000

On Mon, Oct 7, 2019 at 2:36 PM Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Oct 4, 2019 at 8:18 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
> > @@ -296,6 +302,14 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
> >      } else if (n == 32) {
> >          env->pc = ldtul_p(mem_buf);
> >          return sizeof(target_ulong);
> > +    } else if (n == 33) {
> > +#ifndef CONFIG_USER_ONLY
> > +        env->priv = ldtul_p(mem_buf) & 0x3;
> > +        if (env->priv == PRV_H) {
> > +            env->priv = PRV_S;
> > +        }
>
> Why have this? There is no PRV_H so we should never be in that privilege mode.
>
> Alistair

This is hopefully more clear in the next version, but the idea is that
since GDB can try to set the privilege mode to *any* value this
function needs to make sure that it isn't set to something unsupported
like PRV_H.

Jonathan

