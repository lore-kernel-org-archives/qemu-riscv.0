Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09A0C5DF97
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 16:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxSJF-0006R7-Tv; Fri, 21 Aug 2026 12:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSJ3-0006Mj-2c
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 12:41:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSJ0-0008UN-He
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 12:41:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-848761b5897so487144b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787330480; x=1787935280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o5Px8COhkGLvlJ0eaDBwZqzFKsB9CXZit19dsF07AGc=;
 b=aQahwhY70torV5LD6vkWzGoEvJhaHj2zqXfV3W+7Mxlm8BQFVMRPVq+PSv5UgwlBhf
 hTjYUpLLLXNeO5DHycDi/xPeqO4iDiwN78jLf+RvcFsgEQS372fS/ZWBGd8f+pvXWkjS
 Tw9yYuD+acloUX5GtH/xAeI2csUmwXSvopCz25ooB21JP0MkySY3hg6nzZF7Wy/cIFbF
 Iq2cRnhw7tYiIA9IOAePpZn9vgYH9Sxuv9ZmZWomj0aam3/oP3lQO/pauN2yXpSGk8e8
 dmn2YPtQP4BWunOcR2qcvfBZN7JvCrU3vCuBkVdj4Qzqu3WFukWnoRMDZdZZuF9gQOsC
 5aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330480; x=1787935280;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o5Px8COhkGLvlJ0eaDBwZqzFKsB9CXZit19dsF07AGc=;
 b=Qq3im9kF5jLTaMJ1tUqOQ8qGEucgoNcmQY8ukGWN4/cCVuO0vKixIENe8khzSdxQZK
 LjLl4XH64F9Cj4Av3hKkH5PmlUGWtHy/SYMaEDfYuThfq3IPajsXewdOMNwikUxaTOOU
 SDg6UIER0HdjKifQBJse9dr2D9r+TvsOBMV9QveoDSP8lc/r/IAGy5w51iUXh+NZfj/5
 XfRqkvf2obGxM/d4NgfFmhHO+dEdNgzzcNtxcT6Qna8KX09H7f4ZFnNAn0XYmM04PZXn
 TWzwAjYMI+S+Lf5BQvM/iO3Cv0FaPnDlg2laGO146DBrVtubSroXEqTadqo6F+JeBMIz
 pO3Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvA2Ie7srmCjQwiiVHymdYPQC0Gq60pUpBb/ISSyXXwzO+fP+tp2bcVvI49/q3OEGKb7fCIv8b06w8@nongnu.org
X-Gm-Message-State: AFuF++kIPADJJcSjzIduyfW/gzdSTXMpsRa0GcSj816pWKau9K67me6T
 aqFqaJVyG5zEPXJYEJ+Ufc8Jg9rX+NRHOxysxGijYc7Ok+LQ/OvvP2GIqps2fbVmL/M=
X-Gm-Gg: AR+sD12iIxajzfUyqtjDtcckWdMy7MxW3bi/ds4MEJYTi8wWLoRegWnT+gKB4v1ydWX
 Rn9KfJrzWAz6L96Dq+DOryJU4eIDaNREomfyqValMYot4WVJEp4xm+4hheqVUrI8dvJrZ9w7YI2
 IXaEOphq6W5IehqboJUNtR4Hp0wRwpZr7ROVwGPBMbzNDuSnvmut/QKmLR+HsESNT1XqBwWGEeC
 pVJy0dPanyJHlEw+cfmxbD3tPztUWl826VmHMJ+cm6oFJSPTamVsGL87dPI7faJTr/3faupZ80/
 LacRiI38llKTuQrc91w5A6b2SPmIiw3WoWcMKUEM3pNvy8nSQJ/JkpZKjYDFqvStwBZ7TWR7VWW
 zVf6KKWyWaeNJnXMMVKJXrEU2B3yRCHzNuDH9A8QeIXPBKcXDqUOksya6UVHR9VTOtA/beFUemx
 Y8w1tDeGSUgTFBRkDUUKV6igfAbbV2F/U69tE8+FqWCa0VRsF9tcp/O2921San6OIFjauUJ4BW4
 Pdx1cejWGrdhwQ=
X-Received: by 2002:a05:6a00:4c98:b0:851:8baf:5b29 with SMTP id
 d2e1a72fcca58-851f9f7c38emr13055634b3a.10.1787330480361; 
 Fri, 21 Aug 2026 09:41:20 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3362b34sm3183343b3a.6.2026.08.21.09.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 09:41:19 -0700 (PDT)
Message-ID: <82632207-7db4-4c37-8ad1-84694e578d4f@linaro.org>
Date: Fri, 21 Aug 2026 09:41:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] system/cpus: Constify various CPUState arguments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-5-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821104950.32108-5-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 8/21/26 03:49, Philippe Mathieu-Daudé wrote:
> Mark the CPUState structure const when it is only accessed read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/hw/core/cpu.h | 4 ++--
>   include/system/cpus.h | 4 ++--
>   system/cpus.c         | 6 +++---
>   3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

