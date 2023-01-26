Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL7MD-0006hk-Iv
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 13:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pL7LM-00063a-1x
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 13:51:28 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pL7LK-0002xX-GT
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 13:51:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 331C9B81EDF;
 Thu, 26 Jan 2023 18:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0962BC433D2;
 Thu, 26 Jan 2023 18:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674759082;
 bh=8CAa1ig598cZkMIBh8o5mGnF0bobz6eP88r0ewRnrDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T4Zx4L33ovU7AMv75Rrg1dakTiIStUdxiGfrX/xb3JoJADjK0MoyMIX4FWcpLBy8H
 yq3G2JG7Kyjoib7pQor3GkC1Wj7hVyGAfZsr6ZJH1HID/FYKmEEFq+/8S335T4G8JL
 ZvHF3IA8QPL3TOysFhCc4NnrA0y/Z2bCkGgWaNAvUqI3Iok77KPJt+NNtZiksvwtVh
 YCPdZ0mGRz6g7EoLCr5TZkAYvc4BmzhJD78cehUxKuF03F/BWeTF0frhpVtTtU0x1N
 nfHF3vNKYKEa1O6yQuxPAUHWQMMa3GKaMX8Wa0g7A6fzcRxc4SF4TL4k6iXW+czGlL
 pVcf6xGj3FpeA==
Date: Thu, 26 Jan 2023 18:51:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: stage TC <stagethalescristal@gmail.com>, qemu-riscv@nongnu.org
Subject: Re: qemu icicle kit es
Message-ID: <Y9LLp8RXXtB1zJeD@spud>
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
 <Y8BLZLw6gP4hUpyy@spud>
 <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
 <2882065D-831B-4E8C-BFD3-677BB8ECA2AD@kernel.org>
 <Y8K8b75lWE2eXZwz@spud>
 <CAEUhbmWuXChi+w8e0igqppAdqi=2SLzwyd6te2se-PY-B9De0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZxGCtcIMQTSP7Q9y"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWuXChi+w8e0igqppAdqi=2SLzwyd6te2se-PY-B9De0g@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=conor@kernel.org;
 helo=ams.source.kernel.org
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
X-List-Received-Date: Thu, 26 Jan 2023 18:51:28 -0000


--ZxGCtcIMQTSP7Q9y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2023 at 01:45:58PM +0800, Bin Meng wrote:
> On Sat, Jan 14, 2023 at 10:30 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Perhaps if you still have the original wic image you'll have more luck!

I can't find exactly where I mentioned it, but I asked around about the
image that is listed in the docs. The answer I was pretty much "if it's
not on the FTP any more, it's gone".
Unfortunately, our Yocto stuff used autorev at that time so I am not sure
if the image would even be re-creatable.


--ZxGCtcIMQTSP7Q9y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LLpwAKCRB4tDGHoIJi
0g3iAP4wmsULmO9ADfe0LQVGpcc4+q3+7mMxadCG9McI+Hop/wD+Nm+cVux595Rw
9OwHtNF2f9Wb9dBfUpRptSQEcv2ppAA=
=kKku
-----END PGP SIGNATURE-----

--ZxGCtcIMQTSP7Q9y--

