Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMpU4-0003Jt-Qa
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 07:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMpTn-0003ER-T8; Tue, 31 Jan 2023 07:11:16 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMpTl-0008Ez-FV; Tue, 31 Jan 2023 07:11:15 -0500
Received: by mail-ed1-x533.google.com with SMTP id z11so14205230ede.1;
 Tue, 31 Jan 2023 04:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3IPCPRHVk+uX0BnZnfk1IJfCqst8Hr8oNPuqTW/Qm9g=;
 b=FIX7lhVuEPvMjoWKyrHnjO/hrkVVP1JvM1eJYtKGXcljBYMWkN8giLBE/jX2qa34tV
 HIJG1lEHvVe51Fm7HaNcJyalSXVVESl769esntx2WPyGRDCKZeZD1RBSu7BGmdb9KBRB
 5V4/tPKWGuRtgxeecjtzmeIMd2A/eem5yvVhroWn/+bm6jdE+37OiAjhFq9xZb14f1lM
 s3xcpq9JT6Xo7rh9mX24iwu8uyDHFjJVC3zvU504fXKmUmvsurzfZ4pLz12UlpFxWVeC
 oE2kvyaplDiPU3yyxYxmOzOk81G07rWFLxfOEY7qfMoQe/aUW/r7ChsGqGGPgSh+D1rm
 QR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IPCPRHVk+uX0BnZnfk1IJfCqst8Hr8oNPuqTW/Qm9g=;
 b=iCdph3JLFqPHyqALMkmBpmH/bW5MHSp8Q8oSGiiEu4y+wV2V4XiYnaTHnK/ipFZjqB
 O7pn53kLxwBlBnVga25WyTBrO3GfqlXoE0KSHPK2D6H+phrXuoJ3uAhPyWvVcVtv5TIq
 VR0tPEhPUlXWICjBOtu/q34Qo97oRBNw0az6Oca3B/rQfe0m9rnQBDNIWEs0JgYjES00
 6OvwMvWkP0vVUvmr1N/e81AGU1QYJLBjiuk6ziaJkNmZIExNSjaSIkdzIQvZVAXNtW/H
 PlNnS/bcAl5MDO/2/2ntjnU4hWVdLPKmq/a5tLCfpRAHONoUNi9M5cFDPGh6MN9kk9g6
 P4ZQ==
X-Gm-Message-State: AFqh2kqLKoflizforU2+FPfk0wtZ/r6/+ZlzSesNqpCUBN4dLtSm/2ZB
 hWD/LniYhCoevZiFskSyCquJ+q1+2DSvER+Xvzg=
X-Google-Smtp-Source: AMrXdXu64MvRHeOCrAtBrwOljhRyFHbfSEbr3WE21WwFZ6RKbB8Jgk19ItwSMoWHXk8wKRWqECZfXUXZAbmvmT/7K0g=
X-Received: by 2002:a05:6402:5288:b0:49e:66b8:a790 with SMTP id
 en8-20020a056402528800b0049e66b8a790mr10193966edb.47.1675167070606; Tue, 31
 Jan 2023 04:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-4-dbarboza@ventanamicro.com>
 <CAEUhbmW7Yh_7UOjeoPKBhSF1P4axp6kggtSEj9BAty1q6Ed4QA@mail.gmail.com>
 <793f7432-4592-98a4-34e9-472c185be297@ventanamicro.com>
 <CAEUhbmXiNS2cLcdvMLaZ4SUh-0=D7j-dsM+2TuQvF=0EO4xbdQ@mail.gmail.com>
 <0be7a185-b023-31d4-d51e-a7dff59980ee@ventanamicro.com>
In-Reply-To: <0be7a185-b023-31d4-d51e-a7dff59980ee@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 31 Jan 2023 20:11:00 +0800
Message-ID: <CAEUhbmWSVJ0dN0VW6yoAbMKmLvi0x_gJU4ydeW+wUXqjNX7Ngw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 12:11:16 -0000

On Tue, Jan 31, 2023 at 5:57 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/30/23 22:00, Bin Meng wrote:
> > On Tue, Jan 31, 2023 at 1:16 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >>
> >>
> >> On 1/29/23 02:45, Bin Meng wrote:
> >>> On Thu, Jan 26, 2023 at 9:54 PM Daniel Henrique Barboza
> >>> <dbarboza@ventanamicro.com> wrote:
> >>>>
> >>>> As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
> >>>> mem_size (which is defaulted to MachineState::ram_size in all boards)
> >>>> and the FDT pointer. And it makes a very important assumption: the DRAM
> >>>> interval dram_base + mem_size is contiguous. This is indeed the case for
> >>>> most boards that uses a FDT.
> >>>
> >>> s/uses/use
> >>>
> >>>>
> >>>> The Icicle Kit board works with 2 distinct RAM banks that are separated
> >>>> by a gap. We have a lower bank with 1GiB size, a gap follows, then at
> >>>> 64GiB the high memory starts. MachineClass::default_ram_size for this
> >>>> board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
> >>>> size, meaning that there we'll always have at least 512 MiB in the Hi
> >>>> RAM area.
> >>>>
> >>>> Using riscv_compute_fdt_addr() in this board is weird because not only
> >>>> the board has sparse RAM, and it's calling it using the base address of
> >>>> the Lo RAM area, but it's also using a mem_size that we have guarantees
> >>>> that it will go up to the Hi RAM. All the function assumptions doesn't
> >>>> work for this board.
> >>>>
> >>>> In fact, what makes the function works at all in this case is a
> >>>> coincidence.  Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
> >>>> down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
> >>>> the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
> >>>> (2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
> >>>> the FDT under a 3Gb address, which happens to be exactly at the end of
> >>>> DRAM_LO. If the base address of the Lo area started later than 3Gb this
> >>>> function would be unusable by the board. Changing any assumptions inside
> >>>> riscv_compute_fdt_addr() can also break it by accident as well.
> >>>>
> >>>> Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
> >>>> Icicle Kit board and for future boards that might have sparse RAM
> >>>> topologies to worry about:
> >>>>
> >>>> - relieve the condition that the dram_base + mem_size area is contiguous,
> >>>> since this is already not the case today;
> >>>>
> >>>> - receive an extra 'dram_size' size attribute that refers to a contiguous
> >>>> RAM block that the board wants the FDT to reside on.
> >>>>
> >>>> Together with 'mem_size' and 'fdt', which are now now being consumed by a
> >>>> MachineState pointer, we're able to make clear assumptions based on the
> >>>> DRAM block and total mem_size available to ensure that the FDT will be put
> >>>> in a valid RAM address.
> >>>>
> >>>
> >>> Well written commit message. Thanks!
> >>>
> >>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>>> ---
> >>>>    hw/riscv/boot.c            | 38 ++++++++++++++++++++++++++------------
> >>>>    hw/riscv/microchip_pfsoc.c |  3 ++-
> >>>>    hw/riscv/sifive_u.c        |  3 ++-
> >>>>    hw/riscv/spike.c           |  3 ++-
> >>>>    hw/riscv/virt.c            |  3 ++-
> >>>>    include/hw/riscv/boot.h    |  4 ++--
> >>>>    6 files changed, 36 insertions(+), 18 deletions(-)
> >>>>
> >>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >>>> index a6f7b8ae8e..8f4991480b 100644
> >>>> --- a/hw/riscv/boot.c
> >>>> +++ b/hw/riscv/boot.c
> >>>> @@ -284,33 +284,47 @@ out:
> >>>>    }
> >>>>
> >>>>    /*
> >>>> - * The FDT should be put at the farthest point possible to
> >>>> - * avoid overwriting it with the kernel/initrd.
> >>>> + * This function makes an assumption that the DRAM interval
> >>>> + * 'dram_base' + 'dram_size' is contiguous.
> >>>>     *
> >>>> - * This function makes an assumption that the DRAM is
> >>>> - * contiguous. It also cares about 32-bit systems and
> >>>> - * will limit fdt_addr to be addressable by them even for
> >>>> - * 64-bit CPUs.
> >>>> + * Considering that 'dram_end' is the lowest value between
> >>>> + * the end of the DRAM block and MachineState->ram_size, the
> >>>> + * FDT location will vary according to 'dram_base':
> >>>> + *
> >>>> + * - if 'dram_base' is less that 3072 MiB, the FDT will be
> >>>> + * put at the lowest value between 3072 MiB and 'dram_end';
> >>>> + *
> >>>> + * - if 'dram_base' is higher than 3072 MiB, the FDT will be
> >>>> + * put at 'dram_end'.
> >>>>     *
> >>>>     * The FDT is fdt_packed() during the calculation.
> >>>>     */
> >>>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> >>>> -                                void *fdt)
> >>>> +hwaddr riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> >>>
> >>> Using hwaddr to represent a size looks weird. Although technically
> >>> they are the same ... I would leave this as it is.
> >>
> >> I'll leave it as it was back in patch 2 (uint64_t).
> >>
> >>>
> >>>> +                              MachineState *ms)
> >>>>    {
> >>>> -    uint64_t temp;
> >>>> -    hwaddr dram_end = dram_base + mem_size;
> >>>> -    int ret = fdt_pack(fdt);
> >>>> +    int ret = fdt_pack(ms->fdt);
> >>>> +    hwaddr dram_end, temp;
> >>>>        int fdtsize;
> >>>>
> >>>>        /* Should only fail if we've built a corrupted tree */
> >>>>        g_assert(ret == 0);
> >>>>
> >>>> -    fdtsize = fdt_totalsize(fdt);
> >>>> +    fdtsize = fdt_totalsize(ms->fdt);
> >>>>        if (fdtsize <= 0) {
> >>>>            error_report("invalid device-tree");
> >>>>            exit(1);
> >>>>        }
> >>>>
> >>>> +    /*
> >>>> +     * A dram_size == 0, usually from a MemMapEntry[].size element,
> >>>> +     * means that the DRAM block goes all the way to ms->ram_size.
> >>>> +     */
> >>>> +    if (dram_size == 0x0) {
> >>>> +        dram_end = dram_base + ms->ram_size;
> >>>> +    } else {
> >>>> +        dram_end = dram_base + MIN(ms->ram_size, dram_size);
> >>>> +    }
> >>>
> >>> How about:
> >>>
> >>> g_assert(dram_size < ms->ram_size);
> >>
> >> I don't believe that dram_size > ms->ram_size should be an error. A board can
> >> have a declared MemMapEntry.size that is larger than its current setting of
> >> ms->ram_size.
> >
> > What use case is that? This updated function now has the assumption that:
> >
> > 1. dram_size being 0 meaning contiguous system RAM region from dram_base
> > 2. otherwise dram_size being the *first* contiguous system RAM region
> > from dram_base
>
> Yes, but that doesn't mean that dram_size is necessarily smaller than ms->ram_size.
>
> We don't have any board where this happens today but let's pretend that the Icicle
> Kit board didn't have the 1.5Gb minimal RAM restriction. Its first region has
> dram_size 1Gb:
>
> [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000,   0x40000000 },
>
> So, if I start the board with 512M, ms->ram_size = 512M and this assert will trigger
> because dram_size = 1Gb.
>

Ah, I see. So for a machine whose memory size can be dynamically
configured, yes that makes sense.

Regards,
Bin

