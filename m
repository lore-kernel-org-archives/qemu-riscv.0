Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXnVj-0007NI-CK
	for mharc-qemu-riscv@gnu.org; Thu, 21 Nov 2019 09:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iXcOU-0004KK-Of
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 21:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iXcOT-0002CI-6o
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 21:40:30 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iXcOS-0002BI-VH
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2019 21:40:29 -0500
Received: by mail-pl1-x641.google.com with SMTP id q18so821303pls.5
 for <qemu-riscv@nongnu.org>; Wed, 20 Nov 2019 18:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6Lo0092N0xYP5HLEFRPH7wneSTB1+QKHMiBL2Md661s=;
 b=JxOKZm4tCDXUXucOvb135SMfCSvQIawv/zwrU+YjV4r9bcvUXUnar2m76m97br+KeG
 aAK6jDB+OwlyL6A/mitFXhY6iWyakdyTO2J6aqgJ7sr3KYBEDqUVg4ZbhSTZrsyz3X4x
 SlAL3Uomui3/lKeYeSe77HKJjp8tK0DIVNpZlF5RMGbdhbfRWUcAvn+5UhE3bxeqnxAj
 ZOdPnWKFLFhLSyuRp8M31xdyl2AN4M5xr6/qoGBGvZzDtY46LjpnBe83FsdEtLi/rAdM
 PtGYfqhbg7O0hXFB9kx4V/EsWCfiY6X/pb9RCv1jHykPe2yGKePc3T0IBK1OhorS+peQ
 dmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6Lo0092N0xYP5HLEFRPH7wneSTB1+QKHMiBL2Md661s=;
 b=FMndV6G/4DLZwIYm/Fa93EqFIhU0+PFiw2NiMP6MziEfOBu2vln4uk12Ah0XQczIB5
 2aaU5rmSzkrZv5Cr6tcwjtulaCuMyH3z2B1f7K54jOdO3LoShEQkuj9m3fiEvB7CHoga
 m/XR4zGXCQe2vbF3+3OG7dA1+X+762VibY4rQr2efbd33oxMNtmxv658lmBE5Vd2XL6A
 45yTSApiK7F6OEUrF+YgjD4WWOxoqeFlV995oJX8Zpss8VYHP64YxZf+tFnv2ZzMIGu6
 38aH4aG3jzJwY9DJs9KOtYAbaEI1H2jTFSAGmKFexifKeyJ/BibRqRbp+QorusS1IygD
 Y49w==
X-Gm-Message-State: APjAAAUfONmf5Yt1tdm+8hSdEItyLmxixNlNu7DBsDEPhRQucyAT70CK
 3x9aTlRwRDMLe4JBOP8v0/sPVQ==
X-Google-Smtp-Source: APXvYqxGzQHLAOZCUn8Hu6cZmqOTQi17tIxPWk3kS6uiCPhTbKs0BI9GLCxPHpplRNTcI5auvZR3Pg==
X-Received: by 2002:a17:902:7c94:: with SMTP id
 y20mr6360574pll.241.1574304024504; 
 Wed, 20 Nov 2019 18:40:24 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id w69sm786933pfc.164.2019.11.20.18.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 18:40:24 -0800 (PST)
Date: Wed, 20 Nov 2019 18:40:24 -0800 (PST)
X-Google-Original-Date: Wed, 20 Nov 2019 18:40:22 PST (-0800)
Subject: Re: [PATCH] RISC-V: virt: This is a "sifive,test1" test finisher
In-Reply-To: <20191110211033.GU2461@umbus.Home>
CC: Peter Maydell <peter.maydell@linaro.org>, alistair23@gmail.com,
 palmer@sifive.com, Christoph Hellwig <hch@infradead.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: david@gibson.dropbear.id.au
Message-ID: <mhng-7d7315b7-0ef7-4f14-b152-9d478f15c739@palmerdabbelt.mtv.corp.google.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-Mailman-Approved-At: Thu, 21 Nov 2019 09:32:41 -0500
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
X-List-Received-Date: Thu, 21 Nov 2019 02:40:32 -0000

On Sun, 10 Nov 2019 13:10:33 PST (-0800), david@gibson.dropbear.id.au wrote:
> On Fri, Nov 08, 2019 at 10:13:16AM -0800, Palmer Dabbelt wrote:
>> On Fri, 08 Nov 2019 10:04:47 PST (-0800), Peter Maydell wrote:
>> > On Fri, 8 Nov 2019 at 17:15, Alistair Francis <alistair23@gmail.com> wrote:
>> > > 
>> > > On Fri, Nov 8, 2019 at 9:05 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> > > >
>> > > > The test finisher implements the reset command, which means it's a
>> > > > "sifive,test1" device.  This is a backwards compatible change, so it's
>> > > > also a "sifive,test0" device.  I copied the odd idiom for adding a
>> > > > two-string compatible field from the ARM virt board.
>> > > >
>> > > > Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
>> > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> > > > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> > > > ---
>> > > >  hw/riscv/virt.c | 5 ++++-
>> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> > > > index 23f340df19..74f2dce81c 100644
>> > > > --- a/hw/riscv/virt.c
>> > > > +++ b/hw/riscv/virt.c
>> > > > @@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>> > > >      nodename = g_strdup_printf("/test@%lx",
>> > > >          (long)memmap[VIRT_TEST].base);
>> > > >      qemu_fdt_add_subnode(fdt, nodename);
>> > > > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
>> > > > +    {
>> > > > +        const char compat[] = "sifive,test1\0sifive,test0";
>> > > 
>> > > Does this really work? Why not use qemu_fdt_setprop_cells()?
>> > > 
>> > > Alistair
>> > > 
>> > > > +        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
>> > > > +    }
>> > 
>> > qemu_fdt_setprop_cells() is for "set this property to
>> > contain this list of 32-bit integers" (and it does a byteswap
>> > of each 32-bit value from host to BE). That's not what
>> > you want for a string (or a string list, which is what
>> > we have here).
>> > 
>> > Cc'ing David Gibson who's our device tree expert to see if there's
>> > a nicer way to write this. Oddly, given that it's used in the
>> > ubiquitous 'compatible' prop, the dtc Documentation/manual.txt
>> > doesn't say anything about properties being able to be
>> > 'string lists', only 'strings', '32 bit numbers', 'lists of
>> > 32-bit numbers' and 'byte sequences'. You have to dig through
>> > the header file comments to deduce that a string list is
>> > represented by a string with embedded NULs separating
>> > each list item.
>> 
>> I copied this from hw/arm/virt.c, but messed up.  There they use
>> 
>>        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
>>        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
>>                         compat, sizeof(compat));
>
> I'm not sure what you're saying is messed up.  AFAICT, this matches
> the code you have above, and both should be correct.

Sorry, I must have been hallucinating.  For some reason I though I wrote
qemu_fdt_setprop_string(... compat).

I'd like to take this for 4.2 if possible, but I don't think I have a
reviewed-by (I just got my email set up on my Google computer, so it might be
messy for a bit).  I'm happy to submit the cleaner valist version after 4.2, as
per Peter's suggestion.

Alistair: are you OK with this?

>> I'll send a v2, but I'd be happy to add some sort of setprop_stringlist
>> function.  Maybe we just indicate the length with two '\0's?  IIRC that's
>> how other similar-looking data structures are encoded.
>> 
>
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

