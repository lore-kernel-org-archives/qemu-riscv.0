Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1430D6ACF1
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 16:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGKaV-0001oS-SY; Wed, 27 Nov 2024 11:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tGKaI-0001jS-En
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 11:08:10 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tGKaG-0004u9-R1
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 11:08:10 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffc016f301so39645441fa.1
 for <qemu-riscv@nongnu.org>; Wed, 27 Nov 2024 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732723686; x=1733328486; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mIkCk7y38vWyW+8Cbf3UeBCVXSKBTT0KIxuchZyj8YM=;
 b=eP8qUHEWBaoMEjR/+MgXommPkHKp4QsRg04RodDqpIXijyAKKxXy0cqZkAw02EqGQX
 zwfu58oqv9G3w7ETn26FuTe2ejMH1h8mCkAZMIUEilwl279pyTmqoVoq8gP+jsGCQzZR
 wa5riCJD8/hS/VdyzB16WkGx0uRvSpmizECXUABQOtcWAp7a84F7uhHffGhWJdb0wMA3
 phRUyzQjEjzHzEM2zPCIjKoeXgIxtt2lkWjnx415pkOW7glpY03YM6gxk2J8Zse2hByQ
 izb0M/JbQpOu2iou2d9DB/FyIJuSifBlJzK288t80CHQOMf/xEJLlWkeztchD1T4h0dq
 KrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732723686; x=1733328486;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mIkCk7y38vWyW+8Cbf3UeBCVXSKBTT0KIxuchZyj8YM=;
 b=B7KYwhV5GrHTAg9xaYfOudO6CrtPx/3vKH9nq4RAo7/b6GJM1YVtbpieLP63nYGw5D
 Jmh7F0xeNUYfE6MGVHh5AYssZ9juj/M6i35JX27W94Zr1R2kjOeWufgzEO+4zRvwjCi/
 Vj1afqbHyTs17POwqc1nFrZRgzA7j3RYqkWiKCDI+Lj5OY3RfYg7cQ8cLJWkMI65BtDw
 TvkVP7pCbNmItN8s8ZmVyb8nYywEbsLJYbtmWj0aUR7zGXdLbcFSS1udhm2KvwtHUPFT
 m0m50oYVmkbz14NAnuRVSdaCoUKrzv+g7z66qUQ0/ujE9nagtU2LvZYgZETG4GFW83XP
 /5TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn/qJaW7aaRWYbLOZy6pPMbGtFvoVSZYRyspvN1xoypSFxXEegKpyR/xxz8E2XS0lGA8vhMW7+Ivvz@nongnu.org
X-Gm-Message-State: AOJu0Yz44S4DhLkkCyzj9VbWsbkq3isoib/NUXEVGJIg/3wlDftrgl7e
 evFIuAgO9lyn6Yi0YaLO3183dtXhsePmin3BtnJ1G2pBYxKs2f9+2GVp8OBOd+0=
X-Gm-Gg: ASbGncu1AosL8KWH90ywaFuGFgo0vfhsFtYhVMK/rDeNYK1JI4qxeLkhWo194R5Wrhq
 t0gsMYPqJkRDa+R6EyhPYeTaRBmFcoW3srL9s+AqlU2hxd/DmKE+2taSwGi3QpXyYL10kmdEX0a
 xbDm79W01meUYKbRFlvOwJKkoDN1jkDAc6Q86bfUQFzr4V9E0kaLNAM8S/xs7RQfvfEFNAwIxqe
 bE3HcxJNtYhSD6J9Y/6sI6iIz863CBpgrDoRmoY5YNnQktwgzutRsWgbCSQr0DvkQnV
X-Google-Smtp-Source: AGHT+IHjzom4tD3W7my2+NkDuaeQrpr8SABG5FHCVHO9bgCI1vrCiQs2kLNvVdRgb0zPo/X9XqZnSw==
X-Received: by 2002:a2e:b8c3:0:b0:2ff:b822:ec4c with SMTP id
 38308e7fff4ca-2ffd6130847mr21178021fa.35.1732723686512; 
 Wed, 27 Nov 2024 08:08:06 -0800 (PST)
Received: from [192.168.170.227] ([91.223.100.71])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa4d57ad4sm21826811fa.60.2024.11.27.08.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 08:08:06 -0800 (PST)
Message-ID: <33ee1415-7f72-488d-bbf6-cf55e6d0a601@linaro.org>
Date: Wed, 27 Nov 2024 10:07:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] target/riscv: Apply pointer masking for
 virtualized memory accesses
To: baturo.alexey@gmail.com
Cc: zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair23@gmail.com, frank.chang@sifive.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20241127053523.397378-1-baturo.alexey@gmail.com>
 <20241127053523.397378-7-baturo.alexey@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241127053523.397378-7-baturo.alexey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
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

On 11/26/24 23:35, baturo.alexey@gmail.com wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/cpu.h                      |  2 ++
>   target/riscv/cpu_helper.c               | 19 +++++++++++++++++++
>   target/riscv/insn_trans/trans_rvh.c.inc | 11 +++++++++++
>   target/riscv/translate.c                |  4 ++++
>   4 files changed, 36 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 11e3a6d647..6bbd9c6c25 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -634,6 +634,7 @@ FIELD(TB_FLAGS, BCFI_ENABLED, 28, 1)
>   /* If pointer masking should be applied and address sign extended */
>   FIELD(TB_FLAGS, PM_PMM, 29, 2)
>   FIELD(TB_FLAGS, PM_SIGNEXTEND, 31, 1)
> +FIELD(TB_FLAGS, PM_VPMM, 32, 2)

(1) tb_flags is only 32 bits wide, and this overflows.

(2) All of the logic for HSV/HLV is in op_helper.c, so there's no point in doing this 
masking inline.  Do it in helper_hyp_* instead, possibly reusing pieces of adjust_addr 
from vector_helper.c.


r~

