Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AABCA0EEB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uoUw1-0006Iq-VD; Tue, 19 Aug 2025 18:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUw0-0006IO-Mk
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:36:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUvy-0007el-1L
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:36:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76e2e8bb2e5so6148291b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Aug 2025 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755642960; x=1756247760; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDCT8mF9Cljaxm5mZSyW4Sv46fruFce/2oF9ryX6O/o=;
 b=PeU3VaRMHrToWQhvx+hUWhCOq4AWGu7/G9CE027lI1eNjpcl9ny1rzR3131Bf+BFtY
 ubAQs4yb7x7Gks/iHX1a0D3lnOsqq3/ycQaH8MXWOEd2l2q7QDyWkGIzrMIHNey3b/1R
 jlZiEFaR8hc1nyOy7xUVDKaUEgjgphH79XP1IrYRVRNfLKHIJYk0s4qHsT8aXZUFpQfC
 NwVAqh/MX5ZmhPtvqXI8SIWug0TSx/Z0pvpaEJo9EGqsd3g1raDGvnq/PgN6j8382cP0
 DHfYvzXf07broqoSIC80U2vn7tBgmyefqq2Aj6UiozkmuH6y4sEF1aY0r+h34P4gHWn0
 Onig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755642960; x=1756247760;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDCT8mF9Cljaxm5mZSyW4Sv46fruFce/2oF9ryX6O/o=;
 b=YpT2hftToSIm2jBuZJmrnLrP/xihgvDwnLV1mHGDbdrq6cwyDS/XpoDNr+4vSm7d3U
 HWL4Q39Fv4kukDxPvCa1wfNyfjKdks9YUerrB47NHRgfhOG5f4l2rqIG45WCXB+i/swN
 c8BIrxPiCq5eIDt2xw7GYzJv9gLpesT7jy9Lt6kw8RHC9F76gknbdJr9Dg0tzgmvtn6x
 6K++6sgXV83/2sz1T8foj12pdF1XGKQmOtG4lSrKR3B4E6yXeLFbPzZ5eJbPUerg3RT1
 z/dh51fHWsgXfFmCaAfShtbN9bmmP27cDmH5efITyD+WpKUr+nwz1KtK+RYzy9Vyma4V
 scIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUscsdh/S5RChqFOK5aS2E8Gb3rCyahBbixTcIQDy9U/JnoSj0F9uDkSLmZLP4qDipBMIjZJAV1r/4R@nongnu.org
X-Gm-Message-State: AOJu0YwKEyFtPVGihoz8STMJTIJZ3nsVE0vQnRa3aM58YhH3P+9Ljqpp
 x4zsCziZehUuA9RAj7P/LPtCPtHmLdH87wblHNj5KofBFsTpOKeHKd3fFbBs6wqFQHA=
X-Gm-Gg: ASbGncvZKBW8/mA5Ja/tTw8tbCo/v5lacDxwfStEACl4ro6NhifCWfwMlA7jXexJdaB
 ycVc0OZmAgoutDv1vmLIe95JKX4f6W4Qn1FfgBT9KY/B2TwrJq9ugIrZLXzMdHHcL3PRTJVtoPW
 j1SHsf83F/slKtrLbLwj+SmRuKnLRMAlFy2HsoY8mv2VP465B5jvhwPKNiWh8VZ2l9THthn3gnq
 KxBQeLOA4NWQLYgxqyqcB5fycgEeyOFZSwTolT7ypdecuB1AX9FmcV91EBS4A+rar3ypZ4+aiWM
 Rb924aA2O6+gG1qZH/3QltGDBgU0w/aYndakOVjX99lcQ63d2wpXUCZb/te+6jgk56doxj9JeEb
 n98jZlNwTYruMx6qPU/dDxWN2LQ74hr9D2Q==
X-Google-Smtp-Source: AGHT+IHldYserH9m8PK7rEtVfOUVOQXLa9rsjM1enR4gVE01iq1AxGukyahjQ3zL+LvuJHbr92n1QQ==
X-Received: by 2002:a05:6a21:9997:b0:240:16af:401a with SMTP id
 adf61e73a8af0-2431b939f00mr1362738637.32.1755642960015; 
 Tue, 19 Aug 2025 15:36:00 -0700 (PDT)
Received: from [10.0.0.90] ([120.159.20.238]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d4f6ea2sm3475541b3a.62.2025.08.19.15.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 15:35:59 -0700 (PDT)
Message-ID: <d01829eb-48fc-40ca-b6cc-b3e8700c3c2c@linaro.org>
Date: Wed, 20 Aug 2025 08:35:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/35] tcg/wasm: Add neg/not/ctpop instructions
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1755623521.git.ktokunaga.mail@gmail.com>
 <0eb3445353ddde2f34bac187bf8d3ecf02f106b4.1755623522.git.ktokunaga.mail@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <0eb3445353ddde2f34bac187bf8d3ecf02f106b4.1755623522.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 8/20/25 04:21, Kohei Tokunaga wrote:
> +static void tcg_wasm_out_neg(TCGContext *s, TCGReg ret, TCGReg arg)
> +{
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg));
> +    tcg_wasm_out_op_not(s);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 1);
> +    tcg_wasm_out_op(s, OPC_I64_ADD);
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
> +}

This is an odd expansion.  I would have expected ret = 0 - arg.


r~

