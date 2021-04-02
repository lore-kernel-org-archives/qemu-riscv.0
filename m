Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSNRv-0003op-GL
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNRq-0003oQ-Rt
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:19:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNRn-0005zK-0Z
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:19:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso2841840pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 02 Apr 2021 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a7X/JuysazCUdbLBNeqbvw1zbQswYaIoxcHcFQ6jC3Y=;
 b=Epc+SSr4daiw265r1Aj+SQGdcgWXdDqvBxE7FtcfMlEqbPS1wxCeb3DNLYnMggBJyT
 lsiJxGHuZl6h+QnLN80pohkCHU6pNqUyxWnA0dupe5Dh8h17MDCuowB7VGygoP54w1A3
 gP8wiDmO+M7rgq4X0OPtHKRQFBViokWl857tSNPsmLKCTHlJcgl9BMwSx28mooj68dI2
 V1U5jc/5FugsgMFpsDL8wOaWvN+uKnru5m0vu1qkikdsnotgurexC24Qa1ge0IFnd5RK
 HG5oz5Hnrh+iA9LjxkKoDsbsyLsd3mSWKg2coP8u2LMOj8pAw3xLBpjFvZulTQ47Ky6I
 43hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a7X/JuysazCUdbLBNeqbvw1zbQswYaIoxcHcFQ6jC3Y=;
 b=aqAHDkbs4eej5PPMAXsIZ3G69aOD1HSh9eSVPebjLCe2aVRKq2LCSBx6q9gEtc3prR
 t590mPNgln6hWVcYoS7pxX2R6IGrdNDPmsU8sv8PZdodc94gvBfCUdYzCBmE5rNUMy6j
 1bUNF7Q0kD3kHHEZz305H8Z+mUVLbZWuUHn6IDdVKZHtlGX4wAoO7ZjilER3cTZoeHiH
 wZ9WndDbZn70R160nyXRRTGWN0B/K58/aldhtSNlK4Cve9auFAF6M0Kla9bKP+qsmqu3
 qCsCGv2xrGectRsxLhrDioockWgqof3L9xa4FG4zPuNBb/VD0U7tuf4VlsCP+f78KSUq
 03wA==
X-Gm-Message-State: AOAM530ZcXlN7OUHGiV4LCYgXgB4hmxyRDUv02YkVo0H8vzaB0oo9pp1
 HYwMAU2v84MZIvPhL0osSRA5L8/Nea5IeQ==
X-Google-Smtp-Source: ABdhPJxF2wt8dyQ+lWER6xeSrO1ly1b52gKymh6vkTaGYB/Ko8yB38Gg1TDhJadxSzajHHxu8cGgUw==
X-Received: by 2002:a17:90a:4005:: with SMTP id
 u5mr14783532pjc.6.1617383941433; 
 Fri, 02 Apr 2021 10:19:01 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id v23sm8501724pfn.71.2021.04.02.10.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:19:00 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] target/riscv: Use RISCVException enum for CSR
 access
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3beab695-3414-1c61-91d1-f52a2e53f4c5@linaro.org>
Date: Fri, 2 Apr 2021 10:18:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 02 Apr 2021 17:19:07 -0000

On 4/1/21 8:18 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h       | 11 +++++++----
>   target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
>   target/riscv/gdbstub.c   |  8 ++++----
>   target/riscv/op_helper.c | 18 +++++++++---------
>   4 files changed, 38 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

