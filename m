Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCCbV-0005MV-I7
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 21:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCbU-0005K6-3m
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 21:57:56 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCbR-0007oc-F1
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 21:57:55 -0400
Received: by mail-pg1-x541.google.com with SMTP id m34so2345835pgl.11
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=779pfCYpx7jF6I9326Cb+3otTDHwxq0clqMd1vsKIw8=;
 b=PecPpWSnGP5TFyL+CJJ4CS6GPmGzkT0agrirQiz8s5hvC8jPozHCeX44JHezwleZkV
 LacrU61QvXkTovfrticfQqkayx7u+VVkQAW7qFJb3hpQH/baHqzDSsbrUfPVbYbiL6IO
 hMzB0G63nEClYYxgzL/RviWn4o+fzWw5y5IyQBcj5SCvuOeSx0j4c3dueoSqtXmbH+3B
 nfE70NsfD8gxwCjVBu7Ab6mxF5iBsoDkyhuKaqrISI7X/S2ih8Z8E3SVgLUkeHYp5mmZ
 tF8R9rvn3KyNA9HaYR8eWSvlIYLKLgGle9jIwm/89Ps/Tn3TrxwIK5yPBnUHO1FrmlpQ
 1M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=779pfCYpx7jF6I9326Cb+3otTDHwxq0clqMd1vsKIw8=;
 b=BOeW0rY43kR7ckEk/0afjMyfn4y/rBDY62ttz6DlZd0tfPoE7a74ofxd+3pqqE2pwy
 PSqz/SoXDbOSYJgCISzuFK58JZ7z4K8aEThBK6AaVdeRHcEPBUthxi2pr78QpH2r6w+d
 TvwaNma3+XF4udf4BfpS3mbw7L2vFMzz/RFpf4v/W8LL1t4gT0mzbKoCvSADrwXDInT5
 qIVidzBMuXN7PMtvl5bdOAtdBRI32K7djTWKW4QgwSKkgKr9HQpukxc3WQ01fIDv3jou
 mFezncURaQJGR1D0NZ52zx7002eDDMgigV2nEAh/tHxD0UCYUS5Qg5hF5ZLoJGqflDvc
 7ZFg==
X-Gm-Message-State: AOAM532zrc6DLecjDAUkJ+dixnfv7IoJ5U5q5Szl2GJzjjFtodOGH6TZ
 jl9IpVyF4RoudPn75QYtsXRX5g==
X-Google-Smtp-Source: ABdhPJzVOjTs2+dMBHWrAV/Vzcpl3BqCPHapzm0L0pSFGPG/s89dAJmBRA8IZlzHxMEmkEC7NtPxcw==
X-Received: by 2002:aa7:85d4:: with SMTP id z20mr4675435pfn.106.1598752672024; 
 Sat, 29 Aug 2020 18:57:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q10sm4026579pfn.206.2020.08.29.18.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 18:57:51 -0700 (PDT)
Subject: Re: [RFC v4 70/70] target/riscv: gdb: support vector registers for
 rv32
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-71-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e767767b-fd50-3263-fb5e-b366df009595@linaro.org>
Date: Sat, 29 Aug 2020 18:57:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-71-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sun, 30 Aug 2020 01:57:56 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds vector support for rv32 gdb. It allows gdb client to access
> vector registers correctly.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  gdb-xml/riscv-32bit-csr.xml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
> index 3d2031da7dc..bb98b927995 100644
> --- a/gdb-xml/riscv-32bit-csr.xml
> +++ b/gdb-xml/riscv-32bit-csr.xml
> @@ -248,4 +248,11 @@
>    <reg name="mucounteren" bitsize="32"/>
>    <reg name="mscounteren" bitsize="32"/>
>    <reg name="mhcounteren" bitsize="32"/>
> +  <reg name="vstart" bitsize="32" group="vector"/>
> +  <reg name="vxsat" bitsize="32" group="vector"/>
> +  <reg name="vxrm" bitsize="32" group="vector"/>
> +  <reg name="vcsr" bitsize="32" group="vector"/>
> +  <reg name="vl" bitsize="32" group="vector"/>
> +  <reg name="vtype" bitsize="32" group="vector"/>
> +  <reg name="vlenb" bitsize="32" group="vector"/>
>  </feature>
> 

As per comments in the previous patch, needs squashing.


r~

