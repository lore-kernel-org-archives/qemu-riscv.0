Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D6CCFA13
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 14:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI5xV-0001F9-Tp; Sun, 09 Nov 2025 08:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5xU-0001Do-1u
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:59:56 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5xS-0003TJ-J9
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:59:55 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso2562214a12.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696793; x=1763301593; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KbZf15ulVr2z/2LBJX/OTwQjOtB/wWtGpsmY5cW60bg=;
 b=vSyehHyVKWd016K662mH8Qk1vYH47Ud+rlDRhJeWJYn3CyKxUkKUWT7737iJWrosTU
 QZxDvGoRMUhGHP5OHwU0Nd/VV+dyLyQbtz+vagdeRYzwZ8OZ1+IzuEHKi0zORrqRNXO4
 az3G2xVuhTyrEEF4/qik4MPYR1quwwDlxOiJoAazJHySdXbenHy2q75HKVWrsAe4CdRw
 6R8FO3zUw4aufEwT8UtRhMaWywoAc7vqrk2eHTTUFHBmIQJXextYkf5BhOpTlhzPvFzw
 t5ffEbrG+c1zOrx+PhY55gJWkHt89o15kro/qBNZ73tuHRz5WEtnJdAYNOv0+JFqbRqy
 PVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696793; x=1763301593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KbZf15ulVr2z/2LBJX/OTwQjOtB/wWtGpsmY5cW60bg=;
 b=mA58/RQPadp3TJzofADIjcf2a6x9Xb7focGKsMZLtNEhw5dgC/9OEU7zg6s087FtzL
 BKBL0GD8ttq4NdEO+FAvm2m6EXoPX0DI0iPErqRIC5Yj2PYn9q3tvpOQuQygeYo19JBG
 73WEUQUYK6leWWJ9OH6ol/Dfb8dXtY7MvdhH9tprCeiwSLWIU2tgxppobxU4PivvkVRu
 6AFNGuoLstb61vlqdIRgaztFQ8fT8tzfOHJgePAfGlrVpXjvfrh+Zv8nPESliPLybwYc
 sgvLU+7e9RAUmDloJD2EGqg4GVdz8zcxx9pd2T1c97beQWGg4tN7dOSSlYL5AZbTwN33
 zkww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDxKDJeHoYY1UuFzg7MtquRdRfdVb3ulQx8FOcLpJvpMtnqMU8v2XlccjzcTuZJ9NupOoM7YXKYxvD@nongnu.org
X-Gm-Message-State: AOJu0Yyjj+vFimpKLg2hlY/tC0AQ6lalJvra06Va4ZrL1KWTzkBVdU15
 zq+y4QqDaZ2NhNbM/Tn7M13vashV41k3Z7wZIK4YWWssVHsfKJFhpxL2BscDVAM/MhA=
X-Gm-Gg: ASbGncuoJftg0qrgeN3cWYHB6SxDIhJEn8SBBXKGsB3H5EpoX5kssy/Ay3WPoxMjzfI
 bIBADUVQok26Ar8yyPxvMUFRdcVm8XkG5epxU0BHfsQW+wQLovnIc0YPkX/Aepp2qT/qHanPd5T
 SKMfpmF13CUOYhTHGv+Hbj2x7FaG0pzfoP1DdtNMzqMCOf7G9kA1ltvNsAYx6tKTvmRRT5H/LIJ
 PaIUEQJVG8cWtsB1xfsQbUlGr/zxPvqoDFrTAUm/iLE5QwVAMUpqKJupLmDwyWPtTdk/A7Vg5Bp
 bEwlRFaRkOYjt4k7dqhpknTacBIszVHefwGeWJGemAo5xD/7XlB6uDixijodOQUddqKy8Pe+VUN
 C3G4HCmO+gpFXsT9Uwpe8bNmN9qcAPKURFarJTiafxKJMU8aaGG1gqelUwhk1UjBGj/xuceGzum
 BvVDpuA48XqsDPbjebU7/KevwQvV8vULsrl+yUGQDykPGXBrAFIQnX7fcIsw==
X-Google-Smtp-Source: AGHT+IHSLMpVr848boQgSP3JL72tmZPppf59LJSu/UqXV6VYWDsyQqZK8gy4knA2iC/PBqgJeSU9eg==
X-Received: by 2002:a05:6402:1475:b0:640:fb1f:e95c with SMTP id
 4fb4d7f45d1cf-6415e8220e3mr3969680a12.20.1762696793213; 
 Sun, 09 Nov 2025 05:59:53 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862bd0sm9107874a12.26.2025.11.09.05.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 05:59:52 -0800 (PST)
Message-ID: <faddeb4c-2e8d-4c06-a4f3-b983ea373e4b@linaro.org>
Date: Sun, 9 Nov 2025 14:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] hw/intc/riscv_aclint: riscv_aclint_mtimer_get_ticks:
 get rid of void* argument
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-8-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-8-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 7/11/25 11:23, Luc Michel wrote:
> Now that the riscv_aclint_mtimer_get_ticks is only used internally,
> replace its void* argument with the proper RISCVAclintMTimerState type.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   hw/intc/riscv_aclint.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


