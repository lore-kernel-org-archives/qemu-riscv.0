Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A35DE77198
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 09:06:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tV5X2-0001Ke-2m; Tue, 07 Jan 2025 04:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tV5X0-0001KG-I5
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 04:05:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tV5Wy-0002od-Qy
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 04:05:46 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385dece873cso5658590f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736240742; x=1736845542; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDcW+xfLTJD/IB8Pbtb5vwtl2Z1T3HvRUsMWCOo7VOg=;
 b=YsxIGwt0FUjM8Ngmg9lD27DJBR4wlGC1ZGT2/w2a/JdZb8l2YJc2//1koAB0wiK7i0
 y5veJTx5Yhvmj35M5/FhPt1mYkilhIiDwBcDxZl4iKQze1VO2dlk99vJ80rvzrVHoHz7
 pWdhpF8SH+8x7v5OBqS4mKu9SByqV6wzK88gxgHddJVrFqN3rrRUIfrJ1iFDWQ5vYxsJ
 LoE9AOk4ySSbLopNu0i4cTIeNiEv2OHEVZQrplQoeNkBssuvMP+bvAAmN0I3fcITdrma
 iIKB3+JI7VFW2YyqQUMN3axgtQDG9rSfa2+Bk3SwxqIdLba5s/2BIxYuQkc+fZS2d9xv
 75Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736240742; x=1736845542;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDcW+xfLTJD/IB8Pbtb5vwtl2Z1T3HvRUsMWCOo7VOg=;
 b=YVfYuSuNPVsEAhIlBkXnUf3rVq0xfWrm/b/VFonngxNm9VyihTC8qnu+520h5tu4VA
 jVjRoSCg3byec22epk+qDcMA5BClnmEM9esi9nthMBzc1Tz+OqAexBTRkXILAF813ukx
 8eVaBhrwZdMwxAnmdFjA/YfW5b1SsQfflY32qW6CTiLjunOstCHc/rytMx201J4mI1vH
 dwcQW32/788YCDIdzQV1s/EkJ8Gl/QWNzddQC92JUzUhEplNhd7KTqI/iOg9JifCkbOK
 kY7zRgLrtHp26m6yyyqd0E7zFPp11tjQfsIINjFDmBth/ipa4TcOb+x4ov5BJZUCTew2
 VmiQ==
X-Gm-Message-State: AOJu0YzjuhGRBCH9XPIlBmQJMPZHIsBg/+nACDHIBy2V7IPuMIlcx3vt
 pg6zadFytVzLWCP9iQGTeYmB5/axoe5hdisSiEjEd4npNmX0kFCo1Ls8lxS9VCnHwEzq2dtLKuT
 918c=
X-Gm-Gg: ASbGncs9ptO6mnqiDSHS9RrDEg00HQgR9k5AJF6tJd3bXZaZd71lJdfWwS+gwnDWaM5
 r5txrvYdklIrWY/jXbmkcE1TIqOONxjiEVK8choJxscKPr0c58y3C3YQfQgNhCqrbhqofCJlDcI
 ssoa5ttcFwyrvuk7atRJjvnL2V1swDHhTdq/6Ay12tIsiZ2bzOySv+AFBtyDFWrxANF4LY9C76x
 JQIWmI8avoOwAN43u06iT3l9nXIJmQ7wZWah82OzyZxczEfQiQ7NabyJk7vSAOfWq0uyFXLV+e3
 84aHORi+epH/bZDkBllKA0bS
X-Google-Smtp-Source: AGHT+IEf97TXzXfI5yE+aYcsMW5+AS94RPd/lJIJokCWAI8O70UbC4qsCs5OHNd19wrJ/09bWADCVA==
X-Received: by 2002:a05:6000:2a1:b0:385:f060:b7fc with SMTP id
 ffacd0b85a97d-38a221fee1amr49885812f8f.25.1736240742278; 
 Tue, 07 Jan 2025 01:05:42 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4367086e40esm557878575e9.30.2025.01.07.01.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 01:05:41 -0800 (PST)
Message-ID: <a856d994-e6ca-4737-bd66-323c60a7d898@linaro.org>
Date: Tue, 7 Jan 2025 10:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] util/cpuinfo-riscv: Detect Zbs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com
References: <20250102181601.1421059-1-richard.henderson@linaro.org>
 <20250102181601.1421059-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250102181601.1421059-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 2/1/25 19:16, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/riscv/host/cpuinfo.h |  5 +++--
>   util/cpuinfo-riscv.c              | 18 ++++++++++++++++--
>   2 files changed, 19 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


