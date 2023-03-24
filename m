Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfluH-0004eF-Ao
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 14:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfluF-0004dH-Cp
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:12:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfluA-0007b2-SR
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:12:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so2405967pjt.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0vY+5rBAOixEtqTpHGBpkytNZX7xjLsBEtRpe9HSa0=;
 b=CZZNSaXQfDN/tR2bhO11qiIQzqgGA+ouLCkLzRBkjrNnQteHok190nZlC4hCg4yBV1
 Su+HAkkYRPLIAcDHxHk3PbMMBQVe1YG8praIEiajEOBLJnMxcBXPzEFK9Zu5rOMGrgIr
 EBdUUgm6xmnz6R9gBC3TY5fm4FLgiQSo1siQu115il02zFVI6nitIkrw8Grh97K/55W9
 eVL/lLHC9yraVC0BYTG8N9PvgAeYNgk6gUaOnXAFFTIjVbAn3BtqSmMvUm6w7CCt4+rT
 b8jcj3zyyQ70qKRChpJuMjLXE7jo8fOBTMt3ChoYH3euXPTGWIgr7nili1eWBqaaBI9q
 RVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0vY+5rBAOixEtqTpHGBpkytNZX7xjLsBEtRpe9HSa0=;
 b=qtC4vBWwKjMqvbmHryHO3lAXRgSN9P5/mWVVUXVmFM3o+6nkfA6L6mkoYgxRBpB1Dn
 JzXNW0fIoeBGui1xAGR2YrbkqjmbDEZL0TzvLAAb3hSp3rtf0xrNRguf+P0O0sbRXpYC
 EjISiYCoO54LBrqgtvddTAieth9zRhycjoY4BUbvXVuINEFLqcpIbV8IC2nQbBZtbsWf
 Mrf7QRHvP6SL09J9rbh6UmuTYphrOv6Kq+b6R/DTxSXT6TROb75tY5qxZ7wBs8TZY68j
 5B2u0lfTOoy1Qncaj+sTtLrz4vkvewuSfXeKL3Aqr/A7CRllF+z0MvdAu8x7Hf5s1Otn
 NdlA==
X-Gm-Message-State: AAQBX9e9S4WoqEjvDUDzmNNt7MbD/1RQ4zBfXUF9DOTm4Koscqz1eceb
 EofKQyxwDVVVDlyYOgYhI3OX8A==
X-Google-Smtp-Source: AKy350YZnREMD60UTmw8IDRy2zcDGhrs7O2Gu6/C703diSeFyBBJhQS4oQs9IQO8LlhtCapG71SJbw==
X-Received: by 2002:a17:90a:b397:b0:23f:7ff6:eba with SMTP id
 e23-20020a17090ab39700b0023f7ff60ebamr3989507pjr.0.1679681565603; 
 Fri, 24 Mar 2023 11:12:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902a9ca00b001a04a372fa0sm209555plr.251.2023.03.24.11.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:12:45 -0700 (PDT)
Message-ID: <e0b08cd8-b5c5-ee96-0424-20d1588a9531@linaro.org>
Date: Fri, 24 Mar 2023 11:12:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/8] target/riscv: Fix format for comments
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 18:12:51 -0000

On 3/24/23 05:38, Weiwei Li wrote:
> Fix formats for multi-lines comments.
> Add spaces around single line comments(after "/*" and before "*/").
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/arch_dump.c                |  3 +-
>   target/riscv/cpu.c                      |  2 +-
>   target/riscv/cpu.h                      | 26 ++++----
>   target/riscv/cpu_bits.h                 |  2 +-
>   target/riscv/cpu_helper.c               | 57 +++++++++++------
>   target/riscv/csr.c                      |  6 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++-
>   target/riscv/pmp.c                      | 23 ++++---
>   target/riscv/sbi_ecall_interface.h      |  8 +--
>   target/riscv/translate.c                |  8 ++-
>   target/riscv/vector_helper.c            | 82 +++++++++++++++----------
>   11 files changed, 135 insertions(+), 90 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

