Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhqty-0006wZ-Uz
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqtv-0006sh-Q8
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 06:20:19 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqtt-00089U-Go
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 06:20:19 -0400
Received: by mail-qv1-xf32.google.com with SMTP id gh1so12945926qvb.8
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iw7Ij+qnOccjoW85Ygx9iJ+DvRUGe9n4glwupUo77uI=;
 b=JuZ5g8jNezCvZqUnuUIflGKhbhVqk/TwmG/yCsG+gia1h4k0LPnzJCVEIixWhAqy2v
 ajulEx0jQ8o7nlUyRi1I3t7M+t0EZZzpU6OX2yWvJJnMyNoAucFcW1diB6nIZGp5Kh6k
 ysmsKNZ6/laFezWBEuxYjfnstm+LQdD5oCdYndP5irNFRcIeXN+DtKzwcFvGjROOu94a
 Nl6bWSRwdo9qcKrPzbSCB33163Ya6se5g8y6AZJKCgA4jVT/F6HpUp2ppxaukqHwZKs4
 a8MkVaj2UGie/QESNeTy3qlN2Y5p3Z4QtZotNRmferyq9Q8P1xYQMDqY6I15iBalREI2
 w9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iw7Ij+qnOccjoW85Ygx9iJ+DvRUGe9n4glwupUo77uI=;
 b=39yJ7ATDkqQzaoRY53xelKg6MdzeEYW8pYOMWrPGzqLiRWOkcnJPF1DOSa1q3JXtbs
 4/LOatO44i9yBCEgHivedhpL6x3wbZxI+eAviavUeSbUikbW6KWZNp/Lr7hauf7WiAy8
 N/v6gVDU7RaFunPPmJZpmHRHXbfafgq9rp5cuEdiM7LTeUR10iPTVJaLTVHYjQ7Uo4bP
 cQxlCfhDS/pLNC5Zr2xYe/BbImiIVf8/FG0ObxV9oTguDzyuQFfDGkOkbg7zsv1lAEIm
 BbEmRroFbMOGJvIzYsG0bySbZGmXMHLs9JhwKdjI7zxKVbmG0ybPfcyM0YaMj/jZXgRA
 eUIA==
X-Gm-Message-State: AOAM530sdC+36ExzhMXq4AR61Ix/eAHJqxg5cE7Lp82A2abFt+ny/ZRA
 +qwmdlAn+bvltm/Ge9x0aESU6w==
X-Google-Smtp-Source: ABdhPJyIgVlOYFncshZXOm5rI2kP/tRvylLiOSt06EnrhoMwQLSqpSsR7p2LZHaIIcPlvxMZLdOCAg==
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr31803226qvb.56.1635848416429; 
 Tue, 02 Nov 2021 03:20:16 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bs34sm12031156qkb.97.2021.11.02.03.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:20:16 -0700 (PDT)
Subject: Re: [PATCH 03/13] target/riscv: Ignore the pc bits above XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ff63ab8-0576-c1e3-aa33-de52b48cac3f@linaro.org>
Date: Tue, 2 Nov 2021 06:20:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Tue, 02 Nov 2021 10:20:20 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> The read from PC for translation is in cpu_get_tb_cpu_state, before translation.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7d0aee6769..eb425d74d2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -71,7 +71,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   {
>       uint32_t flags = 0;
>   
> -    *pc = env->pc;
> +    *pc = cpu_get_xl(env) == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
>       *cs_base = 0;

Oh, let's not compute cpu_get_xl twice -- currently we do it at the end of the function 
when we store into flags.  Move that as necessary.


r~

