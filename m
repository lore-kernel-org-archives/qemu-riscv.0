Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF4BC001DE
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 15:56:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTP3w-0003KN-Pl; Tue, 08 Aug 2023 11:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qTP3r-0003Io-SH
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 11:55:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qTP3p-0003y1-7R
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 11:55:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-522382c4840so8271714a12.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691510150; x=1692114950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aJ0UsCgUCLRkzlKNN3fii+ReD7qN5JFOHoDMNfD8JZw=;
 b=CXxiYgZdMz2LXSHL4IlP4GaS09u5ib2oVSfpzTenJjGV8m+ijczcaZrhlScwIAglTn
 Fh7rKSZYZWgGQafVT/CayG9K6TUZtVwWuA8PbmYzogDaEpag7gOFhEHE8a5Sj+LJg0PD
 Vlu0Cxt3BZKIpPsjW62X8soniMXhQhYanTiclWebJWe/z+cutgAvAE/2bOxeTIdj9BJK
 uWZ/4wyda2oGXIZH1+ijCAvf52VSVO26qRNXOQk29N43Hl4QVEFQ4HNtiGTy1y+Oh/ja
 qZqq3uMWhhYSnY7wSRYbKXM3Y+yAuf2Yau+TBFcUicZGili+2VU7XW4RUE0lb4WF8epD
 iFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691510150; x=1692114950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJ0UsCgUCLRkzlKNN3fii+ReD7qN5JFOHoDMNfD8JZw=;
 b=bx2nvC4auqfUFB1V6KjCUf8PETqjm5OyhFGCCoA8Mn0jCLR3bfwXKldS0V/EoOszIB
 5tvGqgyQ2I0ahaV5aCiIWwpQM0Zhm7A2aQDtaFamQNHx5ICNFmtVR3yJrU6e4TzTmRBv
 JGljAtaWG2pMRyeiXisqtl851nT4z5Atj6BJieytUUNhDT/Zl6SldnSfgD2xFMyehnTw
 f0Fg4r8AKEsjY+7WVchMdeGL6ijrRkkNreg44Fw+vXazAveEoW58Z1ZeRtNAKh3yD2xS
 g27JNLLqz2+HrYh4da1JHUsB4dosnJrfMbSItWYZYSXE7/XuqC4qCsFChhpG85WYUNc7
 spKQ==
X-Gm-Message-State: AOJu0YyPsUT4ccF76/h5stLGjZG7RK+jClFqeg7w1AHiLa8qAgwA8cRZ
 0z9hx/Hh8iHmnI7g/Vboxj7EyYhNUPYf3zxb9d3gCw==
X-Google-Smtp-Source: AGHT+IHJKYMuHmEub1RNwIwtkMPh4r4CE2dABsGYUBghBUgPkD70WLTt31emiAcDUZI2nWPdQt4RxKVnEArv/j+YX8g=
X-Received: by 2002:aa7:dbd3:0:b0:51e:5322:a642 with SMTP id
 v19-20020aa7dbd3000000b0051e5322a642mr159616edt.27.1691510150265; Tue, 08 Aug
 2023 08:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-3-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Aug 2023 16:55:39 +0100
Message-ID: <CAFEAcA8ORUejjC3iVdjYSkX1St6ntxXbDPtTC0tuv5C_5rQ8xQ@mail.gmail.com>
Subject: Re: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op-gvec.c | 6 ++----
>  tcg/tcg-op.c      | 6 ++----
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index a062239804..e260a07c61 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -3692,8 +3692,7 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
>      for (i = 0; i < oprsz; i += 4) {
>          tcg_gen_ld_i32(t0, cpu_env, aofs + i);
>          tcg_gen_ld_i32(t1, cpu_env, bofs + i);
> -        tcg_gen_setcond_i32(cond, t0, t0, t1);
> -        tcg_gen_neg_i32(t0, t0);
> +        tcg_gen_negsetcond_i32(cond, t0, t0, t1);
>          tcg_gen_st_i32(t0, cpu_env, dofs + i);
>      }

Is it not possible for the optimizer to notice "you did
a setcond followed by a neg, let me turn it into negsetcond
for you" ?

thanks
-- PMM

