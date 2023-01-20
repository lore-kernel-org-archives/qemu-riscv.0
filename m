Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIf4M-0001gy-Ka
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 19:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pIf4H-0001eu-TX; Thu, 19 Jan 2023 19:15:42 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pIf4D-0002y8-1w; Thu, 19 Jan 2023 19:15:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ADB0BCE25E5;
 Fri, 20 Jan 2023 00:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA086C433EF;
 Fri, 20 Jan 2023 00:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674173722;
 bh=ePFabqVRf4st39leips0qVardbndU2mTd4+n33r+jwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bn8/FCIFNQ+VJaszS3acaCOV3J0H/F1qq+4eQTmsmeeddcQLLwLoC9liQWiypZabg
 R6/qChbvE4buMa8nVVefDzPKbJqKZ7km96FmVFjXxpAvk85olYXvou06+tWlEaTcJb
 ZcJgsCd39tMCD3MJC/Px3CuuS7DWfzWmCdNTW5NyuJq8cnSm6OIObcPshj+Y6HgMH9
 xCWoE5yOGwJPl96CpZDcb2fE8mMnSQol1HMwkPCJPkdJxg0E5T2i2eGji1A6ThDdgv
 LSx+I1Vr3Ao7O3KIqgCBdtJIzOmcT3d/CJbEDLL0mkpQqRIY/zkq0cnbUFldEjkbka
 /w32EXYiCQjww==
Date: Fri, 20 Jan 2023 00:15:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
Message-ID: <Y8ndFjv9prrRXLnL@spud>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wMrXO/i6lGaZKplm"
Content-Disposition: inline
In-Reply-To: <20230119191728.622081-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=conor@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 20 Jan 2023 00:15:44 -0000


--wMrXO/i6lGaZKplm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Daniel,

Got through the stuff I wanted to get done tonight faster than
expected...

On Thu, Jan 19, 2023 at 05:17:33PM -0300, Daniel Henrique Barboza wrote:
> Are you testing it by using the command line
> you mentioned in the "qemu icicle kit es" thread?
>=20
> $(QEMU)/qemu-system-riscv64 \
> 	-M microchip-icicle-kit \
> 	-m 2G -smp 5 \
> 	-kernel $(vmlinux_bin) \
> 	-dtb $(devkit).dtb \
> 	-initrd $(initramfs) \
> 	-display none \
> 	-serial null \
> 	-serial stdio

Yah, effectively. It's not quite that, but near enough as makes no real
difference:
qemu-icicle:
	$(QEMU)/qemu-system-riscv64 -M microchip-icicle-kit \
		-m 2G -smp 5 \
		-kernel $(vmlinux_bin) \
		-dtb $(wrkdir)/riscvpc.dtb \
		-initrd $(initramfs) \
		-display none -serial null \
		-serial stdio \
		-D qemu.log -d unimp

I just tried to make things somewhat more intelligible for that thread.

Also in case it is not obvious, I do work for Microchip. As I mentioned
to Alistair at LPC, I/we don't have the cycles at the moment to do
anything with QEMU, so the bits of fixes I have sent are things I fixed
while debugging other issues etc, mostly in the evenings.

Anways, I'll attempt to explain what the craic is here..

On Thu, Jan 19, 2023 at 04:17:24PM -0300, Daniel Henrique Barboza wrote:
> The Icicle Kit board works with 2 distinct RAM banks that are separated

Ehh, 2 isn't really true. There are 6 possible "windows" into the DDR on
MPFS, list here as with their start addresses.

32-bit cached     0x0080000000
64-bit cached     0x1000000000
32-bit non-cached 0x00c0000000
64-bit non-cached 0x1400000000
32-bit WCB        0x00d0000000
64-bit WCB        0x1800000000

These are the "bus" addresses, where the harts think the memory is, but
the memory is not actually connected there. There are some runtime
configurable registers which determine what addresses these correspond
to in the DDR itself.

When the QEMU port for MPFS was written, only two of these were in use,
the 32-bit and 64-bit non-cached regions. The config (seg) registers
were set up so that the 32-bit cached region pointed to 0x0 in DDR and
the 64-bit region pointed to 0x3000_0000 in DDR.
=E2=A2=B0=E2=A0=92=E2=A0=92=E2=A0=92=E2=A0=92=E2=A1=96=E2=A0=92=E2=A0=92=E2=
=A0=92=E2=A3=B6=E2=A0=920x80000000
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=96=E2=A0=92=E2=A0=92=E2=A2=B2=E2=A1=87   =E2=A1=87 0x400000=
00
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A0=93=E2=A0=92=E2=A0=92=E2=A0=92=E2=A0=83 =
=E2=A1=87 <-- 64-bit starts here
=E2=A2=B8=E2=A1=87  =E2=A2=B8      =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8      =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8      =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8      =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8      =E2=A1=87 <-- 32-bit starts at 0x0
=E2=A0=98=E2=A0=93=E2=A0=920=E2=A0=9A=E2=A0=92=E2=A0=921=E2=A0=92=E2=A0=92=
=E2=A0=920x00000000

(These diagrams are a bit crap, I'm copy pasting them from a TUI tool
for visualising these I made for myself. The ~s can be ignored.
https://github.com/ConchuOD/memory-aperature-configurator)

> by a gap. We have a lower bank with 1GiB size, a gap follows,
> then at 64GiB the high memory starts.

As you correctly pointed out, that lower region is in fact 1 GiB & hence
there is actually an overlapping region of 256 MiB.

The Devicetree at this point in time looked like:
	ddrc_cache_lo: memory@80000000 {
		device_type =3D "memory";
		reg =3D <0x0 0x80000000 0x0 0x30000000>;
		clocks =3D <&clkcfg CLK_DDRC>;
		status =3D "okay";
	};

	ddrc_cache_hi: memory@1000000000 {
		device_type =3D "memory";
		reg =3D <0x10 0x0 0x0 0x40000000>;
		clocks =3D <&clkcfg CLK_DDRC>;
		status =3D "okay";
	};

At some point, it was decided that instead we would use a configuration
with ~no memory at 32-bit addresses. I think it was this one here:

=E2=A2=B0=E2=A1=96=E2=A0=92=E2=A0=92=E2=A2=B2=E2=A1=96=E2=A0=92=E2=A0=92=E2=
=A0=92=E2=A3=B6=E2=A0=920x80000000
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A3=BF =E2=A1=87        =20
=E2=A2=B8=E2=A0=93=E2=A0=92=E2=A0=92=E2=A0=9A=E2=A1=87   =E2=A1=9F =E2=A1=
=87 <-- 32-bit starts here
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 0x40000000
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87 <-- 64-bit starts at 0x0
=E2=A0=98=E2=A0=92=E2=A0=920=E2=A0=92=E2=A0=93=E2=A0=921=E2=A0=92=E2=A0=93=
=E2=A0=920x00000000

Because of how these windows work, the 32-bit cached region was always
there, just not used as the Devicetree became:
	ddrc_cache: memory@1000000000 {
		device_type =3D "memory";
		reg =3D <0x10 0x0 0x0 0x76000000>;
		status =3D "okay";
	};

The remaining bit of memory is being used for some WCB buffers etc &
not for the OS itself. This was never upstreamed anywhere AFAIK as it
was a workaround.

The current Devicetree in Linux & U-Boot corresponds to a configuration
like:
=E2=A2=B0=E2=A0=92=E2=A0=92=E2=A0=92=E2=A0=92=E2=A1=96=E2=A0=92=E2=A0=92=E2=
=A0=92=E2=A3=B6=E2=A0=920x80000000
=E2=A2=B8    =E2=A1=87   =E2=A3=BF =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=9F =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=96=E2=A0=92=E2=A0=92=E2=A2=B2=E2=A1=87   =E2=A1=87 0x400000=
00
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87        =20
=E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87 <-- 32- & 64-b=
it start at 0x0
=E2=A0=98=E2=A0=93=E2=A0=920=E2=A0=9A=E2=A0=93=E2=A0=921=E2=A0=92=E2=A0=93=
=E2=A0=920x00000000

That DT looks like:
	ddrc_cache_lo: memory@80000000 {
		device_type =3D "memory";
		reg =3D <0x0 0x80000000 0x0 0x40000000>;
		status =3D "okay";
	};

	ddrc_cache_hi: memory@1040000000 {
		device_type =3D "memory";
		reg =3D <0x10 0x40000000 0x0 0x40000000>;
		status =3D "okay";
	};

Each of these changes came as part of an FPGA reference design change &
a corresponding compatible change. I believe rtlv2203 was the second
configuration & rtlv2210 the third.

I can't boot the current configuration in QEMU, probably due to some of
the things you point out below.
To get it working, I remove the ddrc_cache_hi from my DT and boot with
the 32-bit cached memory only.
This is what the current changes have broken for me.

IMO it is a perfectly valid thing to boot a system using less than the
memory it *can* use.

I guess you read the other thread in which I stated that the HSS boot
that is documented doesn't work with recent HSSes. Ideally, and I am
most certainly _not_ expecting anyone to do this, when the HSS writes
the "seg" registers during boot to configure the memory layout as per
the FPGA bitstream QEMU would configure the memory layout it is
emulating to match.
Since direct kernel boot is a thing too, I was thinking that for that
mode, the config in the dtb should probably be used.
I don't know enough about QEMU to know if this is even possible!

The other possibility I was thinking of was just relaxing the DDR limit
entirely (and ignoring the overlaying) so that QEMU thinks there is 1
GiB at 0x8000_0000 and 16 GiB at 0x10_0000_0000.
Again, I've not had the cycles to look into any of this at all nor am I
expecting anyone else to - just while I am already typing about this
stuff there's no harm in broadcasting the other thoughts I had.

> MachineClass::default_ram_size is set to 1.5Gb and machine_init() is
> enforcing it as minimal RAM size, meaning that there we'll always have

I don't think that this is=20

> at least 512 MiB in the Hi RAM area, and that the FDT will be located
> there all the time.

All the time? That's odd.
I suppose my kernel then remaps the dtb into the memory range it can
access, and therefore things keep ticking.

I don't think that machine_init() should be enforcing a minimum ram size
of 1.5 GiB - although maybe Bin Meng has a reason for that that I don't
understand.

> riscv_compute_fdt_addr() can't handle this setup because it assumes that
> the RAM is always contiguous. It's also returning an uint32_t because
> it's enforcing that fdt address is sitting on an area that is addressable
> to 32 bit CPUs, but 32 bits won't be enough to point to the Hi area of
> the Icicle Kit RAM (and to its FDT itself).
>=20
> Create a new function called microchip_compute_fdt_addr() that is able
> to deal with all these details that are particular to the Icicle Kit.
> Ditch riscv_compute_fdt_addr() and use it instead.
>=20
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/microchip_pfsoc.c | 46 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index dcdbc2cac3..9b829e4d1a 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -54,6 +54,8 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
> =20
> +#include <libfdt.h>
> +
>  /*
>   * The BIOS image used by this machine is called Hart Software Services =
(HSS).
>   * See https://github.com/polarfire-soc/hart-software-services
> @@ -513,6 +515,46 @@ static void microchip_pfsoc_soc_register_types(void)
> =20
>  type_init(microchip_pfsoc_soc_register_types)
> =20
> +static hwaddr microchip_compute_fdt_addr(MachineState *ms)
> +{
> +    const MemMapEntry *memmap =3D microchip_pfsoc_memmap;
> +    hwaddr mem_low_size =3D memmap[MICROCHIP_PFSOC_DRAM_LO].size;
> +    hwaddr mem_high_size, fdt_base;
> +    int ret =3D fdt_pack(ms->fdt);
> +    int fdtsize;
> +
> +    /* Should only fail if we've built a corrupted tree */
> +    g_assert(ret =3D=3D 0);
> +
> +    fdtsize =3D fdt_totalsize(ms->fdt);
> +    if (fdtsize <=3D 0) {
> +        error_report("invalid device-tree");
> +        exit(1);
> +    }
> +
> +    /*
> +     * microchip_icicle_kit_machine_init() does a validation
> +     * that guarantees that ms->ram_size is always greater
> +     * than mem_low_size and that mem_high_size will be
> +     * at least 512MiB.

Again, I don't think it should be doing this at all. I see the comment
about that size refers to DDR training, but given the overlaying of
memory it's entirely possible to train against 64-bit addresses but then
boot a kernel using only low memory addresses.
Perhaps by default & for booting via the bootloader, but I don't think
enforcing this makes sense when the bootloader is not involved.

If a dtb is used as the source for the memory layout, requiring memory
at high addresses doesn't make sense to me. I have no idea if there is a
mechanism for figuring that out though nor am I au fait with how these
memory sizes are calculated.
It is getting kinda late here, so I am sending this without having
investigated any of the detail, sorry.

Hopefully that wasn't too deranged and you can at least understand why I
have been doing what I have...

Thanks,
Conor.

> +     *
> +     * This also means that our fdt_addr will be based
> +     * on the starting address of the HI DRAM block.
> +     */
> +    mem_high_size =3D ms->ram_size - mem_low_size;
> +    fdt_base =3D memmap[MICROCHIP_PFSOC_DRAM_HI].base;
> +
> +    /*
> +     * In theory we could copy riscv_compute_fdt_addr()
> +     * and put the FDT capped at maximum 3Gb from fdt_base,
> +     * but fdt_base is set at 0x1000000000 (64GiB). We
> +     * make the assumption here that the OS is ready to
> +     * handle the FDT, 2MB aligned, at the very end of
> +     * the available RAM.
> +     */
> +    return QEMU_ALIGN_DOWN(fdt_base + mem_high_size - fdtsize, 2 * MiB);
> +}
> +
>  static void microchip_icicle_kit_machine_init(MachineState *machine)
>  {
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> @@ -640,9 +682,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>                                      "bootargs", machine->kernel_cmdline);
>          }
> =20
> -        /* Compute the fdt load address in dram */
> -        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_=
DRAM_LO].base,
> -                                              machine->ram_size, machine=
->fdt);
> +        fdt_load_addr =3D microchip_compute_fdt_addr(machine);
>          riscv_load_fdt(fdt_load_addr, machine->fdt);
> =20
>          /* Load the reset vector */
> --=20
> 2.39.0
>=20
>=20
>=20

--wMrXO/i6lGaZKplm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8ndFgAKCRB4tDGHoIJi
0g4GAQC7HlIcorv5FwQjYfzQLi/taDetKgE8WxSKwNQSVWwdfwEA47i98rN/DSAn
N8hBItXm3FBdDhl13xv4vpQGc2lKFA0=
=HZlu
-----END PGP SIGNATURE-----

--wMrXO/i6lGaZKplm--

