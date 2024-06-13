Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20C1C27C4F
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 15:43:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHmbN-00040Q-Sl; Thu, 13 Jun 2024 11:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sHmbM-0003y1-Fm
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 11:43:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sHmbJ-0003DA-Ew
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 11:43:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-705959a2dfbso865559b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Jun 2024 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718293375; x=1718898175; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=shu4rCk418oF8rBuMNy0AUA60H5cVAf9u8s2a0NUHxQ=;
 b=mlmhK1UjOiVoqG/vfNBeAUEjyJMupA2v55RkxjHo2xUHT4JI9mptBUPMfEsDeITSwp
 lZuYC06Gbu8q9QoFsWpW8mGC1sVWQsMx3v6Vuxm7TUioIljIIT4EPNqcXpmjzoLx4GMn
 1JipsS/KOtuiNUFvHqXhYHvA+F85FrwwmY6BaUsuiC/Ne4eUnYH38o0GqjuPOcUW1DsQ
 QZMuaXAaVRgtie/ODBghqHfzJEe0FOs6O77TnP1KAZVvJn+PxRm2gAZwWzPqiwctuwV5
 SnIraDK2BpRV/g657DWYAfp+Ap4lvB0sHn+TuKzd8qcuXZBMT0+a6fREyvafVJ9fcKup
 Gvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718293375; x=1718898175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=shu4rCk418oF8rBuMNy0AUA60H5cVAf9u8s2a0NUHxQ=;
 b=f7bgcVxFGCgdKnAMHlj3f9m+uTWzKRSfgYe9uj3PC1bXhsQT4nb2IevznuqtB/DsxK
 hoOsMxxcvprZY1UOA76v0QxrOIaqciCbZb44yFYk+Y8KPnwH+dq47OsZfuwi5pL/2W2G
 s6E2ow+JkVl2XtJ5L8FbZRHALhhS3XLb0EvV1DTSnce1UTvjI5TX1mzYbKCYGsjrgwu0
 4QU8+E+6QFAZn9Z6hbEH+wExOjKGiV9oW3f5HwlUjDwbIcF6qxubIMhM0PYNCnYVCde/
 grqa7ltdXYb7tMAMPZJBuquET1Xz7AASB1lOaRpUHXzvd7zeIEskpzYZOblajRrujm51
 oMCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrobSM0ZE588wAmhjeQgjaON4VGV6++mYnPH24ZIzoTQwPO0CTC+1/JrvPSxQso01fVko+HL0NO1gjtpptyx7E9PqU1uQ=
X-Gm-Message-State: AOJu0YyaSAyZtRrL1tvQRlgd8dW2pbHxZYrJc5pzySpbThRuE+Cjdfb0
 EoRnwV6b+tOecE9aLlWN5N9V1gQ/ZpMoKtpVmY2yXyIJgRI9O52P+rfVnzkbgEM=
X-Google-Smtp-Source: AGHT+IFj6t1qXQ3QvuV6KYQEWThAniPvZQLvVw5hb++fxxfuPMJj3jEGyHIaQ4kTwXb2jZMlzQhoqA==
X-Received: by 2002:a05:6a20:918d:b0:1b5:977d:439 with SMTP id
 adf61e73a8af0-1bae7d82b84mr338395637.5.1718293375550; 
 Thu, 13 Jun 2024 08:42:55 -0700 (PDT)
Received: from [192.168.68.109] ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb70f4asm1511664b3a.174.2024.06.13.08.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 08:42:55 -0700 (PDT)
Message-ID: <d1c27d07-7c01-48b5-866e-de8af327c8c4@ventanamicro.com>
Date: Thu, 13 Jun 2024 12:42:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/5] Improve the performance of RISC-V vector
 unit-stride/whole register ld/st instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240613141906.1276105-1-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240613141906.1276105-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

Richard,

On 6/13/24 11:19 AM, Max Chou wrote:
> Hi,
> 
> This RFC patch set tries to fix the issue of
> https://gitlab.com/qemu-project/qemu/-/issues/2137.

To avoid confusion on what we're doing here: this series is another optimization
effort that Max is doing for RISC-V vector. We're also working into optimizing
the front-end load/store ops like we discussed in this bug a few months ago.

This series is not meant to be some sort of replacement/alternative of the approach
we've discussed. We're aiming for both.


Thanks,

Daniel

> 
> In this new version, we added patches that
> 1. Provide a fast path to direct access the host ram for some vector
>     load/store instructions (e.g. unmasked vector unit-stride load/store
>     instructions) and perform virtual address resolution once for the
>     entire vector at beginning of helper function. (Thanks for Richard
>     Henderson's suggestion)
> 2. Replace the group elements load/store TCG ops by the group element
>     load/store flow in helper functions with some assumption (e.g. no
>     masking, continuous memory load/store, the endian of host and guest
>     architecture are the same). (Thanks for Richard Henderson's
>     suggestion)
> 3. Try inline the vector load/store related functions that corresponding
>     most of the execution time.
> 
> This version can improve the performance of the test case provided in
> https://gitlab.com/qemu-project/qemu/-/issues/2137#note_1757501369
> - QEMU user mode (vlen=512): from ~51.8 sec. to ~4.5 sec.
> - QEMU system mode (vlen=512): from ~125.6 sec to ~6.6 sec.
> 
> Series based on riscv-to-apply.next branch (commit d82f37f).
> 
> Changes from v2:
> - Drop v2 patches 1/4/5/6
> - patch 2
>      - Provide direct access host ram flow for vector unit-stride ld/st
> - patch 3
>      - Provide direct access host ram flow for vector whole reg ld/st
> - patch 4
>      - Provide group element load/store flow for vector continuous ld/st
> - patch 5
>      - Extend v2 patch 3 to more vector ld/st functions
> 
> Previous version:
> - v1: https://lore.kernel.org/all/20240215192823.729209-1-max.chou@sifive.com/
> - v2: https://lore.kernel.org/all/20240531174504.281461-1-max.chou@sifive.com/
> 
> Max Chou (5):
>    accel/tcg: Avoid unnecessary call overhead from
>      qemu_plugin_vcpu_mem_cb
>    target/riscv: rvv: Provide a fast path using direct access to host ram
>      for unmasked unit-stride load/store
>    target/riscv: rvv: Provide a fast path using direct access to host ram
>      for unit-stride whole register load/store
>    target/riscv: rvv: Provide group continuous ld/st flow for unit-stride
>      ld/st instructions
>    target/riscv: Inline unit-stride ld/st and corresponding functions for
>      performance
> 
>   accel/tcg/ldst_common.c.inc             |   8 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |   3 +
>   target/riscv/vector_helper.c            | 847 +++++++++++++++++++-----
>   target/riscv/vector_internals.h         |  48 ++
>   4 files changed, 738 insertions(+), 168 deletions(-)
> 

