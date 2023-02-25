Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVsDD-0005go-U9
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 05:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsDC-0005fk-3t
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 05:55:30 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsD9-0002uM-Sp
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 05:55:29 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1729bdcca99so2404196fac.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 02:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TVnsxfYaBt2CtBMAa7FZVDvRgmthwIxPRt4F1C7FdkA=;
 b=iwFvvx3jjcdixuRgy7SVgkh5SX3nYNOWPFAFT08pb1QHGlYBBQafM/tp3x1h81Z2yg
 U6wmYmJdu2IOqG9ELL5A9C7Xx0yjulpuKhLgvBHVsY+i8/M44HdKQcVSQRDLUAbd2vnO
 d3HNRp0wxxs9B+rD7BWMrC7ZnaOLfVsfFCXnlfX2BJOIyYOiGuzSLuJ1AEBj+Q2+q8+x
 tvCuy1MVabv4t5ZMJEIdzEUTOh8RgdP5Enq8Zwb1IXbICaWbac2Yxl6fwvbhz8aHcQpt
 bhc6z9OZM7iq9cWQv7tjGT0BVHA9tkKkjtMhNqmO/Sx/V3N3uBQr6vgUFCOnKlsj8/qQ
 pFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TVnsxfYaBt2CtBMAa7FZVDvRgmthwIxPRt4F1C7FdkA=;
 b=5Z6FM1FaXP6MvzYYqZVHkrenqpljINIFzpHbzj54s/IY5cHPayd4ChHpDegw1wtS8F
 FTafjubOniyEJQ37DwM5i53XexlzPUm5nF9idw+o8qQyT3VDandA60au9FVWoqqACV6H
 LdmMiyOQgRovqprBq4FVr5cyuS+K4VnfUBiYUWDOkTJEHzXeWT/1M6HMDoGpTKuSqkgr
 hejMNXbRFQuTQbbgrFWhn/vls7qYY51acVqKLQ7fOtj3YMY1XBfywnFoF+d2sJUD6IaU
 ctq3DM4NOSF0j5HJB0AAlRwbQgAzyB22V3vaQtxA+f5ptvNFNz7Lish57mW1nXpU3OLa
 QsfA==
X-Gm-Message-State: AO0yUKUxCpwilC67oEPzbgLyNvo+tgRBVMSHDhIy7n6TAjIcj7mYwAty
 m5mhb3RoiV4W+3YIVyHbZRQgYw==
X-Google-Smtp-Source: AK7set+ket8neWRjUohRhf2VE8nzbI7Rd/SWqi7c7Q5amYeQg1sFUsyd10rSfddPApjcDM61zi0YRg==
X-Received: by 2002:a05:6871:20c:b0:16e:759a:6ad9 with SMTP id
 t12-20020a056871020c00b0016e759a6ad9mr15675666oad.25.1677322526203; 
 Sat, 25 Feb 2023 02:55:26 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 c82-20020a4a4f55000000b00500c1100651sm573486oob.45.2023.02.25.02.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:55:25 -0800 (PST)
Message-ID: <e4f6bdb0-2af7-e7d1-1e36-407610f7a355@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:55:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 76/76] docs/devel/tcg-ops: Drop recommendation to free
 temps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-77-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-77-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 10:55:30 -0000



On 2/25/23 06:14, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   docs/devel/tcg-ops.rst | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> index 561c416574..f3f451b77f 100644
> --- a/docs/devel/tcg-ops.rst
> +++ b/docs/devel/tcg-ops.rst
> @@ -951,10 +951,6 @@ Recommended coding rules for best performance
>     often modified, e.g. the integer registers and the condition
>     codes. TCG will be able to use host registers to store them.
>   
> -- Free temporaries when they are no longer used (``tcg_temp_free``).
> -  Since ``tcg_const_x`` also creates a temporary, you should free it
> -  after it is used.
> -
>   - Don't hesitate to use helpers for complicated or seldom used guest
>     instructions. There is little performance advantage in using TCG to
>     implement guest instructions taking more than about twenty TCG

