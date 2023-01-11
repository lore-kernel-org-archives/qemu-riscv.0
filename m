Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFlaY-0007ok-6z
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 19:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaX-0007lr-CH
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:37:01 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaV-0001pu-0V
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:37:01 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so4759081pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 16:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSQPKUBOKOMDxdyfRtg2sFo9EwO3mMVRHfPG9/4VvYQ=;
 b=IwvpSM/UNEJn/urUhSR4JF4MuqEOAkcSwW/hbiPDNJoaSQbgUgXtK5CLaf+DbWIvMc
 4bg/oInXAwHuIWE0GE0/0ox3OTHsqzLXIw1RNA9+0JOvSwUIAiV457+BOiAyjW98IDyG
 NLyLqz/rho/gOHXApR56PG0XbiAlRbSJHqC+UuR/BpNnMvPuyDcbhO9dDXUIc8us/qqX
 7CNOkHmyk7hkXlDLJbyAfFkoC4IITSKjGGPWs7J4szv5Vu7fZ1w+h/2veS7qcmHqTI4H
 k2vHsbUVvKJukhJzP82pIQhOk/kJb+hQWSqoZpGcgeAS+E2r5TouJywzsGOB1wFfR8Q1
 rEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eSQPKUBOKOMDxdyfRtg2sFo9EwO3mMVRHfPG9/4VvYQ=;
 b=udY6DKktUeAzX5/Dl/k1nwrUQfPXsbqeLujA9VvfebZtjanPQiN8BZ7cpBEsV9bcMg
 SP1XLpyxLVFBKz/g4JCPVRSVuCqVigAAb9m2Dg5PmchVvmp9VyGXRR6+red7n2Z7ejtb
 d89ErWqHYb4La05wa6kcu3xcP0GEJY2NZDQkBlDIi+Od3bkozSIhl/mYu6gc8qrk/m30
 ZmADW/uvR7OtbqjL3ewatuQkBgcEsUeHMeRDOUapbgF5hKgW5F6GDQX7dI0z96kMszdw
 npY54kSUpnP2uXtq4MCz5cnAJY6pcIiRRlWyZa3GP060W3FpWhj1v2/tZooTNn7q08ZD
 d6ew==
X-Gm-Message-State: AFqh2kpfVEw7fjUFYhl4qIKDf3CuhRaUyaqBORfCAWF4N+ZOk63jdKlu
 mBbJclIlYUcGW60l/SmPcKMDtw==
X-Google-Smtp-Source: AMrXdXtK0qJQp/xXrYvUywr1SNH5yDAiPRksxahBM6Im72zUSDoLZE4xDoL4vTLg7j0kaoZE6pUPxA==
X-Received: by 2002:a17:902:c495:b0:193:ea7:52b8 with SMTP id
 n21-20020a170902c49500b001930ea752b8mr21180927plx.41.1673483817814; 
 Wed, 11 Jan 2023 16:36:57 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jd9-20020a170903260900b00186727e5f5csm10743237plb.248.2023.01.11.16.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:56 -0800 (PST)
Message-ID: <782e40cf-532b-8148-1512-1b56668977e1@linaro.org>
Date: Wed, 11 Jan 2023 09:50:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/4] bulk: Replace TARGET_FMT_plx -> HWADDR_PRIx
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 00:37:01 -0000

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
> 
>      hwaddr is the type of a physical address
>     (its size can be different from 'target_ulong').
> 
> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
> 
>   $ fgrep define include/exec/hwaddr.h
>   #define HWADDR_H
>   #define HWADDR_BITS 64
>   #define HWADDR_MAX UINT64_MAX
>   #define TARGET_FMT_plx "%016" PRIx64
>           ^^^^^^
>   #define HWADDR_PRId PRId64
>   #define HWADDR_PRIi PRIi64
>   #define HWADDR_PRIo PRIo64
>   #define HWADDR_PRIu PRIu64
>   #define HWADDR_PRIx PRIx64
>   #define HWADDR_PRIX PRIX64
> 
> Since hwaddr's size can be*different*  from target_ulong, it is
> very confusing to read one of its format using the 'TARGET_FMT_'
> prefix, normally used for the target_long / target_ulong types:
> 
> $ fgrep TARGET_FMT_ include/exec/cpu-defs.h
>   #define TARGET_FMT_lx "%08x"
>   #define TARGET_FMT_ld "%d"
>   #define TARGET_FMT_lu "%u"
>   #define TARGET_FMT_lx "%016" PRIx64
>   #define TARGET_FMT_ld "%" PRId64
>   #define TARGET_FMT_lu "%" PRIu64
> 
> Apparently this format was missed during commit a8170e5e97
> ("Rename target_phys_addr_t to hwaddr"), so complete it by
> doing a bulk-replacement to '"%016" HWADDR_PRIx' using:
> 
>   $ sed -i -E \
>         -e 's/" ?TARGET_FMT_plx ?"/%016" HWADDR_PRIx "/g' \
>         -e 's/" ?TARGET_FMT_plx/%016" HWADDR_PRIx/g' \
>         -e 's/TARGET_FMT_plx ?"/"%016" HWADDR_PRIx "/g' \
>         $(git grep -l TARGET_FMT_plx)
> 
> and removing the definition from "exec/hwaddr.h".
> 
> Suggested-by: BALATON Zoltan<balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

