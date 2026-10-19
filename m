Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1D606A31B
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 17:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gIVvfbxC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIqwT-0006ov-5Q; Mon, 19 Oct 2026 13:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1xIqwS-0006oi-2D
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 13:14:32 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1xIqwO-0007VO-Ce
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2026 13:14:31 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-5365f9a04c5so19040861cf.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2026 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1792430066; x=1793034866; darn=nongnu.org;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-type:content-transfer-encoding:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1FTjTiUDtfvCTwAgsNJ2ROpD28tFBzMa/gEOg8BJzjo=;
 b=gIVvfbxCPvuw2q9eOiIjiRVR1QytaXv+QzY242FJZsKnYXxbqMAuV+spjTuFu0fZVe
 c4/8M9o20zTEhMsx+vcjYp/NjjBSJRjTnnTCvJ96zytbQOtXRqjLZRisBYcWf2FbRXwp
 VFBYkVYbMykq5yoA0nkOfDlG/n7DjNVsRfGy0JtccvLY0HhxRHYeCCfVZTJYdvmG8GJM
 eSzQHNScCn0odik8d+DjaJcG+FQDPunhz8Z44GI52uVH9jcqYxnGkdaRhpo2YjycKx4A
 DXyntnAEnTU/IRANptt9ZHJMbySXsEEWo1XzmiTAfrfOIc3RflFJo5NYQBg2OnVafvBF
 mxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430066; x=1793034866;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-type:content-transfer-encoding:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1FTjTiUDtfvCTwAgsNJ2ROpD28tFBzMa/gEOg8BJzjo=;
 b=JcYUGNQYvmTITLNUoApirz7GykItT6/qKPPFrTesBXbxuKhe1vWJXUxFaXbSPdUIJW
 8eZ+smYgxFsdxJH6tzCo8RLMPbf16Uub/92PP/KdIascgD+6QMHdGoDI3Yd+e2YM81kp
 BECofIE1z2QQhIaH+VKwF745KlrLEDeFNfdUVafxPIlgsl/XToyzsss0PKHiBmApdh8X
 Jwu3ZXu/7Fw5hjwEwEEOA4AMYq7X/4kPEgLTebxuUUglwmJv+teOYqnTvfxXMytWVULi
 0K27YCsy3Qvv9eN4v83fhBU8jlBZH0j6HxzWDAnIQ32/y/D4wn3ANlsqn4Z7+AWQAx2h
 LEIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkMCd78++BZ96LJ29cxr2zlN3Qu/nEG08Q8H3qFb7kAwwBAcsQBSV8CkVqGEKYvzzsxkZxSxV/E/z9@nongnu.org
X-Gm-Message-State: AFq9FYI+hsISRFDKnGkU1KUPPSg/QRuxVr4GMeKZZXz0GSw5Qd9y+mY3
 leBsbKVYcTTUncB9eJ+P1McyCGYdTx1vExiqfOg2phgLryE/XbVYtMFBj+bWUzyWEH8=
X-Gm-Gg: AYBFou0CQkduVbySco8Usq66H3CYI9NannfYmFlzUPllU6XVcJ/NaMK4MBueub8wMby
 4eOprYaMO4YoRtnKpHD2KINL4mE6f1Q3YZPqOLOfz/rhK+q7cnRFtZqNHchOVWSwCakyR6qhpbJ
 McBnYYCMwk/EvGaXh3bSGNO8pUm5/ZOVro5LGOf/vdmZB2Ik7RWXIqpgYh1IsghwC7jdRze7TVd
 e+hxsWWHWxzNf6dehzjCGJUBjVxnlDNzNIqCs6odbnfgtKeXryttwZAi1D6757PM5aakpkYKAS2
 mVPjOGV1/UdSOPUeOmjpAVlTrKHONUxBMhfPrqKCxmZ3coqT/hF2LYqVo+UZJx1yh2CepLOyk4/
 cgp1nBuoK+vCVIlvKPkBoBanVSLmspL9KZmkiGOiLJoRByvXSbYwyg1sdoT4NZXBoNzTPiqoOyS
 lA/Luyf3WyCDFdcSz/9K0WtO1PXt5pyijgV7vbCyZK8MGRS6oOnppHdIhXgsI/m/SqS9uLI/aYL
 g6OXvAWcj35HkbGZZbzeBux2tNiwCMN6A==
X-Received: by 2002:a05:622a:e313:10b0:535:152d:9a52 with SMTP id
 d75a77b69052e-53646080e0cmr87541321cf.49.1792430065953; 
 Mon, 19 Oct 2026 10:14:25 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a9c273esm105449611cf.20.2026.10.19.10.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2026 10:14:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 13:14:23 -0400
Message-Id: <DM8ZFFJKYUUD.1YC6LDKPIOGX5@baylibre.com>
Cc: <alistair.francis@wdc.com>, <chao.liu@processmission.com>,
 <liwei1518@gmail.com>, <palmer@dabbelt.com>, <qemu-devel@nongnu.org>,
 <qemu-riscv@nongnu.org>, <zhiwei_liu@linux.alibaba.com>,
 <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
To: "Wang Yechao" <wang.yechao255@zte.com.cn>,
 <daniel.barboza@oss.qualcomm.com>, <richard.henderson@linaro.org>,
 <tgamblin@baylibre.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 0/2] target: riscv: support TLB page flush for
 sfence.vma
X-Mailer: aerc 0.22.0
References: <d4535ac9-449b-4829-a0d1-1eabcfc2c08e@oss.qualcomm.com>
 <20261008070029.20239-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20261008070029.20239-1-wang.yechao255@zte.com.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=tgamblin@baylibre.com; helo=mail-qt1-x836.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 8, 2026 at 3:00 AM EDT, Wang Yechao wrote:
> Hi all,
>
> Patch 1 decides whether to use tlb_flush_page based on whether rs1
> is 0. This is similar to a patch I submitted last year [1]. Under
> normal circumstances this works fine, but it can leave stale TLB
> entries when the guest kernel uses THP.
>
> The reason is that with THP, the guest's mapping is at the PMD level.
> When flushing the TLB, the guest executes sfence.vma only once for the
> whole huge page, rather than 512 times to flush each individual 4K page.
> Patch 1 does not account for this: it only flushes the single 4K page
> corresponding to the address in rs1, leaving the other 511 pages of the
> huge page with stale entries. As a result, guest memory access faults
> can occur after Patch 1 is merged, unless huge-page TLB support is added
> for the RISC-V TCG case.
>
> Please correct me if I've misunderstood anything.

Hi,

Thanks for letting me know about this. I'm working on a local test setup to=
 be
able to reproduce the problem, and I'll look into a more complete fix if so=
.
>
> [1] https://lore.kernel.org/qemu-devel/20250930174849833XG1Q1ETbNvg66WU2U=
VBTV@zte.com.cn/
>
> Yechao,
> Regards



