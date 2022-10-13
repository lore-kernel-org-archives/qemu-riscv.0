Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oj2ld-00022T-9u
	for mharc-qemu-riscv@gnu.org; Thu, 13 Oct 2022 14:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2lS-00020h-5n
 for qemu-riscv@nongnu.org; Thu, 13 Oct 2022 14:17:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2lP-0006Xi-Nj
 for qemu-riscv@nongnu.org; Thu, 13 Oct 2022 14:17:01 -0400
Received: by mail-pl1-x629.google.com with SMTP id o21so131687ple.5
 for <qemu-riscv@nongnu.org>; Thu, 13 Oct 2022 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJeu/I31b6hVJSCC8AsqCZpMYRa3PtYLoTet6p+YpGA=;
 b=Vg0t8Y+Lk4K08y5s/mQwgRn09L5i2n5Hu0BzO3XPZxsMLTK+dNB3SAgubXXR4/CKwX
 shc6ZQ396q9FVtx3mzGNz99rnuORtt4xCUYUeSaGgUoRthUun1mklJjF0M5kHJuH0rq0
 rRC6F10QGU2Gaf9+fJmTu9dPYWxITE7QBJE7+Vxnj/yWlXmI2WHUX0Vhj8Bxgb9uCCeO
 ART45ttbn4sgjmwvnFwBNrFN8fDwIHvMInSDt8OGfuhCRYcVxQ73S4mdT38Upl7tUGXH
 ADIA5PjkImRfK+UTLgjN0XGyfoUgG23FZQEJ2MSxxRolej7aNkhK7KvTVcVJ/Xvj6NX4
 UpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJeu/I31b6hVJSCC8AsqCZpMYRa3PtYLoTet6p+YpGA=;
 b=vNCt/wI/DYTQ4JZWq3IwBFh9+GIzT1nRCtbUgGdiHYEjHulBuBRvHXENwMaPz+P6yb
 VXGUA98kHOoVsS4fpuDNRM8sH61vLybzOiLSsFYtyYdMw24AwFVxJUeTwzZGFtRSYbQ8
 Ji/VONMU8NjAv4zdYevatMC99zn0ztaD6NkmR7XxZqJQ+H9edoJMCaoPW+iJofGBUtnh
 V0QyvGqzT6uxwlvvOi+r4cMdbn9xdorkmEZJtK79/ESozFfzXP76vzVhc5QvxIy+pe8H
 wmOnhdJraNiqKTBnFAgjnN4H01cShRUIUQEzQ4WomiWpM7MZCIp8u2eL7NmzJIYcDycv
 MV7g==
X-Gm-Message-State: ACrzQf3BBzzO3xLvhergVuNl67Nzx3gjjhQDtFzKssfEnaYgz9qUOs/D
 ZcsEqhGRUrB23USgd86JyO/AZA==
X-Google-Smtp-Source: AMsMyM66stNhRsBtUyVzFhSvI2TTHt8VWE7GxQAVdBYYa2xp8Cg9Flhi5C9u1LOSEeaeAIueuW3o4w==
X-Received: by 2002:a17:902:c952:b0:184:ba4f:af39 with SMTP id
 i18-20020a170902c95200b00184ba4faf39mr1167159pla.58.1665685018156; 
 Thu, 13 Oct 2022 11:16:58 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 b124-20020a62cf82000000b00562b752b38asm6734pfg.145.2022.10.13.11.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:16:57 -0700 (PDT)
Message-ID: <24a38a9e-b8e3-9076-8e5e-05b24ada5e34@linaro.org>
Date: Fri, 14 Oct 2022 05:16:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/riscv: pmp: Fixup TLB size calculation
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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
X-List-Received-Date: Thu, 13 Oct 2022 18:17:11 -0000

On 10/12/22 18:14, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
> have been seeing this assert
> 
>      ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_power_of_2(size)' failed.
> 
> When running Tock on the OpenTitan machine.
> 
> The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
> a power of 2. The size was also smaller then TARGET_PAGE_SIZE.
> 
> This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
> rounded down to 1 to ensure it's a valid size.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
> This is based on advice from Richard:
> https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.110653-9-richard.henderson@linaro.org/#25043166
> 
>   target/riscv/pmp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

