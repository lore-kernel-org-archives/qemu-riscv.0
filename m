Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUdi7-0005t0-S6
	for mharc-qemu-riscv@gnu.org; Tue, 12 Nov 2019 16:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iUdi5-0005pP-3P
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 16:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iUdi4-0008JA-3O
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2019 16:28:25 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40879)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iUdi2-0008H8-1x; Tue, 12 Nov 2019 16:28:22 -0500
Received: by mail-lj1-x242.google.com with SMTP id q2so80011ljg.7;
 Tue, 12 Nov 2019 13:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkYIwG8iKsQTBiIO6UELEmwwXOJD4zlsIyx3im0h7cQ=;
 b=lg9QzQKr2PCiOwAY7GYPY+nyKufQXEAVBYLcntDQQHAWo+eMXuunk27kKfO3jbQqhb
 /lnDKUrsAjbGHV5NsTiF11ugZ54KH52iaxzVy/xLyGKbVu9liwLzsYG8xlkZNC0xX9Gs
 ScGGG9fEXNithZ3SQx9hew2dKCBcmfD5Ew9e+0MJMmHB/UKgVZAjU5adLkNoFna8HT1s
 8Ur71g0NC4GGOU8KGzW1xG1ZPkN6XaDmgN67n4Q4a5k8JoN71CP0NUHs1jejJQetCqC0
 MArs4LiKHtLoIQ4wH4qXlful+8FZkcsRgJu9i+eNfEGlJ+xUM9Sj1CtWTGxfkhQFu4+E
 oYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkYIwG8iKsQTBiIO6UELEmwwXOJD4zlsIyx3im0h7cQ=;
 b=NktcUINfN5WoZk1TKCRR4iD4cvf5rFQTMqfydcVLKW6Jb4GWTMMa6gKOXlTto6NrA0
 wDTSu0A5+zKUudTcFfpm2yRor6kExfNvGUUZ8VifBQks+B5izRf/zAB6tOhj+7+u4g3Z
 ecRT0fidV/OCnZRdhwLb9NvgxJtbQzFyQLaxQGOkbIqr06iy/pTicQC3EtGDzZGAuFJm
 KiOyt5LP/zUeYW0x1eyz5coiNs2jupa9G0B+lcu4d0dR58IQDpfAELOomz6jU9FICRxv
 T1nWF4t3DifuI3Yi8pMa5UJZ5ebDBFGyV68MBEATHGqifHGCgmtWjgkzJdd/vSmMsWVU
 ENqw==
X-Gm-Message-State: APjAAAUT3Vgkt2970Esk8EvKm84WTui3QjWpEVuARm887bASeDK1Y9Wx
 JCYTAQPrfeP5TCMT3xxc00zavrN6VUOcG5s7e9E=
X-Google-Smtp-Source: APXvYqxy+dxpliykzlFUR/c/1ipzwKLRNcMO4rNgp/P+tVXUR3jZlnfggAFKO4xKmvOCCBF/R2EmXLmVWVJUbEdbkDM=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr22015874ljn.4.1573594098974; 
 Tue, 12 Nov 2019 13:28:18 -0800 (PST)
MIME-Version: 1.0
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
 <CAEUhbmWaT06GAdz=d-oVtMsM6bOWR23bZjicgBsJLUHqaVRH7g@mail.gmail.com>
In-Reply-To: <CAEUhbmWaT06GAdz=d-oVtMsM6bOWR23bZjicgBsJLUHqaVRH7g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Nov 2019 13:22:25 -0800
Message-ID: <CAKmqyKPqRqqf0kpyTQ6HvMrCRztyMhRKfupLqXAaXyUkHnaydA@mail.gmail.com>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
To: Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Tue, 12 Nov 2019 21:28:26 -0000

On Mon, Nov 11, 2019 at 7:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Nov 7, 2019 at 8:54 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Coreboot developers have requested that they have at least 32MB of flash
> > to load binaries. We currently have 32MB of flash, but it is split in
> > two to allow loading two flash binaries. Let's increase the flash size
> > from 32MB to 64MB to ensure we have a single region that is 32MB.
> >
> > No QEMU release has include flash in the RISC-V virt machine, so this
> > isn't a breaking change.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Ping! I really want this in 4.2. Otherwise we are stuck with a
compatibility issue.

Alistair

