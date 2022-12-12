Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4hA6-00043H-Uv
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 06:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hA1-00041g-UI; Mon, 12 Dec 2022 06:39:56 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hA0-0002ID-BV; Mon, 12 Dec 2022 06:39:53 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 808675C00A2;
 Mon, 12 Dec 2022 06:39:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 12 Dec 2022 06:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670845190; x=1670931590; bh=j7
 e4fCadnwlksvcgN0S6QDOmE7UW/EzPjW87V5ui2go=; b=NPfd5Sd/BwVkYlLtt6
 1m6mLI/Gb4xos21zfDrmTBnNYpqJoMber6UTRcpFef9i2npdpXhvcJov6cgv4mfi
 C1ko0Oc+ujE9TwYWws6jRhjLPzic/O87Uj5nqUReFKvHrqjDZeBRkDY1xv/EgW7v
 MxNTBlLVVuuye9Ypmyl0ypKnmzThnE+uFHG/hQS3hmyvhGYGkE2p2cco1tZ4l+R6
 8QnRlasJ9FWPotobkVg2ul7Ww4FW6gSSanSparPo5vRYmUIZJLHl18fKlZcq+s9E
 0buuS4MBjccQe8dYQQ50fH8PJturNNPOO0TJJ+Ody32RdmJuri9M8lZHoIUZ7K4H
 /zcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670845190; x=1670931590; bh=j7e4fCadnwlksvcgN0S6QDOmE7UW
 /EzPjW87V5ui2go=; b=ey+ZCjRefG00U8SlahvWOhyTuKUXrltYqu9ZlFF1L1gf
 my21SP253efzm6qH+ZllBrYFRX/4AleQPZHgPh1M3Z+HQlOcGi1kYMYEMhvPj/xB
 vSrFzTL+0QwijW3gGEEkL9c2UKDiZJBgDElgCxd2sl1KNXQN8kjvA6KX8Sh7Hvqq
 WlUvtFZM/rOBCpgJWgMCDgawgnW80hWfIaLl5nr1mF5wAHrsKWy+8/z1A2QaEMFd
 kwjxGfqA4BizDEveo3qNVpCM2BLjCgq4QbVrmHAp/hOZwNuBDStxFj0ocj2vvx5V
 tt08B9vfxHkM3eo9OhiBHo4dAGPFT9ybInSTp9n6gA==
X-ME-Sender: <xms:BhOXY7RhiyAI3MatqziwF_3Dnf0wTfI1GZ5hQVayNIri1SAMAQuMEg>
 <xme:BhOXY8xtBocPpeAPzud3DRi1yZwdn0tp7Khr7larwqC-b6xJY7PKqqkef-Q4IHawB
 cmtA7Kl3H2ua7xQwpY>
X-ME-Received: <xmr:BhOXYw1g0lursLGciTs1-ibaFR5KOnl4bu9u_OI5Lbgp6taYobBxfZMQNMVQmltCtYd0gF0lEAEFwHZAQMIrVHEqIp18Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BhOXY7D_vTFUOK5KQeQwV8tbBBpNQgIuGNEHZYsQ8axCHcapyahMNQ>
 <xmx:BhOXY0jCIXQLtTtFT2HJtMQhHtItpAAuAT0q-YEG8-aT09QvJMWxTg>
 <xmx:BhOXY_oEM9IEfvkd-iQRXzWwH15npaVPdAhO85fXk3X8sz6-7B3lqA>
 <xmx:BhOXY9VlvZI8NMRJf0Bh8E28K8ZtHH20BvZTSfYAZJs44OjcbyXhOA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:39:48 -0500 (EST)
Date: Mon, 12 Dec 2022 12:39:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 4/4] hw/nvme: fix missing cq eventidx update
Message-ID: <Y5cTAtSanJicK5FM@cormorant.local>
References: <20221212113215.33135-1-its@irrelevant.dk>
 <20221212113215.33135-5-its@irrelevant.dk>
 <93658dff-fcba-590e-ba53-e5fdb3d841c1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Maq7jjWapbkfJdLr"
Content-Disposition: inline
In-Reply-To: <93658dff-fcba-590e-ba53-e5fdb3d841c1@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Dec 2022 11:39:57 -0000


--Maq7jjWapbkfJdLr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 12 12:37, Philippe Mathieu-Daud=C3=A9 wrote:
> On 12/12/22 12:32, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Prior to reading the shadow doorbell cq head, we have to update the
> > eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
> > write. This happens on riscv64, as reported by Guenter.
> >=20
> > Adding the missing update to the cq eventidx fixes the issue.
> >=20
> > Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support=
")
> > Cc: qemu-stable@nongnu.org
> > Cc: qemu-riscv@nongnu.org
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/ctrl.c | 17 +++++++++++++++--
> >   1 file changed, 15 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 8af70f0216f0..3df29ea68b2f 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -1334,10 +1334,22 @@ static inline void nvme_blk_write(BlockBackend =
*blk, int64_t offset,
> >       }
> >   }
>=20
>=20
> >   static void nvme_update_cq_head(NvmeCQueue *cq)
> >   {
> > -    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
> > -                 sizeof(cq->head));
> > +    uint32_t v;
> > +
> > +    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &v, sizeof(v));
> > +
> > +    cq->head =3D le32_to_cpu(v);
>=20
> Isn't this be part of the previous patch?
>=20

Argh, I screwed it up. I'll fix it.

--Maq7jjWapbkfJdLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOXEwIACgkQTeGvMW1P
DemicAgAuNwa4OA+dA7AvWBKT58pEpX+O+0Gjk8X8massui6cLX1PtHp9w1usuMH
AGnYnk8mdetMawjz98A04IBVAAASjvkq2Y66YTqP/q+/GWvc9OjHX1/uGJDSm6Gd
eEErU70aD6CHXBk/bxSdE4DxRVrKqx5F9nvqUnT8yP93TXHGOFXNKbqAASV+eSzK
ykxcnwPdGv8iwlV8Ja2b6rv1FBb/VQi0esymgKe3nz24bunoNonzHEQ3uoYXTYNm
aNQBmF9G427rquNj3a8ZC0KxoLhP2HIC+BhOljxr+31mDuvvT47uGPSRYl9cpTPz
FpzN6Lm1A8MqX+4efo4z2EwmRsPSng==
=cwN7
-----END PGP SIGNATURE-----

--Maq7jjWapbkfJdLr--

