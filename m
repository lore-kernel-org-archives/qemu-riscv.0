Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIPLn-0002KW-Fp
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIPLl-0002Jp-M4; Thu, 19 Jan 2023 02:28:41 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pIPLi-0004Kb-Vx; Thu, 19 Jan 2023 02:28:41 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C0265C009F;
 Thu, 19 Jan 2023 02:28:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Jan 2023 02:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674113314; x=1674199714; bh=q6
 rz6TOszzqYBgi19e5Lr4aBvloXINprAi989KqAPHI=; b=X0deQFi/sFkISkIwc0
 Z8XHVm0Pol2npvJkEkMd8TQoTTwQgVyOEiACiB3vEICUPi+tCCXiO964lh+bC3tg
 jIqzacJCwfUOZMGwiMQqJCRIFtc5DipBfYu+a1mi8hpdDpzS7DPhUWf4LmTH/Tw9
 fAr7FwIgs5OWgkz8j5OSp+PWqvrLfImNjt8pqUN8SWdiHUfDDCEQTR1btkzCzGqo
 irAUCrn0mRJGI8t4ad+lw0GSVOJPosqn8M00P94pO0pq7UGuwexbiTMvH0KjBdYe
 AbXGDG2lB23e0u6vSepyfxcmG3jXNmmphcKwupRsKQRMNWhc+oRKy45Yb1n1bvPe
 XuXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674113314; x=1674199714; bh=q6rz6TOszzqYBgi19e5Lr4aBvloX
 INprAi989KqAPHI=; b=M9YeHXpFA+efSITLAFjcZX8xgGYhJH1Q7HMIWdxUI1vQ
 T7JEOpdhP+LZK4/XzlX0OU39KojTd6ns5woz8FQbjODuRDvIrAkTdQSwVoiWYaB+
 paK1QhRYGIu8VBf2NQFiU5ekP+vazRt4xz8xyLFwmcjZEvvmadzeCxvi5Y5dOsmB
 sj1L1dcxDdyqKP0ec0XWgxyfX71TI5O0AQo2oNuaQ/yADdU2onREd9atrvAHDHes
 ob8k11uPQpX0P62rqvs86ImPE0XdIU7g5L0LowzCo6RzdhZBhdmxAuGCuXy4olQj
 PrWTFhOKAUt8oEuXaHk+RES6Z8NZqeG/x2fcNTII4Q==
X-ME-Sender: <xms:IfHIY5bQw4YaMGGmRkE9spX0kSJn20yqAM10BlpD_rQx_PZ-Mg8GhQ>
 <xme:IfHIYwawBPVvWDtF9FMoWWWPz2yLgE4v1BFIhbz0nWnVWA6kKc3rI6TGqPettNsiY
 iqW33UBtQYZb11buR0>
X-ME-Received: <xmr:IfHIY7-uDPol7cBJsAJ1O8ZGBvfp8WCGIVo_zi1qfdWI9CNLFNaiXd2Q9cKBknQyt5kPEXe9qHKfzEftntLTr5LhijsRjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IfHIY3ptXduY-MseKEfEPckRoebKuLJUu5MbyTPOgJ8mqwx4uyYm7g>
 <xmx:IfHIY0r93kvbGLBdgF5z2x-yvizWG5MnoQmJcAUaD2XJRkxn5660ng>
 <xmx:IfHIY9TwoNKK9-gKpGCHm7gIM_TUMOIJEwNJKb6CN5uOXIAkmJDCkA>
 <xmx:IvHIYxh2hxdTJWbDCvbpeVu_cupXIsIztNSgy0TCqNpaY0h_HCrmKg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 02:28:31 -0500 (EST)
Date: Thu, 19 Jan 2023 08:28:30 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8jxHuVYoTo6KcH4@cormorant.local>
References: <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
 <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
 <Y8jBG/j8w2R43kYd@kbusch-mbp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b9PjqAhA9tYv0Qnk"
Content-Disposition: inline
In-Reply-To: <Y8jBG/j8w2R43kYd@kbusch-mbp>
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
X-List-Received-Date: Thu, 19 Jan 2023 07:28:42 -0000


--b9PjqAhA9tYv0Qnk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 21:03, Keith Busch wrote:
> On Thu, Jan 19, 2023 at 01:10:57PM +1000, Alistair Francis wrote:
> > On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrote:
> > >
> > > Further up, it says the "interrupt gateway" is responsible for
> > > forwarding new interrupt requests while the level remains asserted, b=
ut
> > > it doesn't look like anything is handling that, which essentially tur=
ns
> > > this into an edge interrupt. Am I missing something, or is this really
> > > not being handled?
> >=20
> > Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
> > internal GPIO lines to trigger an interrupt. So with the current setup
> > we only support edge triggered interrupts.
>=20
> Thanks for confirming!
>=20
> Klaus,
> I think we can justify introducing a work-around in the emulated device
> now. My previous proposal with pci_irq_pulse() is no good since it does
> assert+deassert, but it needs to be the other way around, so please
> don't considert that one.
>=20
> Also, we ought to revisit the intms/intmc usage in the linux driver for
> threaded interrupts.

+CC: qemu-riscv

Keith,

Thanks for digging into this!

Yeah, you are probably right that we should only use the intms/intmc
changes in the use_threaded_interrupts case, not in general. While my
RFC patch does seem to "fix" this, it is just a workaround as your
analysis indicate.

--b9PjqAhA9tYv0Qnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPI8R0ACgkQTeGvMW1P
Den7Xwf/as8sQo8Blioh/lVMAozoftSiWaqZ4j1NZkaqDVAIy3Pv5tjDEVW62NTx
O8zYegRxq52Iag48NGpvbeDY1nLJ050CyUKwrdb4VgqHOlmlSiHzqDIPV5I9AYck
EM/2UNp9hGczLZtP+Zb4D+32ih+IUBcLpLUE1shr3zKB/y5rb/Y9fKksGBtCifBX
+W6tiCm1v7IASYWtWNlZeJzfTLYcGIwWzqRtnq54I1Kfv6or71koCwNmQrUwt93L
fHsPdNsbJIjIPCSGUvH5nYU7O9TYzbG1Vr93NxUC1X2FbQIsnAtchXuh31hRNYlH
iqIAVkPtkHRNM+vce8uSGliwcLwDiw==
=O9qQ
-----END PGP SIGNATURE-----

--b9PjqAhA9tYv0Qnk--

