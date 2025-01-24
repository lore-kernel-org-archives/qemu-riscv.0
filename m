Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BADDC0218B
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:36:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNbI-0007B3-Rl; Fri, 24 Jan 2025 12:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbG-00076F-O7
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:36:10 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbE-0001em-2e
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:36:10 -0500
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6dd43b08674so21432746d6.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740167; x=1738344967; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Y6vsgRygU0bR+WKza1oH3fA4m45+T2lMj7x2f2LgUk=;
 b=ZrWzpzcDfgmCBxiox0iMGHASbsPT+7Vx5+3zU9bdBRrr0XX5bRlNRp4LEmpxHJuSxc
 Zw+Zh/1GqNoO3rdohw0VoGK6ffLR4ag19r+lxWnjCP684E8VzCtH3q/vboInlxQg0CtM
 R0tReytCXvbmavpyPInyIq5nvGu3Z0AFBhPkU5UJ4Ra0udZN7cCBPXDzAbfVhf2hT4YG
 JsI/kZ3XcugOM1cluvhUjKAckmXfv2MQuvr95E+SNj+HKpqn6hAAWhA3wsnDBqBirB7v
 fPv9DOlFOPZvtLpM0s19OlDIdck8a0BDKUlbg9C34vn1/wrGq5175kQZAgF5ejSQT3qZ
 JEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740167; x=1738344967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y6vsgRygU0bR+WKza1oH3fA4m45+T2lMj7x2f2LgUk=;
 b=OFCzwN1BpbNk7OpOKST/9SR53Az/x44Y/LMAIy84jz7aDM/ntCztOZg420QU+XQziS
 cYhdUfwubej67CmXZEp/phf+4VBtJI84GIcJeiwe1juqh6WtoJN8oyY8mVmtsySuXwyX
 23+0AlSDI6KpkqZ1P4kRkn93QXZ4xqEQJu5dllHWPr+XnnKuBbOhA1idhYicPWjmIM3M
 wwh7vzJpv+cbQprZsPUTP3UH5Zpby6ikLI2XVlzAXwJwfCsxwXqgyhUqrmLulh/rsDtX
 qUoCe5suhVDEPlljJYn/+Z7H06iEKx55B428wz+MqZglJ3zKK1DX5Ey3osgyoyiH2d7b
 E9XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvNJDPdK5RmFfn3z4GjYsgVrgRQS8Pu+sN42TGBlhiOba09lX9OMc30VfpToG1VogGTyjXkUpse1SP@nongnu.org
X-Gm-Message-State: AOJu0Yz88+cLkZ2eP6qWOCdmT92FS0kXHk0D51ePcFRg40/As0tBwZBT
 viL+kzbpGcH0w3qn0PkYlAS4vpC1IDzyoYCEugHxJhnmUOW/jBpp/+3R5qmlwRA=
X-Gm-Gg: ASbGncvvJ6CSww3jBAHAe9C61+ID8l1oDWoX+OBnIoHmbSx27cEumaUf5Dxxinxkpcd
 MZNuw2V/HT9mQfmaO0qs7BSpIb+yVckbrRvtsZqLzdoCjVC4umQiuNo/aafnX7YN86nmQt95SOB
 hENrjoRZmk2f7KMm25eRNsNsOvRHhlKLNE0RtH6eB2Hx79xkakVOj0wSV5mDOY7PyFh3mk+UZdJ
 +M5VF4T4FS+LZI/bhdugXf0FmbyXlvkO+bB+RRqzuJMdrsu7qhz21UoNgYmZZK5BlFUNM/2WCqe
 1asJfzBlB3ZsjhMKP+oKf3xYhBYm38MJCj1PnbTAsx2S3M0Sr7BMLM39h6gp72uzOw==
X-Google-Smtp-Source: AGHT+IHWfrdhsMsbb9Du3oN6UmpE8041VfawpDEFVs4GH4a1xOMY1Dgx8qmdRrLCwP/0YF0CaBoQcg==
X-Received: by 2002:a05:6214:21e4:b0:6e1:6bdf:ed1c with SMTP id
 6a1803df08f44-6e1b217a2a8mr451197516d6.14.1737740167035; 
 Fri, 24 Jan 2025 09:36:07 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e20514f426sm10530276d6.38.2025.01.24.09.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:36:06 -0800 (PST)
Message-ID: <286a84ea-356e-4e57-929f-a5afbfea6ad8@linaro.org>
Date: Fri, 24 Jan 2025 09:36:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/28] target/tricore: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-27-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-27-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/tricore/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

