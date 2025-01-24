Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C307C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:17:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNJO-0005xa-GH; Fri, 24 Jan 2025 12:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJK-0005uw-PI
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:17:39 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJI-00070v-Pc
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:17:38 -0500
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7b6f0afda3fso166758685a.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739056; x=1738343856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qBZiO4D1FqmlXSnrN8yKjuP8R99OxjLQaJMiyy6bpiQ=;
 b=WmrVrdFyYsvReqWlk5GBs8PDdKtJR0/NI+w6OW2CYIH1EwonVzwa1x0xclkh8AfRFp
 wCLHv8oXe/11X26YjWf9ViBMxJibY4H9PQgluMyoH1DJOoZxRbtOTwOjBL9qO79FMZ98
 IHn2CV/t/uWwt9Bpc8RKPLDddwWs4YccV1CtNtUxmuDA3vAvusrzlsYJBVY8f8n6tO7t
 UXyTdBGjzSjKWVbUhUImgMyQpDaeQg8+ZlbuCG/qwI/+hwVUn0rKKm7C9qUP63DkY9RM
 CNpDqGTDCnlp/6MDhZdgrNrLev2f67ITaEgfAlJvLNSEkQJIhp6NKO4FqOygNsb7JDaL
 9/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739056; x=1738343856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qBZiO4D1FqmlXSnrN8yKjuP8R99OxjLQaJMiyy6bpiQ=;
 b=WdHERIFfJynQsPAfPlMTnMbVvExfnKkZAtabmwSTHwxWP94MxsGKoQw+bFm+/m/8va
 JUuYTVxxhOieZHlR4OWHhURZ/BNRMGrzKxAa9oe+tNvD8AhAHluXLEAUTI1Jnw3kZJVx
 SUsNbR8JI905kg/uMbfIKqFN3DgVMJbqxMnwNy+jOvrqDbn1d2vd/28b4By4KAtjp18Q
 bX0XlS35FAJ4Zi+kqwf5AvulsEqRrJqfDzpsb4PKfGtzAyF+1aJ/2MvIjZXxCpGZkdZh
 loIpQGWmkStxVGK/FyW3jsarjRIWx8hFTzo7ZhJ8QTpISDQS+JRrhEonX1WflZqj5Fe8
 jLwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOjd66FJ3s5HClzufGFmTWvar0TI3lWE2QevxWKZfWrxfUW+nEoeA39XO6xT6Tx3Q2RS6tZ5wUGznW@nongnu.org
X-Gm-Message-State: AOJu0YyF46cW7vvOcbiBuWcBpq/G/og7aAzj8I857PkzWEMMSglI+tqo
 1eo1Uu57V/kDOp3S3YyMiSLopJvGPzBszwEb6SR1YVYN0q2P+4nG26XKZIyet/s=
X-Gm-Gg: ASbGncu4zCbi3BtWKQNZglsckrHQ3rdCmFrHV8eD2RY6T4Y/zaEcABRPTIz+g4kG9+2
 CaHXSc03cl4p3PEgIZIOEu/InhryJbVZLVh9JSMUubn+ODsr4c1nz0pDmJpZNJoamj3Zpk7tVU8
 ho3Q2yp8AMx6xxEpaGutff/juIUTMAc0HbfwgnS9D3Q9Vq8FtAWdOgcJ+SilWyNzPEdbFPJsvKF
 2r0m2qTKjj98t2VDEMwB42YHp1MVb4xoEsMrYpbcx09E6SSf1doSvux5+MgXtcHlS9Cnubpk31p
 FArmHwMCAidz5Iwfz/9FdBm8IrWgGDJEiPTBaga7GWWHcVsvynKbYAvCvKpBXgxhnA==
X-Google-Smtp-Source: AGHT+IFW722+xKvMmnKjmql7jzBxWTLNbvmvrCvKC9S7GT32+FnmnPGXcFh1fhDO6Jktvqb5suZ8Iw==
X-Received: by 2002:a05:620a:2a13:b0:7b6:d8aa:7ef9 with SMTP id
 af79cd13be357-7be6320c0f9mr4759858985a.32.1737739055757; 
 Fri, 24 Jan 2025 09:17:35 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9aeec6b8sm112525785a.84.2025.01.24.09.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:17:34 -0800 (PST)
Message-ID: <16332db7-6ed6-44eb-b266-8a3e9c7f34b8@linaro.org>
Date: Fri, 24 Jan 2025 09:17:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/28] target/rx: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-22-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
>   target/rx/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

