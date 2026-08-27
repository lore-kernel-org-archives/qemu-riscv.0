Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA1BC61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 10:38:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXU9-00054I-DD; Thu, 27 Aug 2026 06:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXU7-00053W-NU
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:37:27 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXU4-0006Rw-90
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:37:27 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4b1fcd3b1a9so1451665b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 03:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787827043; cv=none;
 d=google.com; s=arc-20260327;
 b=W6C5cmhylZIIacKXJVtJYB+PJCh4C5yL/gJbOjgfu58bRyEQE4attCfM3IyBnjqYan
 Iqw0aAX5X8s1doYAG/GHweUzI5RrYWmxu6Zk5g7szfzO4wfzkEwVuGGbJVmfNA3Rg1Kx
 XLlriTblhFJvZHBrXmmZawasgNT85eTH1+Cbv5MgZaaTnfMPkdjhmA+V/WVbnQpERnnk
 s6Wyjzoi3ZiEKfnNvVKumFzgiHTRm/9FmOyZNr4yjzyiJVH+a5ExB2HUtVZDpFR46Qpk
 MB4apH8Pk3HiaJxHPcDpOfKJXrX+6sGsMkDEP84hS4l0r1RqvWEtiWdhaczHfStXQHMI
 QkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 fh=vTT/wE/NCxtzfNbmZ+hcnYnaPWTwFdpS6gRbA+gKNBQ=;
 b=Nr21GWZE0TqV7JmIF/8GB3iTf6gYy1VGRW4a8Xw13iXPIlG5ueKovNbv28O9Rt6cZv
 xdvae7AI8HR/L5PxoSEY7vkLyVEtfbeZgqelgbqvvh2RNQHp7wnviZ9/m/9c5fQRPHvb
 NH6n3PpSdqf8WWSiFZ7wFLzaWhpdLTfu7r/v8IL4Jq4/dPhAsWvKHgXvIe9GYRDcnwpR
 T11NW094s9zgwCJ8rjz/F6QHKgBGRuDXnx7TN4bvhRZkFhfFJpuEC/Fdt2pq2pmtsli7
 S+X5EwLeNA8IvM/drCqlI7tAMrFbowLmO12jb/iH3V9S7uIP95ImGjcZBSmNbVCnZ41Y
 p6mQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787827042; x=1788431842; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 b=eAFAnMAC+pQ/C1lVpTJhDQJ56+rXaC+uvcNiZkr0DyRkAymbpnpf+mCBwLNkLc7d4w
 JwzFcpw6/oQya2LQ3kP1L8qgERbVVZnMdr1XZS7bc4iwTVSnXgtgC8Vq/IF4Hdy25ZtX
 tbQx9dwX8C/5MDBZHKsLUhKFkmJlMPwnDloyl5LAz3c8gZAG0acd4uCL6yBbcvGdY90P
 45fjLJtfXExMPWQGf52tfOdKB8A8dYD40dsoBfcWUJO5YMjPSbDlezGYS831J1xvRtD5
 +eVYadb8fHRFXKWUBrIJNooRwuU8ctM1k59PZb2oWnzJqBrJ8O0v+ERhl7wSYf4rkrF7
 EAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787827043; x=1788431843;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 b=VKeqii4MAANyDSUrAs7mdkPoSaGex5sy01PL961/i2cgCNASaMS3sUJzQOT6d3m/fr
 oYwntsXsQe91QZZ8OZVkcj1A0ZjG45Fv69dnSU0ZE/OREyB5nK/M9tWZaL2YmcaSvvxQ
 R5qqC6OZMz2UZWKwMuD+S+bZKjUYk/3hFP5EMWHCaoDQ59FpnLd7Djqo6m/zvxSdguNv
 MsbQ18iM56ba6x5BJ1aBBu7HZD829YbyayBKrolp/WeUdFyogoaWDvJFbXRuZ0pPSqwc
 dBgxBbc0beVF7LN15zrbiQUYGRBPUlFQmT+wgzv2dwsdkt4BQB73pRQdQ1J7bcuzKiuA
 ttGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUonzqNS5Ea9wcObXdRI9ZO/PkKVi+r96TKVzYe/lRcm75kiwbFj3BCTu8YWt4WAFeIFj+IjFmAhBG@nongnu.org
X-Gm-Message-State: AFuF++l1WxpsRAIww5lwbJmc3UO5QXu3di+ZGYtt3ij18+vg/DpudBWH
 EFnyanbRvs3+FNmyCfbm2IvljgOkH63MRXzkJ/yzFxTF7nk85IlCuGc9H8E/9h8raCTkSpUTrEy
 sQPyS0WMi3EygWmyFz/CVncf+fLUmGrM=
X-Gm-Gg: AR+sD10CcJGvEBzedqBzW8ZoDCH0pKqsQVUxOfue9XqBLZU+dtLXGlErKmpmRrmNzbP
 APl+zwU2da7Nt5c0hn+M+D3DK+khMkiHy7Z/n1Bqgd6bsK2IzdUS9aTpMLJrux1lrwL67ouRRjg
 tF/RKx0QYWDCMQcexNEn61YnIQFgCXbo1QVIv8PAOcqAIxs/c4KRdBKcnNB1OnF0Nu4lMzc8UQ6
 KcEBl9X7HK5YG2BIHyPePF9uS0MH1/Disw3DVncuzpxCA1kGnBQCEfdldFK7Z29xavbJjJ50tSG
 xqiXYdRUDH41Han/CSel0oxZGxk+NkaphOKLYtAa8dX49TrmrJEYb8Q4Mi2CHjCyLnKDDexNnMc
 yh5Lamg7l
X-Received: by 2002:a05:6808:1910:b0:4b3:880a:f08e with SMTP id
 5614622812f47-4b3880b1abcmr2250536b6e.13.1787827042685; Thu, 27 Aug 2026
 03:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
In-Reply-To: <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
From: Portia Stephens <stephensportia@gmail.com>
Date: Thu, 27 Aug 2026 20:37:10 +1000
X-Gm-Features: AcwNN1XcfRUbsldtwVE7ZLjcGTDazu0Fo4Mo2swVpAOsooTm6tjhILuszIFYo_I
Message-ID: <CACYNXwKU_UuhrBWHNFtYYmSfzRsUd5jRFjSc1++xvQHxPk6rew@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=stephensportia@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 27, 2026 at 7:19=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> >
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The ssi_transfer function comments say that it takes a word varying
> > between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
> > but there is no means to indicate the number of bits that should
> > actually be transferred. All child classes of SSI_PERIPHERAL class have
> > transfer functions that, despite accepting a 32-bit tx, only transfer a
> > single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().
> >
> > The current implementation depends on the SSI model to know
> > what peripheral model will be attached and what transfer size it
> > expects which is error prone. If a SSI_PERIPHERAL model was written tha=
t
> > accepted 32-bit transfers, it could not attach to any existing SSI
> > models.
>
> What is the motivation for this change?

The motivation came from reviewing the designware ssi driver [1] and
realizing how error prone it was. The designware ssi supports varying
frame width but there is no way for the controller logic to know what
the transfer size an attached device expects. It seems like all the
code, that is actually connected to devices, is just written to expect
8-bit transfers so it should be made explicit.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg1218153.html

>
> As far as I know for the hardware SSI protocol, it is indeed
> the case that the SSI controller (and/or the guest software) needs
> to know what transfer size the attached device expects: the
> controller just transmits (or expects to receive) however many
> bits it is programmed for.

This is true but do the devices currently model only support 8-bit
transfers in hardware, do they not support multiframe transfer? SPI
supports varying framewidth but the devices are not actually modeled
in this way.

A better solution may be to have multiple transfer functions,
ssi_transfer8, ssi_transfer32, etc. This would require the device to
explicitly set what it is expecting. It is challenging since the only
model's not using 8-bit transfer don't have any devices connected
upstream so testing is challenging.

>
> > This change updates the the naming of ssi_transfer to ssi_transfer8, as
> > well as changes the return value and transmit argument to be 8-bit.
>
> This means that the API will no longer work for a controller
> and device that aren't 8-bit. We happen not to have any of those
> devices today, but why specifically stop them working?
>
> thanks
> -- PMM

