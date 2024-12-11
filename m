Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7212BE7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 15:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLP4D-00056q-8Y; Wed, 11 Dec 2024 10:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLP4B-00054Y-Ez
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 10:55:59 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLP49-0004Ic-Q0
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 10:55:59 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3eb441c2f28so997326b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733932556; x=1734537356; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LxjO1l1AgGyC9weKWuv+IHqAb3e6rClyzv5vLBGWF2s=;
 b=X6nJ0OAfH9me0Zv+t7RylkYzfUCMI4PzrW2QoPdEmBo1pbg7CDNPcCcHtujMdk2lrq
 WUym3oBAVyX5RMG1BbYCShs88OvlF7qnrS5Ix9BNPhP2m+fmP45qJJ190Vt2rAum4Hbf
 08/+hVE5ktps+PPobHpMAk/dR0YOiqWTjNHQAnQYbTufDhnDfeKV7nqPPYhUcXq0Xb0s
 i5e4KMDo5GUjlaMYl2spbKclq4eJr8beSP48amQ27WjQgf3nmIjWySTk9D9gjlNic1Cu
 f45pVAme8Ra5eohCUw8wH+Ar1YHrONMdZrmHQMeEusjhgQq3DUGnbIPByOm9ajfFllu/
 FvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932556; x=1734537356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxjO1l1AgGyC9weKWuv+IHqAb3e6rClyzv5vLBGWF2s=;
 b=FR8p7+mZDz7OM/qu706eT3FGOYYQxQ7Xn3kbYZ2esg5A7gR6/m7dJxcX0RixTUn5wS
 +c/YgLaIYxntSymyh0CYSIoIpQcDS/DmAFlyj2n/wmQB3h4Y15MXbqXQp/Dzfm469HXq
 hMMsIABKYC6kD1AzT6JrIKMGBAnfjvK5tTrjO7xBoz0qyDQaKbPTgkGlCApZ2f7MUc/g
 owmFU97Qfd+Yp+4Y32kMb/su49fJp3MJsLvw6Bt8mjycNPRTbA2mByPijCjQbz+cfpb+
 Ju0edymMnSKTmDfcTm5JasvWPW/zl/Vejk2IG5kEaUv6xx4ii9Q2ZSHSGLV1kIfbsKUv
 4C+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD/EjqVDdkvL1xNIGGb5tobI76HV3ngL60afIK5oMb6aXl8NVsmR21oe7v+sMERlA12lX6jGOoyyLX@nongnu.org
X-Gm-Message-State: AOJu0YyUlXQjMWFBbApC3qw+VvWafIaGgLp6KqlRqheezSUw8/jJAIfY
 nrB0PCN/r2h+Trap4Vm98Mf0ZAxpbVPZ5afLgZzaG0gThMTGXWIp6N1hfYU36C8=
X-Gm-Gg: ASbGnctbB12FlWBrzF2wW5o66NSuQs8hvc9A5dcWLxeuR3DVzH/KoOXmD1b95LHe1GJ
 B4C/+u6AUd29ARR7FPCQlqQj9wU9BKf+5gvmr4cUOfL+fZwqbbYkIabFyfTli94LBsK2J806Myw
 j1/eWQtZB4IC2tz51SSZnRsEB20morc67X9hh+eTYTTMeoFByWsyVf+6hkswKaWQC3Cvn4YIN52
 53pp+dK9IDlXGFQ51N0L8z9hb7fSgRjp2xbmTwvRLBucv+Zi9kgyzW0/upo71oB6ZXapbA=
X-Google-Smtp-Source: AGHT+IHpiltOWhtK9l9jOaqwmVFlGNnyWWrJCCtPHg+FtHPprCeJdR+k7jbiRoVsQJQR4XhlxNEwzw==
X-Received: by 2002:a05:6808:164e:b0:3eb:7ce2:ab7c with SMTP id
 5614622812f47-3eb85cfef7amr1682492b6e.41.1733932556374; 
 Wed, 11 Dec 2024 07:55:56 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb863c559bsm391127b6e.15.2024.12.11.07.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 07:55:55 -0800 (PST)
Message-ID: <115a3d3d-a303-4e7d-88fd-de1a291db540@linaro.org>
Date: Wed, 11 Dec 2024 09:55:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] target/riscv: add VILL field for vtype register
 macro definition
To: Chao Liu <lc00631@tecorigin.com>, bmeng.cn@gmail.com,
 liwei1518@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com
Cc: dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zqz00548@tecorigin.com
References: <cover.1733930699.git.lc00631@tecorigin.com>
 <87f12c20620026268bc49cd030e6ce8f26e718c4.1733930699.git.lc00631@tecorigin.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87f12c20620026268bc49cd030e6ce8f26e718c4.1733930699.git.lc00631@tecorigin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

On 12/11/24 09:48, Chao Liu wrote:
> Signed-off-by: Chao Liu <lc00631@tecorigin.com>
> ---
>   target/riscv/cpu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 284b112821..0d74ee4581 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -170,7 +170,8 @@ FIELD(VTYPE, VSEW, 3, 3)
>   FIELD(VTYPE, VTA, 6, 1)
>   FIELD(VTYPE, VMA, 7, 1)
>   FIELD(VTYPE, VEDIV, 8, 2)
> -FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
> +FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 12)
> +FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)

Still incorrect, for the same reason.

We support execution of rv32 cpus with qemu-system-riscv64, where sizeof(target_ulong) is 
always 8.  We support SXL/UXL, which changes the behaviour at runtime.

And, really, why do you want to add a define that is never used?


r~

