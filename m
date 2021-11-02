Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhyx8-0002yB-VF
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 14:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyx7-0002wT-HE
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 14:56:09 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyx3-0000LC-M1
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 14:56:09 -0400
Received: by mail-qt1-x82a.google.com with SMTP id 8so136735qty.10
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOFecMmChVDVQd1yY1gTt3CEQJmeF3p7PpwVFrzOMbo=;
 b=BRJHlSJylHqWQzorWlhrlqC/ie3MSA5FP4O5TVgpKR9vNXVRELhe+J8LNPgvJZizRJ
 5bncF6wSm2czK/eQmizE5GCtrrM9sJGKsDcIt9bhHpdgfEbGZllzEbQgnPKNUCsq1uH+
 PYJeVu6WtrN5+bp13Kism/wWjzVpkZZBtmmmcSpoDzvWyhsit2pdKjqiJqWGNjYu8j2p
 Cc1/Ys/yf6gGibQuEHO/e+OyRp+ttwbIYdzVWRb1IsyVmLmsl3llHSEz8fNSeE0w0uBj
 2/tp/v+Dfq1IYcNxqtyuQBKv529gjl6QLWZ1h+ejk61LJfY6AnsrPP92XD16PO/1we22
 B0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOFecMmChVDVQd1yY1gTt3CEQJmeF3p7PpwVFrzOMbo=;
 b=0JQvIOVUrn8pJewxId5mTlwIn6B0ps0ia36BWbgGfIU11kxhSM/sIp8i1MFX2jMNPN
 n7Dj9U3vuwxS4vFQAdY7zL1cYg8bEM6RH6BtTbg1P2hQGUJrolWC1KDLbq+ZtYCHp5GL
 hd7utdtEN6hUcTqjUNONWArYZe0sXb0glE5yO+AWIHOjHpVt88dmKaw3GGnrzNLVMLST
 FWKACiQHuKEO5gC4yy7FNlu+BKMwR36K69YQd++gswSn1XVXVsM4CZAflNDJiT9gHvxW
 hzeqBrSlVfKPuLe/aYK7EW8VcxG+In6l2lOJvCrvtxfc8hRBwFXyifqVAikCxwXbmI0j
 PJIQ==
X-Gm-Message-State: AOAM532WAn8cPlPZE+a+EywW/l5BD59C1nz/T9nytMURQhP0t0IJsvje
 VoHKxLo/+bB5Hde/VXf0ykSA0Q==
X-Google-Smtp-Source: ABdhPJw3BPvFW+BwDSEUe5qsIZGgIkxVPiiynrIm8eBGIo6ltl83AqjmOz1HNYArebbMRrqUV3OsBg==
X-Received: by 2002:ac8:7d0f:: with SMTP id g15mr33690263qtb.60.1635879364275; 
 Tue, 02 Nov 2021 11:56:04 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u6sm10000809qtc.86.2021.11.02.11.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 11:56:03 -0700 (PDT)
Subject: Re: [RFC 4/6] target/riscv: rvk: add implementation of instructions
 for Zk*
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <345c3fc7-72f9-a5b8-1545-fe7835ed8905@linaro.org>
Date: Tue, 2 Nov 2021 14:56:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102031128.17296-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 18:56:09 -0000

On 11/1/21 11:11 PM, liweiwei wrote:
> +uint8_t AES_ENC_SBOX[] = {
> +  0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5,
> +  0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
> +  0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0,
> +  0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,

Use "crypto/aes.h".


> +/* SM4 forward SBox. SM4 has no inverse sbox. */
> +static const uint8_t sm4_sbox[256] = {
> +    0xD6, 0x90, 0xE9, 0xFE, 0xCC, 0xE1, 0x3D, 0xB7, 0x16, 0xB6, 0x14, 0xC2,
> +    0x28, 0xFB, 0x2C, 0x05, 0x2B, 0x67, 0x9A, 0x76, 0x2A, 0xBE, 0x04, 0xC3,
> +    0xAA, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99, 0x9C, 0x42, 0x50, 0xF4,

Hmm.  We have an existing copy of this in target/arm/crypto_helper.c.  I think we should 
move that code out to a shared location like aes.

> +#define sext_xlen(x) (((int64_t)(x) << (XLEN - 32)) >> (XLEN  - 32))

This is (target_ulong)(int32_t)(x).


r~

