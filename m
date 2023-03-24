Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfkrV-0003Cx-9F
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkrT-0003Ba-Ho
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:05:55 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkrQ-00008x-IX
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:05:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z19so2414527plo.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6sjv1eZIEUuuzmYVhMQ9eZmCaZab0ljFuqWwWjn7pmc=;
 b=L++EQmSsgnUhbNV+Q8Q0WTo5DWPNUNRavQAO6ekRQ+Ngrygan0E6KDZ8ka8Tx7z0vz
 AbqfI+HspXfHIGlG7egE9bMb+Kyumg+ihdzD+zcxojXYjOOtv8KoTzTx4nYdVWcJ2QO2
 5iKhExZ68nFxiBgUKMuLja5+oKfYLdRo9LESVNBY3H4VD2kU/f7K+qnuTJ/GPHf6C6bT
 b2Vjk+/P7dETwzTvu++m/BBStdJfyWwN84sDjvq15WwschaY43zoNNixw8+8VpEVM1ou
 RTAWdqTDnE7711n+Zz1on7jyNqxmGfGESop7R85nu5EpGvS2+WGoGvC3Kvlni2zeYFil
 rfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6sjv1eZIEUuuzmYVhMQ9eZmCaZab0ljFuqWwWjn7pmc=;
 b=YmnnEauAhCIj7ld4BFgQ2LIV0zdLUcJDiw8UMX6QmodxKSXtO3yw0qcdHhUhthP++g
 WrTErjigUeXOE4mNWFIahnZRNahGukbeYfyyEEpFekbbirzjjjUqxnkJPEafNV+futru
 Xx50Lsquz08yXtKQpenOcTDLLYSbVYzfgudXk0zA8EDRsdpL4+y6w0GaOyyadrdB3RIa
 jS+QfMOp75G6iCDEs2h8pSHruAD4khsxshwLdy5ssPPg9WeWENJ3sO22KyiN//dBfygv
 obt6Mg+2A28sG2+i7h1jR8mEADlFmUCcBEazeMPIzL27o/niRN9jOXbb8sIGN9s6qzEP
 7clg==
X-Gm-Message-State: AAQBX9cnJDeINjwQh29RkGtT7Foe6txXzzIu4nD2VIL0Ri6EuJ/ZtHIi
 S94zLkkwofr2awxaKxz4PxcHLQ==
X-Google-Smtp-Source: AK7set9EYaZqma7zLJ52W1zi4eUWOuibyD/ykRi75w1yoIveEiMyILwELYySou6qaAr3Iz/QqNN5Rg==
X-Received: by 2002:a17:90a:1903:b0:23f:5c65:8c72 with SMTP id
 3-20020a17090a190300b0023f5c658c72mr3190955pjg.49.1679677551223; 
 Fri, 24 Mar 2023 10:05:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b0019cb534a824sm14398616pll.172.2023.03.24.10.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:05:50 -0700 (PDT)
Message-ID: <a613e9e0-77f9-8f3e-154b-d3df319c1ccd@linaro.org>
Date: Fri, 24 Mar 2023 10:05:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] target/riscv: Extract virt enabled state from tb
 flags
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324143031.1093-1-zhiwei_liu@linux.alibaba.com>
 <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 17:05:55 -0000

On 3/24/23 07:30, LIU Zhiwei wrote:
> Virt enabled state is not a constant. So we should put it into tb flags.
> Thus we can use it like a constant condition at translation phase.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
> ---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 ++
>   target/riscv/translate.c  | 10 +---------
>   3 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

