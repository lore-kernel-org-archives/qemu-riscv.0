Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pflmd-0007UM-2V
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 14:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflma-0007Ss-Mm
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:04:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflmZ-0005bD-7v
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:04:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id l7so2153963pjg.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p7GXiyTViFjz8xPYOWO1w91Dm4jD29nFflvcsFF0A+U=;
 b=Ftt5j91O1J96wO7kskozV7XVS8wE8LtdeRRkLXQF8hCBG+ue3uehcuRy1n3dqZu8gI
 7WjN03MIAyRK5sn2aWuFtBKoZGT+ohAygK1AIHtKQQhuPUF2mb4CtQ1vsdO6bQ1sOUsE
 FvprvQuJ4A9OApUEYltvNGlILOKqB1MFypgr0/z7Y5Tb15N7Jok98ED6OBWofoIkmqO5
 TdmY+GQp+mZXJ9dN8mbYxy+qxdzrqgDyVsM3Jw4dwKL9gvU0TDDJ6b3VOq9ZH8fXcwks
 eEgIMDO4rFyucT4guJXnWR5/1x+tPRZa/CezsVrI4nLGCWAWxzlWA3pmathoMC7Wkmv8
 hznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7GXiyTViFjz8xPYOWO1w91Dm4jD29nFflvcsFF0A+U=;
 b=LY5weLPBa6BJ+U6XUjhzGRKdOyoMjxbgyWG68VmtRcnh/VhHu+KwgatDIvvCb1zUE+
 v0BQJUa0zLK+NGAXLtav7lyVCJZQoyuuQx/hzGGWzyviDfMTSpP/RvbpYO7cCDoV+ORL
 gQkM/QAdmFRApB9LnTQ+iGqO+SIXsXC3l8LXlVMGp3UUlqr5Q5XaFQyGfZNWdD8+tdc2
 Gd0xql5T7UqY2Cg1yMSGKGMqJvumgSLspXAQH8HV9UqiL4GuHzgfh8UXrEoQtIvXZclD
 wny2MInPmC2hasl7YbqPV1JJ3oCw6UCAufmfdAmRNvANpFR5OVK1QlY8jbURN/g67bJl
 kJjA==
X-Gm-Message-State: AO0yUKUnKyh01CN2dVjGfCN6pHhFCRpcM//KjhKOUevN1EyKCLM/q5d3
 eUoQN6n/AEY5AdjrFzFCVOGeew==
X-Google-Smtp-Source: AK7set+H7ijgwpomMtJQ8o6E/vWU2anOC97wGy9HhA3C4mI96YuwKC8qI9QpAh/GjvDbCEM1f1qbQA==
X-Received: by 2002:a05:6a20:6594:b0:d6:d41e:87ee with SMTP id
 p20-20020a056a20659400b000d6d41e87eemr2964721pzh.12.1679681093754; 
 Fri, 24 Mar 2023 11:04:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 e21-20020aa78255000000b0062bada5db75sm888428pfn.172.2023.03.24.11.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:04:53 -0700 (PDT)
Message-ID: <dafce54c-d78e-8ea3-39bb-fc09fc8493c1@linaro.org>
Date: Fri, 24 Mar 2023 11:04:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] target/riscv: Remove redundant check on RVH
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 18:04:56 -0000

On 3/24/23 05:38, Weiwei Li wrote:
> Check on riscv_cpu_virt_enabled contains the check on RVH.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/op_helper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

