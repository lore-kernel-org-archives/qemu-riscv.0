Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX7t7-0004rK-Fa
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 15:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX7sz-0004qQ-Rm
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:10:31 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX7sx-0007Mf-Pl
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:10:29 -0400
Received: by mail-pj1-x1043.google.com with SMTP id m3so3560044pjf.4
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2020 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y/R668eX7wXYMr5eA6G5EZXxdbiAdxzg1YSSNBMKV1c=;
 b=Tdb0jOlRkEUwwZmXZnjhrSsTWykojByvYaSuVlqpTEekR00wTPU9eVS6ikZOCzBjM6
 FJ5fSDLddqafWzpF9D26poT3fsdisKIDVzWlDSGheYEIbiUWqG9e0C2Ad4ljh3XYkNso
 60xdRUl/15q9+hND4zt6dUifMvlE3W57BBakhr3bw9ufWp75T0/kPY9gCaOVLH5ii31B
 ALt3NdqQaMGArlkYP1W6kw3P2b22RpbbeWa/lA9ZrA30QX8jg6hXFDcnZp9F9vuy1YQh
 QLGnXNu8CCtha/wYSy4fs9Sm8HwEOJ5BGDdgrzEkmCu4pbm44CMl0dJ+P+497Tw8I41h
 1kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/R668eX7wXYMr5eA6G5EZXxdbiAdxzg1YSSNBMKV1c=;
 b=a8JyKz29YO3PuXwbmGmFS1UNKBmIQbbfgt26KthdrxLhgtr9ruo6OMs71OJGvK2HBM
 jAZa9Va/HeFZQoXxpIDFM38sbf2jxuumL85Mq/5gfxCpDt54os++M1CSOvHMNIkID6/2
 BaQBc77YeqHWa0DDoFB+swfRnLCfvvKZKeyaInXP1a7vwFGM4G2TA/PErV/nyKWNw204
 u4eUAtcGSDMWEpjAewD7QtZdb6mXygas1kGHn2g+5fSrR9ideYYQfrtvgAaqy74GYb0F
 IgodK9U6CXFnhTdg/eBaGiv0bGqZWSiuNWKPyKELlrQVnlnSbhhoeAcBOldg4VtHQwzj
 SjJQ==
X-Gm-Message-State: AOAM533QjYuNhd3pvC4gfEcR77e082GBiISnQdO3oLPO6Sx+siIwSvuI
 0GfkrT8Ex3QEzrAtN6Pq03UfBQ==
X-Google-Smtp-Source: ABdhPJwkwCTp7BbsqOIvc6mErmzLqcbLAFQUfMt5fbdefGxC/2m6x27EHFut/QPJjynWkWUyOgfJ4w==
X-Received: by 2002:a17:902:9a84:b029:d2:9390:5e6 with SMTP id
 w4-20020a1709029a84b02900d2939005e6mr11568641plp.37.1603739424955; 
 Mon, 26 Oct 2020 12:10:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 15sm8757403pfj.179.2020.10.26.12.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 12:10:24 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] RISC-V Pointer Masking implementation
To: Alistair Francis <alistair23@gmail.com>,
 Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, Alistair Francis
 <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
 <CAKmqyKO1AdNOynNLDBFR0=x3mbcRn4No_iw7DA8anGOnPwmwVw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0dd4b7ce-a894-6913-9a9e-d5775c62b13d@linaro.org>
Date: Mon, 26 Oct 2020 12:10:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO1AdNOynNLDBFR0=x3mbcRn4No_iw7DA8anGOnPwmwVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.167,
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
X-List-Received-Date: Mon, 26 Oct 2020 19:10:31 -0000

On 10/23/20 5:25 PM, Alistair Francis wrote:
> On Thu, Oct 22, 2020 at 1:04 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>>
>> Hi,
>>
>> Added missing sign-off on the first patch.
>>
>> Thanks
>>
>> Alexey Baturo (5):
>>   [RISCV_PM] Add J-extension into RISC-V
>>   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>>     ones in hypervisor mode
>>   [RISCV_PM] Print new PM CSRs in QEMU logs
>>   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>>     instructions
>>   [RISCV_PM] Allow experimental J-ext to be turned on
>>
>> Anatoly Parshintsev (1):
>>   [RISCV_PM] Implement address masking functions required for RISC-V
>>     Pointer Masking extension
> 
> Thanks for the patches!
> 
> I don't know a lot about the J-extension, so it will take me some time
> to read into it before I can review this.
> 
> Maybe you can convince Richard to review it for you :P

Richard did review v3.  Alexey seems to have misplaced or not added the r-b
tags.  Although I missed that it misses the mask for the special hypervisor
load/store insns?


r~

