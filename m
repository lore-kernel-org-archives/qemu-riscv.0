Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXWx1-0004JP-59
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 17:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXWww-0004GT-6g; Tue, 27 Oct 2020 17:56:14 -0400
Received: from home.keithp.com ([63.227.221.253]:43966 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXWwt-0000PN-Gz; Tue, 27 Oct 2020 17:56:13 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id D45213F2DD88;
 Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603835762; bh=LFRed8aLrEhFr9/H0YfC2FHgLemVaokq/v9X3p0bp+M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cAx+ERVBgsVYaJnPv1wxQ10jPAhBgdInxCU9S6Dw0zhIeHuZd78D4Y3YcHRUDVrJ5
 dVF4t29HTGEOm9UpWQBKqT/p4q0i63o1wizr80O0d7oCm/2U5Tq4sdfnvsjGSLJH42
 T0qQpkbgiBvA+rmLU+kyeTLVQPigF8n4fdFmtjgM6kiAYM4WDAfUlsQmZp5w0vdrXQ
 ZJ+1fFrsUuO7N0BzPofOaPjRyMqENXReCyBLDgm/D9ewYvt+C1IC7weuXWTMMck0Qj
 ECsQTciR8kdTOB3c3YwVzqZ6pVoJBaOVXcdBntyzdeZ8bbi5E9XhlRZPrHOq1DnRB/
 5ZTbLTNGETOSg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Q0jRHPqt_1AB; Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 6F4573F2DD87;
 Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603835762; bh=LFRed8aLrEhFr9/H0YfC2FHgLemVaokq/v9X3p0bp+M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cAx+ERVBgsVYaJnPv1wxQ10jPAhBgdInxCU9S6Dw0zhIeHuZd78D4Y3YcHRUDVrJ5
 dVF4t29HTGEOm9UpWQBKqT/p4q0i63o1wizr80O0d7oCm/2U5Tq4sdfnvsjGSLJH42
 T0qQpkbgiBvA+rmLU+kyeTLVQPigF8n4fdFmtjgM6kiAYM4WDAfUlsQmZp5w0vdrXQ
 ZJ+1fFrsUuO7N0BzPofOaPjRyMqENXReCyBLDgm/D9ewYvt+C1IC7weuXWTMMck0Qj
 ECsQTciR8kdTOB3c3YwVzqZ6pVoJBaOVXcdBntyzdeZ8bbi5E9XhlRZPrHOq1DnRB/
 5ZTbLTNGETOSg==
Received: by keithp.com (Postfix, from userid 1000)
 id 419C21582210; Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm
 <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-Reply-To: <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
Date: Tue, 27 Oct 2020 14:56:01 -0700
Message-ID: <87pn53e3ke.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 17:56:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Tue, 27 Oct 2020 21:56:15 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

>> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>
> I think this adds this file to the compilation for all TCG targets;
> you only want it for targets which have Arm-semihosting-ABI compatible
> semihosting. (Various other targets either don't have semihosting
> or have their own ABI.)

Right. These should have been target-specific source sets so that the
file was only added to those targets:

        arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
        riscv_ss.add(files('common-semi.c'))

This appears to work in my testing (building arm, risc-v and x86_64
configs).

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+Yl3IACgkQ2yIaaQAA
ABF23hAAshIh90c2syeOD7e72vZAmKyR3UdxiwRRaobis2M5HEosF8bVTuuYoP+Z
TOE4wV1NK5Z0V2tWcLQ9cJwqwG467Idw5ZGQxgXwe/4D1jf7x9QZZiXhqgqdcb8A
+4AUkGLjFVZMn/hoOt7MWLhLSmBIu2AeZmEfdxEwZN67sb5db8kj1nL429+2g8J5
8bYpoOsbWSGkrYWvm30QbLNiyzndSau0rErgbLf5cRbFDna/saKTKu+t5S+zXt1R
BVu1rFUAD7QgICp8eTOtdmBIt5coNGbk6oQMBlj/TRVatWPl57L34rA+6l1/mrWc
fQjBwe8+BHYxjNaSRN6mMYs/5CxcaNlPNXUTFI2TLIpy9IS6DzzuY2IjHw6qoaz8
y5krhOXkkBQ3Q4riz7zpF/VlH+MEn+Ipmc1wMAgTT+3OP8cKropWIwk//qF00HMy
oAkJpZrYNfTvyMVfHGseg3HvrySxsomMWq6X8StXqSG9Y99f3jCOvpL1bF2UCX0m
lsBNAfU2F3kFcv96lB21tMy+ED9SgagV6q/kVzgiDOarGlxDr9MwHs88LvI2J9JL
61pV/LIQIp1RueHtExqxQ5427e9uEP0f/c57gFUY/J296pDiVqwhe7aGPjlpZ998
SMkwmYTRz1N4SPnnd9Bd5THWOyVtM/znBBmWXAd2qGRf+oQHXlw=
=/2q0
-----END PGP SIGNATURE-----
--=-=-=--

