Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl083-0007cu-Tp
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl081-0007Ve-IE
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:24:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl07z-0005z1-Vo
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:24:41 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-632384298b3so306840b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j593s7gWeDImwOKXx47FgZ1t191b0kOaCv2VqBgzHfo=;
 b=k9GBKSXKT7Oqeif0J8TnFCdbLsTbdAuEXsJeo2UKt8wqoCQsbohQ3oeu58wWpV+0QL
 xKejlZX7sf/XwYJsgqKpxef526V/15kbytRHQUN5aSJq6KzYoYXtLLoQdnpebEy9/jIn
 z7fCnRRQb/YB3nzQmvyJXgWlb6wYckgMrxMC/nE8UR/Hp6Npf3OBwYzb9ZC5OxpaM9fn
 nCNZjdfVJ/6GuRjYWWVTVRxPT2y+7yaQ/rp6VyRBAAWus/YU1wdyoNJfVa9HnJaYAZQN
 IEsNySZHbQNQW4aQ7ikdoQ/oC7+DeG/7+tiaUVNThvxWFD31rbFDxWX08mCzukadis0N
 OgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j593s7gWeDImwOKXx47FgZ1t191b0kOaCv2VqBgzHfo=;
 b=sQ2PLLnu5ZCUwEpo/TvBHtkb30cD6NvpXLY7/jyxH8IPj4q+Qjvkr9Ay1oO2lQnnkf
 gJlRwXRzfiYw7G/L6Z+SFmUcZZFgLiMpZozEWwFA6rXeWwaz2f0VT776GBmcxEsa+pNP
 KgZyztS9xh3GyxFaQzx+E31AVBVk9ahWwqGkB8SZhvfRyvPVvS2CJLVlY/2a0i5yl1KC
 NTlofY8qHBnCBjQkNsiSWRb1P1z5jA+DjYxJBvORVkd2v91x1hK9CQa/9NzJ2rwlsNpu
 Nw+PhCOZbQQOme+wDi3b33ePM2FUqu3mv0Dok6kUUg8mcsuhs3CzuZR7aoEoz5dbeeU5
 YoVQ==
X-Gm-Message-State: AAQBX9dcA78ZGR1gVMJ1jLIPSoJmCGes2IZVAPQCAjs2wydBaSfmt6pm
 D2SnLNrErzpA8v1dG5m9SjiMqA==
X-Google-Smtp-Source: AKy350axqy+F7egmMNHrrI2nRruaffbZMGETFJrrdDbyzMdtw0m3ya0bC/uNqNM1CW+ziJnuj92u7A==
X-Received: by 2002:a05:6a00:140f:b0:627:e677:bc70 with SMTP id
 l15-20020a056a00140f00b00627e677bc70mr4360795pfu.14.1680927878651; 
 Fri, 07 Apr 2023 21:24:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 x5-20020aa79185000000b0062ddcad2cbesm3904629pfa.145.2023.04.07.21.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:24:38 -0700 (PDT)
Message-ID: <85d3df01-97cb-d508-587b-4bfcad945bd1@linaro.org>
Date: Fri, 7 Apr 2023 21:24:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/10] hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 04:24:41 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> "sysemu/kvm.h" is indirectly pulled in. Explicit its
> inclusion to avoid when refactoring include/:
> 
>    hw/arm/sbsa-ref.c:693:9: error: implicit declaration of function 'kvm_enabled' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>      if (kvm_enabled()) {
>          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

