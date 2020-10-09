Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQtTl-0005AF-J0
	for mharc-qemu-riscv@gnu.org; Fri, 09 Oct 2020 10:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQtTj-00058j-A1
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2020 10:34:39 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQtTh-0007M7-2w
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2020 10:34:38 -0400
Received: by mail-ot1-x344.google.com with SMTP id f37so9113377otf.12
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2020 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CO5LLPPDG1Pz5zpShDhiW+Tssla1SONHoMCkPsvk0Ys=;
 b=hOfJNZphWd++o8bENpYKTKBR0N3T3UWJsinP0HOuBWOdMoHvySFWGoDi3xBFviasIo
 MRqLh0LrUw3yrWRm0tn+OZYPvv5uRvQs+ZBrgJx4NO8iZ0QrWQfcU+pDqr+bfpQjFnAl
 /iRPliXRr//14NbSCNWlo8zQ4RslcgNaXbhi9sgR1ZRdWTBn02KBehmQQxD1GlKhuy9M
 4spJxUIRSQ33t1LDiV72FuvdHLpRqIjyjHVKB40G5XnOx/6ZaFEIWHL7iIm3bkkiZmGa
 Q0Wj6dI3wSddlnylVyvfUAi7OZYFa8MaITsZEVvU9Zru+4EYcVtO/zk8yBJ1FeBqFGKy
 fjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CO5LLPPDG1Pz5zpShDhiW+Tssla1SONHoMCkPsvk0Ys=;
 b=NPdRY6szsEaPwNVGmVZHGj29POmPWZbBkGOVNVdUm1MprQ3v0FWmDKv9aYTPNrXtrP
 eBNZoi8qVE3lrCiPvnOBXEp7k6KmTfjFPJbv+DIeEJa2+djhJwWEq3JXyoPnacnYvNBg
 EfTVp9WWDC6T1e70nrfwfcvspe8nIig08MQfn523vkrx7kxkw3fUwiimdDPwI/3ZAFOT
 PUvua19StP3tcMAtscNN4TqadKzg93VaDUkxN4ZgsGhwOO2LGO4mq0yXP2aR7kMKQkmx
 SJvqE1N5v/RwNnvbO2TXv/RhxJaziD05wTs3O84/pCpQ5zo4kBEGeGATD1jrK8Or5Djr
 cyDg==
X-Gm-Message-State: AOAM533CKkSIEQN0t4X/nglHAgaoRBvcn2XG2MUXb+v7Hdl1aUN9uaVk
 Brmk7N+PvVLKKjNLaF9n6eMdKA==
X-Google-Smtp-Source: ABdhPJyTxodjNSNZIBt6/NWSH/pJWl833SbCTLYZ9PXtkeuJB+dwd0OnWQIR4GelXbJt/r7XWT4IxA==
X-Received: by 2002:a9d:6013:: with SMTP id h19mr8750979otj.262.1602254072549; 
 Fri, 09 Oct 2020 07:34:32 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id d27sm6307463otc.6.2020.10.09.07.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:34:31 -0700 (PDT)
Subject: Re: [PATCH V2] target/riscv: raise exception to HS-mode at
 get_physical_address
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 Alistair.Francis@wdc.com, yinyipeng1@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com, dengkai1@huawei.com
References: <20201009075740.688-1-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26316865-1a25-0e12-ee65-76d79e26603d@linaro.org>
Date: Fri, 9 Oct 2020 09:34:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009075740.688-1-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
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
X-List-Received-Date: Fri, 09 Oct 2020 14:34:39 -0000

On 10/9/20 2:57 AM, Yifei Jiang wrote:
>  #define TRANSLATE_FAIL 1
>  #define TRANSLATE_SUCCESS 0
>  #define MMU_USER_IDX 3
> +#define TRANSLATE_G_STAGE_FAIL 4

Note that you're interleaving TRANSLATE_* around an unrelated define.  Perhaps
rearrange to

enum {
    TRANSLATE_SUCCESS = 0,
    TRANSLATE_FAIL,
    TRANSLATE_PMP_FAIL,
    TRANSLATE_G_STAGE_FAIL,
};


> +++ b/target/riscv/cpu_helper.c
> @@ -451,7 +451,10 @@ restart:
>                                                   mmu_idx, false, true);
>  
>              if (vbase_ret != TRANSLATE_SUCCESS) {
> -                return vbase_ret;
> +                env->guest_phys_fault_addr = (base |
> +                                              (addr &
> +                                               (TARGET_PAGE_SIZE - 1))) >> 2;
> +                return TRANSLATE_G_STAGE_FAIL;
>              }

I don't think you can make this change to cpu state, as this function is also
used by gdb.  I think you'll need to add a new (target_ulong *) parameter to
get_physical_address to return this.

The usage in riscv_cpu_tlb_fill could pass &env->guest_phys_fault_addr, and the
usage in riscv_cpu_get_phys_page_debug could pass the address of a local
variable (which it then ignores).

Also, isn't the offset more naturally written idx * ptesize, as seen just a few
lines below?

> +        if (ret != TRANSLATE_FAIL && ret != TRANSLATE_G_STAGE_FAIL) {

Should this not be ret == TRANSLATE_SUCCESS?
This looks buggy with TRANSLATE_PMP_FAIL...


r~

