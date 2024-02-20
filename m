Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B8EC48BC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:22:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcWd5-0005U0-Vp; Tue, 20 Feb 2024 15:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcWd4-0005TU-KP
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 15:22:14 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcWd3-0008IS-7h
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 15:22:14 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dc1ff697f9so6487895ad.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708460532; x=1709065332; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CUVmSc2R9xawkZPYrE0PtPf9cLztRLyt8j5XJwpeuL4=;
 b=lT3lENIVlOwBASWqLhL7/AgDUMDLhgt9zfR3/hN5EYfVs+22ekZ1QaaPEHZmldvg+3
 FPJ4xH2OJXtcJY/V9wZpI+ygMZe2yt2fdhUrrzv/7dR3aJ2rGTXwkSkNlUTv5RK2OnkY
 rvGePR4u4Sz93WlMZI7lJQ77KpVJHnOgbAMxZIile0SWFFGV+8lOJCNOdJwzh9XjT5pQ
 NFQ8E4TyQoxPEJwmE5loJDlVzRpcLawWH7aFT2kRYd8x4vL181TQeeF0KGdVwcl/ZX+x
 e+Can2W7iTjsYwFsXy4bo3yY8Met3XVqke8j/TXxbUpo0m7VH6Nzt8diu/GKJ7B6Atcu
 1Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708460532; x=1709065332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CUVmSc2R9xawkZPYrE0PtPf9cLztRLyt8j5XJwpeuL4=;
 b=cAj+QDWY20V8OKt6IKa+nCLS6K8c1Q9HhMNOkr/PPqMenHf9UgkPJxxKd+g4B8W03b
 xwt7qPtfpDzLI0rNaaNNp1ZERB1Bx2f/wofbokh0E7FWgPbbxH6Z9JKKwVcuQkkf6hbM
 EKkz7WQrTM0ORQuaTr3j/tIwfEWEsnse/YH/HumrlfmetiDLO19HMihZxhus61DSq4FE
 ssGKECalgzT+a555a+NIuSviRjpL9gXh5itY/jQCgHCF+3n0nCQjIS/d8GZoADd7OPO8
 wC2s/QdBEsHK3P2l+l28TbqNEZ49gz/RMe++YMLjIpDKTTS3Th01KQGeggkH0ubJw56J
 9aqg==
X-Gm-Message-State: AOJu0YyE98fgH8i1cNtPDwRzAxe0xF07BIDO+jdf0uSHDG8tt6G66AkH
 CUu3nJiwKh7B85B8/aLq1bhVVCStWkLIlB5onA0x9DdOqzAuLeavYFlHlQfksrc=
X-Google-Smtp-Source: AGHT+IH9sgEWcOGURNt2laqCsZ3Ig2VOuOnMmNPASKOzyJBSOZVveHNWf/pXpWYdY15xoKCVVjY4zg==
X-Received: by 2002:a17:902:7846:b0:1dc:3e:2721 with SMTP id
 e6-20020a170902784600b001dc003e2721mr3745857pln.52.1708460531839; 
 Tue, 20 Feb 2024 12:22:11 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902e9c600b001db45b65e13sm6580544plk.279.2024.02.20.12.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 12:22:11 -0800 (PST)
Message-ID: <2dbadbf5-3e2a-4bcb-8e45-f80885e37dfc@linaro.org>
Date: Tue, 20 Feb 2024 10:22:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] target/riscv: Clear vstart_qe_zero flag
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com, Ivan Klokov <ivan.klokov@syntacore.com>
References: <20240220192607.141880-1-dbarboza@ventanamicro.com>
 <20240220192607.141880-6-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240220192607.141880-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/20/24 09:26, Daniel Henrique Barboza wrote:
> From: Ivan Klokov <ivan.klokov@syntacore.com>
> 
> The vstart_qe_zero flag is set at the beginning of the translation
> phase from the env->vstart variable. During the execution phase, some
> instructions may change env->vstart, but the flag remains the same as
> at the start of the block. With some combinations of instructions this
> causes an illegal instruction exception. This patch simultaneously
> updates flag and env->vstart and to avoid inconsistency.

It does not update env->vstart.  With the commit message fixed,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

