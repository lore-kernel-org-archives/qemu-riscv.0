Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEBC021B2
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 11:49:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlo0B-0008FW-Ve; Sat, 22 Feb 2025 06:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlo07-0008F9-52
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2025 06:48:57 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlo05-0002bU-9d
 for qemu-riscv@nongnu.org; Sat, 22 Feb 2025 06:48:54 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22128b7d587so57576085ad.3
 for <qemu-riscv@nongnu.org>; Sat, 22 Feb 2025 03:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740224931; x=1740829731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8YOecwikxy0uJ/DhK841KjyPW/ldqPdEq4EIRUdH+U=;
 b=ByRnYrpIiBsy8YwtT+6o50WnH3I8FIiPDzuRk4TCksQHrSHd5eSO9zL0c3FojOSLOC
 uG36zLswnPBZj4q8Q91hwA6paZTU1FVNziArtpppE5ZZw+KobeO4RYsjlrrhtu9xf5Me
 cafBfWn5IhKSrL0KUhOkEOjJJZPXb3cTBQiFSjb11GI95YYmbuCHDdPm/hi2aUXEEj4o
 o5csUELamazb+KFFvtaAA3OBP34XJzdV6dUgZ2K5w8y2SaLQOMjJtSMFN5orT/wQ9h9R
 dcCp2UvGFMDQzpq0x3F/AbeJP5KQ6EQ+IpHwRJrNbqPvfgR9Htzj1GQmfKI+hIxlSikl
 re7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740224931; x=1740829731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8YOecwikxy0uJ/DhK841KjyPW/ldqPdEq4EIRUdH+U=;
 b=odEbLvNofjQHEQ/otxsBL0ZSAHGp9bv6W7snTNPPBL+3+cxOmHhltxlFgHC0Fb0PXP
 pJMz5T9vWfMAHhHYhybAa3eJl0i3YAoNHEl34yF7BFl1bnRKojDR4Om7Hzu3n76RuT1s
 J6qZKyQjGRVPDIVzKFw3heoJ0mBg7kCpGz18u2nysPSz5rkau6UpFlm+v5/4kM5/sV7+
 JBm4SwbG/Sldm0TlCfs7v8cmckDynFy1/orU85QfKexPVi5tqz28iv1G8h1TPh54ZS2N
 eb45NcOXcvlSOx9tRuZ6SUZRWF12Nz6a5/b76gwDhyQeIrtPBmSJfRBcIJc5Ds/OOkQ1
 X5xQ==
X-Gm-Message-State: AOJu0YyHWxQ5h+2QZDWAmstYXvyWe9QOUPDeLpZt31vlEaKtvHqh9GdP
 Nl+DurL38UotoIfYlRHrOKXlA38pYs5V6Yw87Z6HQ3k3hISPeWyMAaK3XB1YqrQ=
X-Gm-Gg: ASbGnctnUOr1/JEHmwTPETPmVmODjQ3NB1a5a4ReV6i5Lx28cqxusI3zKLsUe4m+fNC
 GBOmXrf533nhtG6/LUM+0qx1oyQmouv63GKq/oM36AVv+WGcdoWC43LQLgHudiV7y5/rFMAOYUc
 wywqQuDDphvtktRhrIpYtBwmX1WGOUmUAg0d7zy6uvr4UMhA8pCHVzATjyzTXe8HJCPZag/C1V/
 0duWbI0iyXpXQ8GJSAibxgk8vn5pxkuQ26yQkJiwKolZgfXo/UOA0JfL0/kNN2ag1aQzAiLOYAa
 N9UxIMVIN9QnNnzIj4NvHuBh0MBsp6QHqECGSr4=
X-Google-Smtp-Source: AGHT+IEXP8f3/2g1iofh+B6zYL7Gvb0A4T9uG0sj/kPd2q7xVeO4wzewgHSVLeYBlomH7MdWLZ7VKw==
X-Received: by 2002:a05:6a00:4b4f:b0:730:7499:4036 with SMTP id
 d2e1a72fcca58-73426d96b36mr10645843b3a.22.1740224931066; 
 Sat, 22 Feb 2025 03:48:51 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.174])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb5a92b959sm15738629a12.63.2025.02.22.03.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 03:48:50 -0800 (PST)
Message-ID: <06073138-61a4-4279-a5dd-8a9caeef0340@ventanamicro.com>
Date: Sat, 22 Feb 2025 08:48:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: fix C extension disabling on misa write
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20250221135735.85151-1-vladimir.isaev@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250221135735.85151-1-vladimir.isaev@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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



On 2/21/25 10:57 AM, Vladimir Isaev wrote:
> According to spec:
> Writing misa may increase IALIGN, e.g., by disabling the "C" extension. If an instruction that would
> write misa increases IALIGN, and the subsequent instruction’s address is not IALIGN-bit aligned, the
> write to misa is suppressed, leaving misa unchanged.
> 
> So we should suppress write to misa without "C" if it is enabled
> and the subsequent instruction is not aligned to 4.
> 
> Fixes: f18637cd611c ("RISC-V: Add misa runtime write support")
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---
> v2:
> - use env->pc instead of GETPC() since GETPC() is a host pc;
> - use !QEMU_IS_ALIGNED(env->pc, 4) instead of GETPC() & 3;
> 
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/csr.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index afb7544f0780..8aa77c53a0db 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2067,11 +2067,13 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>       val &= env->misa_ext_mask;
>   
>       /*
> -     * Suppress 'C' if next instruction is not aligned
> -     * TODO: this should check next_pc
> +     * Disabling 'C' increases IALIGN to 32. If subsequent instruction's address
> +     * is not 32-bit aligned, write to misa is suppressed.
> +     *
> +     * All csr-related instructions are 4-byte, so we can check current pc alignment.
>        */
> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> -        val &= ~RVC;
> +    if (!(val & RVC) && (env->misa_ext & RVC) && !QEMU_IS_ALIGNED(env->pc, 4)) {
> +        return RISCV_EXCP_NONE;
>       }
>   
>       /* Disable RVG if any of its dependencies are disabled */


