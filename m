Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRdO1-0004Lj-IA
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 12:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRdO0-0004K0-Ia
 for qemu-riscv@nongnu.org; Wed, 31 Mar 2021 12:08:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRdNy-0005c8-Sc
 for qemu-riscv@nongnu.org; Wed, 31 Mar 2021 12:08:04 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1431282pjh.1
 for <qemu-riscv@nongnu.org>; Wed, 31 Mar 2021 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XMSZkEk0OoaY+VPkeJwsIkntCr7MDUwFdmbpdWCKjG8=;
 b=zhDP8f0Uo3fMmVXoj/qOI/ExmjQYbsLlANuSV/5jxJtspCh9yTRkH34Egc4Dd2qkiO
 6N/bwHWC5GNWhVTprfKKpjzIAWa81VtcEKrwYrlg6LRtRrVgQV/6b8y2hkorFBEBSIUK
 2RZGyIumpsIaucfI32WpD39xlQ/aG3a4UG7c8KNXY7k9Yy7wwvUDaszub/F5Bdls84p3
 PrZe5QIejkO/G0XQzaLxw22kUlGUTibfQJNSqJODbOV0BMNUkQIZap7MIH+OmajQmURq
 MbV2zZHyI3lkBbWfqSCA7Lm08AlnBlVhB1A7TWmsWlOrNK2WNnWRjYevDyQKJtoBF72s
 xEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMSZkEk0OoaY+VPkeJwsIkntCr7MDUwFdmbpdWCKjG8=;
 b=unvo9I2P5Bouugt/DfnQlV2Axv+YgVhXb8vu/GZ+T5w+kJssmmNZdgWgQ9xorqFYff
 /m1dguY/JBQSdQQ7qWzLgZRoGy5flkywz4d8DqglLhD76KECLYBUWzMbDSwz7MFRq//Y
 kO39hekbaa598SuNoF9jgXsEgSX7j20wBDF0PQNMQBFOPleyxfwQEXOtTyEfVWKjqr30
 WQsuZBUPPJLVHl2dTN43MLiIXOM2iXPeUAy4TXWpo6wtmp28VrafAuQayAUdKhTFc9fv
 qhonUN+8l7WsZ1F3cIQR6tuY0uRWJv32x1bkFMiaPUoWs/OIFxdFJzTVJxsFvGguVXHY
 IOLw==
X-Gm-Message-State: AOAM532yBg6PtzsS+5Hv9p/eZkL6HXxnJF7l+mUDGVWQ5IXhv4m1ftQE
 +LiJFiwg/C8thOdsnLHPb5GytA==
X-Google-Smtp-Source: ABdhPJyFpt9fqdCz495GIskAyiyEIKvyWDBpxBAq0hAE8jj7baoSNRcJXXvaGz5DC2plgCU56Fxt1Q==
X-Received: by 2002:a17:90a:c909:: with SMTP id
 v9mr4262342pjt.218.1617206881123; 
 Wed, 31 Mar 2021 09:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k21sm2837719pfi.28.2021.03.31.09.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 09:08:00 -0700 (PDT)
Subject: Re: [PATCH 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fee25ee-e944-90b2-ef95-3a6545aac699@linaro.org>
Date: Wed, 31 Mar 2021 09:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 16:08:05 -0000

On 3/29/21 10:08 AM, Bin Meng wrote:
> -    char ethclk_names[] = "pclk\0hclk";
> +    const char *ethclk_names[2] = { "pclk", "hclk" };

static const char * const ethclk_names[2]


r~

