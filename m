Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3D606E54A
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AJ32Z05B
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOzvk-0004pF-Vo; Thu, 05 Nov 2026 11:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOzvj-0004l8-0v
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:03:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOzvg-0004i9-In
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:03:10 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c34bff61551so60020566b.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:03:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793894586; cv=none;
 d=google.com; s=arc-20260327;
 b=gWSdHPSc50uWyUjdJ3P0HpOmdBWKV7l8f3PgiRVMHPMByD7LQZF7DnAODDet+B78Sj
 qa9wTaBeCDw55BHWFgy2T7CJm/ZALCvGUCUDOyN6SPQmBbqGawNIsu0+EZki3MG4ILl2
 UMV9912s+vPhqPc+1fWYXdOeoF8jfkR6HHS/92XXu2W0fShWsF8OLbRUotxgyk4UioEa
 eiIhBntj8Xh7RWoTE74faiuyzVZvtN/KbSaIQNJbP26uqkHO+9uWV19TC7LwPlFZZqFf
 hZJmmBRMeZ6oDy+rtzREhECMG4voXQkCBQhriJ5fDIhU9wkUVVhWZa7G6I4oQGy5isWB
 RC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wxCrwoS0mI+3tASJN+1geokZjdT3OaM62WAeunx1IHs=;
 fh=XQKeTidFn9NnU1RAFkYivnmVH0XpuWvQuMVVU0H2aMA=;
 b=ebM3T/P5S9yM0rt32+0VdjGljPC6g9ov2xFvbG81j884FaIaIlQxdDUMMPUfdrac4h
 uiFMXWKgJhsir5SiEowf0xkgGF5iq+DDfi+ip0SyB4jCaHodttgKAt/H8xojQ2qlVdOO
 WFqnBKcPtvsFwg+kywk5bRqyf/zokjBUqPxgEpfikDImFrYpvC6KhCgl+rMNsAcC8DrR
 Q1Y2U3q/2ZnmgQgib7hEjnyEHsDKs7RyGGhahT5znao/jD5dQdWTqFy2iutj4xjzMM4m
 67iKkjtx2Wwx+m1QqoqRbPmVJKjkL70MVc1NmgDcILp4TEgHy99oFIR1XkYPzHPqJkmJ
 9Tzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894586; x=1794499386; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wxCrwoS0mI+3tASJN+1geokZjdT3OaM62WAeunx1IHs=;
 b=AJ32Z05BXitEkd5q4prGTg/ODIiaSpnqrGQ6lLjmKrTvrYoLS7tWFoYuqwRlGqyGun
 0hKrujPgTSZZtjILquJADto/pN+/aJktMs3ynwqGXtwvPcQ/8T0o7g01UrBDnqKYi7iC
 ZoEv1g0xHQfwKcz3PrgZgVnZB80M2D2DPuKseAXz6ZGUuIWruyvYN5UPeqwQwMZM4t0R
 BNFW0bkb5gjuEUaf6TjX0Uw7iyUjpS4ZjP/afTP2qsvfVancN7eGTlyujVw/XAm0xYD2
 zpFLBKZ5xUrQf3SVKAaoqhsmItuJy0O95Eu1wM8/pRYqTalWjP3bfcqq2JCr4wbpNLkT
 YdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894586; x=1794499386;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wxCrwoS0mI+3tASJN+1geokZjdT3OaM62WAeunx1IHs=;
 b=0QKzB22YHUFgw69IdnXSEIq/njsmT0QFK4SmFGfLrqkn4E7Szxap/hmDEtKJu5Wwun
 LZ36Y3RptEcuKrzk5mE/djfGU6g03TtDR1JiwJTj60sWboBvCCV9Cm1pBIuu8Kyd5M80
 ozfIPjPL0yfhbt8NHYf2nT2MyoIlkMVnWeGJ3QrqkKX6tuHWtHiXMCobMU2zHDwhs9Rj
 Z3wIhDN+MkzpagaetVxOBCb+lH7eAax/MSn8usu3qsRQEtrTZ5EBQJFTlXB9ITWDiQiv
 rr6nPZEGGvx3xJRfl9xSBOJQyXLr3v1dwSbA4IjQ6L1TszBEZa315hneilkf0korZr8v
 7BxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdJrSDPZ2Jm5Nb8v8d9CY4l6+b3R5u5fEXOdpYyfKV14za73EvTV80ZMmuUNuK8P0Niqko9EpwFNge@nongnu.org
X-Gm-Message-State: APuU4Z8MsAipOlNbL93LjU0gsesfko2UNXbyfh8U7Dnivzizt+MH6kFf
 5I47FgilV4nvaSQnX3tnDRtTS79JGA+uiJOZX3w8sbBB+vECUQVkqkGRcbKBFNegnBS27FosCZk
 NDfHRz1ZlRG6vid8Wcs+UQwrLoiqksE0V3/W7acOftw==
X-Gm-Gg: AYBFou2TOMNn9zJCD8zYJ/PAjpMA8LSJBL63Ht4Z2sNFnOReV1KtB0Wmm8aKX4bBHQP
 lqjJrDGHJivIdAID5V5ryDlz/fr+burG2cWhF3sEx+78xiRwkAjCS9fFyCVXDnU75AS3ZHQYChZ
 M8Tmg4/3KiQ0GjEqMzqGz3STARF1OoskgKUPTS/42oxHNrjCkHOUto6a7AnQVhaRoqkV5lA3DXa
 mjOUEHBRj4fnWKinxR52q5i05FgsvzlozO+zziQbTlq0l4ao8UgTyBDynRte77g2jg5oQ3lHjKU
 Lvvp3hgB1Hhgh9PQOGDBQCl85wSFKz9SHMTO5bgTXfXDgMoIIJ7ebHKS3OrKplS8jiqPOT/7+nU
 8v6ZU5mHOt32j1y2fVOlzamz+IOaN0RWCtztXOLBryFMlasvD+vOG03ZyWFBU+o0ZZ3IAhWoc5e
 neORfV3Xp3CZUHpnAPCgbT0ZrwIKm8Q+1zRQg5XQqnKA==
X-Received: by 2002:a17:907:3f1e:b0:c49:9383:a28 with SMTP id
 a640c23a62f3a-c4d34d1566dmr1027166b.35.1793894586394; Thu, 05 Nov 2026
 08:03:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022204223.854640-1-peter.maydell@linaro.org>
 <97a6d73ce1cca97a8de68bd7bc58b575e4026345.camel@wdc.com>
In-Reply-To: <97a6d73ce1cca97a8de68bd7bc58b575e4026345.camel@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2026 16:02:51 +0000
X-Gm-Features: AclHuK-byip71MFYd7RRO2Zo_NZPtyOELUmCfEM8onowyuomZKwtQnixH8hoPCU
Message-ID: <CAFEAcA8NTaF9JGkCfnuJDb4Ei65SStN+NcoG2gBNyEt=1C0QCg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/riscv_aplic: Check config value bounds in realize
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>, 
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>, 
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 03:07, Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> On Thu, 2026-10-22 at 21:42 +0100, Peter Maydell wrote:
> > The riscv aplic interrupt controller has various configurable
> > properties for things like num-harts and num-irqs, which have
> > architectural upper limits.
> >
> > Currently these are checked in riscv_aplic_create(), by assert().
> > QOM devices should check this kind of thing in their realize method,
> > and fail realize for out of range values (which in this case will
> > cause riscv_aplic_create() to make QEMU exit with an error, since it
> > uses &error_fatal).  This isn't a problem currently as no SoC creates
> > and configures the TYPE_RISCV_APLIC device itself, but it avoids one
> > for the future.
> >
> > Move the checks to the realize method. This requires slight
> > adjustments in some cases because:
> >  * property num-irqs is set to num_sources + 1
> >  * property iprio-mask is set to (1U << iprio_bits) - 1
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks; do you plan to queue this patch for 11.2 ?

-- PMM

