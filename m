Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F7CD4F59
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 06:57:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sm6Qq-0002Xz-82; Thu, 05 Sep 2024 02:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm6Qo-0002QC-7N
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 02:57:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm6Qm-0001aU-Ks
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 02:57:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2da4e84c198so309053a91.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Sep 2024 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725519443; x=1726124243; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ROFMTIKigdOFjzeG+UUJwt10IkjKfJAAjZmNYu9048g=;
 b=HsJTZ82gfxwvfW4brIEKIDdjBrC4D/5zRumc1LmQvInA6aqgV+HmnVSOvWxF8JYMDK
 egU/3Zlc+g718VmM2jViPA5pEESCh4mv7QLuCGk9Yo4CQDAkaYaDoZEXqUA14XLeZDTa
 LzwfTmba1XYMpsC0hY7zq5xwu2rZpyxfAnjsVcbxQDWR2mZfSfqnsB8KkmnBwDWQWVGp
 gF//EEbn5HVn9oWL1DCFuYKrkg/G720hOc4WSNiKEpPMyA5rHmga+rg2zdlEejS03kho
 LJeAW1V9F8BeHmCeDR88omnI7dFOW8KzKO+KwP3FV0Mtmo6VUI+XIaIbbt6EUc/CvGrp
 y4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725519443; x=1726124243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ROFMTIKigdOFjzeG+UUJwt10IkjKfJAAjZmNYu9048g=;
 b=upYNO+1WgtR74H8kpS9LcRZxwDd63Ca2dEtPvE7uioIXTIxwWt3h+0teMTPGc2grwi
 lqIjgH0+lWXqF/Mo/ME/PtN/OguOidrYrzrGGhY/sEOfSrtd1qmLEL8xlaITJwQzMJQ+
 XVtcdFpFEpRraKXi08A6HSHJnodIARubQZ29HDpIyXSK4YNfHzAeh+xWfCrj8p8bRrwt
 1P6UXtxQNXQT478sAGt7A5R6S9sUyAtTMlqlj1Jitt15O/Y3dS5SwocO59wp36lT5hiJ
 TfP0RA1czpoEMbf+9WhtQs6XdzuUBvwTTTHFKqEWfV2RHmXd6Cnyp9Mbc6ouauG12D/c
 tD+w==
X-Gm-Message-State: AOJu0YznnTVivFBbj19YRgT+q+vW5cCgWgT63PHue2ZOJ/wKX19plNnW
 VsGBjbPxvNa+2ow47CIdPSvCcZ1MsoyYgDw31J8ERpATqmO1KtDVCI/Xpd/XJrg=
X-Google-Smtp-Source: AGHT+IF08P69MSPX8+HPlqvUTtCWV7QlpgBjiwIO/ZJqkAQwT2EdoAMrzPxbM8LUWKWI0VHy84xT4A==
X-Received: by 2002:a17:90a:a88a:b0:2c9:5ecd:e3c5 with SMTP id
 98e67ed59e1d1-2d8563922b8mr24455826a91.33.1725519442764; 
 Wed, 04 Sep 2024 23:57:22 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d871c7e935sm12318164a91.50.2024.09.04.23.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 23:57:22 -0700 (PDT)
Message-ID: <9d5a5191-eed5-49d6-819b-ca0262a8999b@linaro.org>
Date: Wed, 4 Sep 2024 23:57:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] tcg/riscv: Add support for basic vector opcodes
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240904142739.854-1-zhiwei_liu@linux.alibaba.com>
 <20240904142739.854-8-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240904142739.854-8-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 9/4/24 07:27, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target-con-set.h |  1 +
>   tcg/riscv/tcg-target.c.inc     | 46 ++++++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.h         |  2 +-
>   3 files changed, 48 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

