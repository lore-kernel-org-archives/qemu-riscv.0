Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ky2Mp-0002VD-0s
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jan 2021 19:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ky2Mn-0002Uu-V2; Fri, 08 Jan 2021 19:44:30 -0500
Received: from home.keithp.com ([63.227.221.253]:35078 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ky2Mi-0007jS-7d; Fri, 08 Jan 2021 19:44:29 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 670433F2E5B0;
 Fri,  8 Jan 2021 16:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610153058; bh=kUjl9mivrTbW/TkqoczqwjF/nkzL3deTzPeVcgh3t9s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JgJVg/oE5zhxCJCa45olcsjGPSnNqcFtemH7RZXZPGTZzX+epsRqiFEe8QVwhzRy6
 b/qbjXECBrVe2GI9xHALFyqAGftOEUI0OMLTdA97huBr9vVK9sfm8iZUpN7bT2adAt
 tU+25myoHvqxmDt8GJ8P099e/9KiQecH9i16+H2OyraVLfm+euWRqBx5dWMij9yuYd
 SduuSU/yLN7Qjvasr52hKUl5iF39/FfZSNFwcL4hztLstddVGRbEr+Fg9CA1FEF0Gh
 jOf6ptRai3OzFTFiTniJXkUXX4ZaJsKTXhtTYqNVwYPlGG/fxqqZPWSh1W4p5hReUv
 lKwZgGorRQ4vA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iadNZGcf4_Yx; Fri,  8 Jan 2021 16:44:18 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id EA6F53F2E38B;
 Fri,  8 Jan 2021 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610153057; bh=kUjl9mivrTbW/TkqoczqwjF/nkzL3deTzPeVcgh3t9s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qaP/3UvyNU/CyEDT9B02YJrFj8MnsehX95BxLqk5Oe6Idto2xDX6vdY6UN2wXhHhC
 KJZAiTTEeozZoaZN8Lbb+z7btpHhzkVkWVs5w2saA2o+Gv0yVoVsoDX+SaOAF2sxTC
 W/Sd4ozLXsn0Bbu8PYd/I34t0rnVILlrL+ndBIsfsb3B7ZA0TLGQ2tx8dYwxZEuWxa
 t3fxYvu4ap4oAmFjco2EPkFOoiS3onfELR1ghRmmDU52OIVSPd/eaqraSSBo6K4wkf
 BxkbiLqGk9/9n++PGkx0nDOMJmh7m0ypfAioggRAdct0moySiyoczvtBoEQNwScYJM
 u2Yg5wiNZgh1Q==
Received: by keithp.com (Postfix, from userid 1000)
 id B68CC15821D9; Fri,  8 Jan 2021 16:44:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Alistair Francis <alistair23@gmail.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v1 16/20] riscv: Add semihosting support
In-Reply-To: <CAKmqyKOLLXqjeGO6-k1d_Y_23Q5Tt1uKYUUwCjPDPPMJB3GXVQ@mail.gmail.com>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-17-alex.bennee@linaro.org>
 <CAKmqyKOLLXqjeGO6-k1d_Y_23Q5Tt1uKYUUwCjPDPPMJB3GXVQ@mail.gmail.com>
Date: Fri, 08 Jan 2021 16:44:17 -0800
Message-ID: <87wnwnndlq.fsf@keithp.com>
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
X-List-Received-Date: Sat, 09 Jan 2021 00:44:30 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> Whoops, I thought I had already reviewed this commit.

You had provided quite extensive review with lots of useful comments,
but never added the magic tag for this commit :-)

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/4/GEACgkQ2yIaaQAA
ABFsqg/+K59HEjdV86AzCVB6pUIY/QPySX8+gqRhTVsnWJX8NAZtVWCz2WeOClVs
wZY9C6W71cDOanHEgl1QS8NoHJ1o73HEUZODIkjrrTEKDzpUKawCoaCTVnVqZRTU
cPrVfyq+GCnnVrBofB4pSxtbKU2axBYTu8seKyyDND0Z2lmtappeb2X5l1SzZaRx
P3s/1gh1ccafES7+5cD9EoyAJ36JQo/a8fOHoOiiLq7DdPRlIXmee5keOjCDILOF
KEp/6iZ157TvhNb7MBzHGKdSUvwNAsAwxQc3GoT637ryIGaeS4K0Bhf3rlgI3X/C
URVOZ4VgdLfE7AF/fW87hm2R2s0j2hCxZha/yS1m1gqNtJDfyxAeLccJNg29XVqF
VB8AjOTVuXAvbKo3lygcPssq63BxYO5H++1RlAJfpg0OsezSHDiMRr+RAWYinqVU
5pm6cYBfVMYaQWGD9E4tSZhZqcyZkyFnWYCdTmeiR462agmdZwA58Uo7knEqZ3O5
ikcqeHugbCdvC8867LSCrYzZ6UY3BUo5QfERz5uLeZ3nZDHnTbSXNQPeJ9fr7u/t
S2nj3/cqR2CdCNzNZ3fb+/13FEU9QVfmcS71hlqJHsPAmE1J8+DkYXIQxAm95eaw
i8EUfZ6dl2LWZvdPoaxf6Dr9Kp8aiU+KcU5KgIGtYspkft6+yyQ=
=NlZq
-----END PGP SIGNATURE-----
--=-=-=--

