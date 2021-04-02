Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSNQB-0003K5-SW
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 13:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNQ9-0003Hz-TS
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:17:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNQ6-00059v-S5
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:17:21 -0400
Received: by mail-pg1-x530.google.com with SMTP id t140so3906497pgb.13
 for <qemu-riscv@nongnu.org>; Fri, 02 Apr 2021 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6c9mNIjNfmi+96MQiJgRPmZkwQtSAnQzmjk+Vy2JFW0=;
 b=x2pxWhza5WmtdBp131Bmc0/chOl17D9ZXJuaSbO/2M+ALMu0ueBDBeMsZq5hJ20Rxk
 iSwe90US13RmPkzkfbx3LcpBcz3ZSvCC5rIKo0Dsxcfakr9O+owYKZxRs63Nq6c1S+mB
 QKlr2ozJQpgyuer8Nmkqx284LR/gLafpL4f14udbVYRwL2sCiTcgAItMQQ9HEqCMY7IO
 UEyJ8wp+gxznzCVHO6GvDEpqjccoe1LQaJFZUj8tKjf4VTesGLBYWlokx7KnL1tkis7s
 4v7xHYNlEc9Wq6NrVhepZpQmv0fOOBrVYFpCQTWRLFU4cwmNmZdXWFm9yBXqKsi7NNAN
 66mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6c9mNIjNfmi+96MQiJgRPmZkwQtSAnQzmjk+Vy2JFW0=;
 b=rLz3s+5xsHcsvM7RLjrqS1Jis6Lm5Hmjc4hEWG8/7rYpOE+zz7lPVgACPl9cmm4PO+
 9nO7sO4VGp2Epqt6/+U8kLLDWjWfp0+LGdtd5YryneG/PV+FCBKfrDNutqudpI+sG/rs
 Ai9adwEYPau1kkiCeAdo7CZ974UZ7TVIDa+EbwDzmlIYiIGTSv78clcpXu13/zn1kvsd
 iMuxiT3RLqDzQq3i43JmuKGBq1avOnUDWeONLTHHRuUPnW/j0RCkYueOSzDUoAyW0JOB
 Er8e/gThWqcSc7Gmqe6pNDuivO0GZMawgSPxCdMn82GkdZDfzt0OK0gU5S2RO4xDPfYk
 PA8Q==
X-Gm-Message-State: AOAM533+CgugWCwopj1PXKWd4Zt8HWei1qEtDwuFIXMtU0bok+N22cBs
 Z1c6F7nSpRv8NhOGx00AI9Qqpg==
X-Google-Smtp-Source: ABdhPJzvjj5YOgIa5IleGOUlhy+kfCw/rH1oK6Tbw2Ft441rLIScTMmfRUA5l93pFSw240V7L9vKKA==
X-Received: by 2002:a05:6a00:78a:b029:20a:309:2fcd with SMTP id
 g10-20020a056a00078ab029020a03092fcdmr2439929pfu.35.1617383837290; 
 Fri, 02 Apr 2021 10:17:17 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id n73sm9234014pfd.196.2021.04.02.10.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:17:15 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] target/riscv: Use the RISCVException enum for CSR
 operations
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <8566c4c271723f27f3ae8fc2429f906a459f17ce.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <034b7d4f-5571-b793-3934-aec96ed18f22@linaro.org>
Date: Fri, 2 Apr 2021 10:17:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8566c4c271723f27f3ae8fc2429f906a459f17ce.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 17:17:22 -0000

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h |  14 +-
>   target/riscv/csr.c | 643 +++++++++++++++++++++++++++------------------
>   2 files changed, 390 insertions(+), 267 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

