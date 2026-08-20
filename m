Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9823FC5DF87
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:17:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxC0T-00049B-Us; Thu, 20 Aug 2026 19:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxC0S-00042K-0p
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:17:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxC0P-0007am-G6
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 19:17:07 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d53197d8b5so4627045ad.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 16:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787267824; x=1787872624; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K4PttROwzfD65LdoSoGFqNE1dKR3I+aL1/VrUtik2/o=;
 b=MEKPQ7mSUnKWMoiedBof3HiyoSQKrMCuNMxU2LHTBRskUWXlgMrlmfQDC9dt+7LhtE
 W/iYz9Ty3bdkXnlZDMXEv9nr9oD8wAIAMgvrD51b8zGs+lgzqTZksWPK1C+/afxPWl9m
 uJCCZDXEzSG7btocu7GBCm0paD4XCpBPorqQCKrmkfgwxRfffQ+rCDHyEbabY3CA7cil
 aldDSW7w4fW1f0+K5TqTciNiqLqKHukgM+vLCsQjLOuaLhDPJ3793DPKTv0+uDuDhAGB
 3TP1M+I+tXPH683VB002vJdBXDdhzPuzJKTtH2sCcwsbDInEibEdx0G9OYfXPiFOiQPt
 Xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787267824; x=1787872624;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K4PttROwzfD65LdoSoGFqNE1dKR3I+aL1/VrUtik2/o=;
 b=W8HLSTDecoMpzG/lBTimBeu//733s1T+pccE+wDKxLnn9B5+CgyS4UHAByOlE1GxzJ
 7WbDZYazmhchx6NekPV2NZrwaX07FRCWRjGpIP4Br6aMM5Yc+K/ValOruRjuZOK5HH3J
 GzJs+eHHduowpmPl8GoJFmthVgJ2YGItM+ppHnW9LNobf+tJK+NW4FFO+Vy0IFgOopPe
 QbtW86hJrrdegSd2OOpdkUjgw/RtseoO6lhj1dd93QaKU2juTpJt75mH+zqgaXm0YkdV
 BDqvrJNu1NYqweLwhgXTQmZC448/0tDKnL+6us69cXt4X55svGpzwpXdj0rGlFQ5iC5i
 yMQA==
X-Gm-Message-State: AFuF++nL/FttibxbwgqXRU0YA5Xlzf6VVuccNbRI0CYBtB1gUsaZOyTC
 /J4Wrcjyz2CDqRKPzdoXl32fic4qhSDamANgWMdyGGoMOCvNsnQVpy861XSsxdcCKb8=
X-Gm-Gg: AR+sD11s5av0dDq1PacrINK2ukcfOu1WieWVZmwhTXAvVrMFnGg+tM/bQ117fy5csPK
 KLmu/Q04qV/GDo2lfqoA3RKLtv37Jk1K71FGwGF1nTmXAAPqRaYRgVvgmfnj8m5rs4y9YQhDJEt
 DcWXMk9aiCZgL1NlW/uqukmkRhtL8ADfoPnuGcMUzHlk9uO7PYMKpAtqOXcVPq3XMITz5Wx4EoJ
 67Q/2T0qLx8+/3d2hBZ9pPdsKXD/w63mPpmqeLPmx28FJc/M/0bJ9LvDSGyOGUv+D86PgTdvNtw
 HzvkVdUPP4azevcnAS+wtvhksX1eWwfgMfwLD1PJqhY3xQqLdaCy3cv8aofQWaoEbjW59Mjq182
 hkoJi2yKiEVjkeEYGm4CTJxhPkCiVxD2AKwNoimVR7+fw+Ex/vbkYCX1jthPxnAD6+BFAvyAy7r
 KMFi28SEzb/aj/FAEyxus7AgqmW4mj1oHOo+lWaqHuMlEOIpXEdu3yyde8Y/SGB9a0likNOTuqy
 QyQ
X-Received: by 2002:a17:902:e784:b0:2cf:ba10:6d6 with SMTP id
 d9443c01a7336-2d64af6f8dbmr43305195ad.4.1787267823862; 
 Thu, 20 Aug 2026 16:17:03 -0700 (PDT)
Received: from [172.20.6.151] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d62e3d2f09sm12434385ad.78.2026.08.20.16.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 16:17:03 -0700 (PDT)
Message-ID: <25229622-88a8-4a54-9a45-45cc53aaa78d@linaro.org>
Date: Thu, 20 Aug 2026 16:17:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
 <20260820201356.29775-14-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260820201356.29775-14-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 8/20/26 13:13, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@linaro.org>
> 
> Use _Generic() controlling-expression to add the const-qualified
> variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
> safely access CPU architecture state when it should not be modified.
> 
> Alias env_cpu_const() which is still used.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/exec/cpu-common.h | 30 +++++++++++-------------------
>   include/hw/core/cpu.h     | 17 ++++++++++++-----
>   2 files changed, 23 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

