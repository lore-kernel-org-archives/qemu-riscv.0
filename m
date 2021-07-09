Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1sfa-0004mV-8w
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 11:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sfY-0004ic-Qn
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:44:00 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sfW-0005Wi-RP
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:44:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so8450786pjl.5
 for <qemu-riscv@nongnu.org>; Fri, 09 Jul 2021 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LuhcCMpt2x77Hes0d/MHS8FkZqV2ika15hSqmzaeWBs=;
 b=rkXpJB6yqSnsTyNEIv0TvL6EvJLDmNdE5CnrqRaBURNcd3V1jCg9rPI+NYZAB5ezIW
 IH0JAOigJcptebvUUF+5TdelngVZ9sSOhnDYvYj+KMbulu+kfYlmhJZrDX1w/AWUP0vF
 iXXuyssYZG/m0qQGQP8+5pkNPqmrw5/JkcKC+flKtIiBAqetT43UBUKohPmEf9qrnjh7
 rUiiUuU/v0MbhO5jQnxXLBtpdQkwCxDydb7bq3vGj2a8r0CaBOoVApBGp9OiJPlMWlBo
 DQcu5+BDlMfnQaEtQh4kMek4WhM56fycEnZECmbFo7IKV3CAz6+/fRUsrgbPDgG8aZ7y
 bEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LuhcCMpt2x77Hes0d/MHS8FkZqV2ika15hSqmzaeWBs=;
 b=ubyK5/s1/kI/SN0FHcbAeMJfrwU2GyZQjKZl5/ncqP5nuJ3hTNKz0L+lY/ZsnhiE9D
 B/rLpdxFx/Bd6xD0/cAqhn46O/z9anZy1MMxUOYaYfIYjenCWw5sb80R6pGGzPUWOTjH
 zmlZcLMtLF1EzlZox70RWR4iX2950ex9CiX0Y3Af4rY37fqsMGqRs10ovsZ0vg+wbFJg
 37FVC2cubbuoPvtVauw7Bg7AipQSLR4HTM/+LQJPF9/ASb1K+71+XDxDNckI2OGgm18Z
 z6czMjhGHfoZuduf3j9lvVsOd1mxyc5MUu7OfpxCHBNfpXUZidzJgpNBcKAtxyzP96qN
 ZMQQ==
X-Gm-Message-State: AOAM533reWy0NF7K/NgU7YCNLwKH8sZV0L5zZgXmFTVrSMb/z+Szjhp8
 o8KkAZ4eHaTDxpHHjNtVeWma2SVDkNen9Q==
X-Google-Smtp-Source: ABdhPJxw22buaPBCyhdxaDjgs/yvNhNSFskQZTBwtaI4hJD4Xu4Q8Z67ZfXCGZaKvDvP2N+NLJ7bqQ==
X-Received: by 2002:a17:902:b58f:b029:12a:d11d:51d0 with SMTP id
 a15-20020a170902b58fb029012ad11d51d0mr5616207pls.42.1625845437283; 
 Fri, 09 Jul 2021 08:43:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c141sm7011898pfc.13.2021.07.09.08.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:43:56 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd6cc6eb-ff90-d7f3-9f0f-e35f9691554d@linaro.org>
Date: Fri, 9 Jul 2021 08:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 15:44:01 -0000

On 7/8/21 8:31 PM, Alistair Francis wrote:
> @@ -48,5 +48,7 @@ struct IbexTimerState {
>       uint32_t timebase_freq;
>   
>       qemu_irq irq;
> +
> +    qemu_irq m_timer_irqs;

The plural here is a bit misleading.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

