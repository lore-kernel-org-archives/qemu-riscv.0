Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8HH-00067t-Qp
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:29:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8HG-0005zN-64
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:29:58 -0500
Received: from [2a00:1450:4864:20::333] (port=38587
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8HC-0005Wk-Tf
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:29:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso4089709wms.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jPv6jlmDvYMb9bfF6cYr+8EVko9XD/FWjVmDQUz3Kd4=;
 b=xrrQlAP/8OXqokVc2Z4Dm7mAa62qxshhPRt5Yp+DzolChA8FazM4fpebw/323Y7vBE
 hn4zq5cXZjSBinff7nqUSxs1ThidG3b7ZB+7t/cyt8+pQY+mSVV67iFTK7m3CTW32p9u
 v84+k49ace1J1bWGCDS64RArM2aAMUk/XNquXYrfosflxcCygF00gr9rqq5ENbuXFmUJ
 lU4aiTBSWy+rVvLgyzzdE91M6UA6Sclx1e0oXnwUlc34nfxFnE3XKmZz+MI9cubtt0yb
 EdchmRqcgenyFk+qkq0daVpjIprzHJy9Fzb9JSB3Z6FmZn14gQfxgXl9W846qMFmPJUO
 J1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jPv6jlmDvYMb9bfF6cYr+8EVko9XD/FWjVmDQUz3Kd4=;
 b=ICyFrxAI1LoMlz6a57+Qx+vNI49J/HVeCrlKYmp4bY84ka2CltUi166iK1xr9o2HOB
 8JnrSdXQT8DvogdC4DwIWaBVNuehJL15+tbDkXoR/zAIybLvkTsvQjOUqxtYQDbVJVgo
 Hd/jnBfNrMm0Nfs5YxMI2AQaFGxAbU481f24Ak/lSm2uvN3Me4V5CYZM7DBU1cFeSbaM
 mipglGboByr/WelJLfGzWfnZ0vleyquH1q3ullMXLbGlCJGfJthVjdT50tcQ+4Y3Sj6R
 596qm5aTTQmzROLXBOPVN3QAWCBlKrHcw4N+9iRF8kPCnbWUjr+T0Ac2QQV8D6+0CmiA
 yrGA==
X-Gm-Message-State: AOAM5323KJSk3Rx6iWq9j/SG6Wvg/V3L7Jb+ZrDYVmAc7PPJ3d7c1BFc
 Mh3RjRZvkAMB5wnynZ96Iipfxg==
X-Google-Smtp-Source: ABdhPJw26PwYxBBVlOB/Vs33MsTSmhi9i06xyzIUm4XyuieDWHYQtkLOlBwIQLy6/3p9QdbN+wmq8w==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr7619303wmj.30.1636630193416; 
 Thu, 11 Nov 2021 03:29:53 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id n32sm2400065wms.42.2021.11.11.03.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:29:52 -0800 (PST)
Subject: Re: [PATCH v3 11/20] target/riscv: Split pm_enabled into mask and base
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-12-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8729a439-a9a8-54d7-2b1c-b78921d2a812@linaro.org>
Date: Thu, 11 Nov 2021 12:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-12-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 11:29:58 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Use cached cur_pmmask and cur_pmbase to infer the
> current PM mode.
> 
> This may decrease the TCG IR by one when pm_enabled
> is true and pm_base_enabled is false.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h        |  3 ++-
>   target/riscv/cpu_helper.c | 25 +++++++------------------
>   target/riscv/translate.c  | 12 ++++++++----
>   3 files changed, 17 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

