Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hxps4-0000hD-Hs
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 05:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hxps1-0000er-Iy
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 05:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hxps0-0005St-G6
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 05:47:05 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hxprx-0005RU-VT; Wed, 14 Aug 2019 05:47:02 -0400
Received: by mail-ed1-x541.google.com with SMTP id f22so6529591edt.4;
 Wed, 14 Aug 2019 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QbVftAPqbdy+ZZ2a6m8s/0Vrgc+RjQJkB9Sz6aR81wM=;
 b=s1c8eBsipYAGT2dNVbbTj5TnXwv6EvZA5HIQRkou/R+yxErS+V2bYV+5DXkhktLESV
 N5T/x3zAy9OXCQlDSHZJYQmrD/sU4ZMEacWNLbzA6clZLmAvE/yu2nidsjatrF5X3jXa
 Sdrc9goYHVUMUS/RevfxZV3IPDD1SAiCD502DVZDZoRzbfLvqSLw8dWgxek2xdBbgNVO
 Mvwfa0+p87XTpPbJ+yUdoqnb+dx+jzQfU8HMZuQbvWYX7CYRwbB+wrNpW1fG3rhDjrQm
 uQgAxNnyB0j5qyjXoYjvGeUaJSVR/V3f59d1CN/UDZ1w/GDzES1JZ+iV1dfL7PlmGQBT
 7yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QbVftAPqbdy+ZZ2a6m8s/0Vrgc+RjQJkB9Sz6aR81wM=;
 b=gViByFu1Yydm8hl5WPP35GXMi2oEYyWOzWs3XdqvSWlFgKXGO1JJsZnLnI3Yv3efis
 E9wGAYOadbzjh3alwGoD1JLNi9KAmOz/qcFdtMZggv+98BeD8ePeI6dgGixBmWStqXvq
 tx/+RVzJ4NKX0UUs2lvVH1vG+y9+K5hrpzGiBHsOmEoSGwOhJ1kuGyu6BqJdEcthjWZC
 cHUKJBOkVn/+Z9MaIrqsYr5Wa+N84N+khytmdBRquyPhPrrSQXggnF5OlHU68Ek3hyar
 +u20L2BxpzH9uD/v/NXy49bTYXem0RYx7M6kUYqoa8Rf+iw2rQHpYuQtUy31CwxdUM0Q
 0QEg==
X-Gm-Message-State: APjAAAV56UKH09Tt/YvzWQHdaCDS+byOLvVNwlPit026d0FinN0Nvn2m
 jVFeJJOMxEanbrnPrTnVlc/gSw6DAnckoFyqK64=
X-Google-Smtp-Source: APXvYqyYHMXMk+iRUUUL/2CAuU3h6ykJA4UVk6LU4LoucEZAr61QVFwALYarl28r+jPMBie7NWrVak2rYwLV69vgJq4=
X-Received: by 2002:a05:6402:789:: with SMTP id
 d9mr28537423edy.25.1565776020667; 
 Wed, 14 Aug 2019 02:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
 <1565232570-29296-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPQ0z-VtiebdtBqhBocgGkgeLLbtcawhwss0YpoYZyH2A@mail.gmail.com>
In-Reply-To: <CAKmqyKPQ0z-VtiebdtBqhBocgGkgeLLbtcawhwss0YpoYZyH2A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Aug 2019 17:46:49 +0800
Message-ID: <CAEUhbmWpzQftgOdchxFSQEUNv1_9Zra_n=b9eigh_CRT+6sq1Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] riscv: rv32: Root page
 table address can be larger than 32-bit
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
X-List-Received-Date: Wed, 14 Aug 2019 09:47:06 -0000

Hi Palmer,

On Sat, Aug 10, 2019 at 9:49 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Aug 7, 2019 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > For RV32, the root page table's PPN has 22 bits hence its address
> > bits could be larger than the maximum bits that target_ulong is
> > able to represent. Use hwaddr instead.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

Would you take this one too?

Regards,
Bin

