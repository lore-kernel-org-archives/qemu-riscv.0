Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSNKk-00086H-Im
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 13:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNKi-00083q-Vi
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:11:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNKg-0001zx-Cr
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:11:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 11so2258106pfn.9
 for <qemu-riscv@nongnu.org>; Fri, 02 Apr 2021 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QdD7HEZR0muMqnZaelCXg/4/u7m18lqMo7GL/1Ukw2I=;
 b=CQ3iMnktLwW3XHgqy4r8NHRHoWLvMyB3L/qx96UtSgcHVKgyh5UDgDs4AA1kKF7Im/
 KLrSrO5hfR/y0EQt3di/oW9wtwasFdSg1rJ91aTcxWjXD/q9Apei93qEMN8TRsNJSNj0
 2sZWICP3BEbABhp/KAhrLepDZOxlYG6tUcHI6DpPwjUgDGZBwrFbz2EVP1LI6A/1WG5I
 7zCIfG4FmyaUOJSmCo/qttHixxQBeHCVAIs60HfGKgsl6NAZkbzVGFhVhx8VPTnILgub
 pfGehJIbefo/Na16NmUg61l/EsWsYDMQQStnUNTx6THCMjfn+CD5094TwBG0fkBRgbtl
 e2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QdD7HEZR0muMqnZaelCXg/4/u7m18lqMo7GL/1Ukw2I=;
 b=XiAhc4EG8P70X8Ekl3t8zuZ08J4bhF5Mmkn8iSHcuYy6GPN2CgRy/BySGDUXFr+NVr
 naGuVUWLcI9gp8cxR4qup58hUSrjm0NpnG+n+q0b5N6xlsBjbt1JyScR7Mx2ZavpkMO6
 dauLVVdKn13qIi99eBfrGyNLAsg1dpBTy/svivO+AztENTPy3PU/2110PZoNhrebn8U5
 rq4QJRmC8gXt784Ms9Ldywos2Q1qlaCjSze71oD93OBMjw9fsIOh1HMW65QQBiCMKVYB
 4oQNYvSZR1/mx9+l6O+xb6VLGen0eXQsb1/aNjHuFnHbQOrLsdZ3tNErut2okUFjSFqV
 1FHA==
X-Gm-Message-State: AOAM532Dq8U0Qwp4LzdxZhjFkIX+pGz0UyNJmlOuvrUK8bkdgHwqBKjt
 fD+5kWgP87yOSKv5CL+GKIO4hQ==
X-Google-Smtp-Source: ABdhPJx8GyYpwdBNpSMHV1Ohq6skPBfKtMS+Mqs3BWdjm5RnV6vD5rnzse1ZabF35ErRPFIvMTRTjA==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr12513182pgh.192.1617383500822; 
 Fri, 02 Apr 2021 10:11:40 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q10sm8576990pfc.190.2021.04.02.10.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:11:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/riscv: Convert the RISC-V exceptions to an
 enum
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94b40cdc-4869-730e-50c2-0d33f93be077@linaro.org>
Date: Fri, 2 Apr 2021 10:11:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 02 Apr 2021 17:11:45 -0000

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> Reviewed-by: Bin Meng<bmeng.cn@gmail.com>
> ---
>   target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
>   target/riscv/cpu.c        |  2 +-
>   target/riscv/cpu_helper.c |  4 ++--
>   3 files changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

