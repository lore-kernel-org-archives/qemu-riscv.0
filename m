Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGXN3-0000Qv-5P
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 22:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGXN1-0000Qd-Aq
 for qemu-riscv@nongnu.org; Wed, 18 Aug 2021 22:01:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGXMz-0000ou-Om
 for qemu-riscv@nongnu.org; Wed, 18 Aug 2021 22:01:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id n5so3899506pjt.4
 for <qemu-riscv@nongnu.org>; Wed, 18 Aug 2021 19:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=knKjiCC6/j+JobsnbbtyeLLSFxaiTN3u5jndQ+eQxXs=;
 b=JzbthldYF36kWrOUqCtLhUgdJ5HSSJqLAIagiFm8+ayHXcR1tlvJPD4oei08wCMHBn
 BYRMx1mthsgEwKsxmlCztia0RACsRZXpmjcHNFtLK6lBAzd6oszVbw2abTEI9GrLpk+0
 jiRhtjXw2JULtxhrJyCkAeaRMFK63B17X/qz0DxYgr+m5G+6Bf20hKVGhG3tnxwUFx8L
 QxKAY1agCrdAJF3BhLbWMJ7fG4gKHM9wY7DMxUcOab1VDpdHAFGJ16RRSE518vexuojK
 Ji7Q2hnaCsFaCU7HP5JbYH6SQGRIR/8PQlTbbjR/lSWRFqCeXvQFJqwGGuOS09bAHN6y
 xk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=knKjiCC6/j+JobsnbbtyeLLSFxaiTN3u5jndQ+eQxXs=;
 b=q3/R4ZAwrC1k10BEH3LbfX07oYAlfSe0oST8WL/MsN892/D1igryByhsDzqD0JYBps
 f2v8Ak3dF1Nslq6ZbIBqEDTMgMDLOHD9iPU9rc6NlroNNrb/FY0AqgMRDSIhvaOa+hDo
 xWaxTVhX9PGxdPYiBSykzIcrGc5yy8YHma5s//B4cPzBLhyPLgM5xUzPqxINrkVX/LWo
 9TxLvRXWgAO6+c00FdFQLfkbn/aMHDtWPUlfTZzIIhoX4EpviO2wQLziWMv+EVw3UhgN
 4Z2Cs459eaAu1frligQlMi/U8cZzXGmQzbs3rrO7cXosa9YeX/r4VMPcNRV+Gb6zCsLr
 RyHA==
X-Gm-Message-State: AOAM533nmOBA9NS9W6zuuukwP6FPEBHxg8Up9gLru75YICQQQxMgODp6
 XLrI3eVUkvTEGcDwnpDloRg5hw==
X-Google-Smtp-Source: ABdhPJzWLw08gywoORUWwuckV287cHYqyHYZnYHoF7HLNlHIhIInZxE91q4egEZMCLbtyr8VXp4c7Q==
X-Received: by 2002:a17:90a:6f61:: with SMTP id
 d88mr12691831pjk.139.1629338483840; 
 Wed, 18 Aug 2021 19:01:23 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id t22sm1241021pgv.35.2021.08.18.19.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 19:01:23 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-5-richard.henderson@linaro.org>
 <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a7fb816-57de-3846-f025-a10bfee514e3@linaro.org>
Date: Wed, 18 Aug 2021 16:01:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
X-List-Received-Date: Thu, 19 Aug 2021 02:01:27 -0000

On 8/18/21 12:58 AM, Bin Meng wrote:
>> +    TCGv temp[4];
> 
> Why is 4? Is it enough? Perhaps a comment here is needed here?

It's a round number that will cover three operands plus an extra for address computation.

r~

