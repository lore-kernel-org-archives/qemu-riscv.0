Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcz1O-0003Vq-At
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 17:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kcz1L-0003Ts-0t; Wed, 11 Nov 2020 17:55:19 -0500
Received: from home.keithp.com ([63.227.221.253]:50268 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kcz1I-0006D6-Kw; Wed, 11 Nov 2020 17:55:18 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id CFDBA3F2E04D;
 Wed, 11 Nov 2020 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1605135312; bh=JZIe14bRwmP+C00P4oHG7KgMsfDy0gkTwlW10qLs52s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=u6/e4+gzuRFJcuSFj9mOTyfYopxNZWSPQs7PWE8W6nxOpMfFAaE40U/vDba9Xxm4O
 C6Yxrszy2J9UNA4AqSU4q9G3n6TOF9tm8d+Y1LvauK0sMHf36MjFzK0QDlonKm+RfR
 WfrCWxAHkgRJth13A/pbSBXt1ADz3jerTan56ixgEGHY7jcKq7depQ38cszO+ie4lg
 T6FKZfom/FhxyBfcAp619QLEPoTAn0/JFiaO5cChroy7e7TEbX6sjvXrXR1aT/Zh2+
 aJ+KwGHwc4Du8CCIQ8UmzCG9BZ41YqelpSeUqlnZUhDCQTJnuCqTeoCHa21pw5VhIN
 +nh71w5C6hXlQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id o7VeoGUfkPt4; Wed, 11 Nov 2020 14:55:12 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 6D9653F2DFFB;
 Wed, 11 Nov 2020 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1605135312; bh=JZIe14bRwmP+C00P4oHG7KgMsfDy0gkTwlW10qLs52s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=u6/e4+gzuRFJcuSFj9mOTyfYopxNZWSPQs7PWE8W6nxOpMfFAaE40U/vDba9Xxm4O
 C6Yxrszy2J9UNA4AqSU4q9G3n6TOF9tm8d+Y1LvauK0sMHf36MjFzK0QDlonKm+RfR
 WfrCWxAHkgRJth13A/pbSBXt1ADz3jerTan56ixgEGHY7jcKq7depQ38cszO+ie4lg
 T6FKZfom/FhxyBfcAp619QLEPoTAn0/JFiaO5cChroy7e7TEbX6sjvXrXR1aT/Zh2+
 aJ+KwGHwc4Du8CCIQ8UmzCG9BZ41YqelpSeUqlnZUhDCQTJnuCqTeoCHa21pw5VhIN
 +nh71w5C6hXlQ==
Received: by keithp.com (Postfix, from userid 1000)
 id 4AF2D1582210; Wed, 11 Nov 2020 14:55:12 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 3/4] semihosting: Change internal common-semi interfaces
 to use CPUState *
In-Reply-To: <CAKmqyKP5JpriojRqDNy=SqqkXtg=y39P5xNoMrSsoWhfz8xeaw@mail.gmail.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
 <20201028185722.2783532-4-keithp@keithp.com>
 <CAKmqyKP5JpriojRqDNy=SqqkXtg=y39P5xNoMrSsoWhfz8xeaw@mail.gmail.com>
Date: Wed, 11 Nov 2020 14:55:11 -0800
Message-ID: <874klvh5bk.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 17:49:36
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
X-List-Received-Date: Wed, 11 Nov 2020 22:55:19 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> I'm not sure common is the right name here, as it is really just ARM
> and RISC-V, but I don't have a better name to use.

We've already seen some interest for other architectures; Benjamin
Herrenschmidt was looking at using this for PPC, for instance. He got
stuck at the same point -- attempting to split out this
architecture-neutral code.

In any case, naming is hard, and if anyone has suggestions ...

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+sa9AACgkQ2yIaaQAA
ABEsrxAAqMjpV6wVK7otXM/sddT6+yG/AvGM+oWDHu45Oev9s3Q0TFW2pYkYQZ5O
uOHmTVeKAPsGC8YcobtIUgk2dpAX1B87kAKug3BKWBAB8xTrcFUYQc4b5/viclKU
lJie8lkZR5KkRXiMA7gCab8MECY4cj5lBjwN4W18bW/SVDZjnuuRu6P0EUKbXqsF
B+JOiiICHKamVFoASWlzdf3jXTYOTZk5g6N5HIngTRcjpqQl7RvycOm6Ky+dkvrB
ZmpTDdp8UzPsbuyWd/9uYaNwZWmGWh/jodd3kNnG0APL5Jb0ANzI9/165faeyuuY
44XCWT5MRMwwODOgNmzpBpY6r7pJYaltzSzZUu/IKqZKAPCPxIihe1rzSJ5jNFEQ
rwFp+RlmboxjQP7iPvkc1XCbmNpk2yEXFLnS3UUIqtrorysCdwU+59lbRcHBms3X
MwU0oBrYZgamNCyUiJGTmEvwqK9f5O6vEEF3vQWGESsO94h16lZBG2Yo64KvxTCu
E9rLq661bFKwcMxUAzHIamZHncrbT1AF07K2kdiRE3KPgwCaQTUqMwIqgTRpnNXv
WufvK/v1L27/i2HmFYV0QKDm7GfRMhjqtY/NTABZmJqtTDvnlTqvRvY9LyOo5Z1j
cYLp/OpsPudDLxtrqP1o85JXeanMMMxfhUg3A2DmNOVDFzTx1yg=
=DSes
-----END PGP SIGNATURE-----
--=-=-=--

