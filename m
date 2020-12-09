Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn2Lk-0006XS-U7
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 11:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kn2Li-0006UP-Ls; Wed, 09 Dec 2020 11:29:54 -0500
Received: from home.keithp.com ([63.227.221.253]:43716 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kn2LW-0005w8-VE; Wed, 09 Dec 2020 11:29:54 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 72F8F3F2E329;
 Wed,  9 Dec 2020 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607531376; bh=NfvvG9R1oZHC0/72KAn4eRO/RbaxPTHZX0E9qTml3UI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=syXM6nJ8lwxL0amBETOnN1p1SckCQYDv5U4mPPW/2YfeTOArON8cCF/QOYDuHzrbs
 CAVZNTkOEA01WyciO1sxR0S7pwbKE5eqUj2ka14ZzGxMgzChMZz/qhXn4LbHtJpiwF
 oMXmkmrf50Y6mkeiO0F0mkozOtThwxrbuavVEV8m0r2zc5+EaXj+yfoKIClcusJB8q
 vPpnni8NEPyMtrQZs7d3FOBE0Z8XJUR110eEMK7Imn8NlumNfPL9BR3MkHR9bXG4ST
 YIV7TXhwjp3x9lvAiAqBP5yC5UgyXKhtsXR42qcnDn923N4N4jsYreuNxyx3LTZM6w
 SQ/Li2sZe1ePw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 6I6X17j2ur1b; Wed,  9 Dec 2020 08:29:36 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 0E6273F2DE35;
 Wed,  9 Dec 2020 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607531376; bh=NfvvG9R1oZHC0/72KAn4eRO/RbaxPTHZX0E9qTml3UI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=syXM6nJ8lwxL0amBETOnN1p1SckCQYDv5U4mPPW/2YfeTOArON8cCF/QOYDuHzrbs
 CAVZNTkOEA01WyciO1sxR0S7pwbKE5eqUj2ka14ZzGxMgzChMZz/qhXn4LbHtJpiwF
 oMXmkmrf50Y6mkeiO0F0mkozOtThwxrbuavVEV8m0r2zc5+EaXj+yfoKIClcusJB8q
 vPpnni8NEPyMtrQZs7d3FOBE0Z8XJUR110eEMK7Imn8NlumNfPL9BR3MkHR9bXG4ST
 YIV7TXhwjp3x9lvAiAqBP5yC5UgyXKhtsXR42qcnDn923N4N4jsYreuNxyx3LTZM6w
 SQ/Li2sZe1ePw==
Received: by keithp.com (Postfix, from userid 1000)
 id EA9AC15820DB; Wed,  9 Dec 2020 08:29:35 -0800 (PST)
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
In-Reply-To: <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
Date: Wed, 09 Dec 2020 08:29:35 -0800
Message-ID: <87r1nz6iz4.fsf@keithp.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 09 Dec 2020 16:29:55 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for the patch, I've verified with newlib semihosting support
> which is contributed by Craig Blackmore from embecosm,
> and I would like to add semihosting to user mode, do you mind add this
> patch into this patch series?

I tried to add that already, but I admit that I haven't tested it in a
while. You should find that there are patches to linux-user/semihost.c
and linux-user/qemu.h to enable it.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/Q+28ACgkQ2yIaaQAA
ABGFNw//Ul4a0PbfO3j4ey6T6eC53q1i4ObgE0Bsatdm6xLYgMB7CyJ8Bn/T8h8d
/J31ZrEuRl3+vZhMZE4BGm6BuMEW/uwbrlKjfkTTep4T7JzXSDxUBaO4xa7OYnkI
6R/k9QYoOdvo31zfYG6zg6B1U8FtwnX1mSCUb+GjELEwKdea3yxa64yzapWnzsnU
TqkEP3Vux/M4M+z1LFkZfmvjhVaYcuNczuY3XbL1R7HZJGQktIaBh/lLvOPSL5u7
CQP6H7GZMJMrbJ4VH2KmcyBHFERlBsodXmJKf/ed7fzQLcuhKEYyuzzJ8JeQqwS0
IoHu6DCA5LbzNZQPvjxY2WJ8Rxzpq7uNbrioNC5xLIPvypzdVJUUW4u20bP8wJtf
jUvFNK1ZJYTGomlpL4p+5/f8M2MCj61Fz7wJaHRt12SIRYP0Lt1m4Obkglh9Aneh
PTvepH9BIqEd7FFoJMIFJ2bCcs6Yva8f5lAlW2MPxSs1s42iCVTyOHU/IrcX6e1y
HH68QwmxaJb9XoUV4luCD7WSXm3x8uyH3nPLsxxhTNd/EsczDK/r3q7v4cAjmPQm
URnGQx88afZnpI4xPmCPWI6IGmUta8gzCYw6BdcJbQOA8bxIyTFklV9ouzV25awT
Vnc0GlPGnSi6AjgdHv7wSi7qcuA2SWfLuc+wZZdHTXMyAKT43SQ=
=aNTI
-----END PGP SIGNATURE-----
--=-=-=--

