Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC52g-0003No-EJ
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 13:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC52e-0003NA-3E
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 13:53:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC52c-0007ut-73
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 13:53:27 -0400
Received: by mail-pg1-x533.google.com with SMTP id w186so2015624pgb.8
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=806/hZCnuI9u2fegX3YZY2ZhOkb1OUVrcXhvAHC1n7A=;
 b=gh3Oru7TQgCM++fNXJdya6vH9K//j8zzfIpJGBXl0/MotfDKSe+fMHYw7+b2iYIULB
 mmH7BJ6FdZXpXIiBgYKmuB3irtQh4W3MFHCAW0dQSS0DFCoo4CK18ldn3Rdok8EuKHeA
 QG6as6DDrbEK3u+QnJ+bs+MTPmOgXxFA5fICuJCzseGL3Qo5psxRnLgRwesIeADnABuU
 f2MrYvhXyZeE5X2L9MiVEYiTYquXgN7CN6QyksgetHkF5Mvo5W+r4dkgoBttOSNq48ay
 niew166Nxxt96EyFlqlIFhFZ2vPNXK/zpj+IHm/sPENGYN7GAfH/PC0PzRLZlCQbxHEX
 8/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=806/hZCnuI9u2fegX3YZY2ZhOkb1OUVrcXhvAHC1n7A=;
 b=F9S/yoQrY+VL0yg8t9DOPJ4PbCMws81+cAhXFQZ56D8xbN9WdCQD7w7QmQGneazdq9
 9jwOoKPfKKM8BbYor7VmV5lADriX6ABTu/rMLPMQVdLNCiZdBpgyZIwXIN9M/0684NQw
 f8A1BzC3iKy1PgJZ95bNTNh2oB8RgKpFs4mtr3HD7vcTYiHd+hXTiPhO7S/2kAeZRdRw
 nBDwOVyDReqAegqfsGafYNRF79EKCCzkUKC4n5/gGbayowvzNWPQhCX6XP9lkqN9DRLU
 Ag1FK+QYmSYYKzGOhrHLzxBF5bsFMlAUv5n+YRtkruogQxU/uqdL9yobsczau2XnCjdG
 7r1w==
X-Gm-Message-State: AOAM5312qLfHkUyJYNiEpVBfq1fo90Mbd+oDbybsveLxrZL9nLIk6kYr
 JoXgW7jvFeSKniUEYj8wyNrPWw==
X-Google-Smtp-Source: ABdhPJxusJvltG3/alV8tq56dCV1ubEwt6A5hqPsZYsJiVzB4kyl5wmkT4aZa1zfufCbuFpXKdD+Cw==
X-Received: by 2002:aa7:9e4e:: with SMTP id z14mr3779439pfq.60.1598723604041; 
 Sat, 29 Aug 2020 10:53:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a13sm2949679pgn.17.2020.08.29.10.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 10:53:23 -0700 (PDT)
Subject: Re: [RFC v4 16/70] target/riscv: rvv:1.0: add translation-time
 nan-box helper function
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-17-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2abf8eeb-4d6c-d767-dc5a-368c7859870a@linaro.org>
Date: Sat, 29 Aug 2020 10:53:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-17-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 17:53:28 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> * Add fp16 nan-box check generator function, if a 16-bit input is not
>   properly nanboxed, then the input is replaced with the default qnan.
> * Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
>   generate the NaN-boxed floating-point values based on SEW setting.
> * Apply nanbox helper in opfvf_trans
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 35 ++++++++++++++++++++++++-
>  target/riscv/translate.c                | 10 +++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

