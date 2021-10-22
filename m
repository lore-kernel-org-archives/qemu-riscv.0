Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdj76-000171-8l
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 21:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdj73-00015E-NA
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 21:12:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdj70-0001Qh-Nv
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 21:12:49 -0400
Received: by mail-pg1-x529.google.com with SMTP id c4so1841008pgv.11
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 18:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fH1dfwM7xll1AcDa9VHprTt1BbLXY6UN9GWnY4ITnYw=;
 b=rEgjcsn/4XfvmP4q3jGNcboCn1Ujmpg0K7lWsiJbx6apZtw6Rj6dp00+tTsEwd6eBt
 mdnKMBz6TKXh14D1+y8sHxjIBrthq1h6y/d/APp4qIDeeSLj11dAHbD7tRz7xUCh2ago
 6axbwkzCdJKX1WikV3gIU92O/HOzMniIKmwiy+UsuAF2kyqVxZch9cT6IgZcYmhKxpb/
 xrdf5ejAwt9Iv+aTv+O6QGwSiBdz9KPvrYxwV/wujmIo/2FGJuwC0Izt30ALXHcjN4ad
 MUcuI+Hg5BKqxuXptJZSlHt5taLNkVhYO7OFJlS9KdPu0IJUxaiGwRyvqrIXwFKb0AcM
 7Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fH1dfwM7xll1AcDa9VHprTt1BbLXY6UN9GWnY4ITnYw=;
 b=6BYDxqGi4PHzEsY6f2BdJvVPyLUemWLPOqsvMllGkeBsm4bxZozvgVJ+obw3R7U1aW
 p3zryU8+aMfyRuGjtcvw8rf43TKDBnWSC9L7olkrq82EGbNv0UB/cn8Xwtd2ujhixzCt
 92lZJyb2NFw5bR1xheDuqtd6cwPPQGqa9Q0A77jkjuoCLh4Y8Ie/6FFIALVbecPxwxAd
 fIGpERwy1Qop/RIKqsTAB9l8HbFsn8E5j5FqkDRESX1J0MVISmAg6m5/d6ehCWLbAzar
 kDU/0I7YtjO7KJjtBbEZbjXhpCbtIx5R5BMCTYPTLTrvmim2JIVA+7GbRMRgpX6Z9PcI
 XdKA==
X-Gm-Message-State: AOAM531TfLrcf71P/SmKz1tJgty3Cqp4BT66pQuH3ULIXVspoAHkmSv2
 aEeRPiueKWU1oJYqeqc620CgtWjCQFBrBA==
X-Google-Smtp-Source: ABdhPJzDfix5YAAlciu+Zmij3nT1HYc36p1WsKkQ4g8NPe42grubi4UUpVieac6N4SkU37Bz7/okvw==
X-Received: by 2002:a63:7010:: with SMTP id l16mr7060500pgc.32.1634865164804; 
 Thu, 21 Oct 2021 18:12:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm7425623pfn.159.2021.10.21.18.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 18:12:44 -0700 (PDT)
Subject: Re: [RFC PATCH v5 3/3] riscv: Enable custom CSR support for Andes
 AX25 and A25 CPUs
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 wangjunqiang@iscas.ac.cn, bmeng.cn@gmail.com
Cc: ycliang@andestech.com, alankao@andestech.com, dylan@andestech.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-4-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f7798d8-944a-b2d9-ff27-8a1fdf86b4e0@linaro.org>
Date: Thu, 21 Oct 2021 18:12:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021150921.721630-4-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Oct 2021 01:12:49 -0000

On 10/21/21 8:09 AM, Ruinland Chuan-Tzu Tsai wrote:
> diff --git a/target/riscv/csr_andes.c b/target/riscv/csr_andes.c
> new file mode 100644
> index 0000000000..8617f40483
> --- /dev/null
> +++ b/target/riscv/csr_andes.c
> @@ -0,0 +1,183 @@
> +/*
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + * Andes custom CSR table and handling functions
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +#include "qemu/main-loop.h"
> +#include "exec/exec-all.h"
> +#include "andes_cpu_bits.h"
> +
> +struct andes_csr_val {
> +    target_long uitb;
> +};

docs/devel/style.rst: Use a typedef and CamelCase.
And of course per review of patch 2, this needs to go elsewhere.

You need to add a subsection to machine.c to migrate this new state.  With respect to the 
custom instructions, I suggested adding an ext_andes field.  I would expect these CSRs, 
which go with those instructions, to use the same predicate.

> +riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] = {
...
> +    {CSR_TXEVT,            { "csr_txevt",         any, read_zero, write_stub} },
> +    {0, { "", NULL, NULL, NULL } },
> +    };

Indentation here.

I think you should not export the array itself, but instead

void andes_setup_custom_csrs(RISCVCPUClass *cc)
{
     setup_custom_csrs(cc, andes_custom_csr_table,
                       ARRAY_SIZE(andes_custom_csr_table));
}


r~

