Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7MM-0007GM-Ki
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7MK-0007EL-QG
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:21:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7MJ-0007no-9K
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:21:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id k13so1205093plk.13
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9L/aGUaP3iq4qPOXVXMB3tKy0tWK8spjI5tS1ind9xw=;
 b=KgZt3NJU8GLEYtnk4a/EHS8K77MXgKw/DoddZBq3oECH9XbqfVuTFfznOKVPEvljid
 jQPh770UP9ybJJ/wl8m+G3oR18LN4k9Uc49aTkP6sskilIcPiF5AW1o6CsILsjPV1nti
 f/VrAG9Bgd6pwQmmAvOtsyYiORpt6FCDL3I/vEBP/Au2cmIKovFi1tTwn1ccUw2GRX7e
 QYlpEIQPS60v9AkTLuYEkgu5Gv75iQRWEkI4k1mi8I9SuuiRcknvlftjRWHDnCIH/7U5
 6RfqjB9QaKk3lhDg7MeWn6V6FUNhN/3im5HTTlHfRsDraOZIJxlE5ovOyZB5a/tL5e01
 6GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9L/aGUaP3iq4qPOXVXMB3tKy0tWK8spjI5tS1ind9xw=;
 b=G1nNAoTcseiriNOpQgdHny7LJpQ1ugvOAju/CL47o17FzAWvJkD8tptXZI3umO91OK
 sQpXAv1NPpAz17ZlRdBscFz0oiihN38WHKGXsRLPiKSYyv8ZsJY8L3hUPAIqSWCgFblU
 wptpbw3EU+T0H5ukaIpQ6WYsBgjnvfS+HoE/tz0VH9Ht9YIW37rLlPKv2Psj7XwGms0I
 Ah9UDEdJfq/cOXwCQW7SZ0snnqAI/wJ6rUnn5JFJAT7wPYei7JQA3bNYaY5+w+jIAXhe
 kLqDz0+0xJDRdlqD+hfHWWoLF2IwMwIBa0qVTlnQYI8qXEb8qn2OSdAPjT0F6wGSdwvE
 SYIQ==
X-Gm-Message-State: AOAM532y0yhG9TZyp3ggHHbGoD7V0DOtoi9BjSzMbpZFRzqGUyqYV10Y
 Tv5StY4nrbxRpA0aF4BBMmG2Pw==
X-Google-Smtp-Source: ABdhPJzF4dJzSfpumAvcRExs3WAXsUXL82+pHCcf39Jyhs2cXcOmnjYPVLDVk93vRF12kRJ8ELjtFg==
X-Received: by 2002:a17:90a:950a:: with SMTP id
 t10mr4092385pjo.107.1598732513829; 
 Sat, 29 Aug 2020 13:21:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i20sm3566533pfq.204.2020.08.29.13.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:21:53 -0700 (PDT)
Subject: Re: [RFC v4 45/70] target/riscv: rvv-1.0: add Zvqmac extension
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-46-frank.chang@sifive.com>
 <39cd6665-b74e-c61d-97ba-1ef1d41487f8@linaro.org>
Message-ID: <48cad5a8-c81f-dd8e-4452-add26d351e8a@linaro.org>
Date: Sat, 29 Aug 2020 13:21:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39cd6665-b74e-c61d-97ba-1ef1d41487f8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:21:57 -0000

On 8/29/20 1:17 PM, Richard Henderson wrote:
> On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>  target/riscv/cpu.c       | 1 +
>>  target/riscv/cpu.h       | 1 +
>>  target/riscv/translate.c | 2 ++
>>  3 files changed, 4 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

On second thought, the current manual says

# This is only a proposal for a future extension after v1.0 and might change
substantially before ratifcation.

and does not even include the opcodes for these.

I think we should focus on 1.0 and drop this extension for now.


r~

