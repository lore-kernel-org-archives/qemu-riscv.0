Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYVqy-0005bk-3s
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 11:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVqv-0005Uw-Ab
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 11:30:21 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVqt-00085h-Jf
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 11:30:21 -0400
Received: by mail-qv1-xf31.google.com with SMTP id i9so16884995qvo.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Apr 2021 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OwD+iecOWrweph0KH7tmAi+jLs/j2FqyLJEOHf2ZQok=;
 b=GY+IeuxV3w7rVX/brH9rrj6Cy1YYiRGyFL68T/wv6HxxFYDZ9fc0hHJ4pMT6J53f4y
 oS1i53oeDET7vduxH4t3uLz/Iz/Wdk+C3NsaGyDglB5Ci54d9uORR2erDyDWmUJNYhuI
 Cg7oP79kE70XOtbbXfAJQ/aY9quRgHh+BaMqtKzIVODgCtvT4xOjGU9z6CixFJl64z45
 QGlrhxAlwpe1A1fzxhLB5LApQPmpnxT0T/8LTXzuxgM47nzJBH4uxiVh8iiRJbn1XT3S
 BIFBzF3Sacz5xKL88MkIaDdTLjcYTsLsZ8b1lkN8wh3eD6mGHwTIPH9j/Trn9DGg4CCl
 MdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OwD+iecOWrweph0KH7tmAi+jLs/j2FqyLJEOHf2ZQok=;
 b=E42XFdU3zebZVNxdlAoJ4bQnd7eyWXYl5tf5Cc1IskrMNpCF5zsB4csfrtjY7d6V9s
 p6AHg+fZ/D9HkJBj4OQDvyaY73MnNwwE3xmUHxFw7gqZ5mPozMb3tKc3fp6TDPryJ0dV
 IZ5NjgB6K/MoEF4vP+WTlLy1sYxYgi+fwhsCyPSaa+OyPps9ujlcR16uaTxqj5Gq1oiF
 ZVwpPMMn56Vxp4hiCl5iGLH7fcCfc0dMqEbjqFujyid3eJ3dnq3EScwyYqK1TMxj4Q/i
 H3XG0V1r1GSg/n/CUZX0OnNWWE9fZdfjYfvdlYVnufSOf/4xZPtazGLb+cjcCTP4bwAy
 C8jg==
X-Gm-Message-State: AOAM531u7I7dYzu3yU72AFZ190oqSkPy5aGqmb+Fr0Zd0J6MXiXrjROB
 x3mWhdvcczkv/2Spa9O3IAEDtMJOREvLEg==
X-Google-Smtp-Source: ABdhPJyvZY29T+4ReR+NRKacfcFtKnw1jP8AepyHLdYPwnr5wOS9Jkgb0DXHXjDodtphva7NnzdiaA==
X-Received: by 2002:a05:6214:1866:: with SMTP id
 eh6mr22075486qvb.29.1618846218632; 
 Mon, 19 Apr 2021 08:30:18 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80ca:1129:3594:91a:8889:c77a?
 ([2607:fb90:80ca:1129:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id i5sm572542qka.0.2021.04.19.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 08:30:18 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: fix vrgather macro index variable type bug
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210419060302.14075-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40acb2dc-64f4-23e8-8387-be69f8431761@linaro.org>
Date: Mon, 19 Apr 2021 08:30:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419060302.14075-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 15:30:21 -0000

On 4/18/21 11:03 PM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> ETYPE may be type of uint64_t, thus index variable has to be declared as
> type of uint64_t, too. Otherwise the value read from vs1 register may be
> truncated to type of uint32_t.
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/vector_helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

