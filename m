Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIPsU-0008MH-6L
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 03:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIPsQ-0008Ll-9u; Thu, 19 Jan 2023 03:02:26 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIPsM-0001ZS-Qe; Thu, 19 Jan 2023 03:02:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BC5A35C00E1;
 Thu, 19 Jan 2023 03:02:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Jan 2023 03:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674115339; x=1674201739; bh=mB
 d7QUcrfTarg4e7g/HJLtAIa3/buWqXHjVxwDG6Dhc=; b=PgQYzn/Zz+P8vSoowS
 VJzNxA+WUjOf7kg5rKt+oWCk0VycFhcEEMqKsNFKS8t2ylfL/z5c0yhikjPdsjVk
 VaMLTpemJegaK13BCqmSStZIharlKidWMaKqw5vEy8hNUmNG/hI2kKXIY2jBixel
 EeX8hbjWLaA1qWHBSfd7kkdwLjyUvcMe7IBqe2N42SErwigsYfCP/mEP7kXbnDUT
 62mDEuX/fNFGc9zlRGMQOomiBwhaE7y0s2AsWaj6qvMCxaCxqlEpcw6GRUH1ZeQ9
 xyzGqEsr7TiVkxlZiTh6S5zo6adEeKvJHrD5GgC52psZYi97RNp1nooz7mFtuXzr
 3VSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674115339; x=1674201739; bh=mBd7QUcrfTarg4e7g/HJLtAIa3/b
 uWqXHjVxwDG6Dhc=; b=a55UmbeUTm+fBSvRbrt+qhzKEFviFHTZO7IuWzj1AIJ+
 T8RbC8RHm56bTlAu+C+tNr99bY4+bv7sKeJ9GjHRhy0qAxM6oD0oJanKjjvkeQfD
 JiX/9FGhpDCGX/PrAUJPaZ5h6eLCpatAUW4VM1xvFFUDnT2s/QgJDT9cDGDMeNiM
 5XHQnOlRLW62LwT/57Qe+c/5b8jpYDz7BTvjO6PZTZxPeJ5D85LRjtWFJSVy/wa/
 wOAIZvjYjQiLvgkE1GHwQzcWxft50PluUqvpGh8k9iikUqo1bR+n770n6TMr6btw
 fZVZy5DQiPIJ42W/p6KVe0xTsVcV4lSbwtBzqixXmQ==
X-ME-Sender: <xms:C_nIY8jTBsDQ4ggRP39QWLV7mYU3DfPdSHp72DQ6ptL8xtf7f07RXQ>
 <xme:C_nIY1D4g9mzBBkExaGZ4qdeeU3d2VGX3yboik3wM_tosUgEZtrQCbNt7Ywb_xBsB
 RvTkNZa5dslRopTozk>
X-ME-Received: <xmr:C_nIY0HyaG__FwFFFKEF4lsL-lIScJBQXOEcq8cTcUXSpEne6Y52aSFqNWO20u05dG0XbpNgyF8oTwR5v6ltU_gtCTEjKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:C_nIY9T3JLBn5F003CEEVuuzmh4Wb5kLZhXdNBkAeVsU8wgRmC0w7Q>
 <xmx:C_nIY5zBGcJZaLt4_RHZB9fS2Oir7DBGtDRYEHjkUIE-nZ0WCoPk5g>
 <xmx:C_nIY74zoA133YhZTDfSJfp9y5mb__rXY75lvnJZoh-2R8bwK938zA>
 <xmx:C_nIY_6xwqblwWuFN5fbsLeH6XOpBgN60LTUBPyp-2BKBPm5s7D24w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 03:02:17 -0500 (EST)
Date: Thu, 19 Jan 2023 09:02:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8j5B+c3mM01d+Gk@cormorant.local>
References: <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
 <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
 <Y8jBG/j8w2R43kYd@kbusch-mbp> <Y8jxHuVYoTo6KcH4@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W4BUVAsMEMdcmc71"
Content-Disposition: inline
In-Reply-To: <Y8jxHuVYoTo6KcH4@cormorant.local>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 08:02:28 -0000


--W4BUVAsMEMdcmc71
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 08:28, Klaus Jensen wrote:
> On Jan 18 21:03, Keith Busch wrote:
> > On Thu, Jan 19, 2023 at 01:10:57PM +1000, Alistair Francis wrote:
> > > On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrot=
e:
> > > >
> > > > Further up, it says the "interrupt gateway" is responsible for
> > > > forwarding new interrupt requests while the level remains asserted,=
 but
> > > > it doesn't look like anything is handling that, which essentially t=
urns
> > > > this into an edge interrupt. Am I missing something, or is this rea=
lly
> > > > not being handled?
> > >=20
> > > Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
> > > internal GPIO lines to trigger an interrupt. So with the current setup
> > > we only support edge triggered interrupts.
> >=20
> > Thanks for confirming!
> >=20
> > Klaus,
> > I think we can justify introducing a work-around in the emulated device
> > now. My previous proposal with pci_irq_pulse() is no good since it does
> > assert+deassert, but it needs to be the other way around, so please
> > don't considert that one.
> >=20
> > Also, we ought to revisit the intms/intmc usage in the linux driver for
> > threaded interrupts.
>=20
> +CC: qemu-riscv
>=20
> Keith,
>=20
> Thanks for digging into this!
>=20
> Yeah, you are probably right that we should only use the intms/intmc
> changes in the use_threaded_interrupts case, not in general. While my
> RFC patch does seem to "fix" this, it is just a workaround as your
> analysis indicate.

+CC: Philippe,

I am observing these timeouts/aborts on mips as well, so I guess that
emulation could suffer from the same issue?

--W4BUVAsMEMdcmc71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPI+QYACgkQTeGvMW1P
DekHAwf+Ki1LlCBgmoe95m0vajU7TuDu1kMglgpZ9t7UsBwGa88syocxbt0Xbgi8
9EvIPkncL1hlzzimo/tFa4Ukr5qiCucctT9xW37x2EWpMOk8Dv1Vo3W0pC9X6Apx
nASE5/LGq/hH1IhnewMKPwABXfpd/OCiNnlkbYtp7dQhk9Yls3WoyASZVnXAKk4P
Gu8nsBRUutZT1VEjOIv8GYwQwaJ5IHEWULTndsiQZge/vWKgHLev3xDfOtKXKsmw
mhZm9n1CUZBH2dF9hZCfxGqp1TpWZXKuH5rpw3wcLOFShd8CznI7PvtqNodfeVTo
fveeCWF7UH05j2gpTGQjY1wKLvjxbA==
=ZriN
-----END PGP SIGNATURE-----

--W4BUVAsMEMdcmc71--

