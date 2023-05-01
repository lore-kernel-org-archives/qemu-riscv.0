Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptWT9-0000lR-HK
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 12:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptWT7-0000l2-9O
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 12:33:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptWT4-0000Qx-HM
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 12:33:40 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so26277335e9.0
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682958816; x=1685550816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+rPOneS29Fu+JVRbN9SuaxJGv2ivlReHB9EYFbQ9yFQ=;
 b=jqUPV2FKRzsYcH24y3A8hwJvl8ttqEhO6AZKRqwpmA+AjNVxnYlwlDTqtoXYEGfCPy
 LVG/aC0Efay/jZL+nMOKjpOSNPfot4uDQmvEjRheR6KFFDaSlNK6wwxLo0qWf1A5xDnK
 QxhQSVj9RhmndoMQz6ZmWOoN8zSNkabCj4ZV14kllUE8vYBroZbtUwUoOxYrVKpWvcfy
 V+FGgjZMPfVKlK8I/o/r/87ML5D08KJeyWoh+NULzJ7knx1yOYwD9OrDmcRSs+D9IFlt
 LD/f7gostfsITLdRvVrvHagEmHWR/pxPwWfBHMVCxFInehoDdxwbGltriQkt3uZGHahl
 XVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682958816; x=1685550816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+rPOneS29Fu+JVRbN9SuaxJGv2ivlReHB9EYFbQ9yFQ=;
 b=fRXS/0HF3hNPfybheotaleTp+UvXVpxYHH0Nhvz4mrIf6clEEFRqata4Qp3BImW2qo
 woJBeGzFBPnoT4YV3fnGDd02UQkUhqnPRm3zXnJNZelnP9X88aPl34SOLhJ2HA8EyawZ
 pPir8nyy70/TiFlU7/AdkCPYkILLxZeNv93j0nDJ8L3a4GgpDRpbAeYoMRd0lCOyqTut
 nPz/MIqCZKGvQenKsT4+jJ5sQkBOj1hHCq1u2FLGoVqedQYEyZeyIaPjR0ZQsflhGY9Q
 iKFSc62+6XtVw0FP/jkL15ylAiHggLEe+wySg0Cvg3TOhzuJSBuPUv3rrTx+0WGMwFRL
 ZUQg==
X-Gm-Message-State: AC+VfDxsNg6E5dh+iBccdH03Fj0XyqJsB+XuzdCQW7uJsKkB15uJ3Ftz
 wqITtng2pEmte2luy8JlyedfwA==
X-Google-Smtp-Source: ACHHUZ5rt0GXdsPUkNqJqf2WpFetknVVNrEGpXOpeySqoGtw0AJydLIbMI0HIrLk3tG4djkeF7heTA==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:6fb3:ffcc with SMTP id
 z20-20020a7bc7d4000000b003f16fb3ffccmr10727318wmk.22.1682958816717; 
 Mon, 01 May 2023 09:33:36 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f24f245f57sm24087565wmi.42.2023.05.01.09.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 09:33:36 -0700 (PDT)
Message-ID: <a5a5279f-8144-2001-c1c5-60addddbacf8@linaro.org>
Date: Mon, 1 May 2023 17:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/3] target/riscv: Reuse tb->flags.FS
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
 <20230501140020.3667219-3-mchitale@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230501140020.3667219-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 May 2023 16:33:41 -0000

On 5/1/23 15:00, Mayuresh Chitale wrote:
> When misa.F is 0 tb->flags.FS field is unused and can be used to save
> the current state of smstateen0.FCSR check which is needed by the
> floating point translation routines.
> 
> Signed-off-by: Mayuresh Chitale<mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c               | 6 ++++++
>   target/riscv/insn_trans/trans_rvf.c.inc | 7 ++++---
>   2 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

