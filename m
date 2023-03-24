Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfksa-0004ne-GP
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfksT-0004mA-0C
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:06:57 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfksQ-0000KP-4A
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:06:56 -0400
Received: by mail-pl1-x633.google.com with SMTP id ja10so2404606plb.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYsIFBeT4I7u+yupjgy/Y3QMbRFC1ZjEvHw4NJs2x3Q=;
 b=PbpKvD+qq8naJPFR+Ng4KrxT9fWnUdMav5W75KHKmQKo11NFtbuhbrzWF2BayETZwN
 nAB/2BXxmZCdilylW9T6yGjYaVl/DSuEMVNTM962tGZ/xJDIc7y47cJ0fl86AGPRnMaT
 BKwT5SSPku2poJetQf5UtIaMmhq5FafZqs6Dhzg+la2Zef7AjJsvwkHogqkf54+IBi0y
 Ch+bO3P5/YOxpuMT8zvc6PCMGYiSMLlgUMMUQh/YOgyGDgF3gXWg+vrDnSAKPMGqQYi2
 FXbvkKLamJmNQncwOxd3G5M6uvHcPyEHGiRWoQFcA2iRu3TEYGneMwv2JwAr+ehiwcm7
 e/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYsIFBeT4I7u+yupjgy/Y3QMbRFC1ZjEvHw4NJs2x3Q=;
 b=YRTqjOtLJdrVBqetpRB2JMH/YPg23mvRaRGeZ3CyVrtNyb89y7mfeF1SuFfWiu3W4Y
 x7l3qKtc3iHaAPEPPLYfKRbe5yedYkavLs57ktWQNjtxzSHy5g3GHuJjfMLZ4GsFlZ7G
 mwdT/fCpDuwKSr/v4vWW3hvf/qg6ZH/hYH1EpVCkZBKSUrbTw3ndqlGzxi9SRP8fjOy1
 MporB3io4wHO0f+btPiUxPi9855y2gra/rtUgkAxlCfpB47WixTKFck1ijHkvNuYa3nf
 10E79YhRW1R8AGRsqSLXrICNt8WuLduHC6wQ69aMnuxxmG27dy1yk/QzxmaO2BvS5Uax
 vmCg==
X-Gm-Message-State: AAQBX9cG2gBzWFh2oxF3UEuzNgA78IRlPb/ogsyvWyl4cBdISDukzJ57
 eeOi83Q5UVKq7FsR38IMNulr4g==
X-Google-Smtp-Source: AKy350aRcgXEesb1tDRerQgsNYSHkpYo5qWF0Sh8REhx2/K+jXewpEakujBt0UbTL0CVSC4dDzhklA==
X-Received: by 2002:a05:6a20:7f5d:b0:de:b790:d249 with SMTP id
 e29-20020a056a207f5d00b000deb790d249mr905899pzk.31.1679677612445; 
 Fri, 24 Mar 2023 10:06:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 i10-20020aa78d8a000000b006281bc04392sm6499286pfr.191.2023.03.24.10.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:06:52 -0700 (PDT)
Message-ID: <dfa7ac65-f947-d69e-8196-f5a66af8c7f4@linaro.org>
Date: Fri, 24 Mar 2023 10:06:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] target/riscv: Add a general status enum for
 extensions
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324143031.1093-1-zhiwei_liu@linux.alibaba.com>
 <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 17:06:57 -0000

On 3/24/23 07:30, LIU Zhiwei wrote:
> The pointer masking is the only extension that directly use status.
> The vector or float extension uses the status in an indirect way.
> 
> Replace the pointer masking extension special status fields with
> the general status.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
> v1->v2:
> Move EXT_STATUS_MASK from enum to macro
> ---
>   target/riscv/cpu.c      |  2 +-
>   target/riscv/cpu.h      |  8 ++++++++
>   target/riscv/cpu_bits.h | 12 ++++--------
>   target/riscv/csr.c      | 14 +++++++-------
>   4 files changed, 20 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

