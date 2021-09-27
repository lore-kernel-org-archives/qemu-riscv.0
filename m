Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUqPR-0002zt-2A
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 09:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUqPP-0002uA-Jp
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 09:11:03 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUqPN-0006Tq-Jm
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 09:11:03 -0400
Received: by mail-qt1-x831.google.com with SMTP id d8so16534900qtd.5
 for <qemu-riscv@nongnu.org>; Mon, 27 Sep 2021 06:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=enbgThG9UE7eoEUqBrx8xQyb/C1q+3p4FbXuaCyM0zg=;
 b=kOMRzfalOeDwQgmYt/NTfbcm/tX5lNBWiC9hCW2orJFPI7ZyepnLxAPSjWXMUto7xp
 dIAVwma1LeqOvC8NfeOayAqN+UhsWOgr4KcHdDT1/mKbo23slM4H7HQA9gbv+dE174lH
 9Lt5a17t+4P7QoMU283nnJKkbLPf5YlQ5ZsZRsgva0CfAQgexN8rK9oDskx+iEo+Ll7v
 ytCo+pLF4AFaRGk5DlMEJO8bAyYVkZP7NR1RHE9NZdg0qrn9hFtKE3O+hXnIqjCeX25E
 8YygeGPUya0rCS98kphLkZKIiYJj3zN59ZHGLoXXCNkjCAi/6TE6A4S7ZFFOagxnIlSe
 zPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=enbgThG9UE7eoEUqBrx8xQyb/C1q+3p4FbXuaCyM0zg=;
 b=X0UuKyTaYoMtoekxeLQp+DmOvBrPQ2+DzL1E2iXF7Xqzf1GHgNNFHfAcvLEaj/djcO
 iJrdxpH2zrXpVojCTpste0z1/0XlpmKfx6sHzS4H6nDYNrMRrOXbbPs83cVhQ0GJ6pVP
 OlJa4KV90JmVomFDft+MccILivggvVC2Og/1qG0KUjLsDOFFh8epmMpObSZ0UeRQQT83
 1REZnSkUsO/LZmKL5dp5DfQIMkCgbC81pt3cCSZ6wUpHV8g0dAF/nIf+EIbZ+Yf03vsf
 08u4T8JTgn6YLMlGFIBV8Vrg1epGKnd5L1r64A4j1nKQm/lUwbixNKRx3cm5OoyjAAW2
 j+8Q==
X-Gm-Message-State: AOAM530jg2ifurX9ZrTcUckcO5lw47QQTPWH9S46KdvRG68Ro6wMPF3o
 TBBgrDJfOJObP+1lXG0BxMGvLgVRatCY9Q==
X-Google-Smtp-Source: ABdhPJyR/YZmi7Ox+RDNiTR8whyTbzPB9OoEPcbdICLEQb4sGD1msyqB9KHESoXMm2BDlkYOL1/ikQ==
X-Received: by 2002:ac8:1090:: with SMTP id a16mr18051524qtj.297.1632748260450; 
 Mon, 27 Sep 2021 06:11:00 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id h4sm11962277qkp.86.2021.09.27.06.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 06:11:00 -0700 (PDT)
Subject: Re: [PATCH] tcg/riscv: Fix potential bug in clobbered call register
 set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Joelle van Dyne <j@getutm.app>,
 qemu-riscv@nongnu.org
References: <20210926213902.1713506-1-f4bug@amsat.org>
 <fa4c2f52-d924-4b58-16c6-273ce7dba392@linaro.org>
 <ab6303d3-f009-a992-5b5a-3606b9db3a02@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad47668c-ff03-401c-bf68-15b91b56d4ce@linaro.org>
Date: Mon, 27 Sep 2021 09:10:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ab6303d3-f009-a992-5b5a-3606b9db3a02@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Sep 2021 13:11:04 -0000

On 9/27/21 1:36 AM, Philippe Mathieu-Daudé wrote:
>> There are not 64 registers, so this is incorrect.
> 
> Currently there are 32 registers, but I was looking at this draft:
> https://five-embeddev.com/riscv-v-spec/draft/v-spec.html#_vector_registers
> "The vector extension adds 32 architectural vector registers, v0-v31
> to the base scalar RISC-V ISA."
> If this were to be implemented (and available on the host), wouldn't
> we have 64 registers?

Sure.  But there are *lots* of changes required before that happens, and certainly you 
shouldn't be assuming what the ABI is now.

> Eventually this line would be easier to review as:
> 
>    tcg_target_call_clobber_regs = MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS);

Would it?  Or would it be eaier to review with

   tcg_target_call_clobber_regs = 0;

followed by a set of each register that is call clobbered.

Why are you assuming that it's safer to list unknown registers as call-clobbered?  IF 
ANYTHING, it might be safer to assume that all new registers are caller saved.

But as a general principal, I also don't like register masks containing set bits outside 
the range of the mask.


r~

