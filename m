Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C22C55174
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 03:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrSkf-0008LE-Sn; Tue, 04 Aug 2026 23:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wrSkd-0008Kw-TZ
 for qemu-riscv@nongnu.org; Tue, 04 Aug 2026 23:57:08 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wrSkb-0004VE-1h
 for qemu-riscv@nongnu.org; Tue, 04 Aug 2026 23:57:06 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8201447e8cdso8466377b3.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Aug 2026 20:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785902223; cv=none;
 d=google.com; s=arc-20260327;
 b=LGjJTIx3Tt+NSQrgs90hiEQmAkMB4APoF6f4/s0OyayDEVE0PagaGnrp8fZg3oxMRU
 aIj3hmhjj9u0vccZGngi5udX0Qe8GBCYNoD8uw2paR4NWuKPEemHFLwgX8UHY0WXlQFq
 +dpe5bANBA4IIpELfDRxMRBZYarSe874OJuwEvCECfjnN9oqMwaLwKdcXLlNSXm5l16w
 NUlq1U5w1ztgST22cyxHsWLdIAJYlwKjK2ieY1l/Te0T8QxL7z/32tsa6iW+CVYhOvXO
 WwpmIf37OFBN4z5pMXGjtODAdUoKKyEPLEnahnsjkDBOW+UTU2qlvpn4V870FJRxydYS
 mAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DGPqRyESTpo1dQjuakgv79ctyRbkGGHJyLgDIvGMKTg=;
 fh=zo11v1VTbKutFu7TkgacT7u5F+adnUhMefJCJq9qKfI=;
 b=hv8EY3EBI+PfA34T6EAQceG4WUtHxCB+4ww2YnAxZTNZpxcVW2UWVvOCp/Nbagnpne
 o1klUg2zR56s9qgD009kbv6pweKRSt8JPuPN81QKsofwJSP8v+VGxY9aCJe5Xb+fRKgX
 4RciG2L5sm1RQQvxIBlUHlZRM0uhGfr4MANiEN7CMWcOM//GluDBA+Z+snMnGi3stNJ8
 HXYamZdhi7p69qoWP0L+cyitbUL1XtcB+hACCQPKmgBZ9WwGl0zl2FuOiiab+AQ8Xnte
 JYVE5osXD/aMjUmtUPGxXmoschDUD1vIRlsIVt/fxVCJtKATMaN67ZaUoITsP+CCyiZJ
 WvJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785902223; x=1786507023; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DGPqRyESTpo1dQjuakgv79ctyRbkGGHJyLgDIvGMKTg=;
 b=rAxcZXxhjx4gBDBIzsEFOue5oVHtl2+LeiTaSbXWjygMD88Ggx4pLCMWh+kJbcXipn
 a5UhSoq7ma4QxqaAQnMRnHZ0CuxG9KT5IzFb6z0L5QBH3gwAxWKMHKHUSwy7LMMWbkAs
 N/W6/8fuLv+JI2Hrj6Dh4QYBZnCa002R0UICEy50Ntg8G2cgJArMIHhCZ84MYKKplHcv
 SCYUpln59D62xpYOt2Ecpgdt99Nt2+3qi75ut+cNQoj2hpQr2Im9PvJXw4styhLKZv/F
 cPySV0ikm6EIjBG51jHDYT61dvn4r17rr+IUuCSnVFMBv0aEAYLkr5i2EAUbq81msObi
 +iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785902223; x=1786507023;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DGPqRyESTpo1dQjuakgv79ctyRbkGGHJyLgDIvGMKTg=;
 b=aYYmX23TNwkH0m2JHh4jl1jkQaJH9ojYT+HGdmICgKk67Ba76/JmffC7WCmyIyl+5U
 DWqJdRnc/Nh4TpOgeF8IvRX+E16szQ4BiW+LAZPPBK6pXmFxNm9JqzAtyQF3DisOCy4w
 hbw6+4rcbdSn49zNpM7eHMv0h0V473GekZZfkpLgqgpFBVXWg/td4YjdrbHhLQ/rldea
 K61e3++B1hAzywmA5Zgea73qlHh0q/uFPWl/o4Zm4bWE9rh2Twc/yrmqxZ7grhpVZepl
 vOs8M3WkxXOWoa8sAkmmdRqAe6LLGBLlN2RhDB7OTNy1pHXm9IxZnw4CrIQcapk2wE39
 dshw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr680MUwEbWCRs+jAZ5SOn8MDqElG69/Yqagi87fqehBrJPnzCrWVIBB4p/LW2Dh77UZzYPfQRbHdD5@nongnu.org
X-Gm-Message-State: AOJu0YyZuVjbrxbeM3IZH1+lg96CvrrolGaUNrLjGm2hN2b7uzMTMnXq
 e2eD3KH7ygsSuTZTYvCTH7UMGeFPLb8s6SIO9DcMYe4uydxQyhM63S2qDaOOSainFo3Rs0BxsTB
 YyysL4eknefS7W/XIeYVflugwFGsiies=
X-Gm-Gg: AR+sD13EpirHKo+uYDu62j2baCoGlnKumjMt9rYCFaCay/X/OgBFPMvCBpxht5j8oV2
 U9SSuLenpzfpWWReryGmw0tk+o5eNZSWJXhI95SmUeNFT7ITeZDEikmA0I66vMEwR15/SeBNDcP
 IMg+Dhw1RMoZ43OyfjdBeCDyF1/s1QzKm74cn+nosLJ5bAkCVRPoDhHLZLbNB6ijzy3EhBt08uF
 /G7a1fXTNk56dMp1cj8Ib++ftrnugdJRM0SlwUNUi+jw9K9Uucbgr7BgXV6b2wWxmLVfaNQbp6S
 AAyDAj71UKDDX1rA7uMSqbX8pU0ln6XIlp1cnWo2Wjo=
X-Received: by 2002:a05:690e:4811:b0:662:e0f6:ccbb with SMTP id
 956f58d0204a3-6699aa3f60amr1887052d50.35.1785902223501; Tue, 04 Aug 2026
 20:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260801192848.30606-1-flamboyant.h.01@gmail.com>
 <20260801192848.30606-2-flamboyant.h.01@gmail.com>
 <itp7xmctqnac4c7kytqyrrs3xbfnbjprem6ezlltc6b5ncdpdn@6pypq3e7lbog>
In-Reply-To: <itp7xmctqnac4c7kytqyrrs3xbfnbjprem6ezlltc6b5ncdpdn@6pypq3e7lbog>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Wed, 5 Aug 2026 11:56:55 +0800
X-Gm-Features: AUfX_mwcqGYmsjSXy4nsDQEPokVeJ3_G1WoJLBthR5AL833KJStF6fkLDjvCOkU
Message-ID: <CAAW0U4a-nG-ck4g8w0_Vt1Jbu5dNcYEDjJNR-YvGEiHa9G4Rdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/ssi: Add Synopsys DesignWare SSI standard PIO
 controller
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> =E4=BA=8E2026=E5=B9=B4=
8=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 02:39=E5=86=99=E9=81=93=EF=BC=9A

> There are 2 variants of designware spi, one is called dw-apb-ssi and
> another is called dwc-ssi. If you look at their u-boot drivers, you can
> see that they differ in the location of the TMOD bits in the CTRLR0.
> dw-apb-ssi has it at bits 8 and 9, while dwc-ssi has it at 10/11.
> This implementation is for the dwc-ssi version (which is the newer one).
>
> Would it be possible to have the naming be consistent (DWC_SSI,
> dwc_ssi.c) everywhere? There are some places throught the series where
> the file names/Kconfig symbols/function names are named dw_ssi.
>
> One could argue that this model could retain the generic designware spi
> name and support both versions, but I don't think that's necessary.

I will make the naming consistently use dwc_ssi throughout the
next revision of the series.

I compared the dw-apb-ssi and dwc-ssi , as well as their Linux
and U-Boot driver implementations, and confirmed that the two variants
have distinct guest-visible register ABIs. As you note, CTRLR0.TMOD is
located at bits [9:8] in dw-apb-ssi and at bits [11:10] in DWC SSI. Also,Th=
e
layouts and supported ranges of other fields, including DFS, FRF and
SCPH/SCPOL, also differ. Linux and U-Boot likewise use explicit
capability checks to select the appropriate register field encodings.

Supporting dw-apb-ssi would require variant-specific register handling
and tests. But QEMU currently has no concrete dw-apb-ssi machine/SoC
consumer, my understanding is that this series should remain focused on
dwc-ssi, with dw-apb-ssi support added together with a concrete consumer
and its tests in the future. Please let me know if I have misunderstood.

Regards,
Kangjie

