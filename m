Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSiy7-0006eV-Ib
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 11:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSiy5-0006ae-Cx
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 11:45:33 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSiy3-0007gq-9J
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 11:45:33 -0400
Received: by mail-pg1-x542.google.com with SMTP id n9so2234797pgt.8
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bekVVwx3fg5RyV2lzAVABqy3iI2WaUm9OTRp1uhf2Uo=;
 b=hg6k+uO0U0vAdj8r5W5MdEloBMX3A3VeU4AZB0lODmE2OfD6srAIawlRPuZerUV6Ea
 gv0pwHlaYYMmTA3t+MtO3AqQEb8Cq7Dcu6bNvAPgowuU3jJZ4stniwQ5HXP0vp+wexk6
 jGxCEhi7L98BmhDpR6+jfmUB8QRjEgfgUa0fo92Z0QXXEVJ/j3PF9+EIf1nLac24lrTD
 AbM4NDmqsXh47grRbGzp0c8w9SKxaMLDHQ08d8W0LZ7HW0WJSzS9e6xncERumcS+D9YE
 R94iKppz3HglhQE8aABJaRL7beNySLciTp1KyWXkhMjFODxT7SKUVT9Z0MElEc0Dad50
 6OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bekVVwx3fg5RyV2lzAVABqy3iI2WaUm9OTRp1uhf2Uo=;
 b=jfkXu9HGIg/uVklGMwhNEX5jamYTIdroH8JKqUaZMdbsfq3TxUWTJp5YNcCOowt3g7
 R3RcJhwvFghtBp6KORJ9/kg6uiLAlFd61P9fxy4U1P6g1H11xdccBMCU+YKtAndgPzbL
 R0NcbTtrP1aTZ48UdJwZJ20NR5B1CDbWgbm4eY5gz0H0YSBWGjeWRZLGHcLysqvPnmHN
 T4XLyDzQyDi3fXyfOlemnjWInNvXPJBDcHVb5rk3BuFX5VCHuOg9EwAseAbd5nJCWMY2
 hLpfQS9UPTeVcMXi5O/J7y+q/pAqpHac46177kfcta+sC6AFsi1jZYHfWDKXG/0w+dOF
 RsgQ==
X-Gm-Message-State: AOAM533LLB3kYkkZy2JWO/SBy6SClPvnKrBPNYGcfnjLSkPsMImes1iu
 wRkJOOtQxA59uz0zUczeAylaeA==
X-Google-Smtp-Source: ABdhPJyhBCLjYPXrat9Hj/b/h7B5hxSrFg+VMwaeiDUv/CSryJFB1Y6GBoE+IXP8Bj1NAj+zfhjS4g==
X-Received: by 2002:a63:ab07:: with SMTP id p7mr4358636pgf.326.1602690329555; 
 Wed, 14 Oct 2020 08:45:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t9sm3937411pgp.90.2020.10.14.08.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 08:45:28 -0700 (PDT)
Subject: Re: [PATCH V2 1/5] target/riscv: Add basic vmstate description of CPU
To: Jiangyifei <jiangyifei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>,
 "Wubin (H)" <wu.wubin@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "dengkai (A)" <dengkai1@huawei.com>, yinyipeng <yinyipeng1@huawei.com>
References: <20201010080623.768-1-jiangyifei@huawei.com>
 <20201010080623.768-2-jiangyifei@huawei.com>
 <0bc022ca-35f6-8579-51f1-65005e89a9a3@linaro.org>
 <cbbaee32aaca498294e599ba7768279a@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d4fa7cd-b534-5635-302a-6ef0c4b8426a@linaro.org>
Date: Wed, 14 Oct 2020 08:45:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cbbaee32aaca498294e599ba7768279a@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 14 Oct 2020 15:45:33 -0000

On 10/14/20 3:21 AM, Jiangyifei wrote:
>> Would this be a good time to expand mstatus to uint64_t instead of
>> target_ulong so that it can be saved as one unit and reduce some ifdefs in the
>> code base?
>>
>> Similarly with some of the other status registers that are two halved for
>> riscv32.
> 
> I agree with you that it should be rearranged.
> But I hope this series will focus on achieving migration.
> Can I send another patch to rearrange it later?

Well, that changes the bit layout for migration.
While we could bump the version number, it seemed
easier to change the representation first.


r~

