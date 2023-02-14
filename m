Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRuCT-0001yB-6I
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 07:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRuCS-0001xl-3a
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:14:20 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRuCQ-0000nq-Hv
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:14:19 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-169ba826189so18752458fac.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OZOkaOiqRtXu0wImNTXGwdwY/sVxnMfYUwR+1RIU3+M=;
 b=QS3ycB2HlYmygMxZ3lLhIS53WrTPtRzunS1sFqDzCWP9oSRopwg7Deq0m8SmyoWx0H
 dM92GodkgEL/O8334icINs/7WAqDPP+Dck0wIzOyu/qUbsEXkwIGUv79dZ3iAENm1f9M
 SemUpgcSmSQ7z1VTeOXG6VHiC+uzXTxykrSej6KaQeh2DnYw/EXjK5FAoIcNxhT8S0bN
 /iXtqUTqZJGP7QRPVCl+PJFYXXTDWa08kVEZTL//m2fkj5QYPUwwb3yoTwGzCWs3CopK
 bB9anjCbgpm8r4Q0MAduavwQTaWx7ozXWYROe5OY2VPgGu9XjgIni8GbFTWXvEM9+Un7
 8+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZOkaOiqRtXu0wImNTXGwdwY/sVxnMfYUwR+1RIU3+M=;
 b=dJ9LLP6LJkQAy3JhIkTqcQ3jW3ofx7P71haSUPbanXnIwIrPFpzjROHRpcCYgRf4tE
 xg8gG5JNyxo0dPovCyJZdwh05WTChhc4170tHa7lFL1dvWmlTbX8r7wBaE6eJgnH1e/c
 W9opR/Iorb4tLxGvxk/32/ujrzzKaidGpcjwH6nu4Zki/+jA8ZNxaN0EK5oRazrPNrMf
 onauJx/Zf145+1RXPFLlKhegsNgnWTdGjFY3n8FqweN2BRwFtGemurJdNiPBdZTHCPY/
 JTK8WF7cjiid/Fg6LRAUrDke2Pu6gcyqGqXXuPdgvfLfl/WUpKDgn6LuayQVdLuETMU3
 pNIg==
X-Gm-Message-State: AO0yUKUWet42/jjn+OOOOrxmSWpwAOmJ+5gkiCsNOuYJ+wy07EIgO1l/
 MYjqomrNx0jZO33YWwR0UFFCrA==
X-Google-Smtp-Source: AK7set8W6DMEN/+dW3xXk+QesdmoQpJHP8aaAM8ufpwsLskFC2C7P1A+gV8f1UzNrs+SUYgufkl1qg==
X-Received: by 2002:a05:6871:8b:b0:16e:1aeb:d74b with SMTP id
 u11-20020a056871008b00b0016e1aebd74bmr901653oaa.33.1676376856161; 
 Tue, 14 Feb 2023 04:14:16 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a056870d4d600b0016e210ae4e6sm1152135oai.24.2023.02.14.04.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:14:15 -0800 (PST)
Message-ID: <4aa40803-b1c4-bf4d-3ddc-458e8f1d0538@ventanamicro.com>
Date: Tue, 14 Feb 2023 09:14:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 04/14] target/riscv: Add cfg properties for Zv* extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-5-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 12:14:20 -0000



On 2/14/23 05:38, Weiwei Li wrote:
> Add properties for Zve64d,Zvfh,Zvfhmin extension

"for Zve64d,Zvfh,Zvfhmin extensions."

> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..54c6875617 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -462,7 +462,10 @@ struct RISCVCPUConfig {
>       bool ext_zhinxmin;
>       bool ext_zve32f;
>       bool ext_zve64f;
> +    bool ext_zve64d;
>       bool ext_zmmul;
> +    bool ext_zvfh;
> +    bool ext_zvfhmin;
>       bool ext_smaia;
>       bool ext_ssaia;
>       bool ext_sscofpmf;

