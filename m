Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJvKY-00058H-Jr
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 06:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvKW-00057k-Ev; Mon, 23 Jan 2023 06:49:40 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvKU-0006UT-Px; Mon, 23 Jan 2023 06:49:40 -0500
Received: by mail-vk1-xa34.google.com with SMTP id b81so5803403vkf.1;
 Mon, 23 Jan 2023 03:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fe3wQWfTwAwJBdmmp+ksAlwmOP05eh7YvVMspuYv9SU=;
 b=WD6hp6ZGeyxDd+b55aCySRjVrV++x6XVzUhe9IpgpsjL5l93ymW1bEW22sLiMMlFSc
 TifVsjrh/I9TKo5oZgx0q742YTKdTVHXFQ0Hhx8gZ+4FgzGu/cPfuwk+SECey+H6Mrn0
 Mh+Kr5lqtc83v57NdhCNaQy2c4gDf4Wbnybk1lTNuerAIEMOf1vIlrNHyRaOjaDcIJ5A
 OFzfTGSy7Z/v6tQdLn9X3CHRcb8dl/OXh6JBXQA/TOad/J3pGmgZKW09tgQu1e0iaNky
 kRlzuoTBgGt5tpEAxXupE70HTamiHCnvHpDcCG9mWPLehwAB0fVBv7JVnYYtfqR4UK/e
 20NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fe3wQWfTwAwJBdmmp+ksAlwmOP05eh7YvVMspuYv9SU=;
 b=qgOQHl9jqsehq3jaEB/D7AT4dcmJ6SztBFb/LP7HS5MxlyCBwErxGjvmFu4E29MSkY
 KwBCpuEfQpJnaOPcpykwsoCzDgR3/m1YldKfbCC5JHoilBKnunpRDqNUM0fHuttf5EwL
 8j98gmFD7UyF6IOeodxKTpjlNrqjrRxHvsWRqVXsDIho6AmeNaAHv8yxuo535Zv8qQYr
 toVC55rvXjQNfEAPdPASWkh2drelTRAS6iBsy7gZ4ufriJ2kCG5Tye0/oPiCUgJXmdVZ
 W3Dem16UIkH+uuZWhGddWGVnPWQpE4PfIa6kzLr7ziBUnQyhUogL4nvM5hTVFz9lyMMt
 IrAw==
X-Gm-Message-State: AFqh2koTz5vPnJ9LkQmKNNj6C4ErwXLl3fpsm9h5Cv3dIDMFYBb8G7zZ
 LamYXHLgCiw0Ra3oKGo8AeUyY5vNLHcirF+kJpQ=
X-Google-Smtp-Source: AMrXdXuFVhIA+WFT1MWZq/dZSa407zky4j2y4alVMDLgfhzhClAvivZHlBAwa91KOFQEPefkmkBGpWaVcbLzOM/I7UY=
X-Received: by 2002:a1f:b681:0:b0:3dd:fc42:994d with SMTP id
 g123-20020a1fb681000000b003ddfc42994dmr3231523vkf.25.1674474577415; Mon, 23
 Jan 2023 03:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com> <Y8ndFjv9prrRXLnL@spud>
 <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
 <CAKmqyKN=XquxtTDGCstEu7jEvoOn=1HpHc=ax8+zs3XxZO2G3w@mail.gmail.com>
 <14efb6ee-4de0-ce26-569b-3a7ec6647e7d@ventanamicro.com>
In-Reply-To: <14efb6ee-4de0-ce26-569b-3a7ec6647e7d@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 21:49:11 +1000
Message-ID: <CAKmqyKMTuxpqv2uHope8-oK+LBRJOei4x7LYyL0M6Tj2EGmwVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2023 11:49:40 -0000

On Mon, Jan 23, 2023 at 8:19 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/22/23 19:53, Alistair Francis wrote:
> > On Sun, Jan 22, 2023 at 5:16 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> Conor,
> >>
> >> Thanks for the Icicle-kit walk-through! I'll not claim that I fully understood it,
> >> but I understood enough to handle the situation ATM.
> >>
> >> Without this change, this is where the FDT is being installed in the board when
> >> I start it with 8Gb of RAM (retrieved via 'info roms'):
> >>
> >> addr=00000000bfe00000 size=0x00a720 mem=ram name="fdt"
> >>
> >> Which surprised me at first because this is almost at the end of the LO area which has
> >> 1Gb and I figured it would be in the middle of another RAM area. I took another read
> >> at what we're doing in riscv_load_fdt():
> >>
> >> -----------
> >> temp = (dram_base < 3072 * MiB) ?  MIN(dram_end, 3072 * MiB) : dram_end;
> >> fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> >> -----------
> >>
> >> This code can be read as "if the starting address of the RAM is lower than 3Gb, put
> >> the FDT no further than 3Gb (0xc0000000). Otherwise, put it at the end of dram",
> >> where "dram_base" is the starting address of the RAM block that the function
> >> receives.
> >>
> >> For icicle-kit, this is being passed as  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> >> 0x80000000, which is 2Gb.
> >>
> >> So, regardless of how much RAM we have (dram_end), the FDT will always be capped at
> >> 3Gb. At this moment, this fits exactly at the end of the LO area for the Icicle Kit.
> >> Which is funny because this 3Gb restriction was added by commit 1a475d39ef54 to fix
> >> 32 bit guest boot and it happened to also work for the Microchip SoC.
> >>
> >> So yeah, I thought that I was fixing a bug and in the end I caused one. This patch
> >> needs to go.
> >>
> >>
> >> Alistair, I believe I should re-send v2, this time explaining why the existing function
> >> will not break the Microchip board because we'll never put the FDT out of the LO area
> >> of the board. Does this work for you?
> >
> > I think that's fine. My only worry is that we are losing some
> > flexibility that some future board might want.
>
> What if we change riscv_load_fdt() parameters to pass a MemoryRegion/MemMapEntry
> instead of just dram_base?
>
> Instead of this:
>
> uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>
> We would have this:
>
> uint64_t riscv_load_fdt(MemMapEntry mem, uint64_t mem_size, void *fdt)
>
> Or even this:
>
> uint64_t riscv_load_fdt(hwaddr dram_base, hwaddr dram_size,
>                          uint64_t mem_size, void *fdt)
>
>
> And then we can make assumptions based on the actual memory region that the fdt
> is going to fit into, instead of having a starting address and a total memory
> size and have to deal with issues such as sparse memory.
>
> We can keep all the assumptions already made today (e.g. the 3Gb maximum addr)
> while also having a guarantee that the fdt isn't going to be put in the wrong
> memory region/spot if we decide to change the assumptions later on.

That seems like a good direction. We currently don't need this though,
so don't feel like it needs to be done today.

Alistair

>
>
> Thanks,
>
> Daniel
>
>
>
> >
> > Alistair

