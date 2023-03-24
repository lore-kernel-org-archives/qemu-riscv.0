Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pflm4-0007Df-2R
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 14:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflm2-0007DD-7D
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:04:22 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfllz-0005US-Hr
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:04:21 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q206so1556733pgq.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdwVdiv1tzpY+IhpGDFGRx7ppJPFCmksz+lZpMbCAqc=;
 b=LsqpW40QA3gNgnho5a28YEHtWeE8iR8RZsiQLvfuUJj5MBz3olV2WzLr9p0O7bBf2/
 CdhG1vgJrYVLTVuHbCVC8yTd6P3kBifSi52lAfCmycTATfCXpuL2EWbE06XXJN3qYUlG
 sZpCej+kCDPZRyjiI0HcARviM5kiSkgT0V+UI0J9OkHHTHMo+0VrS3dTyU76PbtKE8Pn
 qppwbgleL7tWqYZffENEie7/oYmBtZZ1LmLfc6GgVZeW2G2+xLOuOpSzHgDJr31h+q0F
 uYxo91GdivBoTiA3igfY/tgU7ZWD2DhJQ9p7+KCIy+byXH3FqI1y3ZnkqmRNhArYgjYa
 hgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdwVdiv1tzpY+IhpGDFGRx7ppJPFCmksz+lZpMbCAqc=;
 b=BMbfd5JJ2lUMgzkidHnfR4iav0ta/0Aohwomv0lrmK4RFDD4K8/d4dz4R5ZEGs76cf
 435p/uuhipqClRwp7TpNNEZowyPHcHbP/kqy8AaZvt+WH4H826lL5OPKudlh16ftDsWm
 CiAMthOL+dKCqdaQrbjCePUKSjS10uLLV0awN2y7wstixMBoVNsP9+dIeuwPXPWb93yD
 4sbFhu6YqFj/A6dbXKzBMC2qnFPUYQ+Yb2xavXjb7MyZS+4C2gRl0BhCx16X7djIvATB
 DFZNujmx+1lmMUkH35GWmpJFU2vApsDYkHdatNTF4jX23DflQ8aDH5pw/PAbxZj08OUe
 gPKw==
X-Gm-Message-State: AAQBX9eXo7CoBEAIWF9rZV59UFl+SvK7PhKVjXRH1aGcvn79JubVxlbG
 RP7M6T0TC2+MRKOpIwj2QhZSnA==
X-Google-Smtp-Source: AKy350Y7ijTVC6Sx0YivgKICFOUA3xMnXzxrTrhfxirtPFHDWW5TVvjhog3DlFwsnp/wQqwgJR054A==
X-Received: by 2002:a62:487:0:b0:622:c601:c0e6 with SMTP id
 129-20020a620487000000b00622c601c0e6mr3370318pfe.16.1679681057591; 
 Fri, 24 Mar 2023 11:04:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 u13-20020aa7838d000000b0059085684b54sm14593704pfm.140.2023.03.24.11.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:04:17 -0700 (PDT)
Message-ID: <9f99ff8e-43e4-71d9-42b1-0d91b396da97@linaro.org>
Date: Fri, 24 Mar 2023 11:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] target/riscv: Remove redundant call to
 riscv_cpu_virt_enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-2-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 18:04:22 -0000

On 3/24/23 05:38, Weiwei Li wrote:
> The assignment is done under the condition riscv_cpu_virt_enabled()=true.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

