Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNtZv-0001WD-TG
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 05:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pNtZt-0001Ve-QV; Fri, 03 Feb 2023 05:45:57 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pNtZr-0002QI-Vj; Fri, 03 Feb 2023 05:45:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id m2so14145407ejb.8;
 Fri, 03 Feb 2023 02:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f1zy6+7JpPXVguis2sH2Aap1Rjhgu0d4S2AZ0dnwXgI=;
 b=I9nn0JEMvxq4/E82lxYe3YOn5nKrfy0t9inOLHS6n4OfJHIUIhbHA4WCVZUELgQsxx
 A7gPpULpPGYecf4BfucbGneXsiftzxEt2Cd2z9pzYU29Jl0NVvF8qJ9AfuVdT7gt1kux
 PpgSb3abpprdazvNn3g2h7ydJLAeTdU5X00dlEk25E8yDAjWvFqtdQeg2PaXdxt0RxGJ
 BD/8X1YuIvjGxCwtk9lgHVENI9jOIVGtMEZ33I7T3ArCAJjEU0oE2jJkWoiX4W3lVE4i
 V0Evyjpbh6CAHjuv5En+ZTJiCZtfnSQVV1eIJy2LtItWcNybCurcjx1TvbmipKGA6Sb5
 MuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f1zy6+7JpPXVguis2sH2Aap1Rjhgu0d4S2AZ0dnwXgI=;
 b=D5bgg5nx3pSHmELvr2lbCDVGk0hWYDfPX04qGQu6iXrG4AV/gOewn75ZUsJOgDvMUF
 JV/Z7Uu8qKFfKpDEaGcElFrMTAAIenl/tNanW0VvavulRjVixkmpaqSoMtW2h+VUXrPn
 ATi91ldjD7iKw+1vC0W/93vrLY6saHh3oc5Mo5u/pKFSpQlNBLeUNc9Ea4lUYi/MpgG1
 I79Rbw7+/Vm8T/dNhYmgWPCO7erMx9egnoRJB4/fGaAGKOfIYN63SFykDsvAEHQYKIVS
 yDfhCWikZHwesjcI4vkfGYb+kfAt/s5l0Z1Zf/cOwqdWPKVGZPnmXRBoYjzUV03zprlt
 qn3A==
X-Gm-Message-State: AO0yUKUZJaemBqVq1RGjlTWjY+mvO3h7tH5lh1SUZWsYynG0PGSZYru3
 SMMnEAgzeBCu9TdHTjcomBEsWj0nystLbbN80w8=
X-Google-Smtp-Source: AK7set9Zm5ntYeqKOmelxQnZZXZkVQ2MUaqw1hFqf8wBXeLi/W5veydb/ifoA6eknplgnhi2QEJXc1Rf3g8AcKdHi1w=
X-Received: by 2002:a17:906:49da:b0:882:3e56:a854 with SMTP id
 w26-20020a17090649da00b008823e56a854mr2824940ejv.263.1675421153773; Fri, 03
 Feb 2023 02:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <20230202135810.1657792-2-dbarboza@ventanamicro.com>
 <CAEUhbmW01vUZNdAcXQ0b-7GUgH70q9eyWJH7kG+Mph4uJJeWnA@mail.gmail.com>
 <51896f68-d902-ee07-295d-5809c9c66e60@ventanamicro.com>
In-Reply-To: <51896f68-d902-ee07-295d-5809c9c66e60@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 3 Feb 2023 18:45:42 +0800
Message-ID: <CAEUhbmVN3Pw8794tq2H3X5amexhptnrZaLdG0MHyON6fyac-AA@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 10:45:58 -0000

Hi Daniel,

On Fri, Feb 3, 2023 at 6:31 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 2/3/23 02:39, Bin Meng wrote:
> > On Thu, Feb 2, 2023 at 9:58 PM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
> >> guest happens to be running in a hypervisor that are using 64 bits to
> >> encode its address, kernel_entry can be padded with '1's and create
> >> problems [1].
> >
> > Still this commit message is inaccurate. It's not
> >
> > "a 32-bit QEMU guest happens to running in a hypervisor that are using
> > 64 bits to encode tis address"
> >
> > as a 32-bit ELF can only hold a 32-bit address, but it's the QEMU ELF
> > loader that does the sign extension and returns the address as
> > uint64_t. It has nothing to do with hypervisor too.
>
>
> Yeah I'm still focusing too much on the use case instead of the root of the
> problem (sign-extension from QEMU elf).
>
> >
> >>
> >> Using a translate_fn() callback in load_elf_ram_sym() to filter the
> >> padding from the address doesn't work. A more detailed explanation can
> >> be found in [2]. The short version is that glue(load_elf, SZ), from
> >> include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
> >> 'kernel_load_base' var in riscv_load_Kernel()) before using
> >> translate_fn(), and will not recalculate it after executing it. This
> >> means that the callback does not prevent the padding from
> >> kernel_load_base to appear.
> >>
> >> Let's instead use a kernel_low var to capture the 'lowaddr' value from
> >> load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.
> >
> > Looking at the prototype of load_elf_ram_sym() it has
> >
> > ssize_t load_elf_ram_sym(const char *filename,
> >                           uint64_t (*elf_note_fn)(void *, void *, bool),
> >                           uint64_t (*translate_fn)(void *, uint64_t),
> >                           void *translate_opaque, uint64_t *pentry,
> >                           uint64_t *lowaddr, uint64_t *highaddr,
> >                           uint32_t *pflags, int big_endian, int elf_machine,
> >                           int clear_lsb, int data_swab,
> >                           AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
> >
> > So kernel_low is the "highaddr" parameter, not the 'lowaddr' value.
>
> And for some reason I thought kernel_base_addr was being used as 'pentry'. kernel_base_addr
> is already 'lowaddr'. Guess I'll have to rewrite the commit message. And revisit why my
> test case worked for riscv32 (I probably didn't use an ELF image ...)
>
> And the only way out seems to be filtering the bits from lowaddr. I'll do that.
>

Can you check as to why QEMU ELF loader does the sign extension?

I personally don't know why. Maybe the ELF loader does something wrong.

Regards,
Bin

