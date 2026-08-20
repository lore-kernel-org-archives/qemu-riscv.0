Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B15FC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:22:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx4Zy-0006kW-P5; Thu, 20 Aug 2026 11:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wx4Zx-0006jm-Cx
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 11:21:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wx4Zu-0002cZ-IB
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 11:21:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38dc69c74b8so2787272a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787239273; x=1787844073; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JBiklarrCZGlNuTGlfjF66tiZXZ/iOMyq4iHSICM5cc=;
 b=RM0YQ7zj9vNJ54qF0TPbhzeRzS32C4bekijOaOS6twd3AI+pfaruq+l9THl46cdiUp
 DsL+8Ms8yb9WXCtMcDce6KmvqF+f5cx+Y3+uPKpZeYt4z+NG2L87BjZPqWe9fmE3XRGr
 rGP+WfSN1HpWn9ojSwvL8mA1Tj/OLuzVLpKKMxxgAuSGK/pPbGls3rCiL0R3WRtYDzxQ
 dYaxXe0Z0OPSALS4T/4HHZG7/36lieaU7JmvkXHBdTFQpuBJbFMDw1l3/0KWQnusc9Q4
 B69taZEGxlXPGNOp+FxW1vWefo6fZzrEuptml9ffXPn9cAaRr6iNiLeA/lTzwTKzLtLS
 YhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787239273; x=1787844073;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JBiklarrCZGlNuTGlfjF66tiZXZ/iOMyq4iHSICM5cc=;
 b=MA/EwhmVtVciC1RuHj2uDTOaiAftFOk1TY9NtUWpO6KafOQYLNML50ioAticqt1L74
 gcq+Ug75IWLlC21oN0IjNDBRA5y+Ilf9wn6VgbAStC9UXejtvzD6YtqTwX644aTZFho6
 mN28K5gucdQ0JvNBreuV26pccjI4xk9aA8zIcngDwve6PK/WyzopYum7AxWQ6qNPo3ch
 0ltn2XAZlxeAuTxq16HVZk0+txKMJEtbNP5Q1nZx88pJGgb0YcTvFPm3zKBt/vyuqVXO
 UQibODdHK+j93i+Wc4wbm3uzT5VoRzrJ3mUdVC93Imn2koxpNfDPK8X5oCk8/4KrcHV3
 WoUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNhBA2qyzHj8AmTC6lJX3ftMotp0QiSWMuJ8gJ4dpFcvl7LLs28BMZYVg+/OPgCvqGPOwlXVUD+yfi@nongnu.org
X-Gm-Message-State: AFuF++mWLQ36r0OX76XgMV/J9S144OqOD52ow+vb6uNaOxQajdiadSyw
 Yy6V+2JACOArr7VjR9EzEOjspKW+VKNlSG2WLDBgrANpzRXyQJbUmVaTWEblwLGV9aI=
X-Gm-Gg: AR+sD12kofOHnHmGnGu4xLliVrU3RWh/D8sMd+rfl8kcfh6HRa7VnmhtELUj/CfpvSS
 /WWxy4/2mt1IKQMSeO5Vz8+DlV3cFUPnH4FkX8QlRiyUYVzbSmioJwrrZZWQ2MtkXEe/bM6oG1h
 PfLuPscXQQ+NZTVNwGQFG4GKkECqDYMaAS3DHcm265wwxwUyUoUwdxr0QA++XFgYW/+N/cCWE6m
 n3H6OIMbNxfRAMksIUuxBh8bZ3si3qnlI/kuK79OHN+Vgyzo1Q60NMSypcyFp1YNRb7Ily3DgJ8
 9oivKTizy8SX4BYoV9TnCiU5HRJ3sZ3uBm2Ulu+HjW6vFO5q0cUz7zWCU09p1fS5GJKpPbKGfxp
 jQnNHelVpRFy6yT73IC3agnmfbD16b+pPG8e5HxmNrAGW+6FYJt2MXmHMne4JE2FHdAtfcj01px
 fHWvIxOX0fKDrC01Z8dwtjupTJnw1bFLJlxjT7l81QeCu0ayE8SpsI26GB1cJrEcMENGcQKTDhH
 ry7dsY=
X-Received: by 2002:a17:90b:390c:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-3958110c03emr21321281a91.10.1787239272449; 
 Thu, 20 Aug 2026 08:21:12 -0700 (PDT)
Received: from ?IPV6:2607:fb90:331d:db6f:e6eb:39ca:2251:a26f?
 ([2607:fb90:331d:db6f:e6eb:39ca:2251:a26f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb17f48sm7805182a91.2.2026.08.20.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:21:11 -0700 (PDT)
Message-ID: <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
Date: Thu, 20 Aug 2026 08:21:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260820104730.25462-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 8/20/26 03:47, Philippe Mathieu-Daudé wrote:
> Introduce const-qualified variants of cpu_env() and
> env_archcpu(), to safely access CPU architecture
> state when it should not be modified.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   include/exec/cpu-common.h | 11 +++++++++++
>   include/hw/core/cpu.h     |  6 ++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6594f7fa1be..f3a3799f451 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
>   }
>   #endif /* CONFIG_TCG */
>   
> +/**
> + * env_archcpu_const(env)
> + * @env: The architecture environment (const).
> + *
> + * Return the const ArchCPU associated with the environment.
> + */
> +static inline const ArchCPU *env_archcpu_const(const CPUArchState *env)
> +{
> +    return (const void *)env - sizeof(CPUState);
> +}
> +
>   /**
>    * env_archcpu(env)
>    * @env: The architecture environment
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 81af7b9ee1a..59f777f3f15 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -594,6 +594,12 @@ struct CPUState {
>   QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
>                     sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
>   
> +static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
> +{
> +    /* We validate that CPUArchState follows CPUState in cpu-target.c */
> +    return (const CPUArchState *)(cpu + 1);
> +}
> +
>   static inline CPUArchState *cpu_env(CPUState *cpu)
>   {
>       /* We validate that CPUArchState follows CPUState in cpu-target.c */

I wonder if we can use _Generic to make this automatic, rather than have to choose between 
two different function names.


r~

