Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCAbq-000464-Nn
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 19:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAbo-00045W-LZ
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:50:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAbm-0003Zr-So
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:50:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id 2so1227606pjx.5
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 16:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEQ3yQMM+Hpe+4Vkqh2p8O9EAykOnajxJUueinR52p8=;
 b=YZnLobdquO/1b0kcNythHwq5muJJ3Dm6AZLBru3kp96B+HLEoox+7Bg/frFwabflpv
 2g0LXbwn5aN1BgQ6pA2o+dmeOscmSMg6edcDq+d/68zuecvZw1s+MnRD0biGdsISlepv
 ptFQFYRa5yy//QsWkd5xisbovrsbHJlHK72x+uiNvbwidBJJ0z9OadssDO8Hxl0FY+JB
 i9o9WTaccDGm6FOn7b6NISdbVbeBNyWTWke6C5xA2AEhgyI1O6orSq+3QR67LVWzKrHc
 IqkIUIDL9wHLrcpPNzDQJFXYgadTY11dlbDP0X/3qJDVaUVn35cTOoIXrpB5RT2MS0t8
 Kc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEQ3yQMM+Hpe+4Vkqh2p8O9EAykOnajxJUueinR52p8=;
 b=OplklD88Y0P+Z0kahkw6TcOI3BJ1VebjhLfDUqwmZRkct7Bnh5DtdjVVxQGbNt1uWU
 iqt/q0NnbgDw/cdMMzTEQDYEKHWKqPd9pLzbq+xH7dx8NVe1AJi2kE7gB67U4EL4+403
 mFhUKd27zLm4l0SMFcSeq7+ZF1kI5qfnwmmY8y9moKU5XhTCxQ4biJq/fOFmqAY8tgsM
 2Y46kuwe+zTrq9ZdSwJvCh/PS0x+6l8e6GmUnIQ45RLnHlsq1y6UjUeeMnYC6iPAW29S
 hM5mSrZ3wNTrhrDTW0HzpAaoE4MqcQ857Gmv2TFHvVCoQ+jf8OItjUHWSsfSzgxGM4AR
 M6mg==
X-Gm-Message-State: AOAM530Gr++jxE6bfCyB+czl128khVYPvxHoqNtUXxaPJ1Q1ZOwRDNKe
 OGbONJmfWgYAc99od0fjKs4m8A==
X-Google-Smtp-Source: ABdhPJxbkOG8oT9t3H3HQbsIun0WJJNob12Rj/i18DuybgNuhu0MUvbX75otcMa2PQ3H/KdNro15eA==
X-Received: by 2002:a17:902:eb0b:: with SMTP id
 l11mr4041574plb.57.1598745004758; 
 Sat, 29 Aug 2020 16:50:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t25sm3413083pgn.13.2020.08.29.16.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 16:50:04 -0700 (PDT)
Subject: Re: [RFC v4 55/70] target/riscv: rvv-1.0: single-width floating-point
 reduction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-56-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d94182cc-8846-9eb6-6a93-87968d0d32c1@linaro.org>
Date: Sat, 29 Aug 2020 16:50:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-56-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 23:50:08 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

The one sentence in the manual is quite poor for this, and needs improvement:

> Floating-point max and min reductions should return the same final> value and raise the same exception flags regardless of operation
> order.

It doesn't actually say anything about the way in which we've implemented the
*_noprop functions.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

