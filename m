Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgwS2-0004AF-0Y
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 16:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwS0-00044l-1t
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:26:56 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwRy-0006Td-WE
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:26:55 -0400
Received: by mail-pg1-x543.google.com with SMTP id o8so4021763pgm.7
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wPHuLyhdI9K6tKUn0jL6BmlikqNCx/CY/2TYID7RL8w=;
 b=DGM7KJcVIhzXTSNeUtiuZUnpQhnKtAJLHj7iNx4y9qBqkXj/dkevxdCKlRf254wykT
 30TGNNwtZsCKxvDdNw7V49cTcCKm6ioRXSlV5sGBl/X/skmv4zH8wrLKnfdvSjOa42Gg
 BQG79Tbl7AbsIhwB2/abLxejm/847sfysY31Y7zOmLW1hEystTwT/4Prz7sfP6YgqFqj
 an4NnZ/D7du/VYJktpxDBrUoFzQaZ3pXz1q0VuAmF32rOP+UKQMrt42PM7mkZnk961J5
 BZNATQY5a+akAJPCKAVglzxy6lyJ55vJaReuXGvq/ZaSRGSa2f7HsbyBxHtHBgKk6ouC
 lvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPHuLyhdI9K6tKUn0jL6BmlikqNCx/CY/2TYID7RL8w=;
 b=tRvNaBQSywaM+9mbuPk89dgC9Ih+MAMtIyWippgh9qdUgSTEnna0xulK6Iza9gp+V5
 M26rEqhFgWna1YzB6IFcsZMfcaCpjo3IagUNmLHu+MtXzlPiKadEAdzHBU+rZ8wv8/2H
 QIjGwYFEpIGNRMz5Fn/tGp8Jr7L2VAIiczrkIAWshVhx4Gy/IPgr7dJflsV1txYVj6o7
 CjnM3gEApYFYeTMPwc0zbAaalFSnbH46zwucZa9i3S4DT0n7tFB76A/tYC6Z+9qrG3th
 SGMT+JRzgq13eBra/gRC0DZ42bO+yAbKBO2WXsI468gPOBCLTp/KA1WcxSl2P7gktCzu
 H8sg==
X-Gm-Message-State: AOAM531ieWmD+fUvskevmoTMHVyWL1A38Oj1IVYBk3Ej0lxXyTN/mtEn
 0rod9JiXnYsn5ZtURz7rVHZILg==
X-Google-Smtp-Source: ABdhPJw3wAaHI24KJWkDJrRh5zuQ1ebOSCJ56r6nBeOJaWBoWEIzG/cs7sRE0GaOU++jXmXAvvSjyg==
X-Received: by 2002:aa7:9839:: with SMTP id q25mr5973957pfl.291.1591302413349; 
 Thu, 04 Jun 2020 13:26:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x8sm1895103pje.31.2020.06.04.13.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:26:52 -0700 (PDT)
Subject: Re: [PATCH v8 26/62] target/riscv: vector single-width fractional
 multiply with rounding and saturation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-27-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b8dfb1c-a8b4-0d3c-b727-0a640e400c74@linaro.org>
Date: Thu, 4 Jun 2020 13:26:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-27-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 20:26:56 -0000

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |   9 ++
>  target/riscv/insn32.decode              |   2 +
>  target/riscv/insn_trans/trans_rvv.inc.c |   4 +
>  target/riscv/vector_helper.c            | 107 ++++++++++++++++++++++++
>  4 files changed, 122 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

