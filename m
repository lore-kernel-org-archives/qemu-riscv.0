Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbURT-0004uq-EU
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 17:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbURS-0004uM-20
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:08:38 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbURQ-0006pp-KY
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:08:37 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r2so9652812pgl.10
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xMsdR9HSOMgsilWpyBEY9jcUF4Zbxt1y7Stdqclr4E8=;
 b=wSJWdqqMqptHztSqHniTFWNrixPyIzfO4ZCnq6lA/4rLcsXesHtCxbkTi8cXgJ/TUo
 vz3j8qXMv1rRNW7hM2boXY3l/W3f5z+aK0HM4NGY8yILj/lMOUvIEonyiRG9p60rgSqb
 icsNKNH3MMyYr1m699XediuQZPrbswkg0pPG6H22aNRRbVJxcarmo4hGQsbqG5QeXv+z
 aR5MjmNdymX7ZX1ye8fljvOMOVh7iMXKPCLQ8hCVuJCHdu1R30ytdkztTLKQ6B7vi9i/
 GIAkleLAcpuLl/w9+/fUi3cFvCRTpON3qDqba9PYVL6D5wU9RaqErHPLZLjDLqJnEobE
 /udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xMsdR9HSOMgsilWpyBEY9jcUF4Zbxt1y7Stdqclr4E8=;
 b=Q8RmVctwLDPPOapf1Bx2tGmaJ6Y+E0MFyTDWuARrvOZ4SENag7rNCb+T5Opft5nbIE
 wY4l9ORZtuMKIEBSfyaHxEjm6J4Sm0Kz7hHG1rn9cCQDqp6IhmpAVTarBf8q99j3UDD0
 4yHh12ZAXMKLkAadVD9k6CTrO0yXWsNHZGho6IHGAWVE2eamqhtKEuo6uouWwqSuNzp8
 VI8rO7donT7PgkNE3WW9Afez03Vve5DaY45soo9l3IE1hUtZcjcQsFihPxpbeBO7sRS/
 ouvgND6+AK9wftvj6LOzX9Iarf4+Fj7dxamzw7eBFGJgxY9msdflnMMkP5MR3Btp+ert
 b/6A==
X-Gm-Message-State: AOAM533871Ol0YnzNol6YPUz20Me7w+kQsuQlyzxpoTavz97hF8Itfi+
 BSBWnra7TUL4/i1Xi6aqMIxauw==
X-Google-Smtp-Source: ABdhPJzHeqPAReWaytPiLQh4OAwQLb2X5VOiQi+6Fjl5D6nQGKyUEJOyHIQOZTpOzNSWpATOSpPTnQ==
X-Received: by 2002:a63:4f56:: with SMTP id p22mr10920214pgl.134.1634332114684; 
 Fri, 15 Oct 2021 14:08:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n207sm5904714pfd.143.2021.10.15.14.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:08:34 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] target/riscv: zfh: half-precision convert and move
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2121307-7394-16a8-d5f2-4ffba5968626@linaro.org>
Date: Fri, 15 Oct 2021 14:08:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 21:08:38 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng<kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/fpu_helper.c                 |  67 +++++
>   target/riscv/helper.h                     |  12 +
>   target/riscv/insn32.decode                |  19 ++
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 288 ++++++++++++++++++++++
>   target/riscv/translate.c                  |  10 +
>   5 files changed, 396 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

