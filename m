Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F92CDB466
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 23:58:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbS3O-0001gx-AI; Sun, 21 Jun 2026 19:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS3M-0001gU-BR
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:58:16 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbS3K-0004qG-OC
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 19:58:16 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6919f40a0c8so6845040a12.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 16:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782086293; cv=none;
 d=google.com; s=arc-20240605;
 b=McZCow3MEziMt1GSlXmh1qf0y7w1qmypnlJyZnbIdEs+iHjh5Fe1543YXktGyuVXnI
 w0K16/hQ9hZgvUdAIfmDfBOE1wPTyFULEx/IZIvCQDCjfMh75/2MBDbcasNInvMVZuz7
 fdbnhm4Ro1mTkzCVLj7PYZ0CfZd9Hgq7Lu9i0K5p/8YaDTC+xVyAjhnPAbbkHxwGT17v
 TqE7do/Dlq29sDA9lYXEnvD8V3bFdYsQlnsvR8vg1+sxNlw41prnwj+0JOexrdANDln6
 LFVaZmuefCucYTGPn7ZHnQUIvnbDs8Gvrgbn3Xa2bsxaLXbE0fyFqBTFB+KF7aDavSHT
 Jz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2M9dSVH3v4ANsnK5FFfYjMxt1yfWmN6H6XpeXKttUwU=;
 fh=34RNRiTM7bnRHdRZbVsIlH19RvPRCOTDznbID9mCQ98=;
 b=YfFyvSmJgXoFzicRooaEWJTMUVYDSSG8t0Z2RUBAaI2Iw0Hz5MhVDMS+3YyurwnHhF
 Zb4Zoof4Lu8S5wXVW+lJHjGjHKVR/M7odsKShu4Ns05JBdsXeHfqSjq8jq69hy2CFMOE
 xin7MBVMVWqU1yVJDQmJzWsgfJ0CiBVeGMrquJW8DZDnrX5V6P2wIAJGKkXQKm8MGUWf
 KIVm79mkrXAFgRN3e7qrr/Xut2n5fhCIjhqMCEztz4etVXDnApFhpHBZWvilGIc5YcW4
 9YAdk48C59SnlgEksEEwvhMRS1SiPeTeY4hQ9m6Xz+UJhEueRopzL7npAbYC3n8WDgx/
 +jlg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782086293; x=1782691093; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2M9dSVH3v4ANsnK5FFfYjMxt1yfWmN6H6XpeXKttUwU=;
 b=F0dkTbFFVN8xkYgiOcRarUSQDmTN/SSrBxS2QwLqFIqfv6Ak57HqMdICamw9S8AEeh
 zeZNtKM8R+ZZVIW2sL77FU6ASeAgdRkhwJtcleRqR+6Dhk+y0xc3kIqyGIVnnZUHRUY3
 ypKU7ULrww5DrEaCSlaIhBQfpmAygg25rEr0a9vNbvAT5zoc+Rrh0+T7wysUiJrj4VLu
 JwhQ0+2sL0kMqLnzTc+YDgESykkVS/IEorXf6wzqBhGuNxJoFEmcoodjTTJ9sLWVjuMX
 3iZ73Yo4OWVdxKO55AP/SGzN1dcuoNb/SrNU/7W8fqGKidwR77EI5E6fRiblTRZpq5hH
 8GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782086293; x=1782691093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2M9dSVH3v4ANsnK5FFfYjMxt1yfWmN6H6XpeXKttUwU=;
 b=O8SsVj22L/4Rki3SvFg/jli3nyckMC0MJklbxkMreXxia7QWLfG3v597hQXx/wr6F+
 9v4Kz0/RLJeLx0csogsJ2DvhnnwjPc6WqjrNrwumVemgvtZFPedKkPl0eN1A1g2baWFL
 O2zcLTELTsdManBYah79VMC6qczabz8pPaBoFuAngyBBppL2RSAqdav8MrnKoip8Mr+T
 WU36iqU21eurGMEWJjiVMlldvB6fih3lLNNnwpaV0/2sD34uGQYO68Cpm1cbzbL7qqwb
 78EJOymE+s0o/Y4xVls3RIXj+EbAUGxQAhZYVyHJmY0jzbfCXN5EZ9tohWnqRf1EdIrZ
 DcLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AJlIi2QEpJyV4rN2WI3CjXOciibHtQ7cZic6W6TjVIv+FjXecUiANk9ttJPTr4HpgamofA9Zpv9fp@nongnu.org
X-Gm-Message-State: AOJu0YxOQrgnTX3jpYqmsmBJ4Up44jv+dkoixzWflblI4kae5cgESu43
 n5kWmM42CXN9++tGr+wNsw0u/0z4CwRcfkag14IfwdG3pNTw0LEMJeBhyab4bN4OGux7W9Oh11F
 JV4ey3EBXOkA60q1ZKTClNlb67D47z6tXuG9ziWk=
X-Gm-Gg: AfdE7ckLkojBX/C1hERm0wAMN3s+o4d3W9gdwm8fz5HcxXGXc/aBqEIub7WTLIo5cwY
 GHt/DRxpvYNJwEUJ0PPvKg517AF5MZkL5cPjAjCvfTth3JxDl0dqCVS/OcFB5dP89bS9rTyllxR
 oIm8sbRA8TQnq07M8rgEfQphHd9eKdS9D35HjBI1mixQajK1l0KctZVSwdxxAgSPv6qf29HzlTo
 p8LDPCxbG4AqiQrEC7PSKs6KoibrcwB4BMaFg/qWJzsMdFb/tv+I0ftEfbMf7FOVm3ifpwlOtgi
 KoSdSOTpjFbJEE1RovCLJIl3pzM=
X-Received: by 2002:a05:6402:3705:b0:691:afd5:77e7 with SMTP id
 4fb4d7f45d1cf-696e51067d0mr5733317a12.22.1782086292772; Sun, 21 Jun 2026
 16:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-3-joel@jms.id.au>
In-Reply-To: <20260617054034.1020724-3-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 09:57:45 +1000
X-Gm-Features: AVVi8CdZfgkHCFwtNXGQtx5vArKbqxAwAaTvMFid-_pX53iQTmXXW-LJzIg5kr8
Message-ID: <CAKmqyKMFMtR4UQfNOtNB-GT8Pd9_WZKkA+ECpSv_cbBob60j7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] tests/functional/riscv64: Use newer kernel for tuxrun
 boot
To: Joel Stanley <joel@jms.id.au>
Cc: alistair.francis@wdc.com, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 17, 2026 at 3:42=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> The published tuxrun kernel is 6.4 which predates the introduction of
> AIA support in Linux. Update it to a 6.11 kernel, the newest build
> on the tuxrun site.
>
> Boot times on a laptop are slightly longer but still reasonable:
>
>                        | v6.4.16 | v6.11.9
>   ---------------------|---------|--------
>    test_riscv64        | 4.82s   | 5.56s
>   ---------------------|---------|--------
>    test_riscv64_maxcpu | 4.94s   | 5.30s
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/functional/riscv64/test_tuxrun.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/functional/riscv64/test_tuxrun.py b/tests/functional/r=
iscv64/test_tuxrun.py
> index 0d8de36204a3..43d1242be52b 100755
> --- a/tests/functional/riscv64/test_tuxrun.py
> +++ b/tests/functional/riscv64/test_tuxrun.py
> @@ -17,8 +17,8 @@
>  class TuxRunRiscV64Test(TuxRunBaselineTest):
>
>      ASSET_RISCV64_KERNEL =3D Asset(
> -        'https://storage.tuxboot.com/buildroot/20241119/riscv64/Image',
> -        '2bd8132a3bf21570290042324fff48c987f42f2a00c08de979f43f0662ebadb=
a')
> +        'https://storage.tuxboot.com/kernels/6.11.9/riscv64/Image',
> +        '174f8bb87f08961e54fa3fcd954a8e31f4645f6d6af4dd43983d5e9841490fb=
0')
>      ASSET_RISCV64_ROOTFS =3D Asset(
>          'https://storage.tuxboot.com/buildroot/20241119/riscv64/rootfs.e=
xt4.zst',
>          'aa4736a9872651dfc0d95e709465eedf1134fd19d42b8cb305bfd776f980100=
4')
> --
> 2.47.3
>
>

