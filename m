Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42A8CD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 07:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi8ah-00070B-Bp; Mon, 18 Sep 2023 03:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qi8af-0006zn-HQ; Mon, 18 Sep 2023 03:22:41 -0400
Received: from forward500a.mail.yandex.net ([178.154.239.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qi8ab-00015i-GJ; Mon, 18 Sep 2023 03:22:41 -0400
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c18:1182:0:640:88e4:0])
 by forward500a.mail.yandex.net (Yandex) with ESMTP id 568E95E822;
 Mon, 18 Sep 2023 10:22:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id QMeN6IBDTKo0-s83QSgyM; 
 Mon, 18 Sep 2023 10:22:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1695021748; bh=SLNNuXl6Kpp232dj1r/WskzeUPLPQp4ohGEkn8q+/Qs=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=f5kaShdn1RVN2qMqJpuK9zvPx8PfVyrDfxowOp0SY1zEQxBmj7NykyQImZjIK2VDk
 iVOzqjBbyd4JRje34ncaUJbLtR06plFjjgdNBcA9zUzczbButOa4dxT03LMZl0bn14
 uA0UjBpBP6zgTNVMhpaOVYmlzbYv11bAK4MhWkg0=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Message-ID: <d2319770cefec2662d70bc2517bdb95793b04a18.camel@maquefel.me>
Subject: Re: [RFC PATCH v2 1/2] hw/riscv: hart: replace array access with
 qemu_get_cpu()
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Nikita Shubin <n.shubin@yadro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 18 Sep 2023 13:22:27 +0300
In-Reply-To: <CAKmqyKN9vBu0aGtov1qy6RvavZ57-c4J+dSwZxZwsiwyQ3gyTQ@mail.gmail.com>
References: <20230914080740.7561-1-nikita.shubin@maquefel.me>
 <20230914080740.7561-2-nikita.shubin@maquefel.me>
 <CAKmqyKN9vBu0aGtov1qy6RvavZ57-c4J+dSwZxZwsiwyQ3gyTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=178.154.239.80;
 envelope-from=nikita.shubin@maquefel.me; helo=forward500a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hello Alistair!

On Mon, 2023-09-18 at 11:50 +1000, Alistair Francis wrote:
> On Thu, Sep 14, 2023 at 6:09=E2=80=AFPM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >=20
> > From: Nikita Shubin <n.shubin@yadro.com>
> >=20
> > Replace all RISCVHartArrayState->harts[idx] with
> > qemu_get_cpu()/cpu_by_arch_id().
>=20
> Thanks for the patch
>=20
> Why do we want this change though?

The main reason for these patches is that CPU Instance overloading
would be nice.

Currently it is not possible to overload instance of RISCVCPU,=20
i.e. something like this:

static const TypeInfo riscv_cpu_type_infos[] =3D {
     {
        .name =3D TYPE_ANOTHER_RISCV_CPU,
        .parent =3D TYPE_RISCV_CPU,
        .instance_size =3D sizeof(MyCPUState),
        .instance_init =3D riscv_my_cpu_init,
    }
};

i.e. .instance_size !=3D sizeof(RISCVCPU).

Because we have RISCVHartArrayState.harts with exactly=20
the size of RISCVCPU.

So either we should avoid using RISCVHartArrayState (which is not
desirable as we can't switch "cpu_type" for existing machines) in such
case or make RISCVHartArrayState accept arbitrary "cpu_type" size.

The previous attempt looks very ugly, indeed:

```
static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState harts,
int i)
{
	return harts->harts[i];
}
```

https://patchwork.kernel.org/project/qemu-devel/patch/20230727080545.7908-1=
-nikita.shubin@maquefel.me/

So qemu_get_cpu()/cpu_by_arch_id() looks much more cleaner and
universal.

>=20
> >=20
> > cpu_index is guaranteed to be continuus by cpu_get_free_index(), so
> > they
> > can be accessed in same order they were added.
> >=20
> > "Hart IDs might not necessarily be numbered contiguously in a
> > multiprocessor system, but at least one hart must have
> > a hart ID of zero."
> >=20
> > This states that hart ID zero should always be present, this makes
> > using
> > cpu_by_arch_id(0) safe.
> >=20
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> > ---
> > =C2=A0hw/riscv/boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++--
> > =C2=A0hw/riscv/sifive_u.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++++--
> > =C2=A0hw/riscv/spike.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 17 ++++++++++-------
> > =C2=A0hw/riscv/virt-acpi-build.c |=C2=A0 2 +-
> > =C2=A0hw/riscv/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 17 +++++++++--------
> > =C2=A05 files changed, 29 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 52bf8e67de..041f966e58 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -36,7 +36,8 @@
> >=20
> > =C2=A0bool riscv_is_32bit(RISCVHartArrayState *harts)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 return harts->harts[0].env.misa_mxl_max =3D=3D MXL_=
RV32;
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D RISCV_CPU(cpu_by_arch_id(0));
> > +=C2=A0=C2=A0=C2=A0 return hart->env.misa_mxl_max =3D=3D MXL_RV32;
> > =C2=A0}
> >=20
> > =C2=A0/*
> > @@ -385,6 +386,7 @@ void riscv_setup_rom_reset_vec(MachineState
> > *machine, RISCVHartArrayState *harts
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t fdt_load_addr)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 int i;
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D RISCV_CPU(cpu_by_arch_id(0));
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t start_addr_hi32 =3D 0x00000000;
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t fdt_load_addr_hi32 =3D 0x00000000;
> >=20
> > @@ -414,7 +416,7 @@ void riscv_setup_rom_reset_vec(MachineState
> > *machine, RISCVHartArrayState *harts
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset_vec[4] =3D 0x018=
2b283;=C2=A0=C2=A0 /*=C2=A0=C2=A0=C2=A0=C2=A0 ld=C2=A0=C2=A0=C2=A0=C2=A0 t0=
, 24(t0) */
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > -=C2=A0=C2=A0=C2=A0 if (!harts->harts[0].cfg.ext_icsr) {
> > +=C2=A0=C2=A0=C2=A0 if (!hart->cfg.ext_icsr) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The Zicsr exte=
nsion has been disabled, so let's ensure
> > we don't
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * run the CSR in=
struction. Let's fill the address with a
> > non
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index ec76dce6c9..3d09d0ee0e 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -168,6 +168,7 @@ static void create_fdt(SiFiveUState *s, const
> > MemMapEntry *memmap,
> > =C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_cell(fdt, "/cpus", "#address-=
cells", 0x1);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu=
--) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *hart;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int cpu_phandle =3D ph=
andle++;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nodename =3D g_strdup_=
printf("/cpus/cpu@%d", cpu);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *intc =3D g_strdu=
p_printf("/cpus/cpu@%d/interrupt-
> > controller", cpu);
> > @@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s, const
> > MemMapEntry *memmap,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 } else {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, nodename, "mmu-typ=
e",
> > "riscv,sv48");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa=
 =3D riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 har=
t =3D RISCV_CPU(qemu_get_cpu(cpu - 1));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa=
 =3D riscv_isa_string(hart);
>=20
> This doesn't look right. The existing code accesses the
> u_cpus/e_cpus.
> The new code doesn't do that. You need to change this offset based on
> the number of e/u cpus (depending on order).
>=20
> Alistair
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa=
 =3D riscv_isa_string(&s->soc.e_cpus.harts[0]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 har=
t =3D RISCV_CPU(qemu_get_cpu(0));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isa=
 =3D riscv_isa_string(hart);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_strin=
g(fdt, nodename, "riscv,isa", isa);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_strin=
g(fdt, nodename, "compatible",
> > "riscv");
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index 81f7e53aed..f3ec6427a1 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -97,29 +97,32 @@ static void create_fdt(SpikeState *s, const
> > MemMapEntry *memmap,
> > =C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 for (socket =3D (riscv_socket_count(ms) - 1); =
socket >=3D 0;
> > socket--) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t num_harts =3D s->s=
oc[socket].num_harts;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t hartid_base =3D s-=
>soc[socket].hartid_base;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clust_name =3D g_strdu=
p_printf("/cpus/cpu-map/cluster%d",
> > socket);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_add_subnode(f=
dt, clust_name);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clint_cells =3D=C2=A0 g_new=
0(uint32_t, s->soc[socket].num_harts *
> > 4);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clint_cells =3D=C2=A0 g_new=
0(uint32_t, num_harts * 4);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (cpu =3D s->soc[socket]=
.num_harts - 1; cpu >=3D 0; cpu--)
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (cpu =3D num_harts - 1;=
 cpu >=3D 0; cpu--) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
 cpu_index =3D hartid_base + cpu;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIS=
CVCPU *hart =3D RISCV_CPU(qemu_get_cpu(cpu_index));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpu_phandle =3D phandle++;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_name =3D g_strdup_printf("/cpus/cpu@%d",
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 s->soc[socket].hartid_base + cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_name =3D g_strdup_printf("/cpus/cpu@%d", cpu_index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_add_subnode(fdt, cpu_name);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (is_32_bit) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-typ=
e",
> > "riscv,sv32");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 } else {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-typ=
e",
> > "riscv,sv48");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nam=
e =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nam=
e =3D riscv_isa_string(hart);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa",
> > name);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 g_free(name);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_setprop_string(fdt, cpu_name, "compatible",
> > "riscv");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_setprop_string(fdt, cpu_name, "status",
> > "okay");
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qem=
u_fdt_setprop_cell(fdt, cpu_name, "reg",
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 s->soc[socket].hartid_base + cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qem=
u_fdt_setprop_cell(fdt, cpu_name, "reg",
> > cpu_index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_setprop_string(fdt, cpu_name, "device_type",
> > "cpu");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 riscv_socket_fdt_write_id(ms, cpu_name, socket);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_fdt_setprop_cell(fdt, cpu_name, "phandle",
> > cpu_phandle);
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-
> > build.c
> > index 7331248f59..d885220cc9 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
> > =C2=A0=C2=A0=C2=A0=C2=A0 isa_offset =3D table_data->len - table.table_o=
ffset;
> > =C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data, 0, 2);=
=C2=A0=C2=A0 /* Type 0 */
> >=20
> > -=C2=A0=C2=A0=C2=A0 cpu =3D &s->soc[0].harts[0];
> > +=C2=A0=C2=A0=C2=A0 cpu =3D RISCV_CPU(cpu_by_arch_id(0));
> > =C2=A0=C2=A0=C2=A0=C2=A0 isa =3D riscv_isa_string(cpu);
> > =C2=A0=C2=A0=C2=A0=C2=A0 len =3D 8 + strlen(isa) + 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0 aligned_len =3D (len % 2) ? (len + 1) : len;
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 5edc1d98d2..f3132ecc1b 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -239,16 +239,18 @@ static void
> > create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t cpu_phandle;
> > =C2=A0=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(s);
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *name, *cpu_name, *core_name, *intc_name,=
 *sv_name;
> > +=C2=A0=C2=A0=C2=A0 uint32_t num_harts =3D s->soc[socket].num_harts;
> > +=C2=A0=C2=A0=C2=A0 uint32_t hartid_base =3D s->soc[socket].hartid_base=
;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t satp_mode_max;
> >=20
> > -=C2=A0=C2=A0=C2=A0 for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D=
 0; cpu--) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu_ptr =3D &s->s=
oc[socket].harts[cpu];
> > +=C2=A0=C2=A0=C2=A0 for (cpu =3D num_harts - 1; cpu >=3D 0; cpu--) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int cpu_index =3D hartid_ba=
se + cpu;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu_ptr =3D RISCV=
_CPU(qemu_get_cpu(cpu_index));
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_phandle =3D (*phan=
dle)++;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_name =3D g_strdup_print=
f("/cpus/cpu@%d",
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->=
soc[socket].hartid_base + cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_name =3D g_strdup_print=
f("/cpus/cpu@%d", cpu_index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_add_subnode(m=
s->fdt, cpu_name);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_ptr->cfg.satp_=
mode.supported !=3D 0) {
> > @@ -275,8 +277,7 @@ static void
> > create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_strin=
g(ms->fdt, cpu_name, "compatible",
> > "riscv");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_strin=
g(ms->fdt, cpu_name, "status",
> > "okay");
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_cell(ms->f=
dt, cpu_name, "reg",
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->=
soc[socket].hartid_base + cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_cell(ms->f=
dt, cpu_name, "reg",
> > cpu_index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_strin=
g(ms->fdt, cpu_name, "device_type",
> > "cpu");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_socket_fdt_write=
_id(ms, cpu_name, socket);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_cell(=
ms->fdt, cpu_name, "phandle",
> > cpu_phandle);
> > @@ -717,12 +718,12 @@ static void create_fdt_pmu(RISCVVirtState *s)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *pmu_name;
> > =C2=A0=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(s);
> > -=C2=A0=C2=A0=C2=A0 RISCVCPU hart =3D s->soc[0].harts[0];
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *hart =3D RISCV_CPU(qemu_get_cpu(0));
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 pmu_name =3D g_strdup_printf("/pmu");
> > =C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_add_subnode(ms->fdt, pmu_name);
> > =C2=A0=C2=A0=C2=A0=C2=A0 qemu_fdt_setprop_string(ms->fdt, pmu_name, "co=
mpatible",
> > "riscv,pmu");
> > -=C2=A0=C2=A0=C2=A0 riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_n=
um,
> > pmu_name);
> > +=C2=A0=C2=A0=C2=A0 riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.pmu_=
num,
> > pmu_name);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 g_free(pmu_name);
> > =C2=A0}
> > --
> > 2.39.2
> >=20
> >=20


