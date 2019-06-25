Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfitk-00011N-Pg
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 06:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hfith-0000xI-Ki
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hfitg-00081Z-E2
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:41:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hfitd-0007dw-PE; Tue, 25 Jun 2019 06:41:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70958308621E;
 Tue, 25 Jun 2019 10:41:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-73.ams2.redhat.com [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBBAA5C234;
 Tue, 25 Jun 2019 10:41:25 +0000 (UTC)
Date: Tue, 25 Jun 2019 11:41:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190625104122.GC3139@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190624225446.22597-1-atish.patra@wdc.com>
 <CAKmqyKO28WO3QzQOOzJnFOA5J2Wjeg-MF5+BcoWWF+qO=+UTNA@mail.gmail.com>
 <09df5e02-e241-1046-5051-909c53fe19b7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09df5e02-e241-1046-5051-909c53fe19b7@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 10:41:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Add cpu-topology
 DT node.
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
X-List-Received-Date: Tue, 25 Jun 2019 10:41:59 -0000

On Tue, Jun 25, 2019 at 12:36:35PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> On 6/25/19 1:24 AM, Alistair Francis wrote:
> > On Mon, Jun 24, 2019 at 3:57 PM Atish Patra <atish.patra@wdc.com> wro=
te:
> >>
> >> Currently, there is no cpu topology defined in RISC-V.
> >> Define a device tree node that clearly describes the
> >> entire topology. This saves the trouble of scanning individual
> >> cache to figure out the topology.
> >>
> >> Here is the linux kernel patch series that enables topology
> >> for RISC-V.
> >>
> >> http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.ht=
ml
> >>
> >> CPU topology after applying this patch in QEMU & above series in ker=
nel
> >>
> >> / # cat /sys/devices/system/cpu/cpu2/topology/thread_siblings_list
> >> 2
> >> / # cat /sys/devices/system/cpu/cpu2/topology/physical_package_id
> >> 0
> >> / # cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
> >> 0-7
> >>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> ---
> >>  hw/riscv/virt.c | 21 +++++++++++++++++++--
> >>  1 file changed, 19 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >> index 84d94d0c42d8..da0b8aa18747 100644
> >> --- a/hw/riscv/virt.c
> >> +++ b/hw/riscv/virt.c
> >> @@ -203,9 +203,12 @@ static void *create_fdt(RISCVVirtState *s, cons=
t struct MemmapEntry *memmap,
> >>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> >>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> >>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu"=
);
> >> +        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle=
);
> >> +        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_p=
handle);
> >> +        int intc_phandle =3D phandle++;
> >=20
> > Don't declare variables in the middle of code. The variable must be
> > declared at the start of a block.
>=20
> I guess this has been relaxed since we allow GNU C99:

Even though we allow GNU C99 I think it is undesirable to declare variabl=
es
in the middle of methods. This is especially true when combined with "got=
o"
as you end up with undefined / uninitialized vairable contents at the jum=
p
target, if we've jumped over the variable declaration.

We can't enforce location of variable declarations, but I'd really
recommend we keep them all at the start of code blocks.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

