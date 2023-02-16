Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSUFj-0006pv-ML
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 21:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUFi-0006pe-9F
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 21:44:06 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUFg-0002WV-Bo
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 21:44:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 pg6-20020a17090b1e0600b002349579949aso356111pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 18:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVAN209fRNbIKnuIIc5upJSr7MiBOg43fn5x0PsORHE=;
 b=xrDbgj60BsMvnqNHjeB6l0oyBSAKWPhD+xqTd2tvDj/Jo51UYb1QMADsUD+UGV85ns
 PFZQy97s1MDetjaI0ILLBd9X0J4Xwzo6wcfgmjTWiUrG+kEMwzfLM4iLQ4YQUNLVIwIv
 OQkE2/9GUV34PMwD9Kg5FM4aTSZl1aNEGv5+vNz+QOCUK5SGuk+WQ9kQSx8jV2vttqj3
 q0pq/mJ2JJdYSVbcgjNENdak9yyapVP5ol8bKtOWzVkOWDOKuwk/L0T84oQkFKSFBNsC
 VN2rMd2+Mea0WJzmf7M4PgmzNXBS2Ya8/KB2HVNgZ5WxdZkugFNie3IFyLKh+p1D/wbq
 T81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVAN209fRNbIKnuIIc5upJSr7MiBOg43fn5x0PsORHE=;
 b=C61ayMr3V+0ESRHos1rmtLo0WYZDb8EWIg4rpguIAndP52Qs5tot7SBFGkomZnsxKj
 hEL7sT5L1RiYNFgzLxVNqe9qjBEY4dMRskLh/dqIvr6HFr/h04M+/97yxmtsH+fPI9zB
 Zu+3hPrvGedNeuWhyKd5TtvsN00BS9fs1GhisI7sWkJaC0BjFd+ddcJbkDVUPOYgV4kP
 ayAKFJivHz+9mZ/6SpVbEADBCNm49O2DGpEzFg65uq6U4UwB6hK09cqCnv8nbtdpOnw/
 J2eSXaTifGfTMCZhcen3ATxftWMsfzbBEvN9evYpgtBFr/Ff8AhYipHSEdeLE4j8p6R/
 kDCg==
X-Gm-Message-State: AO0yUKVSOoI7k4i0teqDCu/be/Q6ud31M0PGEGYHUrIGS65J5LVCUflq
 poJ5MEDr+Pudv9xrO4tPeBRAdg==
X-Google-Smtp-Source: AK7set97gfVh2wdUtSkis3U7KaSrM9cReJFt90IzRHHwG4vZYzOFZM+V5kxn6o5cQfU7bJ/44iE6Dw==
X-Received: by 2002:a17:902:d4c7:b0:198:adc4:22a2 with SMTP id
 o7-20020a170902d4c700b00198adc422a2mr741192plg.29.1676515442653; 
 Wed, 15 Feb 2023 18:44:02 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jg10-20020a17090326ca00b0019aeddce6casm37375plb.205.2023.02.15.18.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 18:44:02 -0800 (PST)
Message-ID: <3a786c14-11b1-6a12-1bb0-fc467bdd2daa@linaro.org>
Date: Wed, 15 Feb 2023 16:43:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
 <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
 <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
 <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
 <CAKC1njR44uKkeqT52mn2wg4PzpF6cvwCEk7cGn=gCVjwjVA-6Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKC1njR44uKkeqT52mn2wg4PzpF6cvwCEk7cGn=gCVjwjVA-6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Thu, 16 Feb 2023 02:44:06 -0000

On 2/15/23 15:38, Deepak Gupta wrote:
> Question:
> I'll basically need two bits (one for forward cfi and one for backward cfi).

Are they separately enabled?  It may also be possible to use a single bit and then perform 
a runtime check.  I guess I should read the spec...

> But I need to throw away the TB if cfi enabling bits mismatch at the
> time TB was generated and the current state of enabling bits.
> Reason being, this needs to get translated again and zimops need to be
> generated.
> 
> What's the best way to throw away a single TB?

You don't throw TBs away at all.

The current cpu state is produced by cpu_get_tb_cpu_state.  This is included into the hash 
table lookup and will only match a TB which has been generated with the same state.  Which 
means that you can have multiple live TBs, those with CFI enabled and those without, and 
the correct one will be selected at runtime.


r~

