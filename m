Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotvs-0002ur-2g
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gotvm-0002tV-HG
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gotvl-0004uw-Ot
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:45:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gotvh-0004mL-TI; Wed, 30 Jan 2019 12:45:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E1C2C068BFB;
	Wed, 30 Jan 2019 17:45:35 +0000 (UTC)
Received: from [10.3.117.44] (ovpn-117-44.phx2.redhat.com [10.3.117.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0D0452C;
	Wed, 30 Jan 2019 17:45:34 +0000 (UTC)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20190130173601.3268-1-palmer@sifive.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <b9b988df-140e-108d-a80d-48c7ce1b351d@redhat.com>
Date: Wed, 30 Jan 2019 11:45:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="aPtElfIDd6OXO6w5kTpLfUJXmgNWVnjHu"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 30 Jan 2019 17:45:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 17:45:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aPtElfIDd6OXO6w5kTpLfUJXmgNWVnjHu
Content-Type: multipart/mixed; boundary="hKx5D6S2TIl2VC1ugEfwVxbe9yTJS2ZhH";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <b9b988df-140e-108d-a80d-48c7ce1b351d@redhat.com>
Subject: Re: [Qemu-devel] [PR RFC] RISC-V Patches for 3.2, Part 3
References: <20190130173601.3268-1-palmer@sifive.com>
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>

--hKx5D6S2TIl2VC1ugEfwVxbe9yTJS2ZhH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
> The following changes since commit 5385a5988c8a55bebdc878c05b96648579b5=
d6e0:
>=20
>   hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config s=
truct (2019-01-21 17:20:36 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-pa=
rt3
>=20
> for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c=
:
>=20
>   target/riscv: fix counter-enable checks in ctr() (2019-01-29 11:33:38=
 -0800)
>=20
> ----------------------------------------------------------------
> RISC-V Patches for 3.2, Part 3

There is no 3.2 release; the next release is named 4.0.  However, if you
don't want to bother with sending a v2 pull request just to fix the
merge commit message, that's okay with me.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--hKx5D6S2TIl2VC1ugEfwVxbe9yTJS2ZhH--

--aPtElfIDd6OXO6w5kTpLfUJXmgNWVnjHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxR4r0ACgkQp6FrSiUn
Q2oFqQf5ASzoPgmptcojZxRZYwJlLlKK1oM6IcGlzM6y8OBA8hiQilF6RqiIgeRw
uYVQsm5ltuFGkZjQ0i5yuCvZDBxgNVK9UJ62rGaPih1VuVCujhnS6V6y9oZEO1kC
0AC0waekcaKjHiSP+/3fD5wfti8G8kz5KtXKcS/uahMKkYjAyx713z3I9DlbcWhi
o6MSQJdC5m6zgY0JbqdZz3poXvr/0fw4vd0icJThnkOka7py7nkQh8c8b9ehQhzd
klKQ3iA+qh3sd7WQYALsv26cZqHEwNQx0lBi2CtTZ/innRcJ+os9dDRFJJlwp2Op
un2ntMGvxDexJA+NW5rQ4CWj1k2Wdw==
=fwCm
-----END PGP SIGNATURE-----

--aPtElfIDd6OXO6w5kTpLfUJXmgNWVnjHu--

