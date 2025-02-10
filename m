Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540D9C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 16:32:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thWhh-0001E2-7k; Mon, 10 Feb 2025 11:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thWhU-00011i-ES
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 11:32:02 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thWhS-0004Ml-Pk
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 11:32:00 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21f62cc4088so45694905ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 08:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739205117; x=1739809917; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=12CbQEpCPianDbSiaHuldNx/DpianNvUPrkbzazwvQw=;
 b=Tj3nbTY7JQtiUiZ2cUuqk9Ms9QEPU/y6BtA3GLVJ2BdaKq2pbQ7rEKG3TlzBi0HrpI
 VLZbZJHYPJG65rQivjG19nqUnWwCztqWuF619eBhyi4SckrXihMf/VsWk9Wg8TxC9Fro
 KTxGsKYHSEnnF0MONnhTC4ZoAb2U57I5a+VP69dDfLEid5D7xRALmVjxtP0M0054ThGm
 2K1muptndXwfVOWYWjWa3W35Fc3sC8NhrK6c0p9rCEuWnyB+/M3DnnhZPniPlRn2fhVD
 tfUcuMz3hSDiG+JQeXFEDUsud3xnVizrF9cd07xePs8TdeJjz2ZGVlZkJUjq8/hMzTyA
 P/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205117; x=1739809917;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=12CbQEpCPianDbSiaHuldNx/DpianNvUPrkbzazwvQw=;
 b=VcWqyAYU1eoErHMwChFJ2SifZFYy35oeulF8Qgb6fAVPEogZ65Cc9KDXOxlxNnk+PJ
 TAKylezBoLNxXH4LbQ559O0IdP49Y2zZAkbW/JlhmymPaBscL5DFAvSa1bxhoYDUOI0L
 RbF/2s0yWpeWLGcyzbLbxhWpKnrPyGL2X+PatZwnVMfVC5Ec5GaWdlvKfz1EAhQcC06V
 tJBctDKxPfL3p9DTAKoXcIRhV2DblkbJsFcataB7UyRaGkgbw1a0HEVz6PPKvdYn6/Zv
 hhmC6m3ahn9l9noUDcCYDe8mTiGlFF0SZtwaP1hZR3ZFw+TSRoqqb6mdxCGECNhp79cm
 EPtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpsP66d/lfZrTCJPlFJqixHGykbxl9BSH8vlXdafY+qWmiHSwqkiWNJCloCX/zL/o27jyEaRGHKr9N@nongnu.org
X-Gm-Message-State: AOJu0Yyj0taNX7kDRyPOoOgOpmIJg0g+YdGleeg9kDzDTsPXG84DrhF+
 0vaSZwkQ1L+qVY5uOPwCO1elTd4HDLZxMCtJO6R2mpe9D17P4tt3ThA4Jkgi4qM=
X-Gm-Gg: ASbGncuNISTFS0tTyD3RNTpOaJi+7VMANgMJ2MFDnw4/OnQsdkwsI3jFv3auK+1IwdG
 3nxDla1maGuYXZZfviwBVwcRH1Os1yMn57ugu6nt9KCflsDXjDZkPbpJ0qVI5uyAVXf/BVwO8Sj
 UdUv+W+qpT/FhhH8GRX3f4BtMnz5k6emWc6BmeHH7T5RVHfRPhGdKV7dEoh2Kl5HjWFE/1/Qaz+
 /kaS2ZSsAlyEMcKwBJrWdV4X8HL2xzW/imoihglZTtvMhq8PwpNhkpEVW583jVIO70uaGBfd9++
 WWnqBC547NTvgvcbSL39XYWk+7JmFFopGKYD3CIg3JFCwbrNQLA6Yys=
X-Google-Smtp-Source: AGHT+IFFWEftsfkSdGjm+736gE4C1ddxbd+4hzUX1a43y14NKfYMJPtTzdUq7+eghSsTvUWTvpr7nw==
X-Received: by 2002:a17:902:f54d:b0:21f:3a7b:f4f1 with SMTP id
 d9443c01a7336-21f4e73af02mr230206585ad.32.1739205117043; 
 Mon, 10 Feb 2025 08:31:57 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3683d8d3sm80112585ad.156.2025.02.10.08.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:31:56 -0800 (PST)
Message-ID: <3bc0e1a1-3587-44db-9802-8d80381339b9@linaro.org>
Date: Mon, 10 Feb 2025 08:31:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] target/riscv: Declare
 RISCVCPUClass::misa_mxl_max as RISCVMXL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20250210133134.90879-1-philmd@linaro.org>
 <20250210133134.90879-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210133134.90879-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 2/10/25 05:31, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Cc: qemu-riscv@nongnu.org
> ---
>   target/riscv/cpu.h | 2 +-
>   target/riscv/cpu.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

