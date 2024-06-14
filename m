Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90EDC27C4F
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 00:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHv0h-0004QG-7x; Thu, 13 Jun 2024 20:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bithamr@pm.me>) id 1sHv0d-0004Pw-SF
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 20:41:40 -0400
Received: from mail-40138.protonmail.ch ([185.70.40.138])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bithamr@pm.me>) id 1sHv0a-0006MV-A0
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 20:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1718325684; x=1718584884;
 bh=3c3PnbKNbdTi0QsZtUCC7xizS4HSHy0nMsicKpwv5vo=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fphOdt//Ai9LJRkeCBEKbiOysbEGzK98N0Rr9ylL2Nw6LlFE11+M9Sf9X4rV9zc9N
 z6a9Xa6GKgokBWy9FxND6Z+TLus9uccHdkcF6U90ulMA3ELPMEDNhXBRY5uQt4h7X7
 45QYMObWDdfrsfI4NO2/3a6vHC96BcmIFuyD3KcGyap2zm3nxocfggUCktZOjTNOPG
 bZoetcr66Y3LSaF2ujaE/S/OEWC8LOw2toLKK9glG4QdEf6o8vbhJbFkWEETYS1/vC
 wmHJBG9W9u92Fhbj+C1j18x7dPzh8Zy0ony93mnNAYlUEksEXclg3epGF9Bs/ZVGZp
 esiCh5vaAnHiw==
Date: Fri, 14 Jun 2024 00:41:18 +0000
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
From: bithamr <bithamr@pm.me>
Subject: Can I utilize the RISC-V vector extension with QEMU?
Message-ID: <36ZoNSXT5RGlpioKZQ9MNoGQIkfIrbYrGvZoO1dEDYPislzbwlGo7eHJBx8vPfhwKiJIBnSkbMw5umxr2WuUltrDIRBvnl8SW_6hKyb3YCY=@pm.me>
Feedback-ID: 54625483:user:proton
X-Pm-Message-ID: aaa085ce4b8e064309c908cea1d5c27aac2b811a
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="------52816fef11c8d027117d6d504a37b10cf5fbbcb51210a6bbc0d84d7e05016c56";
 charset=utf-8
Received-SPF: pass client-ip=185.70.40.138; envelope-from=bithamr@pm.me;
 helo=mail-40138.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------52816fef11c8d027117d6d504a37b10cf5fbbcb51210a6bbc0d84d7e05016c56
Content-Type: multipart/mixed;boundary=---------------------4a4498a68aa7cb1fb0547d73db951390

-----------------------4a4498a68aa7cb1fb0547d73db951390
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hello!

For the last few days I've been trying to see if it's possible to run a RI=
SC-V QEMU instance that has v1.0 vector extension enabled:

https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc

I found the following documentation:

https://wiki.qemu.org/Documentation/Platforms/RISCV
https://www.qemu.org/docs/master/system/target-riscv.html

In that documentation it references extensions, and how some of them might=
 be enabled with "-x", so it seems like it might be possible? But overall =
between both the wiki and the documentation is was unclear if any of the v=
irtual CPUs present in qemu today actually support the vector extensions (=
and if so how to enable that).

What I have so far is a copy of Fedora running in a RISC-V virtual machine=
 for testing. I found the following virtual CPUs come packaged in with qem=
u-riscv64-static:

```
rv64
shakti-c
sifive-e51
sifive-u54
thead-c906
veyron-v1
x-rv128
```

However I have started the virtual machine up with each of these CPUs and =
tested them using the following program:

```
.section .text
.global _start

_start:
    vsetvli x0, x0, e8, m1
    li a7, 93
    li a0, 0
    ecall
```

Each of them returns the following:

```
$ as -o check.o check.s
check.s:5: Error: unrecognized opcode `vsetvli x0,x0,e8,m1', extension `v'=
 or `zve64x' or `zve32x' required
```

I'm kinda getting stuck so I thought maybe it was time to reach out for so=
me help, I really appreciate any you can provide: can I, and then HOW can =
I run a RISC-V qemu instance that has the vector extension present?

Thank you!
-----------------------4a4498a68aa7cb1fb0547d73db951390--

--------52816fef11c8d027117d6d504a37b10cf5fbbcb51210a6bbc0d84d7e05016c56
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsFzBAEBCAAnBYJma5GeCZAUo6dGQ4CzFBYhBH4Rxa3nTlftOe+0nRSjp0ZD
gLMUAADIZRAAkiyaUS0lMplJokpkCR3uizutc/uQFcT2K9Dym38zcndrXJS4
GgQyllbcg86yVvj5Ge1FrLQm5VOW9AX0vmJW/auQvc3lgiIXd6LRxXckykuV
9e4B3y+iQLhn6lB0EzkBd33RVOVhxDUJisHGTYOpNgKFsGECIJu9T7HQfaQU
VtkjFJ0fm6VYlPr5NAnyWE6WA/luDcbwT7SnBfPLWqipXVWMd0TU8mFMnFke
PDPEpK11eq6tIO2ZPetCHdTVy9p+HU3bfVySyPtYhLTSzPPgIDNmC5dfyQer
yGzmxiH+E9OPvbIMpDhSceEI/4vtdM5AJpNQLYBi7QU2UM2q9nAFgmC8jvPD
E424Oc8k5P5XLrqNaFNshtJjqr2osgKtM1h70kevA8XFdt62umqvgpf4FfQ4
S/DBzof2+2w091uVCARk214fON8WWT+D4gNvQm5ZzGGeNILV/tB13ay91A1P
5LiooFKTC6qENIdzOMiLeMIxhIciZULpyQ1v8mpbMDsaKpw5ZvPJLDWzdRk/
YH3vVufNtv4YeCGwP+VQLxuxyl+KtbHc08A/bH/snELsXnBmtjtdZsyE0wAc
HFUsNbagdEWcjSg37TDQld6TdMLt5ZpcnGeZVgBTJB671iMzPQrTuI0gRcny
awWCM2+/8PiTTqlZdlriS9nTFDmy9qVMp1Y=
=ePvi
-----END PGP SIGNATURE-----


--------52816fef11c8d027117d6d504a37b10cf5fbbcb51210a6bbc0d84d7e05016c56--


