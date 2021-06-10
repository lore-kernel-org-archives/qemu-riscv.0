Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrQb5-0003yW-KF
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 15:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQb3-0003wA-HD
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 15:44:09 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQb1-0003Jx-GA
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 15:44:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o9so602458pgd.2
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDeJJqAicTET79cVnU7e1vV33kaFd105MsQQ7wAmM20=;
 b=XBxoAxyegyPpOn7oNb5gZLtMU61BxrdhryS/0BuEQTZ8krItc0LipmSw80XmLmn79B
 Wz2+ZCEz1r8jpqtgCuM6l9WxtjLXQvVOjeyFa7lY53LLKDNPn0JYpBrfU2sCv0oGU6EY
 vkuQygBluai8v5NEVlGDXcZUxbIprrRS2rgJPlZn6XKNfd814gxZnTJpp/SzPV9oWEb3
 wg9Yw5uQAZ6yp56KWlgqL0xGm4hnRvgW+JUKkhzjOwwyTMjBlamH+I2vnYTzzg9yVM2u
 /lrh5MlDJxolxaWzDk7pZXP8VwUR1TA3j5huy9kd0NaoSaQNHH9Fs2BdZWPnu5DBMjDX
 OETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDeJJqAicTET79cVnU7e1vV33kaFd105MsQQ7wAmM20=;
 b=DDiDsjOlwQjeVyE3SC9uTZu/fBI7kshYaS1XRGH3asTRuBKOw3ydVTeSLaIVX3i9VA
 BtpY3Ba3pbhARLBVnz4R+qxaTQcakhXvX7GGRdh/oH7kPgoMl502y6LN0GifK8aMmpBd
 By6ffYEXXWfR3X9EQ+9+ECyzXy8jBxconpd5+qDTHLQ/qfDliSvB5owV/jkAdKbkHrnn
 88G1c9t7V6+aZmnNqPnKIQ3cT6tD3Hb1ZSTnRHQYnIjNOwqkjWejWoF1iNlOb+fM3Y4Z
 ZbE0qHucYQbbayxI+MsUUHk4RCQQctt7EKQo86A/LivOjLD8gX4KAaxtHSe6TGKSsLol
 66+g==
X-Gm-Message-State: AOAM532gXXQXWySyYRiIiJXncSlZDOnNyZAsD08csWloXKuTr+kzJjo2
 jQcfSr4ft+xZmqyDS96a+dF56Q==
X-Google-Smtp-Source: ABdhPJwCFo8lVTPHTSrYrEGyoKYcNQ9rSqcZGILjDp9dfoACYkSkCt4NSOzMS1dV2iAX98vALjNVEQ==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr4527457pfe.37.1623354245923; 
 Thu, 10 Jun 2021 12:44:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 23sm3208807pjw.28.2021.06.10.12.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 12:44:05 -0700 (PDT)
Subject: Re: [PATCH v2 05/37] target/riscv: SIMD 16-bit Shift Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93574407-7802-5ac3-1407-c4d4e2883838@linaro.org>
Date: Thu, 10 Jun 2021 12:44:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610075908.3305506-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 19:44:09 -0000

On 6/10/21 12:58 AM, LIU Zhiwei wrote:
>   include/tcg/tcg-op-gvec.h               |   9 ++
>   tcg/tcg-op-gvec.c                       |  28 +++++++

Again, should be split out, with a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

