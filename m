Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgpwg-0002gX-SF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgpwe-0002g3-Or
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 12:43:44 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgpwc-0006dU-VQ
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 12:43:44 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 ca2-20020a056830610200b006a11ab58c3fso4191353otb.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679935421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UQviVZQFm/bPdd8QQggkQ3ZywRJoIADqBPysj8eLieA=;
 b=MiTT/OKw9M0RrRP0H582uOvlXpejOaiNJhAp8TTgpp6M60mw0rjJ0prR5GFWYPA04X
 ImzBfTp/caODZxqnpKiym/AhIFhTzqQNBfEQq6WVmtltRLwV6tRm6RdlPeICFD8E6h0E
 Bvo68keeCbBhRG3J97C7P63EWoPjGKBerBJGrkKlp6yf7uq4foW4j0XPwsaKlwCpAvWm
 ln2x2QlSalR2yLxolQpuXemWsoaraxJCrXp66L5XlIvCnPXVbY+MSfueX35sfPEqwPN5
 nNRPD7hCXw76NfU4kyFr6DvGRdJrpJ+og6H5yU3VbgQRAS/xoSLMmk8Llrf0Ks8OtWDQ
 /FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679935421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UQviVZQFm/bPdd8QQggkQ3ZywRJoIADqBPysj8eLieA=;
 b=sLbfemscQVO0Ph2x2+F327fIwGH0SG8DCiFMZvHQNsJO7L8rK4WxQNhTxXzIcQmEM0
 feJ7lxNorltLlz87Bh/+hJLwjNnjQnQinR6ebjC2YBcFURWoT2fhreUvquqblJfYt9yr
 PC+0nDCJhpNSFfBkScTzUYfUjHZevn0FpxTo+cFszCTDbNsnOLICfWyHuXJ2fYpCXDu0
 Q4+TQtid5GBo9emMWhqnaH6z/pBm0/xerMqc50Hbkeoh7Nw3ydQn7LkYkktgBrP5Y+xq
 7JmZPVirVh7+gE+8qlgx6GI9Gdmt7Y2tZSek0LiQq4WEreAb4P+ZHuHstXc0SpI2tWsw
 dzzQ==
X-Gm-Message-State: AAQBX9dkY9D+wcwsla8x/v2vMrPmEw8esyrQ7wIdFRGfAvU3PlgGks/x
 VjrUFVouh0f/+HaRtQiIMebU6w==
X-Google-Smtp-Source: AKy350agXwI0bYo+5q45zjJCZzomz53hQkqffC50AHKGpma+/Cyv1R5rvhzaYJIMwLeDU+BHx1utJA==
X-Received: by 2002:a9d:69cb:0:b0:6a1:3d8e:2ae1 with SMTP id
 v11-20020a9d69cb000000b006a13d8e2ae1mr1939083oto.21.1679935421220; 
 Mon, 27 Mar 2023 09:43:41 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 di7-20020a0568303a0700b00690e21a46e1sm11837448otb.56.2023.03.27.09.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 09:43:40 -0700 (PDT)
Message-ID: <e36dba97-c182-c427-e051-2a8d1cfe96a8@ventanamicro.com>
Date: Mon, 27 Mar 2023 13:43:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 16:43:45 -0000



On 3/25/23 07:54, Richard Henderson wrote:
> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
> 
>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
> 
>    * Using cpu_mmu_index(env, true) is insufficient to implement
>      HLVX properly.  While that chooses the correct mmu_idx, it
>      does not perform the read with execute permission.
>      I add a new tcg interface to perform a read-for-execute with
>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>      it's closer.
> 
>    * Handle mstatus.MPV in cpu_mmu_index.
>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>    * Cleanups for get_physical_address.
> 
> While this passes check-avocado, I'm sure that's insufficient.
> Please have a close look.

Tested fine in my end with some buildroot tests and 'stress-ng' in a 'virt'
machine with Ubuntu.

Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> 
> r~
> 
> 
> Fei Wu (2):
>    target/riscv: Separate priv from mmu_idx
>    target/riscv: Reduce overhead of MSTATUS_SUM change
> 
> LIU Zhiwei (4):
>    target/riscv: Extract virt enabled state from tb flags
>    target/riscv: Add a general status enum for extensions
>    target/riscv: Encode the FS and VS on a normal way for tb flags
>    target/riscv: Add a tb flags field for vstart
> 
> Richard Henderson (19):
>    target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>    accel/tcg: Add cpu_ld*_code_mmu
>    target/riscv: Use cpu_ld*_code_mmu for HLVX
>    target/riscv: Handle HLV, HSV via helpers
>    target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>    target/riscv: Introduce mmuidx_sum
>    target/riscv: Introduce mmuidx_priv
>    target/riscv: Introduce mmuidx_2stage
>    target/riscv: Move hstatus.spvp check to check_access_hlsv
>    target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>    target/riscv: Check SUM in the correct register
>    target/riscv: Hoist second stage mode change to callers
>    target/riscv: Hoist pbmte and hade out of the level loop
>    target/riscv: Move leaf pte processing out of level loop
>    target/riscv: Suppress pte update with is_debug
>    target/riscv: Don't modify SUM with is_debug
>    target/riscv: Merge checks for reserved pte flags
>    target/riscv: Reorg access check in get_physical_address
>    target/riscv: Reorg sum check in get_physical_address
> 
>   include/exec/cpu_ldst.h                       |   9 +
>   target/riscv/cpu.h                            |  47 ++-
>   target/riscv/cpu_bits.h                       |  12 +-
>   target/riscv/helper.h                         |  12 +-
>   target/riscv/internals.h                      |  35 ++
>   accel/tcg/cputlb.c                            |  48 +++
>   accel/tcg/user-exec.c                         |  58 +++
>   target/riscv/cpu.c                            |   2 +-
>   target/riscv/cpu_helper.c                     | 393 +++++++++---------
>   target/riscv/csr.c                            |  21 +-
>   target/riscv/op_helper.c                      | 113 ++++-
>   target/riscv/translate.c                      |  72 ++--
>   .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>   target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>   target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>   target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>   target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>   17 files changed, 595 insertions(+), 395 deletions(-)
> 

