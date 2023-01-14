Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGhYG-0002jm-2i
	for mharc-qemu-riscv@gnu.org; Sat, 14 Jan 2023 09:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pGhY8-0002hr-HZ
 for qemu-riscv@nongnu.org; Sat, 14 Jan 2023 09:30:26 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pGhY5-0005Dg-L1
 for qemu-riscv@nongnu.org; Sat, 14 Jan 2023 09:30:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4201660B42;
 Sat, 14 Jan 2023 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEB4C433EF;
 Sat, 14 Jan 2023 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673706610;
 bh=Pl0+C9LzOQU3BhGL7BLYAYlyhYrGrlzHcNe6ifoW2W0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pRlmKKsWE7XHiZOd+oWm/ozhu77eAEccf3M44tctsq6uF22Z5aKSQ+xmvwFjntzyM
 ibxuW5vc/cVP8ngWjBdZnTUlkmOtcbokSTiVkeqChlRbnjw9ELY0sF6ReSmBFQWk7/
 DUU6uWBujAbJxMGstnDnzJsWiqgl2Ku7KVMOzyHedRchAon0W9SGn9ExvtSWwjSwX5
 mTOX0bKcCJWmIs6Qz/tKxwR4rmUfJ8468wjvG+J6WsKYmEkG0IfKdWKFyD8Y+x3Cp/
 7uilz+SEeqSqiEzpMokPg/A2N2ZJC84vzfRrjG4G9VYtll73zskXQyEyOV95frw+E8
 6rPyZVEKDFUcA==
Date: Sat, 14 Jan 2023 14:30:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: stage TC <stagethalescristal@gmail.com>, qemu-riscv@nongnu.org
Subject: Re: qemu icicle kit es
Message-ID: <Y8K8b75lWE2eXZwz@spud>
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
 <Y8BLZLw6gP4hUpyy@spud>
 <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
 <2882065D-831B-4E8C-BFD3-677BB8ECA2AD@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qaLxkvU7yOL0xQ3H"
Content-Disposition: inline
In-Reply-To: <2882065D-831B-4E8C-BFD3-677BB8ECA2AD@kernel.org>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 14 Jan 2023 14:30:30 -0000


--qaLxkvU7yOL0xQ3H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 12:56:57PM +0000, Conor Dooley wrote:
>=20
>=20
> On 13 January 2023 00:35:11 GMT, Bin Meng <bmeng.cn@gmail.com> wrote:
> >On Fri, Jan 13, 2023 at 2:03 AM Conor Dooley <conor@kernel.org> wrote:
> >>
> >> +CC Bin Meng
> >>
>=20
> >> Bin Meng, you're listed as a supporter (in master anyway) but is that
> >> still accurate? I figure there's a good chance it isn't anymore?
> >> Have you tested the platform from HSS init at all lately?
> >
> >Yes, I am still maintaining the QEMU PolarFire SoC. The WiKi page
> >listed the exact HSS version I tested and if it doesn't, it should be
> >a regression in QEMU. If yes, I would like to have a look at that.
>=20
> That'd be great.
> I submitted a few patches for fixing the direct kernel boot & hopefully
> haven't broken anything!
> I'll try to test it also, if I get some time.

Gave 7.2.0 a go yesterday afternoon.
The URL from the documentation is no longer accessible, I cannot wget
the image! I'll try and find out what happened there, AFAIU that FTP is
still in use, so dunno why that file doesn't seem to be there.
I'll try to find out.

I dug out the commit from the docs for the HSS, built that. Generated a
payload using the nearest payload generator commit to that was
compilable, which I passed as the image instead of the wic.

The HSS would load, get as far as trying to extract the payload
containing the next stage bootloader & fail. Specifically, it was
complaining that the magic number for the payload was all zeros.

Perhaps if you still have the original wic image you'll have more luck!

Thanks,
Conor.

| qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
|     -bios path/to/hss.bin -sd path/to/sdcard.img \
|     -nic user,model=3Dcadence_gem \
|     -nic tap,ifname=3Dtap,model=3Dcadence_gem,script=3Dno \
|     -display none -serial stdio \
|     -chardev socket,id=3Dserial1,path=3Dserial1.sock,server=3Don,wait=3Do=
n \
|     -serial chardev:serial1

btw, I built my QEMU with `./configure --target-list=3Driscv64-softmmu &&
make`, and got a complaint from the above command that user mode NICs
were not present in my QEMU.


--qaLxkvU7yOL0xQ3H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8K8bwAKCRB4tDGHoIJi
0qnUAQCU28JUbzk5FXczBq7yOVcPEvvK618bEAS9SXf8NNhkLwD/cGvAg6fu/FDz
TnKyv2v67T5gVTJun/YkvoitAHNs8wQ=
=S6xP
-----END PGP SIGNATURE-----

--qaLxkvU7yOL0xQ3H--

