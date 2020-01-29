Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwqTF-0001Ju-2b
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jan 2020 11:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <keithp@keithp.com>) id 1iwqTB-0001GK-76
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 11:45:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <keithp@keithp.com>) id 1iwqTA-0008KU-5J
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 11:45:37 -0500
Received: from home.keithp.com ([63.227.221.253]:50190 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <keithp@keithp.com>)
 id 1iwqT4-00083r-EP; Wed, 29 Jan 2020 11:45:31 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 45B923F2A8ED;
 Wed, 29 Jan 2020 08:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1580316328; bh=AQ7qwDOrgr4oCXbypzhvadC6PyJ4NatHch4UA6L6ykA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RD6TMZnTWaEtpPa8vpmhDA325+sxDObVt6pBKjRYrKmD2EudMif7/dvxGt/0SJXk3
 gvs/KnKnQy4fg9WUygIzpkweabR8QAjHxY0AgHsg0IjXhkdtcBBwouN4ca1SLIXSdf
 AoZ9yyezBd2SSFdSA3XGiRMaQatReORhRpKIafKg2Br0vn1GpIJp/JHlgcC/bejcZ0
 FKvmyTLy5eKcIDqoBcC6mXw0L9/DxyyhBN0wywXoQsE6OVehm6AEfwr+ynC7VqA/g3
 FMjTFYeMCUctqsN8lns4mV55IevXZjLHviQ11c8Gsxyko+cfiIxrFw2DAiadnDL/zM
 mx3GWeJnG90XQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Tmxo_cOdKbCG; Wed, 29 Jan 2020 08:45:28 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id DD9A03F2A8EB;
 Wed, 29 Jan 2020 08:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1580316327; bh=AQ7qwDOrgr4oCXbypzhvadC6PyJ4NatHch4UA6L6ykA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=evulIWUclSre/ENP/QGh8RQhduNzs7DvX6qSDlEIkRJjZqGyWm83WPN7l+9AUF3DU
 //rJs4qOZW8U6HMs2IN5QJAhM19/q1agc9rdD0hicMUzvhUNuzY3YUadfGyO1/ngXD
 VyH88ZNC6mPijOWhJlygOiny+YtFsAJLk+oSetMsVsijGCQtvBUBbh3Jq2gXBcxty4
 mnDCZQr1172K6NVu5zJv6kbgRaxk2hNG3XafWR4DQDtFU1xOR+nXWjVnfDTaEduAT9
 So6UARstWlV6A1svI1bLt++qzDCmwoRX0UJlPiRi7MkxcNA4ljD9ID+7+FiZDm2Csw
 QVoWS+VKZhu/A==
Received: by keithp.com (Postfix, from userid 1000)
 id BEAF61582162; Wed, 29 Jan 2020 08:45:27 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list\:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] riscv: Add semihosting support [v4]
In-Reply-To: <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
References: <20200128233224.515233-1-keithp@keithp.com>
 <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
Date: Wed, 29 Jan 2020 08:45:27 -0800
Message-ID: <877e1arz2w.fsf@keithp.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.227.221.253
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
X-List-Received-Date: Wed, 29 Jan 2020 16:45:39 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> True but irrelevant. You need to refer to a proper
> risc-v specification for your semihosting.

The RISC-V Foundation defined semihosting as relative to the existing
ARM specification, so using a link to that is appropriate here.

Here's the current specification of the unprivileged ISA, which includes
the definition of semihosting

        https://riscv.org/specifications/

While it may be nice in some abstract sense to create a "better"
semihosting spec, that's not what the RISC-V foundation has decided to
do.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl4xtqcACgkQ2yIaaQAA
ABGTww//fZsnRw7sJLy7xuY29NXr60SREv4ldVOQktPdPEJFbkLwz7e+Iqvbfm6q
pg/4Okfp6wDvCip+mduu7PFSjIbRG3yoqpChCJWaHcmPUJQJ5xcsZJ2v2TE5XdbU
WJvBXaaf3PkTdPNmcSMjCiTiksSjqePNAYPn3b5xNz9LhlVwzo5tWDopbdHLEbWQ
aSLhCFZwm7mq39Fia9thnTUuXkyZkDTAYbwdW30mEonBtnZ6PoJGcrTM+4JvdIR9
A8uur3hkJDyFoF7ykw783tI9Z8rIqGGNxvEpLvudQlbBn9x8/z/GcgGWIojlYfVf
gQLhSEK8PGkaiAkZ6huA3sPkeMoC72x3vnB5uCondbxTS42KEtLIUBnwSvuBUlwd
y3O3H02kClAiOcsGLRccMuYpw9s+7dSDAXqerwS3dIl4gxXYzI17c5BG0cwn8OOX
sbTNBoZoEyERrLnOXQs1q9NKMG6xkvVUvIsYwBnEMMoM+Ve2fhd/N0AmIj7yhnKj
i8ahgFGORWyCNQOqL/oO33yNKMERoPJl8XBonwGweb45KRZ0wKq6eNUxr67fGmv/
R7biHBPW86tVoMRIXYK4HyUEeAbFiIMUWf8OhPA96iHt0hqK3/iV/Kj+daoc9j4a
tnZ5QmcozYWNRHa+XghS3jO4tlxFSLeUvYfKHM6RrHnoyqk2Cec=
=KogH
-----END PGP SIGNATURE-----
--=-=-=--

