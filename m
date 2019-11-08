Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT8d4-0007uw-QL
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 13:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iT8d3-0007uf-4e
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iT8d1-0007hC-R5
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:05:00 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41788)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iT8d1-0007gx-LV
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:04:59 -0500
Received: by mail-oi1-x241.google.com with SMTP id e9so6008591oif.8
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 10:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+btYeezsgOnOT7C71hvkNCIKMyaN8hXI9UchP5S6TrE=;
 b=t6geXBixrM1+hz6a0SiRfQHXdKVJz9ZmT1MMRjw8ORk7cMxO7zFp0DKwMPJt3JEu09
 pSOC/COObEVOeiUy5jhiD3ijc+Tza9ApkWfwWq8nznCjygHae/pfnCviiiP8rpP3all6
 UzHN90hg0ialoJpmn9CrD3XWfbZsU/iJZHycEl0/oSZgHF96V4MhGPNsEQqTI4+TdnXf
 2VlxRx77ccibDIYsmd/FrsRprLeDPjFnppIazq2rK7HUSo4G98nq7Gz+/ZOXaCf8DcCK
 J9C1Z2GmA3KwmqHATDxSErxo5Mu1+ksp/CETrunFwMSlOq5Vz2w9jD64iXo3prmplEaU
 LEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+btYeezsgOnOT7C71hvkNCIKMyaN8hXI9UchP5S6TrE=;
 b=EVnQjG+rZ26+2vfEWvt49WRt2ED5CelCZf8TLCAcjFi3ZFTKfrkecHGdlNaLp9NVWq
 zq8GW4pccKO5QZ1p0JmGMcY3EwsG4P5UvwSYtjDl+wl49htSKwAc+6B1xw/JcL/Q8vCH
 O9HsbsvKqAAUTurUcF8Oo3P4ic0CUT4e7NATwzEeP53rQEZbjbeJg0aIpWyEkq9q8g84
 q8T5DD3hz7NCu4AKieZi55ARK/ZqEc+hnpoMeNqNGXawq6u1Dv4UXGO4ihDkD4MdTeiR
 /KBMwcvWBO/Hv/0/q+0mSnmtcLe9/gQTeYBu2o3EhZNhSDEdos/p54wDXgP8jdX5Qx/5
 aLEw==
X-Gm-Message-State: APjAAAXkn91HWeqsseqiBmKSBtVmyjxe76h5wwEmjFvkxh8NX5BkXbCp
 kcTvCrLLkXcGq47PH15f5gHYNX3l/zRi09rPtvCJ/A==
X-Google-Smtp-Source: APXvYqyqbLgpcGi3STe0bKGYeLaylt5z7R9OwK8yWbmWHqIDjoAoZv9xzAz7awXGUJE6KMK+qkdRCCgNsr9wzctjdSs=
X-Received: by 2002:a05:6808:7d1:: with SMTP id
 f17mr11186584oij.163.1573236298435; 
 Fri, 08 Nov 2019 10:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20191107222500.8018-1-palmer@sifive.com>
 <CAKmqyKOodh3tPUGBM92ZRWFLoeo9E=kcaqO9F9dHz1wBMP9ywA@mail.gmail.com>
In-Reply-To: <CAKmqyKOodh3tPUGBM92ZRWFLoeo9E=kcaqO9F9dHz1wBMP9ywA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Nov 2019 18:04:47 +0000
Message-ID: <CAFEAcA8k+t2qKCSvMjENitvCXyc-qwiG2qbg6gQFKR_+v_zihg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: virt: This is a "sifive,test1" test finisher
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Fri, 08 Nov 2019 18:05:02 -0000

On Fri, 8 Nov 2019 at 17:15, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Nov 8, 2019 at 9:05 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > The test finisher implements the reset command, which means it's a
> > "sifive,test1" device.  This is a backwards compatible change, so it's
> > also a "sifive,test0" device.  I copied the odd idiom for adding a
> > two-string compatible field from the ARM virt board.
> >
> > Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
> >  hw/riscv/virt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 23f340df19..74f2dce81c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >      nodename = g_strdup_printf("/test@%lx",
> >          (long)memmap[VIRT_TEST].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
> > +    {
> > +        const char compat[] = "sifive,test1\0sifive,test0";
>
> Does this really work? Why not use qemu_fdt_setprop_cells()?
>
> Alistair
>
> > +        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
> > +    }

qemu_fdt_setprop_cells() is for "set this property to
contain this list of 32-bit integers" (and it does a byteswap
of each 32-bit value from host to BE). That's not what
you want for a string (or a string list, which is what
we have here).

Cc'ing David Gibson who's our device tree expert to see if there's
a nicer way to write this. Oddly, given that it's used in the
ubiquitous 'compatible' prop, the dtc Documentation/manual.txt
doesn't say anything about properties being able to be
'string lists', only 'strings', '32 bit numbers', 'lists of
32-bit numbers' and 'byte sequences'. You have to dig through
the header file comments to deduce that a string list is
represented by a string with embedded NULs separating
each list item.

thanks
-- PMM

