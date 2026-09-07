Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CA9C79F9E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 07:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3Taz-0007Ul-N2; Mon, 07 Sep 2026 03:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3Tax-0007Tu-BD
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 03:16:47 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3Tau-0001B7-Rv
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 03:16:47 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66c9995ca60so3999657d50.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 00:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788765403; cv=none;
 d=google.com; s=arc-20260327;
 b=spazt4hAq/py0awcdvd1Lq3ojYdIzqxPtEzC1RJ0mERDNClYnyaGSdfokK1nUprBMZ
 iDa79ZvweWRcCmnbmSD7ZSpGbbPsNT7VXEimTl3kYLZK86+xbY9m3aTZfXBGVZ0VQ3ZP
 YICzbv6HZiOLQhFpVkCBNG2PFcxfAGk+FMruXtnxwI+nxcijADmWt9EG3rDFEBzetktX
 wQf0a6W925He9va6ct+/L8TajRBWcupp4HJ2l4ePnELZAg1Lqop1QM6lSfEWEzktD0AP
 IkxQcI7Gw5EOx6XORe0wUGIxDA5aRaZVwqPap61H8AzsBbBkC90T9HkwzUTX8bpHztng
 3WGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QCti3rgeZN1YIm9TfGLPl2KhexTOFxw/SKTwmPEtp6A=;
 fh=31GbVEmt9EZcQfvn86eg8upc2n/2zOZnfKaotVu+OLI=;
 b=LU+DC3VwvUp/JGOrpyqwFCocgoPH94xFPN59ZCZfTLVj7jQAywZiXsScPB6bf7Eujr
 pI+UR9ip9PyU4nRdhij3lOLk70NvvP5nIzGiU+4aYHjzRTm/TD2yjsgewoeLP+7kWI5N
 UuIDGaT3Xi+Xu7TCTsDd7BDN/0Lk5jbthhTYHWKbEJdR+qjnR5MzuawJ9Z8DZGDxLt81
 oAeeGzuVICkwW8o2ZEEERDO7lnSZNELGMYgoDcXS8qajsi1yYaUc/9brx7+hhDQDYCbD
 9V1u56iDiI6FnmoXJaWJCUxIJujYl0vGTS2rwYoDLA4UAgHyGe4nTtQy5y3skcX2FK0s
 JGpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788765403; x=1789370203; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QCti3rgeZN1YIm9TfGLPl2KhexTOFxw/SKTwmPEtp6A=;
 b=Wl/nNtMYIJfudq/VboAi7rx4VReWTRJ9fVOZCbraBRThdjhB72/SnsIqufmsh1D9oL
 k/nBewySlYg7BLwM68crPg1ZzCJeHxhiQ/kswiXjA0wSu+s+teCGt2sVFdTCuiJShjw5
 rxTJ7eB84jqAb/BFX/8CnjXBScPvEzaGwA3To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788765403; x=1789370203;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QCti3rgeZN1YIm9TfGLPl2KhexTOFxw/SKTwmPEtp6A=;
 b=LFssFg/PX24IDRj/hF1i/HCW2wZSBIWVst9f1cBJzYinGWOLEL4h1twFSBeJAGVkHp
 8OoHOkabzQI0tt9wz7GuwH4OLqzGsdzkrujCKqErFVXD4ST+ipsG67o1g2nZ2UzoiBau
 O3E1ox8e3+G8F95XEmBn7ZU4VR5TH/r6nHY6QgTSdMw5rLB/Kj6+DeXzQLo99htpYIGW
 jGBL7VkP2WSO6A5BNyUpgH5ZYl1sWwgqekgimaPkuKP4LfSyPdPG4dvBl64QGwcivbcr
 GqG426DNfFgprr/2vUojj/QGuo3/Ld2CBBoCjsZ4CNMWrZJYMsJ8KKKnnnz2hCmIl2Py
 XGKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9se/Qgf3Y9KTPA830OEFPWPsmwpY7oIrCScny8ymbhaWsSvDZuK34tGjSoQ2XlcXU7Pwpge6413/1@nongnu.org
X-Gm-Message-State: AFuF++m3B7zbE5tfRkychlAiUnImNJfEGzg0rlEx2H5GXTONTk0Ik8Iz
 GC87DDYCdv+YcrfOpgIoQA7gxbOzkToVd7eqEyEwE50HsnqUbSbc/PWMhe7OBc8SAI+jByuont2
 +aTypFlpU7JGOjzNHaSOAJD8VbkN2qaM=
X-Gm-Gg: AYBFou3R/ZIzyX0i/vYUkhkLQ/mDQyMrCcayf2sbGnOWbBYg2tikSu0/Fdi+9bEzvJR
 0jefTSJ2hfOmQ2oV3vhHfP7nzvD/mUUefH+jI5jrF5JCrYwhydHNrYxAidSWrABeAu6zLs6B/Pc
 m9JgMPNnrKi2UkULsqHqfhEZzp+TYNEhTrSBOPz6FHBMJ/1SoYOWoa+k2m6JdGp8Kg3d5dMcrHU
 nRr3WPZ5aQfjR0yOW4jmdxdrLHxU6QzOoTB+ebNGtBBYhjlihYGiJQA+vb+VQz9Gi6vvDOYkWqI
 PoUoldCNbEIVOhTZzCUXyOIUnHPJ+m+C6kV8kuLbGHL3/MFna7H8AAkYW2Onh0BEuWT9BObuLz/
 OHy1fj9Snwi2cOq7i7EBeb3TNUdxRHjTcs5dB3xBwUnLdgsSOcaHTx5k/QMrxe1CsRReq6ZmmZh
 exwIS6gWlwvzTu1d/tUcAUCp1pGIU=
X-Received: by 2002:a05:690e:42cf:b0:66f:c1bc:4058 with SMTP id
 956f58d0204a3-66fc1bc4289mr1725167d50.32.1788765403506; Mon, 07 Sep 2026
 00:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260903055131.257903-1-joel@jms.id.au>
 <20260903055131.257903-16-joel@jms.id.au>
 <5d681d59-4a2f-4068-b36d-4ca40ab7b921@oss.qualcomm.com>
In-Reply-To: <5d681d59-4a2f-4068-b36d-4ca40ab7b921@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Sep 2026 16:46:31 +0930
X-Gm-Features: AcwNN1UcYx2HqbMD2LOa_8r0qgM2x62xIoq0t9zrFPpADh8wMPNrLIavJiosD5I
Message-ID: <CACPK8Xf6Lot-Vs1-=iF+UoLZ=qBoRHhao6Z1FR8JC382qKLXBA@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] hw/riscv/atlantis: Extract an Atlantis SoC device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, 4 Sept 2026 at 20:17, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 3/9/26 07:51, Joel Stanley wrote:
> > Introduce TYPE_TT_ATLANTIS_SOC and move the hart array, AIA, ACLINT,
> > boot ROM, UART and I2C controllers into the new TTAtlantisSoCState. The
> > machine keeps ownership of RAM, device tree generation, firmware
> > loading, and the board-level I2C slaves.
> >
> > This makes it easier to compose the SoC into a more complex machine in
> > the future.
> >
> > Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   include/hw/riscv/tt_atlantis.h |  21 ++++-
> >   hw/riscv/tt_atlantis.c         | 144 +++++++++++++++++++++++---------=
-
> >   2 files changed, 119 insertions(+), 46 deletions(-)
>
>
> > -struct TTAtlantisState {
> > +struct TTAtlantisSoCState {
> >       /*< private >*/
>
> While here please drop these legacy private/public comments (QOM
> style doesn't want them anymore).

Thanks, TIL. I might send a cleanup for the risc-v tree to set an
example for new code.

Cheers,

Joel

