Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC63EC83F03
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:07:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uXcNd-00014L-L0; Fri, 04 Jul 2025 05:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXcNb-00013a-O6
 for qemu-riscv@nongnu.org; Fri, 04 Jul 2025 05:06:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXcNY-0005c7-HE
 for qemu-riscv@nongnu.org; Fri, 04 Jul 2025 05:06:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so421711f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Jul 2025 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751620002; x=1752224802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rW8lDQEU0ckP9xF3CBcW1D3QAajIEmoUVXRX0457wYo=;
 b=gik0kDX6rI6eBf8/9CAaJwPYhrxQdDDivDGs79Gu/myAhy+BrIMOkWDzMcO0asWqYW
 IQCLu3OUau4F1tDp2W5WKiviDgJc7tI2SMwQ3R5n8/vtI1W6EJhfBS3s7oTj/+m6IqMJ
 0EpO6YIvg4zW6xaM+f1GtAs0y8NLpxA1U/Yuuq8hZ30fYOu+70IHIewckmBV63OKxcUm
 GwJrZURGLu5+svBXvBCOyO4MXhnpjGSYkBtBIsCyXIbI1HN+dR7tP+DsBNyQ6jED8Il3
 sebyU5gifh7ZJ1pJocGwmVV2mkCcgH9n9oXOn7tY2DAoxY6wyi+mzyTxfCmz26EZjAmP
 YxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751620002; x=1752224802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rW8lDQEU0ckP9xF3CBcW1D3QAajIEmoUVXRX0457wYo=;
 b=FnvPf4zjh0D0nn2kf8hgLf5fPX87SKCdEjUhx9mRrThVKjXOSJnlT+ARDLeFk+obHm
 E+dH+PCUacloBNanGW3Xs6Y6ZjTVMimHZNfk9wm9jcNoGW0UCgAssuNq47dthJnxKUwm
 NL51ye7qQUUT10bdXJRbyvUcmUoKn3KyzTZEZlYxLiz8YQgY+Tv2NxE2jivvbnfxtK+C
 hr4DDcfkUGgBOFd/vLJ9s0pFKDw+LLilSLgEbKj36owTRBUjk0GJDbjuhP/k4nq5gksh
 HhYECt/xhpTsvdhOLnKaWX/eT2f81PUis2YMbjr2s1lUlKHGucKHOuEw9hHiWJBJoHkJ
 MVWQ==
X-Gm-Message-State: AOJu0Yz/ofTO5c7WhspZ05h0qdbh0YkSypR+F0kQNgnZOoxcdOcFi2gE
 iMSsIL19T7mMKq0BYHuUtMYGj1RwlzyQwYe3wsEe5uDXQIkxT/QDkVbmpF7cZ9yAAdY92L/m/vx
 JBOGeXzw=
X-Gm-Gg: ASbGncvRvg1AKyETvm6I2qhv5poFg0e7d9HSkX/UawWqh5EpAcxiwG3DzIjB+I2RQ2K
 wbwqZtDCrmSn+5uEvMHPN5IHFZBEcNmp4A9siIH0MCJmNl+Z1OAJbH1mn4GK7bV6uJ9scNn9ZhF
 KOd4ZQarexCbh1xqzo8egq14fGhBr2BenqoFgj5QlW6SGmMbg5nnG66YLon73MO2EAzkAAFw+vy
 K2bxEMyxZUm+P/vn/NuXe19cQiuS8KQVlhc0GE68OyIAeSGYv8vCfGEWQfP+LqiDCL/0RSYAlHx
 XUfFff8l0IoPFhVmiq27ieVirrueu5ufR1En5ETjyEn6MmXUG4TZusI+akRwdkYwWtZVm2fnT3v
 agN2/1sFMGufIa+InuLMpMELuC/DUxA==
X-Google-Smtp-Source: AGHT+IGkvu94oDV7hitrUElwKdZUsaf/XSsJf3YKYz4ETfge/glYA28Nhed6tzJBLfKIUZ60h461rg==
X-Received: by 2002:a05:6000:2c13:b0:3a4:ef0d:e614 with SMTP id
 ffacd0b85a97d-3b4964def6bmr1369391f8f.33.1751620001778; 
 Fri, 04 Jul 2025 02:06:41 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161f481sm20748885e9.2.2025.07.04.02.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 02:06:41 -0700 (PDT)
Message-ID: <bbac0ca1-5f98-4454-8314-f05acff5af5d@linaro.org>
Date: Fri, 4 Jul 2025 11:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hmp-cmds-target.c: add CPU_DUMP_VPU in
 hmp_info_registers()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20250623145306.991562-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250623145306.991562-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 23/6/25 16:53, Daniel Henrique Barboza wrote:
> Commit b84694defb added the CPU_DUMP_VPU to allow vector registers to be
> logged by log_cpu_exec() in TCG. This flag was then used in commit
> b227f6a8a7 to print RISC-V vector registers using this flag. Note that
> this change was done in riscv_cpu_dump_state(), the cpu_dump_state()
> callback for RISC-V, the same callback used in hmp_info_registers().
> 
> Back then we forgot to change hmp_info_registers(), and 'info registers'
> isn't showing RISC-V vector registers as a result. No other target is
> impacted since only RISC-V is using CPU_DUMP_VPU.
> 
> There's no reason to not show VPU regs in info_registers(), so add
> CPU_DUMP_VPU to hmp_info_registers(). This will print vector registers
> for all RISC-V machines and, as said above, has no impact in other
> archs.
> 
> Cc: Dr. David Alan Gilbert <dave@treblig.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   monitor/hmp-cmds-target.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


