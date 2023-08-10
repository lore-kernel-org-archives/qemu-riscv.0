Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C59C001DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:49:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU3DJ-0004Qz-On; Thu, 10 Aug 2023 06:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU3DI-0004Qj-Lw
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 06:48:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU3DF-0000pz-NA
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 06:48:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso694638f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691664495; x=1692269295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zREiXgKhZWxOySl4V29SG5+DLFHDpfvUC3WQmIKJbn0=;
 b=Q0HupAC/YX8AtNhm/fEDhb6Lcb9+H1mdoca17VRqXCxJFoplSvC2xORJh7dSkTBv5z
 MHnYcuKDbfnuUUEsL2lV1wyrlPBnDZyUwM2ztGkCI3CmrmSoVVKhI5/0RVpun4qFTUz2
 3EiMv7vQWimfMpT1AU+1ghvkG2hj7IOUjE59i5xp5tMHqM0HgXe984qp7Os2T7QGFzSj
 FgzkcNK2mOTTrUIxPVBlItP2y6tJx1a/uAninJu1pgmBfV3eJ8fMQF4dlaMV+1uYgi6O
 YsKNG0VTuig0mx+h9iu1+wY24vXD1XyO5CT0/flohu6oAHGCgWD1arBaM0ZmL77f/dyV
 YqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691664495; x=1692269295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zREiXgKhZWxOySl4V29SG5+DLFHDpfvUC3WQmIKJbn0=;
 b=f5JXm0vMCG8grgO6QNzryyEdmAPt/fHNsV/ekXLOSrdFp11DX8XLGjrrGsJ6g6gpaM
 3n/qeQA+s7qjB2OQ0y2QauP7zNTj+eoK/oy1TwfUVsJTwDE9EMJlJE/6Gf1c1q3Y4feN
 eYDBPpXIjjxcLyH917bGxGwPsWRxK04Bz5acYfL4kGInBU88MZ7qaAyQwZOeR8EzxAdL
 h25IqiLCz7UaqP/pB7Sd5E6bRxDMdRD7W/zRbljTDH2OfOoU40Nh9+7tWGLgRwB7Fj2K
 bi9I+RK3HSzsDqlcOGp2wi+46ZcXbklmEiki37+gx/CMeh/MrvR9f+fAo3HYyVYAoEdn
 LwZA==
X-Gm-Message-State: AOJu0YyZfJTWHZIrLiQMYYzpsl/odBfYiz26G4/JPJxWzqxDEC93Obsg
 DJtBja3c5ZN3y12DLtavHXh9OA==
X-Google-Smtp-Source: AGHT+IG+HwwMgrsgOm9JZ0Hr29Jn819s3M9xSfBSZbEVx/RdrpKh5qAK7TJQuyXEGYf1FBD5zkW4+g==
X-Received: by 2002:adf:f605:0:b0:317:54de:7315 with SMTP id
 t5-20020adff605000000b0031754de7315mr1730141wrp.61.1691664494935; 
 Thu, 10 Aug 2023 03:48:14 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
 by smtp.gmail.com with ESMTPSA id
 b13-20020adfe30d000000b003113ed02080sm1746738wrj.95.2023.08.10.03.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 03:48:14 -0700 (PDT)
Message-ID: <64635d96-26d9-a00c-cf2f-aa92d7162061@linaro.org>
Date: Thu, 10 Aug 2023 12:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/riscv: Use abi_ulong for target_ucontext
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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

On 8/8/23 11:34, LIU Zhiwei wrote:
> We should not use types dependend on host arch for target_ucontext.
> This bug is found when run rv32 applications.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   linux-user/riscv/signal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index eaa168199a..ff8634a272 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -38,8 +38,8 @@ struct target_sigcontext {
>   }; /* cf. riscv-linux:arch/riscv/include/uapi/asm/ptrace.h */
>   
>   struct target_ucontext {
> -    unsigned long uc_flags;
> -    struct target_ucontext *uc_link;
> +    abi_ulong uc_flags;

Correct.

> +    abi_ulong uc_link;

Isn't it 'abi_ptr uc_link' instead?

>       target_stack_t uc_stack;
>       target_sigset_t uc_sigmask;
>       uint8_t   __unused[1024 / 8 - sizeof(target_sigset_t)];


