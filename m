Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyayl-0004ec-6h
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 08:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1hyayh-0004Zx-V9
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 08:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hyayg-0004fD-MM
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 08:05:07 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hyayV-0004XL-9N; Fri, 16 Aug 2019 08:04:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46927M0thdz9sML; Fri, 16 Aug 2019 22:04:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565957087;
 bh=1OQXK0o9OvoNPapWpbimPbhqPrE5Qa0PGQHKlRYcMkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wekzw6zxxq4IvC7+Zbnwqdia1xVqewDn7eX7Ht9Y83gQasjzBhjYu5PoAd/WiLpW0
 0PKntAaqTZcpID4Z8EVVQ0BYFf4MjOJ+3toNPAxMyQTRRcgQcAbv4eU/EBfCSgFmWB
 Crykn4dJVY56dnF3V1Dz6Ofl/uRZ25H6HxZL3I/0=
Date: Fri, 16 Aug 2019 21:43:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: tony.nguyen@bt.com, qemu-devel@nongnu.org, rth@twiddle.net,
 pbonzini@redhat.com, mst@redhat.com, imammedo@redhat.com,
 marcel.apfelbaum@gmail.com, xiaoguangrong.eric@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org,
 b.galvani@gmail.com, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 i.mitsyanko@gmail.com, robh@kernel.org, peter.chubb@nicta.com.au,
 sundeep.lkml@gmail.com, jan.kiszka@web.de, balrogg@gmail.com,
 eric.auger@redhat.com, kraxel@redhat.com, michael@walle.cc,
 kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 keith.busch@intel.com, marcandre.lureau@redhat.com,
 Andrew.Baumann@microsoft.com, edgar.iglesias@gmail.com,
 antonynpavlov@gmail.com, chouteau@adacore.com,
 frederic.konrad@adacore.com, huth@tuxfamily.org,
 mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 arikalo@wavecomp.com, balaton@eik.bme.hu, gxt@mprc.pku.edu.cn,
 deller@gmx.de, ehabkost@redhat.com, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul.durrant@citrix.com,
 aurelien@aurel32.net, amarkovic@wavecomp.com, magnus.damm@gmail.com,
 berto@igalia.com, minyard@acm.org, pburton@wavecomp.com,
 jslaby@suse.cz, jcd@tribudubois.net, andrew.smirnov@gmail.com,
 green@moxielogic.com, jasowang@redhat.com,
 dmitry.fleytman@gmail.com, sw@weilnetz.de, jiri@resnulli.us,
 crwulff@gmail.com, marex@denx.de, lersek@redhat.com,
 proljc@gmail.com, shorne@gmail.com, yuval.shaia@oracle.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, walling@linux.ibm.com,
 cohuck@redhat.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, fam@euphon.net, hare@suse.com,
 atar4qemu@gmail.com, stefanb@linux.ibm.com,
 alex.williamson@redhat.com, jcmvbkbc@gmail.com, laurent@vivier.eu,
 claudio.fontana@suse.com, stefanha@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Message-ID: <20190816114305.GB2259@umbus.fritz.box>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Fri, 16 Aug 2019 12:05:09 -0000


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 11:58:05AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Tony,
>=20
> On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> > This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
> >=20
> > v7:
> [...]
> > - Re-declared many native endian devices as little or big endian. This =
is why
> >   v7 has +16 patches.
>=20
> Why are you doing that? What is the rational?
>=20
> Anyhow if this not required by your series, you should split it out of
> it, and send it on your principal changes are merged.
> I'm worried because this these new patches involve many subsystems (thus
> maintainers) and reviewing them will now take a fair amount of time.
>=20
> > For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> > targets from the set of target/hw/*/device.o.
> >
> > If the set of targets are all little or all big endian, re-declare
> > the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> > respectively.
>=20
> If only little endian targets use a device, that doesn't mean the device
> is designed in little endian...
>=20
> Then if a big endian target plan to use this device, it will require
> more work and you might have introduced regressions...

Uh.. only if they make the version of the device on a big endian
target big endian.  Which is a terrible idea - if you know a hardware
designer planning to do this, please slap them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1WlskACgkQbDjKyiDZ
s5K9oQ//Uuo9cWWmd396i/MdQyddqKELOko009vf2k8wlEaysKrMpuKkkj7EV4Lz
x+MQYyqEBAZMLC5KoTeSRYHynyRTPSBOURxhQNkH4Nqj3Skxr9buvX4pqhNLhmLE
A8tSn3paa4N5GKXbgt4fOiNwBXxnrcAQgmruCbyvO7NKXPmZyTSQxJkR8VHE/qxK
LWKEgA/bjyloFI7OwpWW0rc0LdqmDljy4NKmfHsFxlZdc+TlcM2PgkYPBdRMf5SH
Nlj3YvXrsxa1gfrGLou/tlS9WHyKxl7K1DSbh42ObtrBKtc6z9aPY9+mi1moAJLi
/CpHM3SbdY4j1mGPk5/TZBul+m7spkoJfDB0A/mwb5pTLsZKO0fIOThUkjlCD32D
It90f2Y2I+omAnGOs8nX52SOoNfUwB6vtA4ThBEXzKSOOepPuL5dgSmJ8sGUn1GY
eckRx2z4Emap23L0WavytQ+oaQW8PrhfMFUBWS1DSh/uPVUs1m4Zcs2Q8siBRXZJ
J70alEhGvbhch2+S5q69iYIvljVoMcA1DjHc06WTwZOatjUdjJAQpMLidpH03+UC
AKeSvwpEA5yvuxCfLuThYD+6MeEGyVtH/IEKqSLE7IFVp2VBeqZ4tNKN41Fw/aQH
t3Q5LKmwmLKiyzHZSFM5JmNuyjmdwG56N4INLGlLEAPy9F40PR0=
=nw08
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

