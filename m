Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf4zx-0000hk-23
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 14:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf4zw-0000g1-6F
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 14:47:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf4zu-0006ui-9n
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 14:47:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so756194pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jrhKvmnhHW2Qn3MRqI5S03s5/79OInQui5KWYxRx4Ro=;
 b=Haa6zC+dCAmtrMJNgXCfkXCtfs8UmFkSU5X/1NSkoAXlOFgxwzTukff53U9q3aQRHy
 Irv1rrWICRsXVodpyTHSzgzMV+CYK63DIbpxyr3kZ2XBb71yaL17Bw02QfgsyLljJ/5A
 dqxIW208I5TkwNO/wJMHeDzmKvnyMnqPRVTaFlxyJCbJWv2zXYDrDb1pPPIWK8tifyuf
 NyKl9yE6HbufS485nkHK8UCyGXmdguQp1GPTkQTEouLdoQC7Z8hu/xAwX0J/I8LyZEyC
 cQmI3fP3XuWtEfRP/pZoRmK16fHtXjBSNmVoXGATa+Ks3GAc8H/jSCvxnL+zXplSQTzK
 xxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jrhKvmnhHW2Qn3MRqI5S03s5/79OInQui5KWYxRx4Ro=;
 b=hn6Dz23ouHKeQ9tufzzlpSxkWxAgs6523fsCH1ttDT3TnhqnZSsCXWanD1AQhproqH
 T5aqbpVL/8pvuSLVF1voNK08dGOzY6JRBPybuOBz0SwUB1Yf9uQ0wj2rlPxMyNRbkLLX
 jvu41Erah+LF/HuVCXvs3ekO34jbRmGytD8G187sU9lEiagX2xVJi+caU06vePFQrLQG
 cb2yhbGoF5OO4yIPF/+tvEip1Kk0dvjxvDb8vdYEec3Vl4+1+k9lV0f9+8r3rkOPvv4f
 x+2ccQuQqON5Li+gaXpRA7JoKiKx0SXwLOiPA2XLGFKGSzfpmwsu+b86g+/40MqnSFAW
 1+/g==
X-Gm-Message-State: AOAM531MGhtJkmM9/A8GpwX2tugzCCWWQ987HNSifh+xruQUdbTEF05h
 788cgTcyDmvaw43Ud5QS0GTme4V4jWZfzA==
X-Google-Smtp-Source: ABdhPJydx1fv0cyzqnRZ3DSsdiIQBNijR0f97vatS8S2P4FUQLvmqRfF528NE6EU8ZIi1S+JA/9Mpw==
X-Received: by 2002:a17:90a:be17:: with SMTP id
 a23mr20583530pjs.82.1635187617407; 
 Mon, 25 Oct 2021 11:46:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u193sm16314734pgc.34.2021.10.25.11.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:46:57 -0700 (PDT)
Subject: Re: [PATCH v17 3/8] target/riscv: Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
 <20211025173609.2724490-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9143ada5-eaf5-c790-ba60-7572809bf732@linaro.org>
Date: Mon, 25 Oct 2021 11:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025173609.2724490-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
X-List-Received-Date: Mon, 25 Oct 2021 18:47:04 -0000

On 10/25/21 10:36 AM, Alexey Baturo wrote:
> +    /* User Pointer Masking */
> +    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
> +    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> +    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
> +    /* Machine Pointer Masking */
> +    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
> +    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
> +    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
> +    /* Supervisor Pointer Masking */
> +    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
> +    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
> +    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },

Surely the S-mode and U-mode csrs surely also depend on RVS and RVU respectively?


r~

