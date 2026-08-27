Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D12FC61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzWGv-0006S2-8J; Thu, 27 Aug 2026 05:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWGt-0006Qd-LS
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:19:43 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWGr-0006nZ-9W
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:19:43 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-81ed2a06b9eso19529487b3.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 02:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822380; cv=none;
 d=google.com; s=arc-20260327;
 b=OTtvh0LGTbZjfTP90dKfSBte+nzw0+aAK3UwqUNg/vOHs+mVDceFjOPZyMI2vaWRc1
 96S3iOyO2+sTBomtIT/2ePMZfeTXGoQB2Y/2Etnolc/hcCjRPcZkawKZD1tc6jqHX0x6
 PEzZi5hrkz6oe5bLCQOe2KXpftF2tA4bX9AU19dGmwbbQ+YcYxFYZSG0v2uBNmzC1RX7
 QzymHY38e2LO4pQl7NuvWOV1D6y1uWhyz3Zutw2nnIgqjQHrZqgRngc4Ao0qoXkgMni1
 FMzpo8d0QpBWGnQ4q1s2/jM7jI1jmdRAaUDtMGsjK4bf0ahIj1tYO8vA4S+r+nzjc5SB
 yFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 fh=d+mXN49x8/lkjWtcnLqjuojG2fXIKt2GGrudJtzJnTE=;
 b=bTwrt07+faB0GQaAG/2VeaBLxRk7RNmC8CYt+VbqxffJ1NHWA2gF6BBDLKopa7+v9F
 N4F7Up0CEJqrICZj+NYyrJQ+h8uzUGsUYA1QJhlYz83/OtnP0DdG10q9x0AqWD78q8cV
 vYEV1VzRCBkfUM33lQ3rHYX0NvTINXQqqo3W1gis9EupepKoeQBlvo0PD4XmMotY4B58
 XJ9CzODOn9p61NMtjw0dgU7MmigbwleNyboB1M4CqpHw6gNklmfcgVmmFqGe38e+V/WV
 UU9Zu48ZqoXTV/oheil3k3rsuBaNR2XYbPWu8QnO6WmmvAvSm0AGm43YF/8jHQ1JMoq8
 9aQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787822380; x=1788427180; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 b=XUdCcVbI/QwKV6f9tFG+o0UIW6drN2qgD9xyBFNZgOKsYjAjZdE7L0TBGlmQ4KmjNn
 0EGvgzJBpSS8aB15x+h9XRUyUujyg9oiiTdcRmX7FGxlBZLX/zj2E5BqObas+alyNd7p
 isAn9/Wg9RNxztKU8KpwxPCCo3nmXWCOkUS6sChkVs/Cysc3vFWEazluPihTRvTjGhP6
 Q31VtomgHrJyg5R38CapOIos8LxOPoSR9K6/38q0mkevrLwvLX3WjOjAQIyza4ujcS1R
 zB+Z6XjyeKPU9AQ1l11+b2BFS9Dc8bwDwTo/dXsTE28EKoDJyNbEhnPO3E2OcxjK7jlM
 E80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787822380; x=1788427180;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 b=B/NN/fm3ES2YC+COj2IMVl540virKjeA7faUBooKk8PL3rdf2YAouXcSVAtvHk2G2a
 MiX4sgcsjOwl6yugIZPnSFpF/8gke0vm2PVimSQb7eqFscTTFT5V0QGHLmxWeNYn6k3W
 xOkuX857Mp2Fw5EpYHfWk7wbiRqvgi9x9bls5k5uBXJ86iQ3KGVgdT5htbENOT1ueOYq
 3lc3ekdGLIJH3VNYEI+qY8aZSZo0UBP+MQB8UXxBIifs0hcV1dUuaG7Kc8Pwz6iF0kn9
 OQhBE1xYo0ZBCI1dDcpFzkbF4fyLD8oYIS6Ua0eFAOYoaiET5c0c19yp5pHPVHMhyPSb
 HkCQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq46vuZScCfLlkkIKKfRkQUIgL3ZUKgu+kmEjFvHSmi6tDbz9C4+j/wpFEFGBmKRs4Q0xWUri5G9AGs@nongnu.org
X-Gm-Message-State: AFuF++kVxzctbNxHBNxpKeKEjTsTZW9lR+RoB2i0fqz7i7p0n9b9u6iv
 d+w+QFAleJd8NoFCgVvLlyey1W5tI9EglgKpWBb4LUI/SA3GkBgBGn1krAx8FXuNwq7026GMDly
 efcUOqbj835LWlp+CvBFiZYwXbqCBNITY1mZWoGFB4Q==
X-Gm-Gg: AR+sD11Vpp8xSvD9yzqLYsBayIc2K9/ZwyZId59zM4WX4S/AHV57WucnOktVQEC+GLx
 /q7aL/Kr6ePTbbcHorvED8v9yR1GPPuI+o1CRYeNWxuUPvvxQsNmaA0UhSaxaGeW1rAGeXgUsp0
 5I9tDm5kcYQc07Pb9XjTnZzFEVTmrsjyUNZWmGsf0CIFD6tCaeUAvAJmbHGhbhJWwtSUMGv/HPC
 00a6vGAvKov+NXz65a9OLAgbvtijXyklWiypQMb0eXEZEWFgs7xf823X6p2yCyeu3YmPj7zBRF+
 B/miaGnqToVMrx4rxbfDjR5g4xVrWRJWJjZtLiPxwM+ipHqoPpTfJxC13cvQxWXueVweM7UBFhz
 G1VKxRImRcrF9fBSPC1uwsrmGdX6z
X-Received: by 2002:a05:690c:9c0c:b0:80c:ebd4:762 with SMTP id
 00721157ae682-8573be1e4c0mr61989607b3.7.1787822379833; Thu, 27 Aug 2026
 02:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
In-Reply-To: <20260825040452.1322251-1-stephensportia@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:19:28 +0100
X-Gm-Features: AcwNN1XRZThkv23MUPhrrgokKre1Ig6vtj8xgI-faEZYcmow70zlT5AbwWYVdik
Message-ID: <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: stephensportia@gmail.com
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
>
> From: Portia Stephens <portias@oss.tenstorrent.com>
>
> The ssi_transfer function comments say that it takes a word varying
> between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
> but there is no means to indicate the number of bits that should
> actually be transferred. All child classes of SSI_PERIPHERAL class have
> transfer functions that, despite accepting a 32-bit tx, only transfer a
> single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().
>
> The current implementation depends on the SSI model to know
> what peripheral model will be attached and what transfer size it
> expects which is error prone. If a SSI_PERIPHERAL model was written that
> accepted 32-bit transfers, it could not attach to any existing SSI
> models.

What is the motivation for this change?

As far as I know for the hardware SSI protocol, it is indeed
the case that the SSI controller (and/or the guest software) needs
to know what transfer size the attached device expects: the
controller just transmits (or expects to receive) however many
bits it is programmed for.

> This change updates the the naming of ssi_transfer to ssi_transfer8, as
> well as changes the return value and transmit argument to be 8-bit.

This means that the API will no longer work for a controller
and device that aren't 8-bit. We happen not to have any of those
devices today, but why specifically stop them working?

thanks
-- PMM

