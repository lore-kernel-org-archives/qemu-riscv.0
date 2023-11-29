Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD5C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 15:13:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8MFU-0005nA-1E; Wed, 29 Nov 2023 10:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1r8MFS-0005mm-Ci; Wed, 29 Nov 2023 10:13:10 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1r8MFP-0002P1-Du; Wed, 29 Nov 2023 10:13:10 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50AD9CE1EF9;
 Wed, 29 Nov 2023 15:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF7EC433C7;
 Wed, 29 Nov 2023 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701270781;
 bh=nL4eRrOfOlpn89MV2opGSwseTkqYgbTtpXhvnr1zKwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArsyBSnaoia+yo0kAMMq9JjFoOjtpmsyAKFENz6Ndla6pWTb93YWLNLnbSKW7LMjX
 qi5s9idn0ilLhwraddLA1vIGr0hh8lKN7SJDy/XtusrJapUUWkgIb/M5ZFu6jJjH0M
 XScJdCVZtrn6K2m+e9jidFgMfSpirnQEhUyUHYG+GNjh9g0hKhn2ZHu21ncOV4oH+o
 p8ZX6T0cEyiVfWFoYe6iN1+1SduJYR/cGSBhKK4x0B70BmwJFw0WWu0qMx3x5q6tyZ
 yY+4HP1hwz7xTdm7p/U9CkTvaXn6gxWbUWtmUeVSIMM5LTuFRWfB9U85Yr8ixzCLkI
 37s/HqupxfGEg==
Date: Wed, 29 Nov 2023 15:12:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1] riscv: support new isa extension detection devicetree
 properties
Message-ID: <20231129-disperser-footless-7adf30a02cc2@spud>
References: <20231129-pebble-tuition-52fe03be95ae@spud>
 <651f0ec5-1639-4b4b-ac3e-151e0af45214@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xzoX5rTDahZz4UXN"
Content-Disposition: inline
In-Reply-To: <651f0ec5-1639-4b4b-ac3e-151e0af45214@ventanamicro.com>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=conor@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


--xzoX5rTDahZz4UXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 11:37:00AM -0300, Daniel Henrique Barboza wrote:
> On 11/29/23 07:39, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > A few months ago I submitted a patch to various lists, deprecating
> > "riscv,isa" with a lengthy commit message [0] that is now commit
> > aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa") in the Linux
> > kernel tree. Primarily, the goal was to replace "riscv,isa" with a new
> > set of properties that allowed for strictly defining the meaning of
> > various extensions, where "riscv,isa" was tied to whatever definitions
> > inflicted upon us by the ISA manual, which have seen some variance over
> > time.
> >=20
> > Two new properties were introduced: "riscv,isa-base" and
> > "riscv,isa-extensions". The former is a simple string to communicate the
> > base ISA implemented by a hart and the latter an array of strings used
> > to communicate the set of ISA extensions supported, per the definitions
> > of each substring in extensions.yaml [1]. A beneficial side effect was
> > also the ability to define vendor extensions in a more "official" way,
> > as the ISA manual and other RVI specifications only covered the format
> > for vendor extensions in the ISA string, but not the meaning of vendor
> > extensions, for obvious reasons.
> >=20
> > Add support for setting these two new properties in the devicetrees for
> > the various devicetree platforms supported by QEMU for RISC-V. The Linux
> > kernel already supports parsing ISA extensions from these new
> > properties, and documenting them in the dt-binding is a requirement for
> > new extension detection being added to the kernel.
> >=20
> > A side effect of the implementation is that the meaning for elements in
> > "riscv,isa" and in "riscv,isa-extensions" are now tied together as they
> > are constructed from the same source. The same applies to the ISA string
> > provided in ACPI tables, but there does not appear to be any strict
> > definitions of meanings in ACPI land either.
> >=20
> > Link: https://lore.kernel.org/qemu-riscv/20230702-eats-scorebook-c951f1=
70d29f@spud/ [0]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/riscv/extensions.yaml [1]
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
>=20
> What about new extensions? Do we still need them to be present in riscv,i=
sa
> or can we just add them to riscv,isa-extensions? Eventually we'll want ap=
plications
> to move on and stop using riscv,isa altogether, but if we keep adding new
> extensions to it this process will take longer.

Yeah, I kinda didn't want to go there any time soon though, since this
is only the second codebase I've added the properties to so far. If
preventing adding new things to "riscv,isa" is something the maintainers
of the RISC-V QEMU support are down to do, I certainly would not object.

>=20
> > The apart from the bonding of ACPI and DT definitions which concerns me
> > a bit, I'm a wee bit worried about the vendor extensions diverging from
> > what ends up in bindings. Ideally I think there should be acked binding
> > patches for extensions, but that's well outside of my jurisdiction!
> >=20
> > There's two 80 char line length violations in this, but the file already
> > has some > 80 char lines, so I figured that it'd be fine...
>=20
> It's fine to me.

Cool.

> > +void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename)
> > +{
> > +    const size_t maxlen =3D sizeof("rv128i");
> > +    g_autofree char *isa_base =3D g_new(char, maxlen);
> > +    g_autofree char *riscv_isa;
> > +    char **isa_extensions;
> > +    int count =3D 0;
> > +
> > +    riscv_isa =3D riscv_isa_string(cpu);
> > +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", riscv_isa);
> > +
> > +    snprintf(isa_base, maxlen, "rv%di", TARGET_LONG_BITS);
> > +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa-base", isa_base);
> > +
> > +    isa_extensions =3D riscv_isa_extensions_list(cpu, &count);
> > +    qemu_fdt_setprop_string_array(fdt, nodename, "riscv,isa-extensions=
",
> > +                                  isa_extensions, count);
> > +
> > +    for (int i =3D 0; i < count; i++) {
> > +        g_free(isa_extensions[i]);
> > +    }
> > +}
>=20
> This will break user-mode build:
>=20
> [2025/2626] Linking target qemu-riscv64
> FAILED: qemu-riscv64
> (...)
> /usr/bin/ld: libqemu-riscv64-linux-user.fa.p/target_riscv_cpu.c.o: in fun=
ction `riscv_isa_set_props':
> /home/danielhb/work/qemu/build/../target/riscv/cpu.c:1774: undefined refe=
rence to `qemu_fdt_setprop_string'
> /usr/bin/ld: /home/danielhb/work/qemu/build/../target/riscv/cpu.c:1777: u=
ndefined reference to `qemu_fdt_setprop_string'
> /usr/bin/ld: /home/danielhb/work/qemu/build/../target/riscv/cpu.c:1780: u=
ndefined reference to `qemu_fdt_setprop_string_array'
> collect2: error: ld returned 1 exit status

ngl, I have never used user-mode before. I'll fix that up. I'm not
really an indef in c files fan, but if that is par for the course then
it works for me :)

> As a bonus, I would rename riscv_isa_set_props() to something like riscv_=
write_isa_fdt()
> to be closer to what the function is doing.
>=20
>=20
> Finally, is this the intended result? I got this DTs by using a simple bu=
ildroot with
> rv64:
>=20
> # cat  /proc/device-tree/cpus/cpu@0/riscv,isa-base
> rv64i#
> #
> # cat  /proc/device-tree/cpus/cpu@0/riscv,isa
> rv64imafdch_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zih=
pm_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu#
> #
> # cat  /proc/device-tree/cpus/cpu@0/riscv,isa-extensions
> imafdchzicbomzicbozzicntrzicsrzifenceizihintntlzihintpausezihpmzawrszfazc=
azcdzbazbbzbczbssstcsvadu#

Yup! It just looks confusing with that proc file.
# cat /proc/device-tree/cpus/cpu@0/riscv,isa-extensions
imafdchzicbomzicbozzicntrzicsrzifenceizihintntlzihintpausezihpmzawrszfazcaz=
cdzbazbbzbczbssstcsvadu#=20
which then shows up in /proc/cpuinfo as
isa             : rv64imafdch_zicbom_zicboz_zicntr_zicsr_zifencei_zihintpau=
se_zihpm_zba_zbb_zbs_sstc

Dumping the dtb and running it backwards through dtc you can see the
property looks like:
riscv,isa-extensions =3D "i\0m\0a\0f\0d\0c\0h\0zicbom\0zicboz\0zicntr\0zics=
r\0zifencei\0zihintntl\0zihintpause\0zihpm\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\=
0zbc\0zbs\0sstc\0svadu";

That's the same way that compatibles appear:
# cat /proc/device-tree/soc/clint@2000000/compatible=20
sifive,clint0riscv,clint0#

The null terminating chars being the "issue" in both cases.

Cheers,
Conor.

--xzoX5rTDahZz4UXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdU+QAKCRB4tDGHoIJi
0r9tAQCyZVep15KNTrY6XJRMU2XqseB1AZTnQtILxBLpnoTeHwEAvxt2f3fKBKOP
NYG03jNquG//Q1kleaXoxtd1shF8sAo=
=E/c1
-----END PGP SIGNATURE-----

--xzoX5rTDahZz4UXN--

