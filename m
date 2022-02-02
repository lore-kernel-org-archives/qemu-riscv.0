Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nF3f8-0005Wu-Vo
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 19:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3f3-0005Tt-Lz
 for qemu-riscv@nongnu.org; Tue, 01 Feb 2022 19:38:13 -0500
Received: from [2607:f8b0:4864:20::1036] (port=41538
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3f1-0000cu-I0
 for qemu-riscv@nongnu.org; Tue, 01 Feb 2022 19:38:12 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so4375104pjp.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Feb 2022 16:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SXQe6Y6TC822QBKkRdNsGkB7KOJ+vGJ1ZAXPy6kuWDo=;
 b=W77qRgzPICz5l0Mg31UIZwe64gZcjOZ3Y6ktoIPO1sAU4ewMHuEFWnCXXeiJIWAjHe
 uKmkakJH0ma5mqcvyclMWQNd2wtHLk6hO7BKkkGAI/YEBFf7qv7Or//pynHuyqTc6XZG
 WCzTwE3Pgt9ysqvw7oZa8Gu5cf0n/5JRb41M/YECvettsnYWX9PPN0R64M+1Ns5dskss
 IgQPIornIF5jIb75L+ye6TbgWhBY8hfSTTKg7vRNjlRUpgG6nFFs93XWWA3E/KNbgfAu
 CyI2ajSYTd7F5sU7m3DVowgJAX3/lzk2+HBSpIJlUA7rrkWmEfNQIiR2QJkHb5gEWzXx
 xM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SXQe6Y6TC822QBKkRdNsGkB7KOJ+vGJ1ZAXPy6kuWDo=;
 b=ZWrN3Bdc0duPUdsmrWPxalwkhjmcmwI+hzBDEmHPjFH+X+fIMMXwfNUdefJIP6kbPD
 ya1jG+fgt7Z0UZiVlTDE78QyLClKmuD+H7pngRCOrKHeQgyiDq6AhbtpaJ+yM6RoQ6ch
 oENgVr/94s5L3bxL4LTz8HEFHTLnBKHvT4m4Cnes1rI4ohI7Qb4CEui2kBwy3lGXVaxE
 cd3Ah4bEJBEBzomuSjrNQ52Ky47nxaQP/96etlx/hFiwqQrRciu5wNBGZcHLTmQ3tm75
 HxPReV1L3hePHy8mO0WvvGchPQFsLi+vCHQQcZ3RF/ke/76a731YDryugVBGIS6rhnwu
 +QFg==
X-Gm-Message-State: AOAM531pzVwG3/wl4LlChQjGjOE4/uVrEtf+UyxpiLXas3aa1KF2DqEK
 s93CsN323DpAU6LKFviIqo1BmQ==
X-Google-Smtp-Source: ABdhPJwTkyO503Qf0bEPpSwdL4Ha614/lJ78R/V+gBvnAUH2UShAci84kzLBi+6EAHuUVOVpM3l7Sg==
X-Received: by 2002:a17:90b:4d84:: with SMTP id
 oj4mr5274554pjb.192.1643762290065; 
 Tue, 01 Feb 2022 16:38:10 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c?
 ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id me4sm3951663pjb.26.2022.02.01.16.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 16:38:09 -0800 (PST)
Message-ID: <aceb893a-bcad-66da-a6cb-091b9b2f14c2@linaro.org>
Date: Wed, 2 Feb 2022 11:38:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/riscv: Fix vill field write in vtype
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
References: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Feb 2022 00:38:15 -0000

On 2/1/22 17:46, LIU Zhiwei wrote:
> The guest should be able to set the vill bit as part of vsetvl.
> 
> Currently we may set env->vill to 1 in the vsetvl helper, but there
> is nowhere that we set it to 0, so once it transitions to 1 it's stuck
> there until the system is reset.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/vector_helper.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

