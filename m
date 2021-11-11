Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8ak-0005Vw-0Q
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:50:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ai-0005VP-IJ
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:50:04 -0500
Received: from [2a00:1450:4864:20::42e] (port=38733
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ag-0008Pn-Vf
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:50:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u18so9340295wrg.5
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=deNzq7wXYcMv9629IR4CK51YQcoU79po0UXUEkKWHJk=;
 b=u91cJ3Fem0gG7ApzHmOFgT73Ab5IjyQXvp+QlKr5cS8NC1t55gkcOL1+n6VT0IshMW
 H276EXB9vjQO0gGss4I2g1+kfEouiWRgwXPBZwpnlGiReI3YAJQgREWsjbnJYXRMfyvo
 OjVXjp2Wi8Nv5V9vqA6ncB66lXmSbbebDGEScIE87Elyl7mNGxK3oyIa1Uy8ipnXI/mm
 xWQMdQry6yqPY1Tth/1IAEYfuhKK52ZsDyCroHGhgPTYh7yzAHc3xmG0IO5Ks+d0V15W
 IxLLVtx1dvWRJnEC5ABMeErUsyhTG8F08AjZFJxwVWHolJLFkqLRm3LuUzJSR2BrUwfy
 8uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=deNzq7wXYcMv9629IR4CK51YQcoU79po0UXUEkKWHJk=;
 b=CjrujdeT3/w+FAGvIP2bChu5+hXFfZ9NY7IDB5hwNE8OcnsRGdL9seqQuslzNYAZgF
 SUqYSjH3/TIv++AK2JxECmZ95t6Z5fIwQVzBfVU1YO2nwXoPil5mwz/Qd4v+AJb9JR3a
 RrIJnYngESIz9dUJiS/Mxn3xLHHLNf5qtPipo/I/j4Rjs5ZoWxTxnEtn6OVOxEeehHVf
 8EYyjM7FKGBu0S81eKDnvguh0xA/Tzpii/xVTMnYqp6vqOB4jFsukC3LDKYjYhWKfm1R
 GnAAAguaGzfkSS1m6sca2Koux+iaCTXzYVd9w38FtXid0FjO03JURBxYlM9XCMeP0Q3I
 ULJQ==
X-Gm-Message-State: AOAM532Adq/C0Zr/xrWQnRHGf7+JgBX0Kq7KxA6RyhjX83XaG6Gw0lyt
 mGmrD1creFmoNTqyrDQBZ60X7q6wSwyLF+ySi6E=
X-Google-Smtp-Source: ABdhPJzly9fRL3lgJf2r92W8/BXFsyVQxLo7v8n5KuvwKC2dSSbv8phSHk0RjSmusbnxddYV1lFwxw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr8548569wrs.237.1636631401463; 
 Thu, 11 Nov 2021 03:50:01 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id o12sm3687610wrc.85.2021.11.11.03.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:50:01 -0800 (PST)
Subject: Re: [PATCH v3 20/20] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-21-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <663dcab0-3370-7716-2abb-187893de6103@linaro.org>
Date: Thu, 11 Nov 2021 12:49:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-21-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 11:50:04 -0000

On 11/11/21 6:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/csr.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8f8f170768..43eaa6c710 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -553,15 +553,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>            * RV32: MPV and GVA are not in mstatus. The current plan is to
>            * add them to mstatush. For now, we just don't support it.
>            */
> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>       }
>   
>       mstatus = (mstatus & ~mask) | (val & mask);
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        /* SXL and UXL fields are for now read only */
> +        /* SXL fields are for now read only */
>           mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;

Still missing the update for write_sstatus, which I think is simply an update to 
sstatus_v1_10_mask.


r~


