Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3362CC87FD2
	for <qemu-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 00:01:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiLnl-0005Cc-MJ; Sat, 02 Aug 2025 19:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLlk-00021K-1T
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 19:36:04 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLli-0005eo-GU
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 19:36:03 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso2675319fac.0
 for <qemu-riscv@nongnu.org>; Sat, 02 Aug 2025 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177761; x=1754782561; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3OYt7eBlj6TLScUOSH96PIY9qJXoKg6RVtO5072AqU8=;
 b=paTa2Xd7unomAhxKrzPmnt5tXZXOrTJIaoOFvck/PbnFEDYgyZ9IT1DfxWY5SLOfmr
 cfVGG1IPEztw26yrMIN4UlyLKPuZ32ywfMSCUqoV0Te/iJ9kX7fSTocun1uRqfWS+Iof
 9oyS6e9tgIW/WAjmt4NjqaoMciqv+hr1QBLm1CY9wdpk6jRXWdJrgdO3wXNWxS7bS0he
 fREZiGoXZz175xqR9hiqnRS0Tb2KyBVTmJSl+/cohFVp/4OU2pAxaz6bow3PM/8SKQm/
 440aflZ0O7E5hUz6/BvdrOoTCnC3e8RVNBarfjoeHGfIqsnmgNl/N8gpHsB1ZXeh3mJh
 f04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177761; x=1754782561;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3OYt7eBlj6TLScUOSH96PIY9qJXoKg6RVtO5072AqU8=;
 b=JNV/hurlaNoVNjqNaUlVIleqsrpejZjUH+C6NdvjcrdxRgEeQlePifYEgCRmyUWVut
 YTTP2zDledkI+5ecy9a2p3DCrWDIG++U1/GwGECmLnogeGiTblacqbreSpqpLFgSrzU8
 vKgX/aQiFcrMHRgomt189xs7CERXm3AQEOYagE/OXQu7R5eD1pEADeMu99arXw2IEDH3
 pjQD3VS03y8I9ri8XuF6ZwWgFm0TGRQvdaDHWtc2vCIhcsE3XNmBDqJlNfx9MdUZo/zF
 ytgj0N1xZt2L1dUhJil8d7ILeze7FHbjFcpINInth2V/iLClxp3fpxhMQI7CDGVVRsWy
 cPVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf3q6bxaOKCVxeAzfmTPxu8ZSpAgHZLzomDRs2cmwuPIK1bfXYuLSCphL8dp2VOG2CRCmx//guyFEy@nongnu.org
X-Gm-Message-State: AOJu0Yyzb36QHwkRjn4NHJwlV7wzo0MiCQFJYwEvdfv5U4yUA9fGEvD1
 PQI3YFGBszfgJgN0sDWMTbSzV+q3lUzZjPkGe45PozPOQpfUl5OrwO0I9bTdSkhVeUQ=
X-Gm-Gg: ASbGncs/tDp3jMiPkjYpgOf/5y5dsFZ//wGDAi3upc4D1R9ECF4AZu2zWGM6rOtwK8p
 PDIlayP26TA7bW6KMIvbHTnWzleeKv7LuRIWAAGV7I4YVpvaGm/n64JZD9oW2/OxobHkT165TPe
 NKW07xcObGQqM7xySw5M+Bef/jEVMNe75Jm4hn1WlkLwipHedUn5UDuzxgRjzJApxL6AiKQ6gSS
 j3WqaCLWfcoBvRx2TXcAUKiu3UMdPfZPWoTV9wdcpwrMwntkuySuh1AGv88XavlwA6CkHcyyz+d
 HeiuCLlD2QGFBe/pFSuOvaGoDQr3eD8oLFuxg3y3x09z0Tdg1yp52a2jRK23QQ8IVcJM5KWwhWa
 f3t6icSY0R28rEOTkUFHpIHRMgVVwXQ5fg4Rf3oJvJTG+zEd7ctgaC+l3Esh4rm5x
X-Google-Smtp-Source: AGHT+IGQUwudy5SgY6i5USrh60dcm17cESa/gJPtegao9tuuoomqw2SYZdOE6Pdx7rIKZQKKh73HMw==
X-Received: by 2002:a05:6870:c0c2:b0:307:1af1:60a1 with SMTP id
 586e51a60fabf-30b6799392bmr2632095fac.19.1754177761361; 
 Sat, 02 Aug 2025 16:36:01 -0700 (PDT)
Received: from [10.153.194.227] ([172.58.111.133])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-307a717b99esm1765800fac.10.2025.08.02.16.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 16:36:00 -0700 (PDT)
Message-ID: <f0d2da41-56eb-473c-95b8-061b69b44a47@linaro.org>
Date: Sun, 3 Aug 2025 09:35:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] semihosting/syscall: replace uint64_t with vaddr
 where appropriate
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
 <20250801232609.2744557-3-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250801232609.2744557-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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

On 8/2/25 09:26, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   semihosting/syscalls.c | 78 +++++++++++++++++++++---------------------
>   1 file changed, 39 insertions(+), 39 deletions(-)

Ooo ahh.  Later came very soon.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

