Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18388C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:40:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNfG-0003Z0-Aj; Fri, 24 Jan 2025 12:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNfB-0003X8-1b
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:40:13 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNf9-0002oN-29
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:40:12 -0500
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6dcd4f1aaccso33954666d6.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740410; x=1738345210; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=whu1tYPX1DIKsEnegp1oH1/XFqeOkSpePtst4qKd65c=;
 b=iUSOScLxsS9vdff47pKFjOPMwA2V0zrYo/1KVaTNtOTjT/g8Af1h9/jP1Au2BSmopZ
 LQ+666hCUYzdqs8TYmt5M00UERvXVQIOsGEuxTArQ2ibwFALFhFyzefCAkEoe9OGTQNy
 o9b/3yfqHWpFdi0JKFeuUHSDuSmpm0/NfhiKcBdQ8Z/rgb/ZxvUnDKowWjx4rFu0MsI8
 gSZPIH1/PofipD/8saYyiPwaS6bS2RFypwlELqBqfCuuDaQOReTKdnr0DlOUbPodvLlM
 fPh0sU4qnKZi+RiCJUuLR0/pSi6xwHdA7h27VBs05ztsbY5mpM6U/t3GDN+TFKzG1A7A
 kEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740410; x=1738345210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=whu1tYPX1DIKsEnegp1oH1/XFqeOkSpePtst4qKd65c=;
 b=Bzsxar/W5bpGYn5DpehDdvNm1WgBh6LAqhDDYe6OukOwfuMmo404bOwX3/VYN7UKzV
 V3K1MdUS+C4+t6OdFGmDyCrGpgdYqlHA+w2/OuA8pVXbOQYytvZDa8oiSuNB4Kqe54N1
 c7w1hYa54OW7HDpAQLfzvwmI0m+OhkCuoMEZfEJ7bOO1PXGwYjQu3W1KoByGeZIHe+r+
 fbkRkNhwnJ6iLpqxx4fKlQft9tsTPSF6n5XOWtapGE35rVvY8Hnxvl4JAbU1eL+sw1jG
 EQ2NJcAee4/xQNN4TLpCPMiNTDFEOTjjQjGf9bCprO712CfZECaqEJl83+sspds6rss1
 SS8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVLCnmt0JGpr0XYbYKS18PfkUvsBaMgoNMKUuDlLeIfQlRyRRtU4ZaH7jf0s3xqFUvMr9lU7ePwTom@nongnu.org
X-Gm-Message-State: AOJu0YyORaUyWYFKMBNl/jUHYs6xtpeaGdv1XULzjbE6MWQ8Zk1JCPbu
 Y6gWgKQND19TaZ3vdjVEg+UH4Ed5sLKHx1XTJ1uCCsL52Cp/APfk67Zzi6A7iac=
X-Gm-Gg: ASbGncuyiFcEjWDEjKPQfBhmNKF6pmiyO8YHCvTi9iym1wvNADNri6BeXRviTp09XhI
 xszRK71HtWgffz8tr9mrPD0RFBKhg5x/mbzaTTOIroaqnfrTXAz5A5OzJMD+/nJfrUqNtiQGm+A
 X9ByxJBrShSaNAyaI6cM48pjO6yUIhZ3Zq0tknmOuLAcgBdrv3wBo1WVF+HKWH/O4aCZZT7v3Ph
 5QMA4gBWvHi9Myyo5gojBaEkdBKs8rmT7AsuNA0dTe2s11WfyAZGMNx7yl6tK6VCYoYFMdGprlZ
 M+QCYodH2AJfyagrrG6VvScoApYl+eUusrZ4UDj2FTQLnevr61a0f8bb0DT80pLfKA==
X-Google-Smtp-Source: AGHT+IE4fTXG1rvgr48gCctvowJzj5i4rpqlAyHTIHit0ZkMb3GGR+HaA5QQwTJuji06wDa9PYnRFQ==
X-Received: by 2002:a05:6214:29ea:b0:6d8:932a:eaa3 with SMTP id
 6a1803df08f44-6e1b216ef63mr483487356d6.3.1737740409823; 
 Fri, 24 Jan 2025 09:40:09 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2058c2164sm10442886d6.99.2025.01.24.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:40:09 -0800 (PST)
Message-ID: <038f15ee-73bd-4b44-87e7-fc3086562814@linaro.org>
Date: Fri, 24 Jan 2025 09:40:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/28] cpus: Remove CPUClass::has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-29-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-29-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
> diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
> index 7b16bda2250..7f287984aa6 100644
> --- a/hw/core/cpu-system.c
> +++ b/hw/core/cpu-system.c
> @@ -25,12 +25,8 @@
>   
>   bool cpu_has_work(CPUState *cpu)
>   {
> -    if (cpu->cc->sysemu_ops->has_work) {
> -        return cpu->cc->sysemu_ops->has_work(cpu);
> -    }
> -
> -    g_assert(cpu->cc->has_work);
> -    return cpu->cc->has_work(cpu);
> +    g_assert(cpu->cc->sysemu_ops->has_work);
> +    return cpu->cc->sysemu_ops->has_work(cpu);

Let's assert this once at startup, much like we do in tcg_exec_realizefn for TCGCPUOps.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

