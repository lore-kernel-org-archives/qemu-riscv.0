Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E37CA0ED1
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 02:13:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjr8a-0005NH-Gw; Thu, 29 Aug 2024 22:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjr8Y-0005GD-QP
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 22:13:18 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjr8V-0003WE-Uz
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 22:13:18 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-6e7b121be30so799063a12.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 19:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724983994; x=1725588794; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aegJ28C2nNo+uc5Dpi8nFxpc0ECb2HMRQvxoRb4LCF8=;
 b=NlPWqyajxhdJVu4lMk1Wwtjwv2/PQ2UiHN/CUkpT+SXuWTij+/SEo8fIbM3NtTCou7
 Q7IVHGgIs6NSA+Kz1U2nNxUvMfyQFFngIxbvdvotO2FsCev9VTNAN5cpRnmaY2U+3h/x
 GspJgOINNGNjCu1vF+kWLeiqshZfAMoPoESsz6awaqQk3AtWOr74dv3BBBkmdicQ6z5w
 HOG2dU5SVMAIBqV/LNGbXKN+Yg2qIujmWgyhgAQyPyg/749dzLUaJgspwpGCLEhtngUY
 4q+lEV0vMtSaGTTrt2n2PJ/WHgO/rjIp6Yxz5t1DHx5RYQqD5d9saQsQ/49tM40aj7mb
 40/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724983994; x=1725588794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aegJ28C2nNo+uc5Dpi8nFxpc0ECb2HMRQvxoRb4LCF8=;
 b=rk9dlCtyARouAd6WR85s/yZRPDNWrNbvJ36Uqcl8GzsPvgD+lMoBQ6hauw1wHRRyte
 Sfdsypu0b5TnIDoAP1LJ/YclaRqW29RUzCPQXEHQ04y7XanEbzOo+wFBj6dWy6We4Ja8
 WL1Z34jDNlrFrT/1K8oQH8R58n2YXt3HV1i3GPeXNPBCXcYTUaVAguX/87gG8Ii7ZbDz
 P5oMgMTkjRyAx8L/TGFZNS4jkTSWEYBye+4L5xD/gx3xSeiWcZ1cGDTE4CzmT5sO5JWy
 VVVJoZD5/B35BxqIFsbBiBViE0csVQ5zyW5PtI2GggiiVwNwg2mGqGBrTb6vAA0kgFZY
 3FfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQvZBETu4KAp7j71a6BRCtpvk2TXBrJrj3K0jxiPbRJseJzLrRCDMA0cyxbL3NFv1uoXQeMKl5HUDP@nongnu.org
X-Gm-Message-State: AOJu0Yxs/Dsl9WuL2VrCbS/FD3C/rKMWwDVsxLCScMCMYOB5oux7GCR3
 cFeCeKucKczy+Hv2FWViYBecbuUcP8Eg8B3+wlxGnGSG4VuWqdt2YiNQepPoaIE=
X-Google-Smtp-Source: AGHT+IFhJkTOjrZU0KosEhQf85qhQEbmZfz8ORVMcsARmNVA5SWp6L6Im8XCojL0AowutZeXm+ZhbA==
X-Received: by 2002:a05:6a20:2d07:b0:1cc:be79:92ca with SMTP id
 adf61e73a8af0-1cce0fed498mr4512042637.5.1724983994251; 
 Thu, 29 Aug 2024 19:13:14 -0700 (PDT)
Received: from ?IPV6:2001:8004:5100:1c02:35b7:18d3:3fc5:9f02?
 ([2001:8004:5100:1c02:35b7:18d3:3fc5:9f02])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205152b12d3sm17627705ad.41.2024.08.29.19.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 19:13:13 -0700 (PDT)
Message-ID: <84dfd92a-cf4d-48d3-93c0-a030eb198bcb@linaro.org>
Date: Fri, 30 Aug 2024 12:13:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/20] target/riscv: save and restore elp state on
 priv transitions
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240829233425.1005029-1-debug@rivosinc.com>
 <20240829233425.1005029-5-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240829233425.1005029-5-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 8/30/24 09:34, Deepak Gupta wrote:
> elp state is recorded in *status on trap entry (less privilege to higher
> privilege) and restored in elp from *status on trap exit (higher to less
> privilege).
> 
> Additionally this patch introduces a forward cfi helper function to
> determine if current privilege has forward cfi is enabled or not based on
> *envcfg (for U, VU, S, VU, HS) or mseccfg csr (for M). For qemu-user, a
> new field `ufcfien` is introduced which is by default set to false and
> helper function returns value deposited in `ufcfien` for qemu-user.

Patch description needs updating to remove ufcfien.

> +bool cpu_get_fcfien(CPURISCVState *env)
> +{
> +    /* no cfi extension, return false */
> +    if (!env_archcpu(env)->cfg.ext_zicfilp) {
> +        return false;
> +    }
> +
> +    switch (env->priv) {
> +    case PRV_U:
> +        if (riscv_has_ext(env, RVS)) {
> +            return env->senvcfg & SENVCFG_LPE;
> +        }
> +        return env->menvcfg & MENVCFG_LPE;
> +#ifndef CONFIG_USER_ONLY
> +    case PRV_S:
> +        if (env->virt_enabled) {
> +            return env->henvcfg & HENVCFG_LPE;
> +        }
> +        return env->menvcfg & MENVCFG_LPE;
> +    case PRV_M:
> +        return env->mseccfg & MSECCFG_MLPE;
> +#endif
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Excellent, thanks.


r~

