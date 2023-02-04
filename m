Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOHGv-0001oA-TU
	for mharc-qemu-riscv@gnu.org; Sat, 04 Feb 2023 07:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOHGt-0001nh-0a; Sat, 04 Feb 2023 07:03:56 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOHGq-0000Hp-TV; Sat, 04 Feb 2023 07:03:54 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id s24so8019361vsi.12;
 Sat, 04 Feb 2023 04:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z67EqDy61rVQ8457moV7eF1Z0EkJrukYrh9MNtN1Heo=;
 b=OebUOxJzhOfDS+D4JZvPvRHs6H+W4lVGq11+raHk8k27VfO4fqcJeQ/i3IEBF89kHI
 4kQUeP/ZURrRZxjFEZkhMiUJJ29fgc2ycOV4JsaNmENJo2ApeanVCTJXSm2Lo64DAn+x
 J9YfsNo3VM3fVFsIz4rpfooUW4smZxV36M3WpIXDXhNyR/RHrfXl6ZsnSGz8IaPIHTkr
 W8Pf9hAcfWbI91i8cIG9gEqc0E6lOhYktshgcQ4Y08R719lwxXHd1gDoZliJLJIQnaW6
 Whsxu1EkU7Bycnt0P6OezBB0sNfi7SZIMn4d2yY9E2XLjsgtLTNdjkoEl2iYl1QtRp3P
 kB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z67EqDy61rVQ8457moV7eF1Z0EkJrukYrh9MNtN1Heo=;
 b=YEU1XlVSzQgJgIWBUj6r7+vYdyUIxHY12ncig+9PLGYzxKDmkLSK+E6v2qKKF+VhLI
 eKPVaM3oa3Hif+g3+pCX7KXjW1bvh0iCzxtANYXxnI/DfDab8rvFdWQ1iUFwmjlykAo2
 pFuY6HIIYO7cBZfegEIkzXICG24e5UzacmbKBu0FIdHhSotTE5cMW+OCZ8VUAbSMW9et
 3F1dWXv8Q8RqJAu1W9OT5/ehWDp7a4JYxHn92g/9ncw2+SLWuHYmfO5qmyiVtao3byPT
 Ix9GRobnXbMTCCvHtx5vqlQ69xVMdJZtB70TDpRBCpVhblpvcQjihEmZMfr3DThXMn1Y
 f0fw==
X-Gm-Message-State: AO0yUKVZukGC5Myoqf8BQCKG+Nc0+txbW5H+euM+ZSe6gxaOyCdPkyzw
 SzOy16letRhAEwSbdI+HtRThopG4YUMdhHbJLVw=
X-Google-Smtp-Source: AK7set/B8zPaDA7YpJPzydbtgaFMF0CuBL9KLAk5NKweVeghrgC4axwCFnCJoX57/nkRmP5cUZmHbC8/EZoV1dGe8fc=
X-Received: by 2002:a67:e102:0:b0:3f0:89e1:7c80 with SMTP id
 d2-20020a67e102000000b003f089e17c80mr1748757vsl.72.1675512231208; Sat, 04 Feb
 2023 04:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <20230202135810.1657792-2-dbarboza@ventanamicro.com>
 <CAEUhbmW01vUZNdAcXQ0b-7GUgH70q9eyWJH7kG+Mph4uJJeWnA@mail.gmail.com>
 <51896f68-d902-ee07-295d-5809c9c66e60@ventanamicro.com>
 <CAEUhbmVN3Pw8794tq2H3X5amexhptnrZaLdG0MHyON6fyac-AA@mail.gmail.com>
 <e7d32c5f-a996-2d50-9362-3223c546d136@ventanamicro.com>
In-Reply-To: <e7d32c5f-a996-2d50-9362-3223c546d136@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 4 Feb 2023 22:03:24 +1000
Message-ID: <CAKmqyKN8MB9zS-KB__Z5HXjEd_QOXEQL_zpVyNga4gQcgdSGsw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Sat, 04 Feb 2023 12:03:56 -0000

On Sat, Feb 4, 2023 at 7:01 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hey,
>
> On 2/3/23 07:45, Bin Meng wrote:
> > Hi Daniel,
> >
> > On Fri, Feb 3, 2023 at 6:31 PM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >>
> >>
> >> On 2/3/23 02:39, Bin Meng wrote:
> >>> On Thu, Feb 2, 2023 at 9:58 PM Daniel Henrique Barboza
> >>> <dbarboza@ventanamicro.com> wrote:
> >>>>
> >>>> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
> >>>> guest happens to be running in a hypervisor that are using 64 bits to
> >>>> encode its address, kernel_entry can be padded with '1's and create
> >>>> problems [1].
> >>>
> >>> Still this commit message is inaccurate. It's not
> >>>
> >>> "a 32-bit QEMU guest happens to running in a hypervisor that are using
> >>> 64 bits to encode tis address"
> >>>
> >>> as a 32-bit ELF can only hold a 32-bit address, but it's the QEMU ELF
> >>> loader that does the sign extension and returns the address as
> >>> uint64_t. It has nothing to do with hypervisor too.
> >>
> >>
> >> Yeah I'm still focusing too much on the use case instead of the root of the
> >> problem (sign-extension from QEMU elf).
> >>
> >>>
> >>>>
> >>>> Using a translate_fn() callback in load_elf_ram_sym() to filter the
> >>>> padding from the address doesn't work. A more detailed explanation can
> >>>> be found in [2]. The short version is that glue(load_elf, SZ), from
> >>>> include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
> >>>> 'kernel_load_base' var in riscv_load_Kernel()) before using
> >>>> translate_fn(), and will not recalculate it after executing it. This
> >>>> means that the callback does not prevent the padding from
> >>>> kernel_load_base to appear.
> >>>>
> >>>> Let's instead use a kernel_low var to capture the 'lowaddr' value from
> >>>> load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.
> >>>
> >>> Looking at the prototype of load_elf_ram_sym() it has
> >>>
> >>> ssize_t load_elf_ram_sym(const char *filename,
> >>>                            uint64_t (*elf_note_fn)(void *, void *, bool),
> >>>                            uint64_t (*translate_fn)(void *, uint64_t),
> >>>                            void *translate_opaque, uint64_t *pentry,
> >>>                            uint64_t *lowaddr, uint64_t *highaddr,
> >>>                            uint32_t *pflags, int big_endian, int elf_machine,
> >>>                            int clear_lsb, int data_swab,
> >>>                            AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
> >>>
> >>> So kernel_low is the "highaddr" parameter, not the 'lowaddr' value.
> >>
> >> And for some reason I thought kernel_base_addr was being used as 'pentry'. kernel_base_addr
> >> is already 'lowaddr'. Guess I'll have to rewrite the commit message. And revisit why my
> >> test case worked for riscv32 (I probably didn't use an ELF image ...)
> >>
> >> And the only way out seems to be filtering the bits from lowaddr. I'll do that.
> >>
> >
> > Can you check as to why QEMU ELF loader does the sign extension?
> >
> > I personally don't know why. Maybe the ELF loader does something wrong.
>
>
> I took a look and didn't find out why. I checked that in the ELF specification some
> file headers can indicate a sign extension. E.g. R_X86_64_32S for example is described as
> "Direct 32 bit zero extended". Note that the use of the tags are dependent on how the
> ELF was built, so we would need the exact ELF to check for that. All I can say is that
> there is a sign extension going on, in the 'lowaddr' field, and that translate_fn()
> wasn't enough to filter it out. I can't say whether this is intended or a bug.
>
>
> But going back a little, this whole situation happened in v5 because, in the next
> patch, riscv_load_initrd() started to receive an uint64_t (kernel_entry) instead of
> receiving a target_ulong like it was doing before. This behavior change, which was
> accidental, not only revealed this sign-extension behavior but also potentially changed
> what riscv_load_initrd() is receiving from load_uimage_as() the same way it's
> impacting load_elf_ram_sym(). The third load option, load_image_targphys_as(), is
> already using a target_ulong (kernel_start_addr) as return value so it's not
> impacted.
>
> I believe Alistair suggested to clear bits instead of just doing a target_ulong
> cast for a reason (I guess we're trying to gate all 32/64 bit CPU logic using a
> direct approach such as checking the CPU directly), but I also think we should
> clear bits for all 'kernel_entry' possibilities, not just the one that comes from
> load_elf_ram_sym(), to be consistent in all three cases. We might be even avoiding
> a future headache from load_uimage_as().

That seems like the approach to take. That way we aren't changing
behaviour and it continues along with improving/adding RV32 support on
64-bit bit targets.

If we want to change the behaviour in the future, we can add a patch
that does that with a description of why.

Alistair

>
>
>
> Thoughts?
>
>
> Daniel
>
>
> [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-elf.adoc
>
> >
> > Regards,
> > Bin
>

