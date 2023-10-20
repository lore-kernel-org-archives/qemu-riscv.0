Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC26C004C0
	for <qemu-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 01:04:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quMs5-0000Ov-8B; Sat, 21 Oct 2023 21:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quMs4-0000ON-BD
 for qemu-riscv@nongnu.org; Sat, 21 Oct 2023 21:03:12 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quMs2-0006kd-SF
 for qemu-riscv@nongnu.org; Sat, 21 Oct 2023 21:03:12 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1e12f41e496so1615637fac.3
 for <qemu-riscv@nongnu.org>; Sat, 21 Oct 2023 18:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697936589; x=1698541389; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6caqfr3Dnh29P8ABBGTbsJCMM3a5lZxAEUUlZdx/kJA=;
 b=qBD1JXbF12C3rtF/Z6X29PIrMQ4u05lfZDLxBFGmNELA/UJkMoOMjafOAsnIC9X4L0
 83fv5XHnT0yqh0pORVXWp3ON+iqZXCA3QeOmFiPU224OBpOnqtFZexJwERYjYgRXhZoj
 m0TZe10+4zpfu7TR5h5PfYTTJncj71cBAUu9h889pueVumOAZ2lycPkw0wJ1F2Xd3HVh
 TmMlRGZkLKWGZvo/XJe6172K4HHTuOPyt3i1S8oZyCs45Hj7tdb8iwyh2dIK3ecMJCeN
 dh5lJg7f681BtnqjprGq+suuDIV3B3T6Q8/gLWpfEbxPVW+SDHNIe5GN+TzMN0Lwa84g
 +zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697936589; x=1698541389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6caqfr3Dnh29P8ABBGTbsJCMM3a5lZxAEUUlZdx/kJA=;
 b=kO3yEAmf/bxITK/bLzMS1hPs2r8kAHBddhLeW3oBopAfUcXspj2MzEEUn2Lr1geTcF
 Tj4JjKqjwtA+EzM8qi7RaTEMwyU+Qid6kveTED6Gm9isd8Yu3IXltynEY+1zFcYjt5Jb
 77Bpfg9PyFvh4JmbZ7f6FM1nJJTGfOUUUzPtOYc3ZK25/egFcpUsyflj0fOkke414ljq
 CjMTovztmYk4g+eobMWva/4l8lBh94MoByfR14cj+KvtVOxB9aPkX8ZIhkUX9jR3JocJ
 ph5oQXnGDj5tQIE63Euv4f4vfrS/GwNiOrLCR9xCFd0I7WLPMlZwua6KbiA7VF4jw932
 mTVg==
X-Gm-Message-State: AOJu0Yygm+cqlaEIrMFIvEJdwIbjQkHchqzhkFiq01fy6tpmdv+5Nq3k
 Od5/aOES+o2b2egZ5KyCHqulcw==
X-Google-Smtp-Source: AGHT+IHLr2VFPseG+owm8eqXushjc2RIRXl6zj/RlLjRy0XbQG4v2fOIuzkgmCRcyj0PlSFwisgksw==
X-Received: by 2002:a05:6870:12d0:b0:1d6:8b7f:ce89 with SMTP id
 16-20020a05687012d000b001d68b7fce89mr5608356oam.51.1697936589478; 
 Sat, 21 Oct 2023 18:03:09 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 jb14-20020a170903258e00b001bc21222e34sm3704336plb.285.2023.10.21.18.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Oct 2023 18:03:09 -0700 (PDT)
Message-ID: <55b81b8f-8c88-4e6b-8519-180b38aae009@linaro.org>
Date: Fri, 20 Oct 2023 09:06:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020074501.283063-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/20/23 00:45, Daniel Henrique Barboza wrote:
> Commit f57d5f8004 deprecated the 'any' CPU type but failed to change the
> default CPU for linux-user. The result is that all linux-users
> invocations that doesn't specify a different CPU started to show a
> deprecation warning:
> 
> $ ./build/qemu-riscv64  ./foo-novect.out
> qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed in the future.
> 
> Change the default CPU for RISC-V linux-user from 'any' to 'max'.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

