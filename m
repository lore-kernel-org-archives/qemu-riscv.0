Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knFKy-0008QX-Jh
	for mharc-qemu-riscv@gnu.org; Thu, 10 Dec 2020 01:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1knFKx-0008PF-06; Thu, 10 Dec 2020 01:21:59 -0500
Received: from home.keithp.com ([63.227.221.253]:48422 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1knFKr-0005zT-95; Thu, 10 Dec 2020 01:21:58 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 7E6673F2E34F;
 Wed,  9 Dec 2020 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607581309; bh=WiZcTrRc8mRZ2nFBgQVmDVQ67kro6pXUo7LIKeVniBI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bPOHgD+1pWkrER7VuUQkFhcx57PGa9uBAFSiPSLd6E6HAjw4VgtU6kkWa7olW0rG3
 Ql0hmms5FtqPDx9UuSqXe1rj41TO/X2ib0JbjmAa7BQdxH0taBckrRp8D/g9kqXzda
 Br3BqbqaERkcjHLgwpLgAT5l7QuClMLVBkl50HEU839peRF+Spfq3GeNJ6xc3etXSO
 DY//iJOayO+az9f71iMLofjeHsd0yWktGfRATTcJE2HRnak6VgRmSNYEAe+9n9YBan
 FahhLjbrxPIkZWZLeRGj0OyDMbhXY1Ofy/ng3hPY9TYe/yXNG4t7tGh18XwxIQhYEC
 dykmxC46hjEfg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PIPf-FKm5K6w; Wed,  9 Dec 2020 22:21:49 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 1F7AE3F2D58D;
 Wed,  9 Dec 2020 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607581309; bh=WiZcTrRc8mRZ2nFBgQVmDVQ67kro6pXUo7LIKeVniBI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bPOHgD+1pWkrER7VuUQkFhcx57PGa9uBAFSiPSLd6E6HAjw4VgtU6kkWa7olW0rG3
 Ql0hmms5FtqPDx9UuSqXe1rj41TO/X2ib0JbjmAa7BQdxH0taBckrRp8D/g9kqXzda
 Br3BqbqaERkcjHLgwpLgAT5l7QuClMLVBkl50HEU839peRF+Spfq3GeNJ6xc3etXSO
 DY//iJOayO+az9f71iMLofjeHsd0yWktGfRATTcJE2HRnak6VgRmSNYEAe+9n9YBan
 FahhLjbrxPIkZWZLeRGj0OyDMbhXY1Ofy/ng3hPY9TYe/yXNG4t7tGh18XwxIQhYEC
 dykmxC46hjEfg==
Received: by keithp.com (Postfix, from userid 1000)
 id D92BD15820DB; Wed,  9 Dec 2020 22:21:48 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Kito Cheng <kito.cheng@gmail.com>
Cc: qemu-devel@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Alistair
 Francis <Alistair.Francis@wdc.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
In-Reply-To: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
 <87r1nz6iz4.fsf@keithp.com>
 <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Date: Wed, 09 Dec 2020 22:21:47 -0800
Message-ID: <871rfy6v0k.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 10 Dec 2020 06:21:59 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for your reply, but it seems like we need some more modification in
>  linux-user/riscv/cpu_loop.c to enable that, I guess I should post that i=
n mail
> rather than attachment :)

Ah, I completely missed the attachment! So sorry. That applies cleanly
on top of the rest of my series, so I think we can just leave it like
that unless someone wants it presented differently. Not sure why I
thought this was working before; I clearly missed the most important
bit.

Reviewed-by: Keith Packard <keithp@keithp.com>

I've got a github repo with these bits in case anyone wants to look at
the whole tree:

        https://github.com/keith-packard/qemu/tree/semihosting

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/RvnwACgkQ2yIaaQAA
ABE0Dg//R+H0GxY+Y4VCpnq8akZdTtLwCs06v9ziZQ+xmVO1qXZxNpWXNwPTLUQ9
/T3J0t3LATimH2kn+3j3Q5vqm3gwTYZQuTQPGd+62KwfDHE6ua4DcvXRT5deClfU
66ZdgsJkObDbX+peoE0NxDlyaWh1DZE8gWPojWXjcpoyfV+j/QRm16h7Bx5rwJdv
Fp/JaQ8H8TRdKtynnCMF5IWLRFGxnhOhZOhPC5z6PW2NcZVCKb4PASwW7wxF6xrC
8BA26oLrS9pOJvrgGsEz19i2J3C3lamdJ243Yu5wkndyVnxvQtPc2gA2NV8PZrry
JwwsX6oSo3/1lCXnlCiWnfxVorKbSdJx37Hz9rAsZYGgu/uLRFMrDpcx4jeBN0w2
oQhuxfdm8H5JoP7VEuPl6EG/fAk9hR8xMTpCkiixoWMk+8OV3hzzMScS8PbBVLKg
p5Nw5cwtwMs4BwSHPZ+A9Byd2om3tI+DZxwAik2mf/Pkw1hBm+uJb7ywKekL0QKD
8yEXckjRVmOLuzIQZ/fpwqwv56xJuh3/me3sTgH9njH36jULTs23cvbViJ2zI79E
P87GE4HCCSlM4KLj3tOIBZLySBbYAf4TqLSzUwTQIgPLoe7VuEMAPM2phm38QjIv
UPOdBLAKC9ZXsnt6+QJlQwAgSsesu66ngm2IcYaG4bV0z77/H54=
=a27Q
-----END PGP SIGNATURE-----
--=-=-=--

