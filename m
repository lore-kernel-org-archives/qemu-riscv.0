Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C602C04FFE
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 09:16:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6oGS-0002l6-QH; Tue, 14 May 2024 05:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oGI-0002gq-3L
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:15:56 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oGF-0003hc-QY
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:15:53 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso1330711166b.3
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715678150; x=1716282950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3kIbnS0lTiOmRMGPnEagmHyZQHMzjCCiO4kX1MmPS/A=;
 b=M9b3SufB9wsAjtcqanocYXllUKJe5yPseR6diomEHRb87Oom8ImhsGVeKiiLtj+erH
 7MIemrycmCDftwQ+lsBNMoFGXd5TcDsqIkESrr3YQILpUmNbtdivn8qio+6zNhTaqAuq
 cRRvrLmP8+PK23Kh1kcCWPEzw3ACxoy6UdUMhQW10n8jJYQnRh8VqjdBEwGIh3KH71n8
 fZlCm8H1BTYmqZZR0AHZEkbww4WAmCLVQOAfXyW82c31lnew972IVymg+/K3Li1ib4YX
 JBKlotc4KBpSSbpVcU8GG2IA+DL1ABi76VQUJZw0KYybhdZmRj95chfozZ4QC2a/eyb2
 TAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715678150; x=1716282950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kIbnS0lTiOmRMGPnEagmHyZQHMzjCCiO4kX1MmPS/A=;
 b=CW0YHaM/ylcbsyogQgWZt4eNDgT537cbbhs04m2Yvkk/yrZVveTDtmU7DnOPlT4wpF
 Mtj65sF8VYmdzYTyUfDsohFBP7H+yvXGyQnVDuBe3AOd3WKUp7tAVLJbrLtKXZX+ltE4
 pSffNm/NAwpEC+whNGTssFXaJavKHwCondYdUDkMlEuOKv07HzbseBu+bvuRCOtyCnLJ
 d0d8ETaFRNZvoDSTWB0lwsDlBXD5UHNi8cQ0JQEXNcvtk3NPsqYUyZ9SDQwJOF8sYhBC
 qavm5HuxKM4RgvnSMH1xVawHPlhfPNbyHAXw8W0galebqSAuuBRPy41MBCsoZGaK36qb
 QX2g==
X-Gm-Message-State: AOJu0Yy0Z9D4SJTg5DjdZQn5Q7jCbuHFJwMa5x/FbQISGpqffU17mYnF
 kkE6s+bSj/hWaxbRXh1Ii57LU9R+exHvjD01aJUA5YcH0mP2TsMRIuyjVK6a0/neieiyNq5AHPh
 GW2EiUHc2jQhEOfiPoQra7ycrH6DbQ7g9dcTRYA==
X-Google-Smtp-Source: AGHT+IHIQ5ejF4HqOkKMTuj16sAX8YMk45lgnbfrJSIzaZfi4oic7HLHSG0SCvjd/GkUSitdboV9Aw42MEejWdUBK34=
X-Received: by 2002:aa7:d3ca:0:b0:574:d098:37b0 with SMTP id
 4fb4d7f45d1cf-574d0983807mr4382619a12.7.1715678149617; Tue, 14 May 2024
 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
In-Reply-To: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2024 10:15:36 +0100
Message-ID: <CAFEAcA_33s35DmdEQ=+O_kSodgEUg=R49n+iXOqEcmgY4Ng_8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Assorted fixes for PMU
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 29 Apr 2024 at 20:29, Atish Patra <atishp@rivosinc.com> wrote:
>
> This series contains few miscallenous fixes related to hpmcounters
> and related code. The first patch fixes an issue with cycle/instret
> counters overcouting while the remaining two are more for specification
> compliance.

I've noticed a number of riscv patchsets from various people
recently where the subject line for the cover letter doesn't
include any indication that it's a riscv related patchset.
For instance this one is just "Assorted fixes for PMU", which
could easily be an Arm PMU series. Could you all try to make sure
that cover letter subject lines indicate the architecture or
other subcomponent they affect, please? This helps people who
are skimming over the mailing list looking for patches relevant
to them.

thanks
-- PMM

