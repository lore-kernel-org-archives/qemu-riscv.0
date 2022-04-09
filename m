Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ndDBm-0004Bv-QM
	for mharc-qemu-riscv@gnu.org; Sat, 09 Apr 2022 11:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDBl-0004Be-5a
 for qemu-riscv@nongnu.org; Sat, 09 Apr 2022 11:39:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDBj-0003Mq-6S
 for qemu-riscv@nongnu.org; Sat, 09 Apr 2022 11:39:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id a42so4378566pfx.7
 for <qemu-riscv@nongnu.org>; Sat, 09 Apr 2022 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XKuOgXtH+HZ5PmRGbBuiped8Xv5BMxxNWPpupFiNAkM=;
 b=HfYTDH8MZ3Wf7VPZim9bKWjZnZw1dEhNVVR6lq48iW7U/ewZdj7I+aNc4l5FgbTbXE
 EyIXWeqcee4EgP15hbJUB1GCJxDftFBBmnU/KFWLPLo7J9KLy7CqK2hfeGxHihFgTfjo
 YdpyAFSv8Jrlh+p/47HHyzJ9fc4kR8LuOzN0ZPIlxVfLPn/LGGl/7f0/B9W9j+O4akL9
 ZFg8dYOzR9Wm2uc0lCske/sssQll/lnZSlvAzto7XU7QmxlIVNliS7W9HzEXSKhCV7ph
 MDymk9rFB3b6TXVUbUEob2s4dePMkj8BJc0sX0BZrcxW2H8YpNHMWfVWu82nAU77q/6S
 8+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XKuOgXtH+HZ5PmRGbBuiped8Xv5BMxxNWPpupFiNAkM=;
 b=Rdc7xW5jBJUZUY/f8lkyNrIsFZDf+m5OKYuGwiNYJZvK75UUoBTU/5NPUOfCbpGaj8
 zhD4so3z1+IegUNrETTbLDFahm+7ZbdUzBOkHONuRUoLni/7Gg1r0Yilb3tCWEYRAqQY
 ekuAmAIB1Sc0RbcddbnoD3zlDZmjaRFiPX/VtF0cgHMcvCPaBvY+Vf94vugNXoQXXP2s
 5jyBDFySu6TXPVBhLVFzhsF4jqyw8lF+dpAZy9dEYtt/yMqKvYbqMnjR/fZpo5px1w70
 l9O0gd+8hrAM8M7T7PEDTio/99PwnWbtS9dnthrORKThBxZpqCHCIicNSzwQEsDbXZEV
 j98Q==
X-Gm-Message-State: AOAM533tbZ7oCyf2P9njGa9x7YW5mnvck7PT55GgIdfI6lOVe4z8S5Nz
 WYNbtITR0xeiSaSTYrWDH78IfA==
X-Google-Smtp-Source: ABdhPJw2nNaefGtf9ULC6y4MC99Uo5vev4YK9pMwE630heyMrt5YsVC7L6esOIQbgBqi9coV/8VC4w==
X-Received: by 2002:a63:e201:0:b0:382:6afe:f0ec with SMTP id
 q1-20020a63e201000000b003826afef0ecmr19803487pgh.339.1649518785040; 
 Sat, 09 Apr 2022 08:39:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a638c0f000000b003827bfe1f5csm24719473pgd.7.2022.04.09.08.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:39:44 -0700 (PDT)
Message-ID: <16256d45-740c-c858-b5ce-3eb1e4b10565@linaro.org>
Date: Sat, 9 Apr 2022 08:39:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/riscv: replace TARGET_LONG_BITS in gdbstub
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 09 Apr 2022 15:39:49 -0000

On 4/9/22 02:46, Frédéric Pétrot wrote:
> Now that we have misa xlen, use that in riscv gdbstub.c instead of the
> TARGET_LONG_BITS define, and use riscv_cpu_mxl_bits to provide the number of
> bits in a consistent way.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   target/riscv/gdbstub.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9ed049c29e..1602f76d2b 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -305,7 +305,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>       CPURISCVState *env = &cpu->env;
>       GString *s = g_string_new(NULL);
>       riscv_csr_predicate_fn predicate;
> -    int bitsize = 16 << env->misa_mxl_max;
> +    int bitsize = riscv_cpu_mxl_bits(env);

This isn't correct, changing from using max to current mxl.

You might think this is ok, because this will run up in startup, but it really runs 
whenever gdb attaches to the stub.  Which could be anytime.


r~

