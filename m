Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41336C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 07:56:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTHZv-0007zF-O2; Tue, 08 Aug 2023 03:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qTHZu-0007yc-AI; Tue, 08 Aug 2023 03:56:30 -0400
Received: from forward501b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d501])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qTHZq-0003ff-4G; Tue, 08 Aug 2023 03:56:30 -0400
Received: from mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a712:0:640:d986:0])
 by forward501b.mail.yandex.net (Yandex) with ESMTP id 7903E5EDA2;
 Tue,  8 Aug 2023 10:56:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id DuSVfQ0WlCg0-hIBDAOhO; 
 Tue, 08 Aug 2023 10:56:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1691481376; bh=RXSg1AkYnBoaLqI/ohpz+GCIEG3ttcW6ktd2WxMTqeQ=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=T1RbILzTlnVoKZEhUDe984jFnPXTQwkKYoRzPY5XUiCbR0517PQe/Y1w4t1dERx7K
 s+Tt/636kfWo9Rfucx8mcI/AoqRXCRpVV7Q+k7uCm1eRnqMUev0xsRu5RWujZLatgC
 x+QzLjUA1SeZhahAcgQ3wRKblSrZK9QyH4s0C2Ic=
Authentication-Results: mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Message-ID: <c60d90c8c17a876b9e976416e2259ddc92ffdd9f.camel@maquefel.me>
Subject: Re: [RFC PATCH] hw/riscv: hart: allow other cpu instance
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Date: Tue, 08 Aug 2023 10:56:14 +0300
In-Reply-To: <43c6120f-ed43-d45c-a3a5-a3bf22fd8f67@ventanamicro.com>
References: <20230727080545.7908-1-nikita.shubin@maquefel.me>
 <43c6120f-ed43-d45c-a3a5-a3bf22fd8f67@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:d501;
 envelope-from=nikita.shubin@maquefel.me; helo=forward501b.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hello Deniel!

On Mon, 2023-07-31 at 11:12 -0300, Daniel Henrique Barboza wrote:
> >=20
> >=20
> > On 7/27/23 05:05, Nikita Shubin wrote:
> > > > From: Nikita Shubin <n.shubin@yadro.com>
> > > >=20
> > > > Allow using instances derivative from RISCVCPU
> > > >=20
> > > > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > > > ---
> > > > Currently it is not possible to overload instance of RISCVCPU,
> > > > i.e. something like this:
> > > >=20
> > > > static const TypeInfo riscv_cpu_type_infos[] =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D TYPE_ANO=
THER_RISCV_CPU,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D TYPE_R=
ISCV_CPU,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_size =3D=
 sizeof(MyCPUState),
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_init =3D=
 riscv_my_cpu_init,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > };
> > > >=20
> > > > Because we have RISCVHartArrayState.harts with exactly
> > > > the size of RISCVCPU.
> > > >=20
> > > > Using own instances can be used to store some internal hart
> > > > state.
> > > > ---
> > > > =C2=A0 hw/riscv/boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++--
> > > > =C2=A0 hw/riscv/riscv_hart.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 20 ++++++++++++--------
> > > > =C2=A0 hw/riscv/sifive_u.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
> > > > =C2=A0 hw/riscv/spike.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++-
> > > > =C2=A0 hw/riscv/virt-acpi-build.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0 hw/riscv/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> > > > =C2=A0 include/hw/riscv/riscv_hart.h | 18 +++++++++++++++++-
> > > > =C2=A0 7 files changed, 44 insertions(+), 18 deletions(-)
> > > >=20
> > > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > > index 52bf8e67de..c0456dcc2e 100644
> > > > --- a/hw/riscv/boot.c
> > > > +++ b/hw/riscv/boot.c
> > > > @@ -36,7 +36,8 @@
> > > > =C2=A0=20
> > > > =C2=A0 bool riscv_is_32bit(RISCVHartArrayState *harts)
> > > > =C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 return harts->harts[0].env.misa_mxl_max =3D=3D =
MXL_RV32;
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D riscv_array_get_hart(harts, =
0);
> > > > +=C2=A0=C2=A0=C2=A0 return hart->env.misa_mxl_max =3D=3D MXL_RV32;
> > > > =C2=A0 }
> > > > =C2=A0=20
> > > > =C2=A0 /*
> > > > @@ -414,7 +415,7 @@ void riscv_setup_rom_reset_vec(MachineState
> > > > *machine, RISCVHartArrayState *harts
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset_vec[4]=
 =3D 0x0182b283;=C2=A0=C2=A0 /*=C2=A0=C2=A0=C2=A0=C2=A0 ld=C2=A0=C2=A0=C2=
=A0=C2=A0 t0, 24(t0)
> > > > */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0 if (!harts->harts[0].cfg.ext_icsr) {
> > > > +=C2=A0=C2=A0=C2=A0 if (!riscv_array_get_hart(harts, 0)->cfg.ext_ic=
sr) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The =
Zicsr extension has been disabled, so let's
> > > > ensure
> > > > we don't
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * run =
the CSR instruction. Let's fill the address
> > > > with a
> > > > non
> > > > diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> > > > index 613ea2aaa0..74fc10ef48 100644
> > > > --- a/hw/riscv/riscv_hart.c
> > > > +++ b/hw/riscv/riscv_hart.c
> > > > @@ -43,24 +43,28 @@ static void riscv_harts_cpu_reset(void
> > > > *opaque)
> > > > =C2=A0 }
> > > > =C2=A0=20
> > > > =C2=A0 static bool riscv_hart_realize(RISCVHartArrayState *s, int
> > > > idx,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *cpu_type, Error **errp)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *cpu_type, size_t size,
> > > > Error
> > > > **errp)
> > > > =C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 object_initialize_child(OBJECT(s), "harts[*]", =
&s-
> > > > >harts[idx],
> > > > cpu_type);
> > > > -=C2=A0=C2=A0=C2=A0 qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "r=
esetvec",
> > > > s->resetvec);
> > > > -=C2=A0=C2=A0=C2=A0 s->harts[idx].env.mhartid =3D s->hartid_base + =
idx;
> > > > -=C2=A0=C2=A0=C2=A0 qemu_register_reset(riscv_harts_cpu_reset, &s-
> > > > >harts[idx]);
> > > > -=C2=A0=C2=A0=C2=A0 return qdev_realize(DEVICE(&s->harts[idx]), NUL=
L, errp);
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D riscv_array_get_hart(s, idx)=
;
> > > > +=C2=A0=C2=A0=C2=A0 object_initialize_child_internal(OBJECT(s), "ha=
rts[*]",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart,=
 size, cpu_type);
> > > > +=C2=A0=C2=A0=C2=A0 qdev_prop_set_uint64(DEVICE(hart), "resetvec", =
s-
> > > > >resetvec);
> > > > +=C2=A0=C2=A0=C2=A0 hart->env.mhartid =3D s->hartid_base + idx;
> > > > +=C2=A0=C2=A0=C2=A0 qemu_register_reset(riscv_harts_cpu_reset, hart=
);
> > > > +=C2=A0=C2=A0=C2=A0 return qdev_realize(DEVICE(hart), NULL, errp);
> > > > =C2=A0 }
> > > > =C2=A0=20
> > > > =C2=A0 static void riscv_harts_realize(DeviceState *dev, Error
> > > > **errp)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVHartArrayState *s =3D RISCV_HAR=
T_ARRAY(dev);
> > > > +=C2=A0=C2=A0=C2=A0 size_t size =3D object_type_get_instance_size(s=
->cpu_type);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int n;
> > > > =C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0 s->harts =3D g_new0(RISCVCPU, s->num_harts);
> > > > +=C2=A0=C2=A0=C2=A0 s->harts =3D g_new0(RISCVCPU *, s->num_harts);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (n =3D 0; n < s->num_harts; n++)=
 {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!riscv_hart_realize=
(s, n, s->cpu_type, errp)) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->harts[n] =3D RISCV_C=
PU(object_new(s->cpu_type));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!riscv_hart_realize=
(s, n, s->cpu_type, size,
> > > > errp)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return;
> >=20
> > Not an issue with this patch but riscv_hart_realize() can use some
> > review. I
> > I think that we're doing stuff in the wrong place. Perhaps I'll
> > look
> > into it.

Shoudn't allocation and mhartid assignment happen earlier in
instance_init() ?

> >=20
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > > > index 35a335b8d0..b8a54db81b 100644
> > > > --- a/hw/riscv/sifive_u.c
> > > > +++ b/hw/riscv/sifive_u.c
> > > > @@ -104,6 +104,7 @@ static void create_fdt(SiFiveUState *s,
> > > > const
> > > > MemMapEntry *memmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *nodename;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t plic_phandle, prci_phandle,=
 gpio_phandle,
> > > > phandle =3D
> > > > 1;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t hfclk_phandle, rtcclk_phand=
le, phy_phandle;
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const char * const ethclk_nam=
es[2] =3D { "pclk",
> > > > "hclk"
> > > > };
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const char * const clint_comp=
at[2] =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sifive,clin=
t0", "riscv,clint0"
> > > > @@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s,
> > > > const
> > > > MemMapEntry *memmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 } else {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, nodename,
> > > > "mmu-type", "riscv,sv48");
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 isa =3D riscv_isa_string(&s->soc.u_cpus.harts[cpu -
> > > > 1]);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hart =3D riscv_array_get_hart(&s->soc.u_cpus, cpu -
> > > > 1);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 isa =3D riscv_isa_string(hart);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 isa =3D riscv_isa_string(&s->soc.e_cpus.harts[0]);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hart =3D riscv_array_get_hart(&s->soc.e_cpus, 0);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 isa =3D riscv_isa_string(hart);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_set=
prop_string(fdt, nodename, "riscv,isa",
> > > > isa);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_set=
prop_string(fdt, nodename, "compatible",
> > > > "riscv");
> > > > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > > > index 81f7e53aed..85b7568dad 100644
> > > > --- a/hw/riscv/spike.c
> > > > +++ b/hw/riscv/spike.c
> > > > @@ -61,6 +61,7 @@ static void create_fdt(SpikeState *s, const
> > > > MemMapEntry *memmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t cpu_phandle, intc_phandle, =
phandle =3D 1;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *name, *mem_name, *clint_name, =
*clust_name;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *core_name, *cpu_name, *intc_na=
me;
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const char * const clint_comp=
at[2] =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sifive,clin=
t0", "riscv,clint0"
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > @@ -103,6 +104,7 @@ static void create_fdt(SpikeState *s, const
> > > > MemMapEntry *memmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clint_cells =
=3D=C2=A0 g_new0(uint32_t, s-
> > > > >soc[socket].num_harts
> > > > * 4);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (cpu =3D=
 s->soc[socket].num_harts - 1; cpu >=3D 0;
> > > > cpu--)
> > > > {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hart =3D riscv_array_get_hart(&s->soc[socket], cpu);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cpu_phandle =3D phandle++;
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> > > > @@ -113,7 +115,7 @@ static void create_fdt(SpikeState *s, const
> > > > MemMapEntry *memmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 } else {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, cpu_name,
> > > > "mmu-type", "riscv,sv48");
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 name =3D riscv_isa_string(&s-
> > > > >soc[socket].harts[cpu]);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 name =3D riscv_isa_string(hart);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, cpu_name,
> > > > "riscv,isa",
> > > > name);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_free(name);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, cpu_name,
> > > > "compatible",
> > > > "riscv");
> > > > diff --git a/hw/riscv/virt-acpi-build.c
> > > > b/hw/riscv/virt-acpi-build.c
> > > > index 7331248f59..7cff4e4baf 100644
> > > > --- a/hw/riscv/virt-acpi-build.c
> > > > +++ b/hw/riscv/virt-acpi-build.c
> > > > @@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa_offset =3D table_data->len - tab=
le.table_offset;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data=
, 0, 2);=C2=A0=C2=A0 /* Type 0
> > > > */
> > > > =C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0 cpu =3D &s->soc[0].harts[0];
> > > > +=C2=A0=C2=A0=C2=A0 cpu =3D riscv_array_get_hart(&s->soc[0], 0);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa =3D riscv_isa_string(cpu);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len =3D 8 + strlen(isa) + 1;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aligned_len =3D (len % 2) ? (len + 1=
) : len;
> > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > index d90286dc46..59b42cc5e4 100644
> > > > --- a/hw/riscv/virt.c
> > > > +++ b/hw/riscv/virt.c
> > > > @@ -236,7 +236,7 @@ static void
> > > > create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t satp_mode_max;
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (cpu =3D s->soc[socket].num_hart=
s - 1; cpu >=3D 0; cpu--)
> > > > {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu_ptr =3D &=
s->soc[socket].harts[cpu];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu_ptr =3D r=
iscv_array_get_hart(&s-
> > > > >soc[socket],
> > > > cpu);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_phandle =
=3D (*phandle)++;
> > > > =C2=A0=20
> > > > @@ -730,12 +730,12 @@ static void create_fdt_pmu(RISCVVirtState
> > > > *s)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *pmu_name;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(s);
> > > > -=C2=A0=C2=A0=C2=A0 RISCVCPU hart =3D s->soc[0].harts[0];
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D riscv_array_get_hart(&s->soc=
[0], 0);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu_name =3D g_strdup_printf("/soc/p=
mu");
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_add_subnode(ms->fdt, pmu_na=
me);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(ms->fdt, pmu=
_name, "compatible",
> > > > "riscv,pmu");
> > > > -=C2=A0=C2=A0=C2=A0 riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.p=
mu_num,
> > > > pmu_name);
> > > > +=C2=A0=C2=A0=C2=A0 riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.=
pmu_num,
> > > > pmu_name);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free(pmu_name);
> > > > =C2=A0 }
> > > > diff --git a/include/hw/riscv/riscv_hart.h
> > > > b/include/hw/riscv/riscv_hart.h
> > > > index bbc21cdc9a..a5393c361b 100644
> > > > --- a/include/hw/riscv/riscv_hart.h
> > > > +++ b/include/hw/riscv/riscv_hart.h
> > > > @@ -38,7 +38,23 @@ struct RISCVHartArrayState {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t hartid_base;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *cpu_type;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t resetvec;
> > > > -=C2=A0=C2=A0=C2=A0 RISCVCPU *harts;
> > > > +=C2=A0=C2=A0=C2=A0 RISCVCPU **harts;
> > > > =C2=A0 };
> > > > =C2=A0=20
> > > > +/**
> > > > + * riscv_array_get_hart:
> > > > + */
> > > > +static inline RISCVCPU
> > > > *riscv_array_get_hart(RISCVHartArrayState
> > > > *harts, int i)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return harts->harts[i];
> > > > +}
> >=20
> > I don't see too much gain in this API because you'll still need a


Indeed the API itself looks the same annoying, but the goal was
allowing instance overload, the most horrifying part is adding props to
cpu currently.

> > RISCVHartArrayState
> > instance anyways, which is the most annoying part. E.g:

Do you think getting rid of RISCVHartArrayState might be a good idea ?

Currently only microchip_pfsoc and sifive_u use a pair of
RISCVHartArrayState for separate cpu_types.

> >=20
> > > > -=C2=A0=C2=A0=C2=A0 cpu =3D &s->soc[0].harts[0];
> > > > +=C2=A0=C2=A0=C2=A0 cpu =3D riscv_array_get_hart(&s->soc[0], 0);
> >=20
> >=20
> >=20
> > > > +
> > > > +/**
> > > > + * riscv_array_get_num_harts:
> > > > + */
> > > > +static inline unsigned
> > > > riscv_array_get_num_harts(RISCVHartArrayState *harts)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return harts->num_harts;
> > > > +}
> >=20
> > Same with this API, which you didn't end up using in this patch.
> > Thanks,
> >=20
> >=20
> > Daniel
> >=20
> > > > +
> > > > =C2=A0 #endif



