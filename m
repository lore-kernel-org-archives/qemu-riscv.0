Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWVzF-0003Fr-Ds
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 23:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVzE-0003F5-Dc
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:14:40 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVzA-0006VB-QZ
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:14:39 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z22so4194279plo.3
 for <qemu-riscv@nongnu.org>; Tue, 13 Apr 2021 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAAq5ItyC12mz4O4d4lIMv9wThII8XtGy9912qs54fM=;
 b=evm3PkZc5l9SNGPVMIWrcfbzANrH1eSzTzoMRId4viORtuV1Rks3qYkJh6KLpTXIp/
 s3Usr3+TGzrPCA6Div6ASYetIPX1znd/JmdaZBWFGae3noG4zMbIIAjkZYnSQUW8Bxso
 FkPKHnKHsQjTRjcPdnvyA/y8HKasALJaJF/yp8/boPD4HnhphV1FHkq8etImG07VcflP
 RIoCmD+I9JBkMtCOstJYtc9wEB/7kp/Bocs2rI6p9ZozmfbZQEgOtX8AFHRIfpqb/dxu
 u++0na5voJ9SLEo/WzNnIish6qPxVjd345/ht3On8NPs6iArTEgVo+IOkpKKphNdJrSO
 OyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAAq5ItyC12mz4O4d4lIMv9wThII8XtGy9912qs54fM=;
 b=Ma+vH5OeDJR3qin+a0KrIqXrL9dNL7g41iFsQoFtdAFeVYluw+iqfd86r6RYZ1VyNU
 crJcQZuwNouxglNxzY2JL7kyVZiNz7LL3VVj92+JaCmoqJ2mv5YcfVnUXc6XBBxu0GjX
 KY0RUykutBUC0y10uz9GRdkkycB4MdmRiBhTNSQQjvYiY5xepGZMkB77Yl+saANE1FLL
 CoLbcbzEB36cnH9Ar6ZA9lxOogNo7r4/GHycCgb1utpBYyk9ex4epcqzTTeAC7cERfzj
 M2X4lJAe1pdgVFY3glnzQdYf75BcObGf+b6Wya4FmP5Y0tlpoH7fMIyCNa9E6Np1e9Z7
 tkmw==
X-Gm-Message-State: AOAM53168SKC3W1DJwMup/wbeGEByuAOZiKkpfUU+0T5JmnxyxjspKA0
 xF7SCamEuxrN2YayJcJ2XZC+WA==
X-Google-Smtp-Source: ABdhPJyfv+8RTikYJjcyLBRm3OihQhuTLX76dfWzIUAcSmCfVcWddSxnKpro0UNRX+K4gZFhWQBeNQ==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr1066895pjz.37.1618370075444; 
 Tue, 13 Apr 2021 20:14:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id o9sm14863487pfh.217.2021.04.13.20.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:14:35 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] target/riscv: Remove the hardcoded SATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec8a710c-c38a-ca35-7f44-1caffd1987c2@linaro.org>
Date: Tue, 13 Apr 2021 20:14:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 03:14:40 -0000

On 4/13/21 4:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h   | 11 -----------
>   target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
>   target/riscv/csr.c        | 20 ++++++++++++++++----
>   target/riscv/monitor.c    | 22 +++++++++++++++++-----
>   4 files changed, 51 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

