Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT8l9-0002kb-OZ
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 13:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iT8l6-0002kL-Ru
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iT8l5-0002mI-Di
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:13:20 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iT8l5-0002kj-0k
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 13:13:19 -0500
Received: by mail-pg1-x541.google.com with SMTP id z24so4460664pgu.4
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4OhJ8/ssnzX1h1ox9WgBFS8OB0q7jM4PcyUwC85Hrg4=;
 b=GUK3+kc/vYmW25Q3MVf0Dmsc9fNJZYeEbRQX400+9mmAj8fdz82SaNHZeNaM05ZlkP
 Z86Lu/PBQniqj250m5/+sPu3JlqFQu9T80MGj2YrQR1QkKeooqHuUOHHFxz2wfN5xlXn
 1S9bsxGJ7hxUokOWm1JMGjgxYrLfkRo1BFF+OSbVoYn87nkhxQrBMN3fFoyRFRD29PIB
 c3jtso0fvdiby4i4LY52w5f4Z6GvKanaq3Vhyw2B2rg6sVCZwLvMvr/6aUI/gXtMMDsY
 jqzvKkZp5eDEw8XZlNF8UvSXJWiXn7avipVzLtuLaT6D/TkXEnoLMfyF3d+pBnTHlpaG
 g0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4OhJ8/ssnzX1h1ox9WgBFS8OB0q7jM4PcyUwC85Hrg4=;
 b=OPK5EWae7bkcg6cCnpMB3RIj3pwloTBTlYxkMDzsda95M6NyJ579BAH86dkgxUk4i7
 bTwXVsL3ftyNrzZOdX1b6fM33YU5bZqIAttGDHLFhzo8L+KFx6QYbMjaQF63xk7aHfy3
 4uFE56sH7y6VdbfcdKMfzkjqIMglGqdbffC8pe07m5Cr8rIRi6mrA4JBuY/HytQQ3x48
 aVJAr3naJognnzmVo3lZkksLa4EHBU5IggY7ArtmNYdMxcLiaDS6/2GJLzS+FJAlaFu+
 PbFYxAX2WLvxG/ZKRwiQONLzxY+OryjqJkV97wohooeSeiYIwQeHKWZ4+TwQc8lJJ41y
 1AdA==
X-Gm-Message-State: APjAAAXnu3qcLbUv3QQ5IhdE4pznc10+QXArjRS2FfC58P/jSmfF3Qoo
 8t4rYQYG+wjnuL8hiMseS2tWBQ==
X-Google-Smtp-Source: APXvYqxb1jU7qr2xD92YPfh5ymTDFaz4H7vcjKBVV24QD+3Zc6CmQzU3/j32PPusNRdsR/tbXe6hJg==
X-Received: by 2002:a62:6044:: with SMTP id u65mr13668040pfb.227.1573236797047; 
 Fri, 08 Nov 2019 10:13:17 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n72sm6221230pjc.4.2019.11.08.10.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 10:13:16 -0800 (PST)
Date: Fri, 08 Nov 2019 10:13:16 -0800 (PST)
X-Google-Original-Date: Fri, 08 Nov 2019 10:13:15 PST (-0800)
Subject: Re: [PATCH] RISC-V: virt: This is a "sifive,test1" test finisher
In-Reply-To: <CAFEAcA8k+t2qKCSvMjENitvCXyc-qwiG2qbg6gQFKR_+v_zihg@mail.gmail.com>
CC: alistair23@gmail.com, palmer@sifive.com,
 Christoph Hellwig <hch@infradead.org>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-3242a5ea-9d0c-49fb-bcf6-d8482328b272@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Fri, 08 Nov 2019 18:13:22 -0000

On Fri, 08 Nov 2019 10:04:47 PST (-0800), Peter Maydell wrote:
> On Fri, 8 Nov 2019 at 17:15, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Nov 8, 2019 at 9:05 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >
>> > The test finisher implements the reset command, which means it's a
>> > "sifive,test1" device.  This is a backwards compatible change, so it's
>> > also a "sifive,test0" device.  I copied the odd idiom for adding a
>> > two-string compatible field from the ARM virt board.
>> >
>> > Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
>> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> > ---
>> >  hw/riscv/virt.c | 5 ++++-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> > index 23f340df19..74f2dce81c 100644
>> > --- a/hw/riscv/virt.c
>> > +++ b/hw/riscv/virt.c
>> > @@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>> >      nodename = g_strdup_printf("/test@%lx",
>> >          (long)memmap[VIRT_TEST].base);
>> >      qemu_fdt_add_subnode(fdt, nodename);
>> > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
>> > +    {
>> > +        const char compat[] = "sifive,test1\0sifive,test0";
>>
>> Does this really work? Why not use qemu_fdt_setprop_cells()?
>>
>> Alistair
>>
>> > +        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
>> > +    }
>
> qemu_fdt_setprop_cells() is for "set this property to
> contain this list of 32-bit integers" (and it does a byteswap
> of each 32-bit value from host to BE). That's not what
> you want for a string (or a string list, which is what
> we have here).
>
> Cc'ing David Gibson who's our device tree expert to see if there's
> a nicer way to write this. Oddly, given that it's used in the
> ubiquitous 'compatible' prop, the dtc Documentation/manual.txt
> doesn't say anything about properties being able to be
> 'string lists', only 'strings', '32 bit numbers', 'lists of
> 32-bit numbers' and 'byte sequences'. You have to dig through
> the header file comments to deduce that a string list is
> represented by a string with embedded NULs separating
> each list item.

I copied this from hw/arm/virt.c, but messed up.  There they use

        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
                         compat, sizeof(compat));

I'll send a v2, but I'd be happy to add some sort of setprop_stringlist 
function.  Maybe we just indicate the length with two '\0's?  IIRC that's how 
other similar-looking data structures are encoded.

