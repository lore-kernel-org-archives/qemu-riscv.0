Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzIgG-0005Hg-22
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 09:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIgE-0005Dz-Bg
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 09:58:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIgC-0007IM-9L
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 09:58:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso1687207pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4WQWTopKKEv9rfkqnvBwmmJR9DtPRn6OiWT8LVXm6/k=;
 b=kIjlJaCtMBQsJLKZF6hOZZAw52QhnV36inNJkY+R8/G94ACbgyRVzILtzIdzggooNY
 3DYnSZmw23c3LLxaltmRHzq/6uDBhSFedx3kVpDE2bUTvJf9DQ1f0rPz2r1yFU8cvaDw
 9pkmQSn+tfC8pqABqHs0zx1Seydrdd32LyA7kcZv6Bl4VmrT09XRy9FW5k3mHiC1C6jQ
 VMCFxw4uPwK/7gd/pYkqZ4B8trNKIEOsmrTWSIIuztv5OC3++JePJwAx6zY+3rD3a6ZC
 q3tWD3rqzva7/ToSiNHxkJROLMPTrFbUsFwQff9HZar9uzX8TQx0CLnacOkJBta0j0jK
 MdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4WQWTopKKEv9rfkqnvBwmmJR9DtPRn6OiWT8LVXm6/k=;
 b=zxzfDYz/JNk7gv01A3h4dvFGjISO1oxXqBZdnzqxq811hXP44LCLwToayHLVFX9PzF
 SdqtrexazdO1rjmbN9U9TQCzPdCfyivrsF4OvznHQ9owaYe6QI8rQgBrB35Zs265XImY
 THYOnbqlsZennsKxTY43ZKVO2rq68yj2iswc2Rv2xkumSiVk0xgbUUrJu9tvZS///xQl
 pXuzBsFWouZgerif/k7QqDxBrPKtWoGu2dIoCKLRChNgcckeaxB4k1MgFG2KQEEqxgbQ
 08XasSDVjZxhXr1Gv0ICGYxmY0ntZC1YvS8Goy/kcjhM4SrLtYvy2pt1kUBxHsnHt66U
 SGUQ==
X-Gm-Message-State: AOAM531YO67V5V5a6f/8fjLHcAt0doNz1ToxYUwq0r4asFz3eckfaToo
 B4M9ERTNfVg+9DyGRXxdP5cH2Q==
X-Google-Smtp-Source: ABdhPJwG9WuroW2phfbBUTJaALL/wS23IxesbJNrl9dVtCzqp6f9L2SMw5DduvF6UfoQGzPRBBxUOQ==
X-Received: by 2002:a17:902:d2ce:b0:167:7637:7025 with SMTP id
 n14-20020a170902d2ce00b0016776377025mr22646325plc.37.1654783111149; 
 Thu, 09 Jun 2022 06:58:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170902d5d700b00166423df3cdsm14789339plh.209.2022.06.09.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 06:58:30 -0700 (PDT)
Message-ID: <8e48300c-9b30-728b-22ab-652476015975@linaro.org>
Date: Thu, 9 Jun 2022 06:58:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-5-apatel@ventanamicro.com>
 <6455580a-7344-8531-cd2c-708f8ddfb04b@linaro.org>
 <CAAhSdy1JeAuz0YtMdKQjeJHpEG5_BL35v+OWiGsiPn4WgAsOaQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAhSdy1JeAuz0YtMdKQjeJHpEG5_BL35v+OWiGsiPn4WgAsOaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 13:58:34 -0000

On 6/8/22 20:16, Anup Patel wrote:
> On Wed, Jun 8, 2022 at 10:23 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/8/22 09:14, Anup Patel wrote:
>>> +    struct isa_ext_data isa_edata_arr[] = {
>>
>> static const?
> 
> Using const is fine but we can't use "static const" because
> the "struct isa_ext_data" has a pointer to ext_xyz which
> is different for each CPU.

Ah, I see.  Perhaps better to use offsetof then -- the data structure is not small...


r~

