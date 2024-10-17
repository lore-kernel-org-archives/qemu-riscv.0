Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB8ED374A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 14:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t1RGP-0008Uq-Lr; Thu, 17 Oct 2024 10:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t1RGN-0008UK-OQ
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2024 10:14:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t1RGL-0001yP-T9
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2024 10:14:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso9951695e9.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Oct 2024 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729174440; x=1729779240;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W/ORKd3cph6/ku0+Qc401FY0JRgv51EJWdtLhtOb4qc=;
 b=x6Ti/u6Io9HlRP6V6uAkFauDdc5scxHvB2a/L3zyOzyA0Bw5hieoYTNLpsHGzvwm1Y
 0TxGV6nHLhYWL+4B8Di6Wu+9A/IdV8Z4L4+UYVybeCVk0pTXmy54dp+6hbhbLct1ULpv
 Dj8Fx71MZVlfNxy7dT9COav8MRmvaB99jiLIBnJPb39cC9k6+Hh7e09SFI/Ftre0ilqG
 D6NjNShLc41sOaG+v4Ue1bvTjqY0liH0LRGNQJbhnv4Q2QWvjQhxwDwiEy8YmpQF7O6a
 Bwa/oXX7PTtNhF3OP5iBN8RScvnchsqwvthSfIFPE8OOtjnsQDgD62ntjdLFrhHxDNX8
 2BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729174440; x=1729779240;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W/ORKd3cph6/ku0+Qc401FY0JRgv51EJWdtLhtOb4qc=;
 b=M7l7Zse+cVm1aX6ur3K4WmtQ7GcPyV77/jIJEd4x+8frLhDjZe3GN/wYsNfYVDdLhM
 hqmzQ7q7GtBQGyCBxx9iU3kvnrYmYv6UuLHTjfBYB6gWvlVLlpWmfaiZPpNIxlz92yL0
 FjCcjeifu1uGXSijzruVg6tKDMG2B07GahwEv73dJz4DR5OaxHasVnB0vBxXF0/AGICt
 hhLIE58Lk07NO5DvVdgVmTTibHQQgPcYAbUyrGvYhC6awxNBKpG7iBCg0BcyUWAjdmsH
 cKQCt8HOS9+ByKf/ougIVD2TkmIvJLcm8J8mCp/npGv52gTGZxs4q+tChIrmC3Lo8/d/
 EnQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvd5Ef1K30BBRnKkhYYRWl1c5mEAZJOkchmHg9t7JH+RpCTgxoEIjWJjkOOsjzYx7Ysrh4f8i9AeUQ@nongnu.org
X-Gm-Message-State: AOJu0YwVnRIJend8l1DTyhwfhdjxwm59wl9OIwhaxTSEUP4U91KSt2vN
 2NawyiqmE52XJyeE+jE06orStOzNQhT23ljZqc+b1bb/Az4olZc9bIkOQCOJQGg2E2dmkLBDYT5
 TWP8=
X-Google-Smtp-Source: AGHT+IENdxMnfrfxqj6gI5ADcU7T0zieFTEpRZPACY5pjb4K5oAPqLOsGfvrzVlxS2zRHHQgenewFA==
X-Received: by 2002:a05:600c:3543:b0:425:80d5:b8b2 with SMTP id
 5b1f17b1804b1-431255e4113mr169037775e9.16.1729174439764; 
 Thu, 17 Oct 2024 07:13:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626?
 ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c38397sm27730645e9.5.2024.10.17.07.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 07:13:59 -0700 (PDT)
Message-ID: <1b9a53b3-79d0-4ba2-9450-35e28ecfbd79@rivosinc.com>
Date: Thu, 17 Oct 2024 16:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] target/riscv: Handle Smrnmi interrupt and exception
To: frank.chang@sifive.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Tommy Wu <tommy.wu@sifive.com>
References: <20241014181948.1974405-1-frank.chang@sifive.com>
 <20241014181948.1974405-3-frank.chang@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241014181948.1974405-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 14/10/2024 20:19, frank.chang@sifive.com wrote:
> @@ -1679,6 +1718,20 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
>      int sxlen = 0;
>      int mxlen = 0;
> + bool nnmi_excep = false;
> +
> + if (cpu->cfg.ext_smrnmi && env->rnmip && async) {
> + env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
> + env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
> + env->virt_enabled);
> + env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
> + env->priv);
> + env->mncause = cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1));
> + env->mnepc = env->pc;
> + env->pc = env->rnmi_irqvec;
> + riscv_cpu_set_mode(env, PRV_M, virt);

Hi Frank,

Does it make sense to use the virt value here since if we are going to
PRV_M mode, then virt should be false ?

Thanks,

Clément


> + return;
> + }


