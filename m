Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E04C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRtN9-0000gO-JI; Mon, 22 Jan 2024 07:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rRtN3-0000dL-Db; Mon, 22 Jan 2024 07:25:45 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rRtN1-00016i-5J; Mon, 22 Jan 2024 07:25:45 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 398D460B66;
 Mon, 22 Jan 2024 12:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9295CC433F1;
 Mon, 22 Jan 2024 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705926338;
 bh=V9BR7vi0GPG2x5l+LHBGrG65eiQhV38pQHJg/neQDLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LCbrIXjmq8dOZzKuEXbGDDqR3tBs44rKj5LESchFLn1RJdMeVKkJm2TBAqWPZnDMA
 5HWla8uB4kNpdDIv8gjY+EDgOsFVaYztYt3StjNiGBKOTqGeEJsUOS6oJrX3Y64oTB
 KN1i2HjY8t7bClo5abytO4U/7DNDZwakZvHiExEwSgvCqpgesJemRl8/nSZsJ51fqd
 VCN0jXXgwFfCCACcIJPVFbyzPRvMnlAJ6Y8PyxAzEZkyOqKGtMINwxZ+tpaUo0LTeG
 31Xx7YKtAvWm2B3kabth4obmexLccP9Jd++Lu4bDk/4PN7yx24p6X7rdbBGdj208Ol
 ON/LTKWLgXAQQ==
Date: Mon, 22 Jan 2024 12:25:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/2] riscv: support new isa extension detection
 devicetree properties
Message-ID: <20240122-reflex-tinsmith-209b2e56145f@spud>
References: <20240110-mold-renovate-256db1b5c70e@spud>
 <CAKmqyKOy19Vy5zm8=9WZmUs3H=aL8Tn49-iXu9LfEHtHJMpadA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zUZnWFLyLFqW7N0x"
Content-Disposition: inline
In-Reply-To: <CAKmqyKOy19Vy5zm8=9WZmUs3H=aL8Tn49-iXu9LfEHtHJMpadA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


--zUZnWFLyLFqW7N0x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:24:19PM +1000, Alistair Francis wrote:
> On Wed, Jan 10, 2024 at 8:27=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Making it a series to keep the standalone change to riscv_isa_string()
> > that Drew reported separate.
> >
> > Changes in v3:
> > - g_free() isa_extensions too
> > - use misa_mxl_max rather than the compile target for the base isa
> > - add a new patch changing riscv_isa_string() to do the same
> > - drop a null check that cannot be null
> > - rebased on top of Alistair's next branch
>=20
> Do you mind rebasing on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next again?
> There was a big re-org recently so lots of rebasing is required

I can, sure. Do you want me to introduce the macro that I mentioned in
the first patch as a helper for misa_mxl_max -> width conversions when I
do?

Thanks,
Conor.

--zUZnWFLyLFqW7N0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa5evgAKCRB4tDGHoIJi
0r1ZAP9wzZg7sl+OsEL8lSQCrAkFSv4hYosJaBfb19CBH1PnrgEAh7nzQoZAT2jW
4b0sOE+t4ZI5+FCYwykd4HeDX4kcDwQ=
=UmP5
-----END PGP SIGNATURE-----

--zUZnWFLyLFqW7N0x--

