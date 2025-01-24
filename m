Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE5AC02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:06:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbN8a-0003rA-CQ; Fri, 24 Jan 2025 12:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8J-0003jE-18
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8G-0004oX-28
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:14 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so3876734a91.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738370; x=1738343170; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrNfx2IQLbCv8te2qs82IcX9IkurKqGHcLiP17zLtEY=;
 b=yGAeAJwruMArXHnxrQ5SQzI56J9XHlY0/7c+4xy+OnVu09H4Zkos5agwE8g/aRm/HD
 p3AqfS/hfgoRSF8WTn4lT0TG2sjqs+HQoQhuW+KQXec5ixupTxUA7lzKGj0BR3b0qauU
 eBhGrw4QH+UVMt+M0X8TUognQmHZzxvjLM2FU0GWnxpwezD7zHMtz8dA/tLeCzI7sDhS
 rqrJ2EXQzx7dYxL5/qcEEB/tdCII8Arx4OsaOiONVYs1axS8dllckRT818b02OX3Ag4g
 uQsNgL2LMHkze+BPAndQpwF+E1dnPSdWcyEVjc3MPS+CeCJs7UPWd+KNkAja7irCEPk4
 yQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738370; x=1738343170;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrNfx2IQLbCv8te2qs82IcX9IkurKqGHcLiP17zLtEY=;
 b=NhgC6EDqBVTC48cBBi3I+147yAx6enItSzYiRXFtqntyqfeGjtNWTGNjWsRPrnDxEi
 6YcACy488nwPLLnhQwPTl4V1eis8l3WXVnWqUjQ8nh7wLU+awbV/nCrBamZtAaG+fVfi
 B97r6x6NwsQjzks/5PAlVUo18kIQHwEfcage0JwmrcsyS97Eomhue8F+8xaXvA1gUoFh
 uFZF0a8BnhyhRpjkqfBDWd66bsuAoSzPZctw9XcBhtv2RdHh46cuKpXNih8gtt7H8kKq
 bfBtajv5n7yv+tlwhGuD+1xoaSnsJDUb3CuhCMUKu3HP01TRAH2ugHpTE/72YUlygKfF
 IOZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQcM7pGhR7vPwg+aAFQVeY8z3NXvlL/PuSaM33UBxXdUHioOBlTk6o36ZfgtbBXbApSj6D2AaqRJSt@nongnu.org
X-Gm-Message-State: AOJu0YxlzGLN+m2yHD3rT6DKCOBkHxRBqWprE8hhprjRBtwJ/ww2SkTo
 tYRUXQ90nj9SsdTQBYBVyj/ixZCOfQjK1sOtioPiyhVXQDzE4GhgiLbiZ11WK24=
X-Gm-Gg: ASbGncsn2KY4+qXeiAobkII40JQoiWjvmAThSCt2LeDtxuDbNeqMDXXVdwEkIWNNOMj
 EyU9pfQTjScYLG67BsQdeHwc9fygcSGwgnzzJWVCxBegM0jmqACzR1/IUi93cbHuIX1jPIx4hUe
 HIMhmB5szGxif4vavs3s8uYU/+166NcVbsNEpCt52z9MZHcLC3q7bL8qw41KFjF0HIcqjwWMoeJ
 gBzn4Naocms723PJH8TZBWqbKMfhHvXILDZHBlmena2njhvdOuE6EOzQsCQMUkd9xJHA0x5H7q6
 boK700ktGWaDJS42sDSHu+4Y
X-Google-Smtp-Source: AGHT+IG5LgDdTFqhvy9653F/gzEQg3yZsG+nvhDh0F9tVkY2PaJoUPkS96T7jCGIHQGU5xUqK9fDdw==
X-Received: by 2002:a17:90b:2b8c:b0:2f5:63a:44f8 with SMTP id
 98e67ed59e1d1-2f7ff2beae0mr7103688a91.8.1737738370636; 
 Fri, 24 Jan 2025 09:06:10 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa8318asm1971992a91.47.2025.01.24.09.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:06:10 -0800 (PST)
Message-ID: <b2a7f8e9-7571-432f-9cde-ec549217fcbb@linaro.org>
Date: Fri, 24 Jan 2025 09:06:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/28] target/alpha: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
>   target/alpha/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

