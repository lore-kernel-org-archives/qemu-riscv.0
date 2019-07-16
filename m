Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnP2n-0003io-Ab
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 11:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hnNwZ-0004WB-RV
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hnNwY-0002zz-Ph
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:56:35 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1hnNwV-0002y0-GP; Tue, 16 Jul 2019 09:56:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id r1so21054667wrl.7;
 Tue, 16 Jul 2019 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dipokld8iDHqbE49EQ+wVKN/86qV/Cdx+scrTGYVrEo=;
 b=kvalVW+98y0a+a5LiR9PkT3rn0pZ2pTlPXLLyEJgmUcqkio05SZzT8KT7gdzzuZIaX
 pPOtAS5fV1lvRLJy76OuYY3DGJ/pIUGKnREpyE39sY1aCp6EJ31Bbe8jr5KIe8/Hk93M
 TpVhOvbvRopm6ovD6XP1W6KBUK8qU8NO2XJ6+Hc0wgQXgAXgVg8cCEoDVI1cY5Ee4MYS
 tCYgqnpnKZq6rLwP/Msv/SPmyla23AZ2M1W+LyRmGltMiXrn5ucQSSHFGRYDLYJjuPOr
 cjGH3tjx/Kg0B/QKlOcuks031YUV+rBbQMGPOUn6fnpwKe/TnmUVsYgPpX7BCTDodHde
 95ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dipokld8iDHqbE49EQ+wVKN/86qV/Cdx+scrTGYVrEo=;
 b=QIu4gOrdABUROodPmQFd9ggTw1z9RAFAo/HliviUWu9Jj29Px/BT3cmq7h8qy0uvM3
 DonKsnmCV56R2JhHjmA3hgZV98oSzkpp1rzHO7LhfUhMzk9vqe5U9aJS18yhkfCZ2/h4
 muX8zYHIGD+QFd89A9wZ6ZZVobOMtfxKLytO+RX2MCVEtdYuEljZEbSsGvxJXJUZoxmC
 wWgnXZQf+DF6FIdbZKJ3P80Ql02RUrPxjAUVZS/aM2hmoVOaCxigVjPBcC3c6tX0fJhU
 7cVTwjbrz8xm16EcpjeNhY+OyhleM9Wrhr6w6V8Kz8LDsp0DOmmH+HPqpaYtjojJbZCZ
 cGCA==
X-Gm-Message-State: APjAAAVCPIqi3WSyzn2HuQGsseOGdvjfeaxKNNNx2VIuJM4xakBmJPZe
 ejqZyP8LiSpZPRFfcSFD1pI=
X-Google-Smtp-Source: APXvYqy7+izjwfGQLn6ZtcazGUS6g8dXo3rNWuWdzrGBbDNB4c4oSFhh9pj0Tp6NKBC+F4dBhSMCng==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr37544629wro.33.1563285389935; 
 Tue, 16 Jul 2019 06:56:29 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id g11sm24604690wrq.92.2019.07.16.06.56.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 06:56:29 -0700 (PDT)
Date: Tue, 16 Jul 2019 14:56:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 codyprime@gmail.com, anup@brainfault.org, palmer@sifive.com,
 stefanha@redhat.com, pbonzini@redhat.com, alistair23@gmail.com,
 bmeng.cn@gmail.com, linux@roeck-us.net
Message-ID: <20190716135628.GA18691@stefanha-x1.localdomain>
References: <cover.1562803960.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <cover.1562803960.git.alistair.francis@wdc.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-Mailman-Approved-At: Tue, 16 Jul 2019 11:07:04 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 0/2] RISC-V: Add default
 OpenSBI ROM
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
X-List-Received-Date: Tue, 16 Jul 2019 13:56:37 -0000


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2019 at 05:14:02PM -0700, Alistair Francis wrote:
> This series includes the OpenSBI firmware for QEMU RISC-V users.

A mirror of the OpenSBI repo has been created here:
https://git.qemu.org/?p=opensbi.git;a=summary

qemu.org hosts all software, including firmware, that goes into QEMU so
that users can rebuild from source even if the original repository goes
offline.

Please use the URL https://git.qemu.org/git/opensbi.git if you resend
the patch.  If this patch is merged unchanged I will send a follow-up
commit to update the URL for you.

Thanks,
Stefan

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0t14wACgkQnKSrs4Gr
c8jJuwgAnZ+VD878ZUW8ztYnRUV23Q6hxbaycZsCBadlU+4+RP6IeW7xQRPP/wLH
uGGky8XKIP92xDzDRwxYn4HHKCuhlvZcfvMVwBMDszeq+2B3NgzUwfEXSj0xV2xr
BYWDoh0UskdTYRErVYtXdtIBlSeNW8y3vRm7Z497bF6S0OuOXaBjLJvuleyISK3Z
DMmlTc83G8oJv3bzwe2R4PyP+E+ZA6D6vKTskimB+/VAwLOVH2HFl9dBkl2ndSpx
XGacVAya10mTYq+SfVUsWUUmm+qhUcL3AuuM9FsNaF954YDm3iGXGi4ZOY34Oa4e
BZidWzQTHl+jYKOoxsqDLOlUvWXWXg==
=qlul
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

