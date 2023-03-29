Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phYmP-0005SI-I2
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 12:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYmN-0005RU-8U
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 12:36:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYmL-00031N-8Q
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 12:36:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id k15so9627824pgt.10
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680107764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AjvNAt/4YDJVjLGS76iQaE5yaByPsmOs0MvxHruMIGI=;
 b=CwJeDq0Ukj0w/1o4Ev8GAUcrFA2Ezp7zZtkNxHvFp2xGKLxOCcicKOc08efIaV9IrD
 fWSZaFVqNEscMME4m8gpcbxUuCVywIizL4PbrU1Y+x0GB4SYh++mjY2hC3A1SC014O0b
 uMkx4A9vw3uvTlj3ExQPOzVktgUMVNmCGqhjWIFvuHI2Taz4VuyWe3brURgacEA/O5zU
 l6eKc4/iWtPWYWXnBxz7WKtDD5b7d8x/mQjvMaXgQlwjC8B2Wa3MhGImFe5szp31mYPh
 IaWqrw1+aUB2Iow+aUJ5OJwpaNP12N/IN0CWIGG7SUv+rTZVEJYfCFBOjJ/b/zEMqyXz
 9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AjvNAt/4YDJVjLGS76iQaE5yaByPsmOs0MvxHruMIGI=;
 b=Rrs4wZd8cph1f+aIKvjSVMEUQ9Bso2HeFmbjUnHVlvCcfDFieP7PtgigDQ8RS6I2kw
 4yCBgoRfheXWnKYVNQP2Lxeyh1qzpKFyM9Kf0N0uH4vg5H+VBvmTesPnu+Z+T7ViyeYm
 8WFSeYd2HfAuUrj/qvsM+NqbHWWj+TyupPVGBR3Lyx9wW3gftKPEiWIVkna/k0wJmrfU
 H3RRr1ew6+Ajqlyv+84B6SVYuu6ocXZdDxu1xqLWH+a0sVOavdSpShwC+TPjYOoSQ5zp
 45ZVB/qWq0TVxx+/awXLirDKuS2AoGwjMKj2kt67rK3c4W6dupqxA76aMHP8WWspVP5A
 XE2A==
X-Gm-Message-State: AAQBX9dvwTBDJic535B7rLxZrVO3+x6hL4pTQv+SFZFD3djHZjhYHVV/
 jy5W5LEXNmGSVm6tDwFAppiLdw==
X-Google-Smtp-Source: AKy350b/nMpobfpsqTpDy+WLvTPIO7H6DAd7FAwDczf3BlTKjiBxyf6Oe0U86J5aDDCgxYR+XtFrCw==
X-Received: by 2002:a62:1794:0:b0:624:f1f2:234a with SMTP id
 142-20020a621794000000b00624f1f2234amr15729569pfx.23.1680107763652; 
 Wed, 29 Mar 2023 09:36:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 d9-20020aa78e49000000b005cd81a74821sm19507939pfr.152.2023.03.29.09.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:36:03 -0700 (PDT)
Message-ID: <a1809221-ed92-01ec-28b9-7a9397c9066e@linaro.org>
Date: Wed, 29 Mar 2023 09:36:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329032346.55185-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Mar 2023 16:36:07 -0000

On 3/28/23 20:23, Weiwei Li wrote:
> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
> mask for instruction is enabled.
> Enable PC-relative translation when J is enabled.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c        |  4 ++++
>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>   target/riscv/csr.c        |  2 --
>   4 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 646fa31a59..99f0177c6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1193,6 +1193,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   
>   
>   #ifndef CONFIG_USER_ONLY
> +    if(cpu->cfg.ext_j) {
> +        cs->tcg_cflags |= CF_PCREL;
> +    }

"if ("

Consider enabling it always for system mode.  The reason for the existence of CF_PCREL is 
to improve performance with the guest kernel's address space randomization.  Each guest 
process maps libc.so (et al) at a different virtual address, and this allows those 
translations to be shared.

I would enable CF_PCREL in a separate patch from MMTE_*_PM_INSN.


r~

