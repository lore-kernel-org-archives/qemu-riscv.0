Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfkr1-0002cp-Rt
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkr0-0002cV-LF
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:05:26 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkqx-0008S2-VS
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:05:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w4so2378881plg.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AUcB2uIJGflArJH0ZjnGpW49Lq8MbXvQKF59hToSvbg=;
 b=PrSQvNIeWNfoIrNZGzdfxCOpGTpOjYPpfFxD9F03QMHhmeP9ncwC5L9uUvAOFV+ZaD
 dJzyx+Cu2NwTIJmw3Pp7HFJA/g1DDzOE/pgRmSEj5jZh3wrd/je2/1XnNBui3ybL+bWs
 yuQevLOR09t6MxXy6gSYYtXXfOhY9Nx1bwjC9MktUE5ZBhn1kONfkYDER4ViJ7kdAFsK
 jcgGqTI003xJ4//c3i/TKETxUt5mBbnY9SYcXSQQO3p9QDj0qnUeTCDbWCF3Pgd103AR
 mlij97araWAALu1LZlxOy/hTiNmuKopE5JkRQXdeWoYsJ3wOlNaHfXknatk4vyiwhSlH
 9+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AUcB2uIJGflArJH0ZjnGpW49Lq8MbXvQKF59hToSvbg=;
 b=Ejo4HGc5KVO1+ZTETidItjMXPDs1ZiNi7ZLSwqtK9/7anmas+M35VPnTlm7dCsa88k
 PRBXrM6K8jD5KJFoaizi/10i3B8Q6h4vz1Bk6hQ23xr7ib0vEGHfWf35t84SxTuG/jlf
 iAyXKDeHgMavG0AxzE7+pNv7zDU6qBL+qdOdbOepEWM5C4A0LUX4IZoCAq75AEjr3Sv1
 h6kWaQRc1QEzKMp//J+AlsEMhWBOtTgY8o3VSov2B2lHd5GLbrrWI2RRkVtxPw5wW3SG
 R38g7A9wjAGCNuWIS76TIN8uYxc2USl7/r6XEpJ93yk32N3wUZ3rEE3D3TNZMYeAf2Tp
 Ez6w==
X-Gm-Message-State: AAQBX9cPRJEEku17HhE//OJUzTgiJhGhuWQbuxgRNS6NlvUCjrQBhbQs
 KU9rjtr6+wiku9UWDenVcm9Xrw==
X-Google-Smtp-Source: AKy350ZdopybBoEUK/ev3oEnXOH8HVZwkDjjo3+tAWu01FtWHs5AcZOPLgSCKFyCYsWjhNw0NAuzEg==
X-Received: by 2002:a17:90b:3b42:b0:23f:81de:6a74 with SMTP id
 ot2-20020a17090b3b4200b0023f81de6a74mr3414323pjb.39.1679677522449; 
 Fri, 24 Mar 2023 10:05:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902900300b001a060007fcbsm14425023plp.213.2023.03.24.10.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:05:22 -0700 (PDT)
Message-ID: <4ae27732-2fc7-8f36-f169-34e8e9bc4e77@linaro.org>
Date: Fri, 24 Mar 2023 10:05:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] target/riscv: Add a tb flags field for vstart
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 17:05:26 -0000

On 3/23/23 22:59, LIU Zhiwei wrote:
> Once we mistook the vstart directly from the env->vstart. As env->vstart is not
> a constant, we should record it in the tb flags if we want to use
> it in translation.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h                      | 21 +++++++++++----------
>   target/riscv/cpu_helper.c               |  1 +
>   target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
>   target/riscv/translate.c                |  4 ++--
>   4 files changed, 21 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

