Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZL6z-00022y-6p
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL6x-00021m-Py
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:23:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL6w-0006Dt-5k
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:23:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id k37so6830210wms.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8eiAeSolVQI18uIFOs6HobNFu/RILK/fSRKCEoKLRCM=;
 b=k42FnOdvQeNfAykJkdKLAMy023o1kbNULKJly99BuhmhkBZ5J3rJIA00aeUqqUZNhp
 NJ2z0N7K/RYJzuB6ZavvZxY9ybTjmA5XNDPFiUJV+okw8bBBECbXia+W7GB935vLUx8G
 C+SHu6ymDDrTV2APNKDmw+7ikz44SMbGbt4NhKHPyzPMYjZ8T0NC/f+vWtFlP8E2N8/7
 pryKr34zJgQJCS0F/6jHzgkmSUUmkpfSndfZursz+P8i8gYCKtKPCqEgsZeagO7IZLG4
 dD3kRFogunx8rK5iWOnSYgpJFKHUN58uYCZCH+KRZYSrfk7Vjr4thn79I8P0P9vyWZJw
 GGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8eiAeSolVQI18uIFOs6HobNFu/RILK/fSRKCEoKLRCM=;
 b=DH05sbA4t3hUE3S0hWcPSJGgAO0elIbZR43IT447o9RUWoiSaOfDMHsXQWHy1FNEh1
 ihaMwyN00PozxtRT8yZv3gzRptbYUUcBgB70uN/26AfUddNF5G++C8jav3oUUJ/Nca6h
 RXKnakibN5KFwkwdbFHOlrh8/zoyqqprgg14vhVlGnZSwAeN5uLWOJs7HciGAy6Tyf+o
 bTOUsrMU82ZpthPOTfB/s/wN20xVmi+wFHnznh+8gqadsm/Cldqfutl2xZCBUetfny/U
 y1rHn9o6dU7YKAW53Tmr3APcokYN3D4KG+yW/ugB3fjvj6QN/tm/pGGIqRGqj4PDXV9C
 xPfA==
X-Gm-Message-State: AO0yUKVfB28a6N1pN0H0oRbx1TWY2JQH8XF39zIml+GcAkpTGwQeLFv0
 D+X2nTr0a64Dtnt7ETRGAKY0GA==
X-Google-Smtp-Source: AK7set9P7Cmd1hHKH+dzz1S8iIWz/H/mTBNWpmtLryH/VsXVvBnVmM4OB36ljLfM3MLiAZBHt2sCuA==
X-Received: by 2002:a05:600c:4593:b0:3eb:29fe:70df with SMTP id
 r19-20020a05600c459300b003eb29fe70dfmr11961673wmo.35.1678148600608; 
 Mon, 06 Mar 2023 16:23:20 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b003e204fdb160sm16292163wmo.3.2023.03.06.16.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:23:20 -0800 (PST)
Message-ID: <f455f031-5d7a-604a-3e6e-6f2b17807509@linaro.org>
Date: Tue, 7 Mar 2023 01:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 52/70] target/sh4: Avoid tcg_const_i32 for TAS.B
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:23:24 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Since we're assigning to cpu_sr_t in the end,
> use that as the intermediate temp as well.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/translate.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



