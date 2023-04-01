Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piQSQ-0005OJ-CU
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQSP-0005O0-AQ
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:55:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQSM-0002op-PV
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:55:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so25329551pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680314101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SjSXnjm5qi84eEs+q9sDAi4NhodN6CMX1wcTiQSdqu4=;
 b=gM179A+7oB2KvEUjqYeqc7LfJyWcV9C9VojApXKiszAkU++emgvfVRIjxjxHgT+L7I
 fDInPeP9cqFAj7JXp46ERlgWB2MozOxme7zjW390O7ej5fUpLYJqzP80gyTL0KEA7nAz
 GOVeImDOYYZh5gvYCmQ5zVQXEk67vZkewr7H8UkjU54cEGE7HNYb36SgIR2azsCstFII
 dlVM495/WFHHIovrpWTRAV4k2ALQg3MgLqrgqF8oayNtAvQEOJvFFOSA6CUPaCE7ykjO
 bW+/zreWk/eX+LB5EUKdY4/6V9O6kMtdfyJX6nUdJj2UyG+yTjsIbXRyK8ql9ShR1rab
 VmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680314101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SjSXnjm5qi84eEs+q9sDAi4NhodN6CMX1wcTiQSdqu4=;
 b=03QLyiOVvf8LMwCeWDU2p/BIpQ3cogaFiCfHALpDGWWucFQNWRKG2lar8hQ5CIkbrn
 oLGnD7bFYfd19zUUEtSls97OTADxyZGtNJthTB6idC+YJocS96VXM3UETtlDsCo+kxQI
 u2aPQjcoayjwXI4fyarjMjv3ZnwBOCpQvcGR4g2W1Rp/HICax5K5d+VzLeueOYwz9IS+
 IF+ZMtng+f/7k7BgHrDKRWIlMk2RvFtkqu+z4jSl615NPxHzG1qWfdERocKhDF4pnRm5
 QI/dW3ZASr1LE60QuzaqnKocLbpvBVjy8QFDQl8j8vP8+ygBzamNjyAh7TBLc+l/AI//
 dPZw==
X-Gm-Message-State: AAQBX9dFKc1RoEHoToZNvXravUcPDpMuMyVaDNzYTpPea2eX7r25iFJC
 M9v9LVVq2yP++ms1btmqoo4FhQ==
X-Google-Smtp-Source: AKy350bgECNkelDnYse9yKmZTQcIvSXU2ptI2863eybpiwW7xdAC+KWqRivr4GOsbDzr8oNe6I8kRw==
X-Received: by 2002:a17:903:234c:b0:1a1:a0b7:7244 with SMTP id
 c12-20020a170903234c00b001a1a0b77244mr36316405plh.63.1680314101236; 
 Fri, 31 Mar 2023 18:55:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f7ce00b001a217a7a11csm2189091plw.131.2023.03.31.18.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:55:00 -0700 (PDT)
Message-ID: <c3a6fe9f-e771-5baa-4953-358e9330cc4e@linaro.org>
Date: Fri, 31 Mar 2023 18:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 8/8] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-9-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-9-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 01:55:05 -0000

On 3/31/23 08:06, Weiwei Li wrote:
> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
> mask for instruction is enabled.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>   target/riscv/csr.c        |  2 --
>   3 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

