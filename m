Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nP4uD-00064G-M0
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 10:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP4uB-00061H-RD
 for qemu-riscv@nongnu.org; Tue, 01 Mar 2022 10:59:15 -0500
Received: from [2607:f8b0:4864:20::1033] (port=41815
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP4uA-0006Cp-9G
 for qemu-riscv@nongnu.org; Tue, 01 Mar 2022 10:59:15 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so2575885pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Mar 2022 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pF8fDBchuhFDlb6WqZU1DNnSnzpChrDmx4dAZAP6tJQ=;
 b=W/vKp5F48XIAziPZjlmeQgfWUmCZZAMG63h0dX2FxTCkZSwPHoxbXXixAWXWaV0j+n
 fb0PH8mmf5kpAKE1KD2TgdrD0v1Y9i8gJB1nJb0rCVKOLav94pNcEprjN0d8Q7b7Su8K
 OtuC/j6nFAhmiyNWjoN0rHgxi3/5hD+0XTrNg+iqTzUo2bi/+6LiTh0Gc9+mFX0f67R3
 qiu/Yg9koR1t/jZXFloPJUznhbM4gEffsx7W/IfYlE4phZYt0+lN9C4wLZ6fHM1Z5ZOC
 MK8yY/DQQTUs6LepbHfP+xT2y8UpI6kMNGehrlMe/qjvZSP7NFB11Iv8ajOSF6+SSOW/
 bggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pF8fDBchuhFDlb6WqZU1DNnSnzpChrDmx4dAZAP6tJQ=;
 b=5CbwoGtI7msHzEsTifg9v67WsLeQmNJklJ92Z4ERFXeadzQ5XqLwFtO77KwKc9+GnT
 UjKS9nvse0rb4wbLulGgYR4sCceAgUVYxNlGQq05GttzxMUor27JOfj6RGGNHeGH0iRj
 Cih3tkT4yscUZWrKJDPrw9eb5tjwclTmx38nQuBBCV0AVPqbjvjlkt7h7+28w//tapiV
 xJFKpbOfRvOxeil5ZU/upKRnnUa/I6Sxd0TvDDs/NABz5BfxAQhcRcHazufkm1QcC02Y
 9c47n3jjwpLZBr1aB+EJy/xc1jDKzz9MISdHFolGKr1ybqsDrZBQePSg2X3WttCt81hl
 odCw==
X-Gm-Message-State: AOAM530m3gVS2rMcB+I/QY18WqB4VISldq60PfKnokGCKjuIGKbSldkr
 9usynn1t3+tdR5ES7WvKh3y2mw==
X-Google-Smtp-Source: ABdhPJx+1jpwUJ7npLq47DNDqiS7ITaihLLQXdrvTmr2ZyJdd54SmggueOu9ghyMi3pv6quy7J7cOQ==
X-Received: by 2002:a17:90a:2e0a:b0:1be:d5a0:cc5a with SMTP id
 q10-20020a17090a2e0a00b001bed5a0cc5amr4886543pjd.120.1646150352515; 
 Tue, 01 Mar 2022 07:59:12 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h33-20020a631221000000b00374982ad51fsm13668515pgl.59.2022.03.01.07.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 07:59:12 -0800 (PST)
Message-ID: <8b6ff05f-7246-940e-be90-44ede1a6a3ba@linaro.org>
Date: Tue, 1 Mar 2022 05:59:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 12/14] target/riscv: rvk: add CSR support for Zkr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-13-liweiwei@iscas.ac.cn>
 <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
 <72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn>
 <07c003f8-b34b-0da0-2298-ff3be5fd7655@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <07c003f8-b34b-0da0-2298-ff3be5fd7655@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 15:59:16 -0000

On 2/28/22 16:27, Weiwei Li wrote:
> 
> 在 2022/3/1 上午9:44, Weiwei Li 写道:
>>
>> 在 2022/3/1 上午4:11, Richard Henderson 写道:
>>> On 2/28/22 04:48, Weiwei Li wrote:
>>>> +/* Crypto Extension */
>>>> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>>>> +                              target_ulong *ret_value,
>>>> +                              target_ulong new_value, target_ulong write_mask)
>>>> +{
>>>> +    if (!write_mask) {
>>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>>> +    }
>>>
>>> This is incorrect.  The error should only be with a write-mask of the actual x0 
>>> register, not another register which happens to contain 0.  There is in fact no way to 
>>> diagnose exactly what you want here, which IIRC has an existing fixme comment somewhere.
>> Yeah. write_mask is also used in riscv_csrrw_check to check whether the read-only csr is 
>> written. We cannot distinguish x0 and reg which contains 0  here without changing total 
>> progress of csr read/write.
>>>
> I seems misunderstand the code for csr read/write:  write_mask will be set zero only for 
> read-only operation (CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI with uimm=0) via do_csrr --> 
> helper_csrr -> riscv_csrrw call-chain.
> 
> The write_mask for do_csrw and do_csrrw will not be zero.
> 
> As said in the spec :
> 
> "TheseedCSR must be accessed with a read-write instruction. A read-only instruction such 
> asCSRRS/CSRRC
> withrs1=x0orCSRRSI/CSRRCIwithuimm=0will raise an illegal instruction exception. "
> 
> So it's suitable to check write_mask here.

Consider CSRRS with rs1=x31.  In that case mask will be the value in x31.  Even if the 
value is 0, this is still considered a read-write instruction.


r~

