Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNNTb-0008N9-16
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 19:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNTW-0008Md-VQ; Wed, 01 Feb 2023 19:29:14 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNTU-0000dy-Ny; Wed, 01 Feb 2023 19:29:14 -0500
Received: by mail-vk1-xa34.google.com with SMTP id v5so78140vkc.10;
 Wed, 01 Feb 2023 16:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0+/lAUiNAA5YFvUG41wSJ1xaZBx6pctCWqWTYEBIUY=;
 b=bFPfnSB4IZ5GaE6bcm3v2wS5KwnoprQVzPZ/V+X+q05zkrffUTqjEJdqC+gRTZE6hv
 vsVb4FgvAb8Bwl2a8Wu7Nf5KsTesptsaipNjdzBkc0V00crHvh2T7HgwG2FX0Xork79Y
 hmXtHzgV/bcNlt3XC5vDthyxtmmDrZliOus4CBX28MnT3GtjNajUfHcKfGszXN+gzvSx
 h69b0SuxOPA+n5hXIGj9+fJ3FIGvxuVQA2e3CSCf9PdiDLAFkllJYST+OV8oSJ7ehmVd
 +nkkaqT95niqZLQI9Stp8jTXEgj/GgRR0KCiHcPX1xpLI8wY8+nkroJv0mzHuJh1+Ljq
 ZP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0+/lAUiNAA5YFvUG41wSJ1xaZBx6pctCWqWTYEBIUY=;
 b=LtFDmZENu8J06jHcmWKkNZdRJp3Ac6pVLVs8BihWwizkcR/ILBKYWQ1FhMExR7Su3f
 zoyJKCrh5iuyp1i43Ho5+Rlt/jq4BtBDe/HQm58qayLfUTnZQpB3ZAg0tIJ6qooBcgos
 2JOjkLwtS56UKYADCGhTjZvhv5YNEVLL/lmyjhPzNZE1DsB4mH/sQ7JtngpweTwrMaRt
 DYDaM/jaF0F1qmHKQhPnhJUS0atmijioMvj3ipdXFgpCb6V+sG9TQ+iEu6L7xzmU3UEo
 t/GPzY5gNRyuH5XD2MYPDXv3/UwhMQFN7LXnUO22X5yn636EZl62D87we3nNen6oQI7w
 45yQ==
X-Gm-Message-State: AO0yUKW+P0/gc2lnyCmOaWGDZ46sTDhDqZz+PMDpS92q8CnNuUT9iTvg
 3tuCmtg3tka8w7yqsi5UxQmtp/fW1L8IwP9ilTmgOv47J0w=
X-Google-Smtp-Source: AK7set++ajkIwW0ZNAykbVQFlHIMCQAh2PVsw6LsikSwtJGaONTzz/9r231gGCp66mMGkhiCTSBZyWYSS3gWBOA377s=
X-Received: by 2002:a05:6122:c4:b0:3e2:4afc:40ab with SMTP id
 h4-20020a05612200c400b003e24afc40abmr646961vkc.25.1675297751280; Wed, 01 Feb
 2023 16:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
 <20230119213707.651533-2-dbarboza@ventanamicro.com>
 <CAKmqyKPsZC64SsecFip20NhnwjKHRdw1nj-3=jYPU5Lu+urMTQ@mail.gmail.com>
 <a3aab251-a90c-ea06-271d-ce02e3ee589c@ventanamicro.com>
In-Reply-To: <a3aab251-a90c-ea06-271d-ce02e3ee589c@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 10:28:45 +1000
Message-ID: <CAKmqyKPbdxuoes36nv4HszCPPF6kF2TEcLxPv2iWc0C2ZOfE5Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] hw/riscv: clear kernel_entry higher bits from
 load_elf_ram_sym()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 02 Feb 2023 00:29:15 -0000

On Wed, Feb 1, 2023 at 11:48 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/31/23 21:16, Alistair Francis wrote:
> > On Fri, Jan 20, 2023 at 7:38 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit
> >> QEMU guest happens to be running in a hypervisor that are using 64
> >> bits to encode its address, kernel_entry can be padded with '1's
> >> and create problems [1].
> >>
> >> Use a translate_fn() callback to be called by load_elf_ram_sym() and
> >> return only the 32 bits address if we're running a 32 bit CPU.
> >>
> >> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.htm=
l
> >>
> >> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   hw/riscv/boot.c            | 20 +++++++++++++++++++-
> >>   hw/riscv/microchip_pfsoc.c |  3 ++-
> >>   hw/riscv/opentitan.c       |  3 ++-
> >>   hw/riscv/sifive_e.c        |  3 ++-
> >>   hw/riscv/sifive_u.c        |  3 ++-
> >>   hw/riscv/spike.c           |  3 ++-
> >>   hw/riscv/virt.c            |  3 ++-
> >>   include/hw/riscv/boot.h    |  1 +
> >>   8 files changed, 32 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >> index 2594276223..46fc7adccf 100644
> >> --- a/hw/riscv/boot.c
> >> +++ b/hw/riscv/boot.c
> >> @@ -173,7 +173,24 @@ target_ulong riscv_load_firmware(const char *firm=
ware_filename,
> >>       exit(1);
> >>   }
> >>
> >> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> >> +{
> >> +    RISCVHartArrayState *harts =3D opaque;
> >> +
> >> +    if (riscv_is_32bit(harts)) {
> >> +        /*
> >> +         * For 32 bit CPUs, kernel_load_base is sign-extended
> >> +         * (i.e. it can be padded with '1's) by load_elf().
> >> +         * Remove the sign extension by truncating to 32-bit.
> >> +         */
> >> +        return extract64(addr, 0, 32);
> >> +    }
> >> +
> >> +    return addr;
> >
> > So.... After all that, this doesn't actually mask pentry from
> > load_elf_ram_sym(), so it doesn't help.
>
> Interesting. And it has to do with how load_elf() is handling it. All the=
se
> load_elf() functions will end up in either load_elf64() or load_elf32(), =
which
> in turn will call glue(load_elf, SZ) from include/hw/elf_ops.h.
>
> In that function, pentry is calculated right at the start:
>
>
>      if (pentry)
>          *pentry =3D (uint64_t)(elf_sword)ehdr.e_entry;
>
>
> And then, down below, the translation function is used:
>
>              if (translate_fn) {
>                  addr =3D translate_fn(translate_opaque, ph->p_paddr);
>                  glue(elf_reloc, SZ)(&ehdr, fd, must_swab,  translate_fn,
>                                      translate_opaque, data, ph, elf_mach=
ine);
>              } else {
>                  addr =3D ph->p_paddr;
>              }
>
> And 'pentry' is only recalculated if we do NOT have a translate_fn:
>
>
>              /* the entry pointer in the ELF header is a virtual
>               * address, if the text segments paddr and vaddr differ
>               * we need to adjust the entry */
>              if (pentry && !translate_fn &&
>                      ph->p_vaddr !=3D ph->p_paddr &&
>                      ehdr.e_entry >=3D ph->p_vaddr &&
>                      ehdr.e_entry < ph->p_vaddr + ph->p_filesz &&
>                      ph->p_flags & PF_X) {
>                  *pentry =3D ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
>              }
>
>
> I can't say whether this is an oversight or intended, but in the end it's=
 a given
> that pentry is not being affected by translate_fn() as we thought it woul=
d - meaning
> that we're still passing the sign-extension along.
>
> I'll mention this in the commit message for future reference.
>
>
>
>
> >
> >> +}
> >> +
> >>   target_ulong riscv_load_kernel(MachineState *machine,
> >> +                               RISCVHartArrayState *harts,
> >>                                  target_ulong kernel_start_addr,
> >>                                  symbol_fn_t sym_cb)
> >>   {
> >> @@ -189,7 +206,8 @@ target_ulong riscv_load_kernel(MachineState *machi=
ne,
> >>        * the (expected) load address load address. This allows kernels=
 to have
> >>        * separate SBI and ELF entry points (used by FreeBSD, for examp=
le).
> >>        */
> >> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> >> +    if (load_elf_ram_sym(kernel_filename, NULL,
> >> +                         translate_kernel_address, harts,
> >>                            NULL, &kernel_load_base, NULL, NULL, 0,
> >>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> >
> > I think we just need to add the mask here
>
>
> I saw in other machines that we can retrieve 'kernel_low' using the param=
eter
> right after kernel_load_base. This worked for me to boot a 32 bit 'virt' =
machine
> with -kernel:
>
>
> -    if (load_elf_ram_sym(kernel_filename, NULL,
> -                         translate_kernel_address, harts,
> -                         NULL, &kernel_load_base, NULL, NULL, 0,
> +    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
> +                         &kernel_load_base, &kernel_low, NULL, 0,
>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>           kernel_entry =3D kernel_load_base;
> +
> +        if (riscv_is_32bit(harts)) {
> +            kernel_entry =3D kernel_low;
> +        }

That looks good to me, I expect that would work

Alistair

>
>
> I don't have your failing use case here so it would be up for you to be '=
adventurous'
> and see if this would fix the problem you're seeing. If you'd rather get =
this over
> with we can just mask it out and call it day.
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
> >
> >>           return kernel_load_base;
> >> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> >> index 82ae5e7023..bdefeb3cbb 100644
> >> --- a/hw/riscv/microchip_pfsoc.c
> >> +++ b/hw/riscv/microchip_pfsoc.c
> >> @@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(Mach=
ineState *machine)
> >>           kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u=
_cpus,
> >>                                                            firmware_en=
d_addr);
> >>
> >> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr=
, NULL);
> >> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> >> +                                         kernel_start_addr, NULL);
> >>
> >>           if (machine->initrd_filename) {
> >>               riscv_load_initrd(machine, kernel_entry);
> >> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> >> index 64d5d435b9..2731138c41 100644
> >> --- a/hw/riscv/opentitan.c
> >> +++ b/hw/riscv/opentitan.c
> >> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *mac=
hine)
> >>       }
> >>
> >>       if (machine->kernel_filename) {
> >> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
> >> +        riscv_load_kernel(machine, &s->soc.cpus,
> >> +                          memmap[IBEX_DEV_RAM].base, NULL);
> >>       }
> >>   }
> >>
> >> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> >> index 3e3f4b0088..1a7d381514 100644
> >> --- a/hw/riscv/sifive_e.c
> >> +++ b/hw/riscv/sifive_e.c
> >> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *ma=
chine)
> >>                             memmap[SIFIVE_E_DEV_MROM].base, &address_s=
pace_memory);
> >>
> >>       if (machine->kernel_filename) {
> >> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NU=
LL);
> >> +        riscv_load_kernel(machine, &s->soc.cpus,
> >> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
> >>       }
> >>   }
> >>
> >> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> index 2fb6ee231f..83dfe09877 100644
> >> --- a/hw/riscv/sifive_u.c
> >> +++ b/hw/riscv/sifive_u.c
> >> @@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *ma=
chine)
> >>           kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u=
_cpus,
> >>                                                            firmware_en=
d_addr);
> >>
> >> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr=
, NULL);
> >> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> >> +                                         kernel_start_addr, NULL);
> >>
> >>           if (machine->initrd_filename) {
> >>               riscv_load_initrd(machine, kernel_entry);
> >> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> >> index badc11ec43..2bcc50d90d 100644
> >> --- a/hw/riscv/spike.c
> >> +++ b/hw/riscv/spike.c
> >> @@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine=
)
> >>           kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0=
],
> >>                                                            firmware_en=
d_addr);
> >>
> >> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr=
,
> >> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> >> +                                         kernel_start_addr,
> >>                                            htif_symbol_callback);
> >>
> >>           if (machine->initrd_filename) {
> >> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >> index 4a11b4b010..ac173a6ed6 100644
> >> --- a/hw/riscv/virt.c
> >> +++ b/hw/riscv/virt.c
> >> @@ -1274,7 +1274,8 @@ static void virt_machine_done(Notifier *notifier=
, void *data)
> >>           kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0=
],
> >>                                                            firmware_en=
d_addr);
> >>
> >> -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr=
, NULL);
> >> +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> >> +                                         kernel_start_addr, NULL);
> >>
> >>           if (machine->initrd_filename) {
> >>               riscv_load_initrd(machine, kernel_entry);
> >> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> >> index f94653a09b..105706bf25 100644
> >> --- a/include/hw/riscv/boot.h
> >> +++ b/include/hw/riscv/boot.h
> >> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmwar=
e_filename,
> >>                                    hwaddr firmware_load_addr,
> >>                                    symbol_fn_t sym_cb);
> >>   target_ulong riscv_load_kernel(MachineState *machine,
> >> +                               RISCVHartArrayState *harts,
> >>                                  target_ulong firmware_end_addr,
> >>                                  symbol_fn_t sym_cb);
> >>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)=
;
> >> --
> >> 2.39.0
> >>
> >>

