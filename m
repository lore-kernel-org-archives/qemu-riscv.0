Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D088DEE499C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 18:41:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soSHJ-0002cy-4h; Wed, 11 Sep 2024 14:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soSHH-0002c0-QE
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 14:41:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soSHF-00036m-Vx
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 14:41:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2da55ea8163so97807a91.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726080076; x=1726684876; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LF9rFhNu7qqZClXterFCaDe5DwIbNtW6584ATjbpYPg=;
 b=k686ynthv/iZ47yfAvzryfI31tPAR7tD41ph6+3y0XuqEQSUCScYFEFwwa+AAWhMP3
 jZvl4/OJmCH8CCb/e6ATMkAeQ5/tXXfpaFa3y8qoKg3HMDAM64yCuhUSZbJ91UF9ryZ7
 qQMej30xaZSw/5RInnOYj/O+X3mDPg+6qZsZEmNohQHmn2anhkGxXc4W9+wfmLTcOY6G
 nGT+EyBUOV6oIlVxr2JJAOvJGZHJ5H4fhlfoEucux7nNcjAzUrrSvTkTVJN5RCJxofF0
 Y7oKaU7Z3jo0EOTg+E4WIW+M5+yeMz131sboVS8bddC1gdWQ+O3cXSoDPWjMgrUH1g+b
 2I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726080076; x=1726684876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LF9rFhNu7qqZClXterFCaDe5DwIbNtW6584ATjbpYPg=;
 b=lDmTeSKefCVRBFwMrV00ZElPGXXpylVfjeItn3QvPaQm2T3OjpR6Q7BOdUrPstg4k+
 bpFyEsebUvrGkns/qgYiYQ+VzJFcAkcebaSyifIF5BQ8UTTXHkCam7fq5DPwOR9Gj0La
 X0Da/xPXK2icnmRLsIAuEEtR6pjlGPSAf+hYoadY+pSag/PIUy4Al5R2ZxG6pfLmaMTB
 qDN4qHxeRXWnmO4nARSGaDmDJoF/u0p9S4gxJWqWc9N2xwoux7iYbb460cWZHFzx9wdk
 sMPG7kWwXNPOkM0QVoytGVPvweHj8gvJm+ex76HCVp2wKWj+CxjmkX0Z6QAsfKupKRAX
 i5hQ==
X-Gm-Message-State: AOJu0YyBQo22hpCLr2pMJMwR3zQ0Qd8IN7XRxWziPca9dHRCmvLJLlhg
 LaTTiXVGUV/WWNq2uT0G2scPPtjPUhGdYqiWjSZLaN618pWxlS9D/22uGnhUyOWqX99/C3K+J3O
 o
X-Google-Smtp-Source: AGHT+IG78la1qYpITkjK0g0yuodpHVDmVwdhRSyD2dWtrf2gEYeuT17yz6a/MqFjWT5LDPmYwGGSJA==
X-Received: by 2002:a17:90a:d903:b0:2d6:1c0f:fea6 with SMTP id
 98e67ed59e1d1-2db9ffc385dmr177970a91.11.1726080075942; 
 Wed, 11 Sep 2024 11:41:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04966bcbsm8749076a91.41.2024.09.11.11.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 11:41:15 -0700 (PDT)
Message-ID: <0d591570-02c6-48c9-9e3f-ef47ac20ce7d@linaro.org>
Date: Wed, 11 Sep 2024 11:41:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] tcg/riscv: Add basic support for vector
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 Swung0x48 <swung0x48@outlook.com>,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-3-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240911132630.461-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 9/11/24 06:26, LIU Zhiwei wrote:
> From: Swung0x48<swung0x48@outlook.com>
> 
> The RISC-V vector instruction set utilizes the LMUL field to group
> multiple registers, enabling variable-length vector registers. This
> implementation uses only the first register number of each group while
> reserving the other register numbers within the group.
> 
> In TCG, each VEC_IR can have 3 types (TCG_TYPE_V64/128/256), and the
> host runtime needs to adjust LMUL based on the type to use different
> register groups.
> 
> This presents challenges for TCG's register allocation. Currently, we
> avoid modifying the register allocation part of TCG and only expose the
> minimum number of vector registers.
> 
> For example, when the host vlen is 64 bits and type is TCG_TYPE_V256, with
> LMUL equal to 4, we use 4 vector registers as one register group. We can
> use a maximum of 8 register groups, but the V0 register number is reserved
> as a mask register, so we can effectively use at most 7 register groups.
> Moreover, when type is smaller than TCG_TYPE_V256, only 7 registers are
> forced to be used. This is because TCG cannot yet dynamically constrain
> registers with type; likewise, when the host vlen is 128 bits and
> TCG_TYPE_V256, we can use at most 15 registers.
> 
> There is not much pressure on vector register allocation in TCG now, so
> using 7 registers is feasible and will not have a major impact on code
> generation.
> 
> This patch:
> 1. Reserves vector register 0 for use as a mask register.
> 2. When using register groups, reserves the additional registers within
>     each group.
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Co-authored-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>

If there is a co-author, there should be another Signed-off-by.

> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target-con-str.h |   1 +
>   tcg/riscv/tcg-target.c.inc     | 126 ++++++++++++++++++++++++---------
>   tcg/riscv/tcg-target.h         |  78 +++++++++++---------
>   tcg/riscv/tcg-target.opc.h     |  12 ++++
>   4 files changed, 151 insertions(+), 66 deletions(-)
>   create mode 100644 tcg/riscv/tcg-target.opc.h

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

