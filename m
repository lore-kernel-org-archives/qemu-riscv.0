Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iTuUJ-0007Mf-Bx
	for mharc-qemu-riscv@gnu.org; Sun, 10 Nov 2019 16:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iTuUC-0007Fp-1I
 for qemu-riscv@nongnu.org; Sun, 10 Nov 2019 16:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iTuUA-0004m2-MB
 for qemu-riscv@nongnu.org; Sun, 10 Nov 2019 16:11:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35799 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iTuU6-0004VK-J2; Sun, 10 Nov 2019 16:10:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47B69h2wSwz9sPn; Mon, 11 Nov 2019 08:10:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1573420248;
 bh=27jGD5TWiQBF/fV8akQUfTkbtCwRFj5H7+m3ZwUM12I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6iGp5/8N3/qasUlgALVNnOr6owFfjG7iNRu9FcSxOPRFCesbPUijha2rRdiGE3zS
 moZPPpKE4AS+/GkS7W47AhzZKpmcLcaeYm3mXQNGBjL4q7dmb6zipbUv2+TpnzIWx+
 A2p8HrnyXJ+TGQKFW11JkcIElWRzBClb/4iAEeMM=
Date: Sun, 10 Nov 2019 21:09:36 +0000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] RISC-V: virt: This is a "sifive,test1" test finisher
Message-ID: <20191110210936.GT2461@umbus.Home>
References: <20191107222500.8018-1-palmer@sifive.com>
 <CAKmqyKOodh3tPUGBM92ZRWFLoeo9E=kcaqO9F9dHz1wBMP9ywA@mail.gmail.com>
 <CAFEAcA8k+t2qKCSvMjENitvCXyc-qwiG2qbg6gQFKR_+v_zihg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZXzThk3vFZecBD04"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8k+t2qKCSvMjENitvCXyc-qwiG2qbg6gQFKR_+v_zihg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
X-List-Received-Date: Sun, 10 Nov 2019 21:11:05 -0000


--ZXzThk3vFZecBD04
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 06:04:47PM +0000, Peter Maydell wrote:
> On Fri, 8 Nov 2019 at 17:15, Alistair Francis <alistair23@gmail.com> wrot=
e:
> >
> > On Fri, Nov 8, 2019 at 9:05 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> > >
> > > The test finisher implements the reset command, which means it's a
> > > "sifive,test1" device.  This is a backwards compatible change, so it's
> > > also a "sifive,test0" device.  I copied the odd idiom for adding a
> > > two-string compatible field from the ARM virt board.
> > >
> > > Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> > > ---
> > >  hw/riscv/virt.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > index 23f340df19..74f2dce81c 100644
> > > --- a/hw/riscv/virt.c
> > > +++ b/hw/riscv/virt.c
> > > @@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const =
struct MemmapEntry *memmap,
> > >      nodename =3D g_strdup_printf("/test@%lx",
> > >          (long)memmap[VIRT_TEST].base);
> > >      qemu_fdt_add_subnode(fdt, nodename);
> > > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,tes=
t0");
> > > +    {
> > > +        const char compat[] =3D "sifive,test1\0sifive,test0";
> >
> > Does this really work? Why not use qemu_fdt_setprop_cells()?
> >
> > Alistair
> >
> > > +        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof=
(compat));
> > > +    }
>=20
> qemu_fdt_setprop_cells() is for "set this property to
> contain this list of 32-bit integers" (and it does a byteswap
> of each 32-bit value from host to BE). That's not what
> you want for a string (or a string list, which is what
> we have here).

Yes.

> Cc'ing David Gibson who's our device tree expert to see if there's
> a nicer way to write this.

Not amongst the qemu wrappers AFAIK.  With raw libfdt you could build
it up in stages using fdt_setprop_string() followed by
fdt_appendprop_string(), although that would require additional
memmove()s to complete.

A stringlist setprop function using varargs might be a useful addition
to libfdt.  The tricky bit is that libfdt can be used in environments
with no allocator, which makes implementation tricky.

> Oddly, given that it's used in the
> ubiquitous 'compatible' prop, the dtc Documentation/manual.txt
> doesn't say anything about properties being able to be
> 'string lists', only 'strings', '32 bit numbers', 'lists of
> 32-bit numbers' and 'byte sequences'.

Oof, yeah that manual hasn't really been updated for ages.  That
really only describes the pieces from which a property can be mode.
You can then concatenate those together using ,.  So in .dts you can
make a string list as:
	compatible =3D "foo", "bar";

The , is effectively a bytestring append operator.

> You have to dig through
> the header file comments to deduce that a string list is
> represented by a string with embedded NULs separating
> each list item.

Well, you can do that as well, but using commas is more common in
modern dts files.  The two are equivalent by construction (in .dtb
properties are simply bytestrings).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZXzThk3vFZecBD04
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3IfI0ACgkQbDjKyiDZ
s5IcwQ//R3PuqO0pSG0oTfDVlyla+E8fYEgocz5dy9uRa9yWllj7gIKlNTpe73PE
wA6yXpStCvQdu4nGXEvUEG6wxEB8eYXTTFhkWMVlFsmeK3Un7IaWvOBFvXn667gF
gC8YQg/z2wEWVqrOUyUw+tZkXZhw7849MZ0TB9j8Gl96wq5XwkCMGq7ytFvru6bO
ymMheyyf4Ku6fsE6P3BWe+LTlognGAhfCaq5RJIChEmmuNKrIRSMdcAz40zpbmeJ
PGjpDEzS+SlmWNOPOPT+vFZtroZuQvGmnukcczj0i1vQ0Tt9nEBnwadgk9t9gb7o
EgRkO1rrN5OqTtVPeMx0Xmsi4K1BBhfJC7g5cCyfZpyZseWAthFqe4fm2+6zQaIn
luIB2JmIJ9jCpXG8/Tio/5vcL3Kc6VDlBlN3xSEAu2lrVH7HZsUmC1VmSgKp1EtT
fWUmsx73yTKEw+MgMWqnG+n+0QvQPZttsKnTZFlOwo7OjKov8BEsI7+mERPK6bJ5
Z0tI+5OqyYBzHhQMJLn/GQofcJLfYDxhCrrffgmAwlm4X902VUy9hGXIXxmQI140
q8xKTg8Xn7hpBSVDm0XOMbpZeY6drMpyEGSMlEOTeiTK1mrnbvZIoR7mwzbo9gkF
8A+K+2ogBxHXGE/OFZYvkwKl5AIYbqHw5Z7sqoAg3Xslz37tpVM=
=UNVY
-----END PGP SIGNATURE-----

--ZXzThk3vFZecBD04--

