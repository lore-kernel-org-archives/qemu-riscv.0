Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbUT1-0007PX-6M
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 17:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUSw-0007OS-BP
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:10:11 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUSn-0000Kn-Rh
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:10:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f11so5499587pfc.12
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gh04OXC6k8fgu42oNUZoxbBaP+3zvp6mXHOX26ijhHI=;
 b=ulCTVBJ0mvOFcRQ0govCFvPJeZL28Ifb/5WQxYuFGj4c8S6zVHgGLR3X3fjGU3qf6E
 jn7zw5ce73wYpj32a4Aq2ySX6pvMWJ/eqVJFiPdBsUUExvxhg+5hvTuu37aIa0b6tjNk
 LTbKRTZ7ACoLnmqc8weFZth/6so8zSo/aVNVtuAC7ODJQCJUOEoRpUL7NTsKzCEk4DF6
 X0HeKM2fj+GqX2lB5CG74zcEGk8QKi2ZTgx4TjjJEFefgj2KytLeilsLMihThwc2SA00
 JjCnpqa7ISx65zRQXkOjHUIcJ9hBM+bSl1Df3J0C7jy6V+SUBYe9MRtUNUzrdDPv+kSx
 BAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gh04OXC6k8fgu42oNUZoxbBaP+3zvp6mXHOX26ijhHI=;
 b=mG7jUyPfTd3qftgMVOdUsmWeDBy9vCx2EoG1ChymodjOQwtb9Vcj7gSe3kz3fdzE/i
 CrbSNrIb7l74BJ0l5Q/SPCVcPPoBpja2HFU9F/mvaLgST5sgCB8VPhbF8tVwdUNrLVWb
 bhsmz3YQ2peL1hARYdDGKexdJs1gtFyU38OohfYxPEKknSNXAAuYWgtKSQBLsk88xGcK
 1wCiSt6NheyXgAo0JnpkCg3xhgevfzz3ci+Jj6O7xw9/tOAxqkw52MaIjI/oJ5byZ5Cr
 NkniQ9ya1PSOGwuWmSt+oDuUalhM1a8CFWD2OBF6MrAgsVqLEKx6pyyHQEi0CGAAyHJb
 kkaA==
X-Gm-Message-State: AOAM533uK0235eHrgx75/yyfpd17Iy2PzU8IattaPgOytR0ApnEm9Tfw
 P0wQkP8+Igb0XoVbcP/2Uw3E0g==
X-Google-Smtp-Source: ABdhPJzuqN7ly1aDfCA6RT3pbRDOpJKiZlkbo6hHIVmlAFn58NJns52qTut03WSb9G6LttwwV4wfzQ==
X-Received: by 2002:a62:60c2:0:b0:446:b494:39cc with SMTP id
 u185-20020a6260c2000000b00446b49439ccmr14025832pfb.22.1634332200270; 
 Fri, 15 Oct 2021 14:10:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm11147631pjk.3.2021.10.15.14.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:09:59 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] target/riscv: zfh: half-precision floating-point
 compare
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e51a405-9eed-58db-8df2-9f71fb63c83d@linaro.org>
Date: Fri, 15 Oct 2021 14:09:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 21:10:11 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 | 21 +++++++++++++
>   target/riscv/helper.h                     |  3 ++
>   target/riscv/insn32.decode                |  3 ++
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 37 +++++++++++++++++++++++
>   4 files changed, 64 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

