Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUk1-0002mh-9x
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUjz-0002ie-Ow
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:40:35 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUjy-0004T3-0t
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:40:35 -0400
Received: by mail-qt1-x82d.google.com with SMTP id j1so8135017qtq.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LerSDip4kArOXibM3bHSA4G9bPSUeS1ue3a3zZwCP+o=;
 b=bSx95gEI4WrgtLjSdxUTPVLV477ZuaW2YRMP4giRFcnD1kg1XmuIqLHaImG2962dYD
 O+TeKynXZ7bbUbZUAadge57CdquCtYPKkeoMsdw2r4bqBrEMc2oUAwQjuKevofsji1SB
 ZeNi1Xx0j9BAAb6w4VSI7yljJg/urtTvo4gpO/Rln4/KOSBq/LZO25uFZRPpFR4cLQVN
 3ce+WjzRR25plgZnqoeQpptDye8nEdn98OkpX0iF0X8Hs1Y3qJcZ/d8TwxO0FBQqIk7u
 c+jeXIUS6OFv/JogeDV1M+PE5CtxUe9MgtljqC38r3vaa9DCPWtlbXH+lhxQ8PSCYCNd
 Unyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LerSDip4kArOXibM3bHSA4G9bPSUeS1ue3a3zZwCP+o=;
 b=e2BluSw5/6e6HOR/KAkXhNKB1ynLmdL76TfSukSUF2gLXg4bq4QidjUdp8ERPiwCvo
 D+H33z6IpWuUTI47xPbQed9uXTMjkXwJiIN/gZ51vY+A6/UDQYfSWJw76xWfRmYZ9hqv
 D531sJKa/eJ5SO57kul/zSv6/ycOgo3SBpfrtMz8yFc3wgxvPHe4/3WtaR6qxcHo3PZd
 JClsKa0zI0nYUiBAOqr0eV8UiUF5nxPUudV3xDkQ9BrVbXHl8ZLy7pbIcfawliRpDWEv
 tF4OtAyqdPhhc9y9KV3VtnRwhMYUDdglGSB3TLeEgVtq/bJ8T3LY6nicFgfuIMqaDtif
 oG7Q==
X-Gm-Message-State: AOAM533LB5kV3eHohr/xCzh+lP8C7vbj8spZJs9FRIushPWf225xJezd
 elcfnwF3k5YHNssmv56YUJ3DJQ==
X-Google-Smtp-Source: ABdhPJwIBjILW0NWvfVVWxT37DwsUBhjGzmx2c10w8CzeDQT8cfdv+4xUlRHp+C0dYmD1r3IhAgzsA==
X-Received: by 2002:ac8:7f44:: with SMTP id g4mr29121136qtk.130.1635763232879; 
 Mon, 01 Nov 2021 03:40:32 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u8sm1060910qkp.21.2021.11.01.03.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:40:32 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/riscv: Use gdb xml according to max mxlen
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10878235-c45a-07eb-144e-09e4ba4486fd@linaro.org>
Date: Mon, 1 Nov 2021 06:40:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:40:36 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> +    switch (env->misa_mxl_max) {
> +    case MXL_RV32:
> +        tmp = (uint32_t)ldl_p(mem_buf);

Signed int32_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

