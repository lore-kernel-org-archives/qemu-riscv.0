Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVfkG-0003KW-Dc
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 16:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfkE-0003KG-SO
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:36:46 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfkD-0001eg-AY
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:36:46 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so592765pja.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 13:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BmSLxIs/HglzErFMlGbuQ/f8fkqpUchvrsk5ptIjLNQ=;
 b=oTzI3ZJ8ccRb5xZ/3TG9njuQmQ92catbdAltfU55kaT1XSHpyU4gneWCybYCRVA+pu
 USTb9DHsFIlX4uN3RCVkliRpvfLtQXdZtL039El5lqXipI4Ax8hsUFWZ2dHWBnxBbBe6
 KCKkUY/p7ou3uEpl8CJkfqsFp8c+WgOtcDmzTWKG/JUxOUBoTIbLABpLoOLml7Fj+lOD
 GV+FKB30R8E163r2WgY/OBEid5WoJr/iVXbHpt7NXANPX8A1okCH/dMvXY89Zr1TfIz+
 jpc7BTJBJZBch0QE1jbq3ZKz+1ys/c3VY9pgKVRyDsFv37qd+QWFFFCz2FhkNaNrU/er
 0Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BmSLxIs/HglzErFMlGbuQ/f8fkqpUchvrsk5ptIjLNQ=;
 b=Alr9TijCYrJJeaK0XcztqcMxKCPBtIWU+fw4hmueNuhoXqHfQwSvVvkeLmRToTkw9j
 /C3+/7XWr5+iAkZdsVYeGgaeMWtqzvceANVO2gijeJpVqG5TK5cA9svEh/zOB46utZ5r
 Q/N/4clPjTgnU3nn4fXuSbA+bUpF7ubGrQt26H9u/7VRD3cwS6jtdq221bKuOeFEd9+x
 tFOkIM9g1hWnb9IboxFKH44a6c7rB1iQ6NbBPmmPLKeazkjiEcwcxFqBmnWIWpKP364Q
 Nz2gdPIFg9PlcP+0Tu+Q+FuRjc4Ue6De1e7Dpa+xj/YC5+0KnwIpPYDLenjM/hIriUoX
 H96g==
X-Gm-Message-State: AO0yUKXqK0KQluBemlawKjU6eMtCaZeMY/CPVxOMDjEnmO/xCpfxmZnF
 yqLTyPkzSvCeGiou/Vg1Fpc6Gw==
X-Google-Smtp-Source: AK7set+1w6A7n2Kh51ODvocdRPwrq79RZQEXXXTZ/DKleVqO+BsSv+M3xLL00avyfJXuGJL5ts4sBw==
X-Received: by 2002:a05:6a20:71c9:b0:cb:f76c:ce05 with SMTP id
 t9-20020a056a2071c900b000cbf76cce05mr8635022pzb.47.1677274603731; 
 Fri, 24 Feb 2023 13:36:43 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e25-20020a62aa19000000b005a8c42d2e66sm36371pff.18.2023.02.24.13.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:36:43 -0800 (PST)
Message-ID: <c18fedc7-c563-54ba-9736-1475651979e9@linaro.org>
Date: Fri, 24 Feb 2023 11:36:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Fri, 24 Feb 2023 21:36:47 -0000

On 2/24/23 07:45, Daniel Henrique Barboza wrote:
> Hi,
> 
> These cleanups were suggested by LIU Zhiwei during the review of the
> RISCV_FEATURE_* cleanups, currently on version 7 [1].
> 
> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.
> 
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html
> 
> Daniel Henrique Barboza (4):
>    target/riscv/csr.c: use env_archcpu() in ctr()
>    target/riscv/csr.c: simplify mctr()
>    target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
>    target/riscv/csr.c: avoid env_archcpu() usages when reading
>      RISCVCPUConfig
> 
>   target/riscv/csr.c | 90 +++++++++++++---------------------------------
>   1 file changed, 24 insertions(+), 66 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

