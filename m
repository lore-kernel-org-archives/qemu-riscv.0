Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57B7CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7IDH-0002Nr-2R; Fri, 10 Oct 2025 14:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7IDF-0002Kx-6S
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:51:33 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7ID8-0003Em-F2
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:51:32 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo2190712b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760122283; x=1760727083; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UjQu7zlrklW8bhkUH1PQfspXRlINeX0cjmG1+QQoGLs=;
 b=DBdDU8pMuCBSG3syntMZ8AmFgkXNvwAGSE/W93Yht7v00j88SiESQBbO4gkXeQkbnh
 IB7ARARa/TDA86qyKNDcN3ldPjJQSX8G56NTKgC9o5klnUJmD8ur+lCvIRVKvI64F/uv
 52ymNYb43aUNY4ObXGcHPv7elUu4jNyvR1rFrZ/KYzDFNxnDLqyfQVyNshL2pjBxpgCv
 vUMYxwH1tT1WQVeEomsaJCbY0ohRD/BysYU21z5TIEvsvV25KCPUntN9rcFrmbOq5dEK
 1YAVGWLjDjblCtAAMz+96GB+Eji3zFAOSIatU3skjBuPyopnzQl9YaTXxdGo71eKiWad
 aJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760122283; x=1760727083;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjQu7zlrklW8bhkUH1PQfspXRlINeX0cjmG1+QQoGLs=;
 b=TaDd0a3wt/4YNzrmVGMcynJyPMPT/lli7FFX74bsAI5sLElirEyPC2//wZiuw4ymlx
 Qxn3UjAiDqgxmMshTlqmX6cZjGqEgqY9v7qWs3SJJ+wkIcw1wQ9w/8tr0RY/gg8NAcZI
 JLnDW4or1DF1M004Oe66ZymOpTnGeyk5eN1V7eEHXCuELm5Ysux95Xr2+63yiH8SCmlA
 9//fdA8dGSQ1H+SInKLAbZjRSECku3LoMPZ3vKExvRW3vg23E5d7UCo0VpmgkiE3oeyz
 B9r3ZxM6MGNdash/L5ET8ChSMlKB+kgQZg9UXXEFY1aLcSMSb46jAlI+XOUumYo3hd1P
 I2Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4azC9P8YEBp/A0bN+cSP66KtJ9WWNqucf+Zh5MUZEbUiBU+2CF2raiutRvm7xRXOaI6Yunz91C8e1@nongnu.org
X-Gm-Message-State: AOJu0YzNo/lZ3wtSVvUAsqf2OvH4nAYyFy9hvnqegYT6/IRBjFk/eQOh
 k80IyzPYfgdL/SXMwHGWngxUfpemudmmlGBIfk1/GFdw8zkqCy+Jv8xwvtRkPer4qE0=
X-Gm-Gg: ASbGncsOXfJW4vnndrATgNaDq1sVaBFBwtAEysDSq9mjt+1IfN9zUwAuJa7DATTEre+
 mnfgV7rzcO0Udqv2e3Ov0XsVwsTPmB6vmsS/OtVEDfpldgihe3xd4V8lQd/0OfsBNgK/SU4/ZTF
 fb27zBMl9p+C6sT/PZHzlyb9yqmNLyYG7L5Kdd59XWSe3ABWlqwGt2uHiVIQZZcC9twHJU4MKSI
 1ikkdpzUzYJkpSjfZVXrk9Z75FZwj4ILEZ3fZ9gD3Yzl1/JpMgKlAw/5QCKI+sJrKl1tYaiiIn0
 AjxVA+D0R0SrUVKk9uGWTy3QlJ7s7xvR6X7rYyffe/gwUB13wMzILmYyJqxF2yMIenL+DQXAESF
 z/DHaVHa6U9J/OM0cqHA24S3SVP7qaM9ZW8Jba6FPTc6QsvMHO652DYDJjUM=
X-Google-Smtp-Source: AGHT+IGeh7EqjJMv17z6t9orhQkp4p7snkDCDTXPf0X6g5kZMAdbtHWlfxAx1AW+wesX7a5Hwiw9Ww==
X-Received: by 2002:a05:6a21:99aa:b0:246:354:e0ff with SMTP id
 adf61e73a8af0-32da80bbb0cmr18998510637.8.1760122283134; 
 Fri, 10 Oct 2025 11:51:23 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678dcc0cd1sm3035389a12.8.2025.10.10.11.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:51:22 -0700 (PDT)
Message-ID: <19ae4657-92cb-434b-979c-05f399ea7dda@linaro.org>
Date: Fri, 10 Oct 2025 11:51:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] target/riscv: Conceal MO_TE|MO_ALIGN within
 gen_lr() / gen_sc()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251010155045.78220-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 10/10/25 08:50, Philippe Mathieu-Daudé wrote:
> All callers of gen_lr() / gen_sc() set the MO_TE and MO_ALIGN flags.
> Set them once in the callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/insn_trans/trans_rva.c.inc | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

