Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfYWE-0003kU-1b
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 22:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYW8-0003jJ-E2
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 22:50:35 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYW6-0003M3-II
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 22:50:31 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r66so9406388pgr.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Apr 2022 19:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b4bguhTjW+b5Asu527rfuN6CfaRQdYkMKK8zSVOczqs=;
 b=zMYmI4wDaatRAEVqxc7zSkZ/+0j1D4J5U4E2IMY4TCTnwVTku2z0rXuBN+94QWzbQC
 fWAbQuGq82JhwzsqXO6rTckXsNy3wGknl2TqyUTnSdJFvsUbprRw43xiZlj4htzq7ZDv
 j7GGeblwthzh+t9q+WHEd4GlxtlDoD7olSvicoe+nYjvj/NjGw/PVEC47b13ngSFOSa3
 fKmV8AqlRWrIAqbNiBSZ5micisC7I5Zz6IZQ6t0BCXYgr15BcYGONDPVxBZmcGHGqKbQ
 HupOcx5RRGl2fW06RYmtR5bqxGu6nXWVH7v300mPnarM3Z3W9jr/ye/nms/qUCMQnsO/
 DmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b4bguhTjW+b5Asu527rfuN6CfaRQdYkMKK8zSVOczqs=;
 b=Q0+a8JmYYwcWGN6ymqe4bF29En0Pch7zpoYrxCjtQ9LIRfysMyBWfST2EKPSepCcHC
 /m4KB9HM5sZCLpe9gbKV6/SwJdhrihiogqhEgEv6coqLSJGuyl6Bef83Kx6FRKV1IfSC
 27vL7HScnFMy64GNLPoRADkMzY5dN5Ygx9abmw8biFooOeIWjAHfukF8VWpLAjK9J8z9
 sy26OSYD96qD5HM102rw4KFcTUUnsCbhtA1voFSsiDNEb9lVdYk15Af81P8XTVwAPKtM
 yoLRr6Y+scxbC4uOwrQDI5wWhuNdTaV7XAYkaPWo+d2B/KZ7Nte0vHLrfy1phUy5KiSC
 CpqA==
X-Gm-Message-State: AOAM533HAto4RPVWM2oRuY2coXRPy82zt1THkxBoqyGM4UGeHi7MbWGK
 QgbT7Yum71C6xkRykCLSpm1i4Q==
X-Google-Smtp-Source: ABdhPJyEx5tW372KYt/ihZbUjFALT7h/391+v5PwHpk+AMQuEheVkaGqcGr0SKjjJLBWyLDFm0bQlw==
X-Received: by 2002:a63:931e:0:b0:39d:9d36:545d with SMTP id
 b30-20020a63931e000000b0039d9d36545dmr1422273pge.511.1650077427951; 
 Fri, 15 Apr 2022 19:50:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a635719000000b0039da6cdf82dsm5619278pgb.83.2022.04.15.19.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 19:50:27 -0700 (PDT)
Message-ID: <a169f2cc-a4b9-a4df-9f16-323206f1715e@linaro.org>
Date: Fri, 15 Apr 2022 19:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v10 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220416023549.28463-1-liweiwei@iscas.ac.cn>
 <20220416023549.28463-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220416023549.28463-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Sat, 16 Apr 2022 02:50:36 -0000

On 4/15/22 19:35, Weiwei Li wrote:
> +target_ulong HELPER(aes32esmi)(target_ulong rs1, target_ulong rs2,
> +                               target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, true, true);
> +}
> +
> +target_ulong HELPER(aes32esi)(target_ulong rs1, target_ulong rs2,
> +                              target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, true, false);
> +}
> +
> +target_ulong HELPER(aes32dsmi)(target_ulong rs1, target_ulong rs2,
> +                               target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, false, true);
> +}
> +
> +target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
> +                              target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, false, false);
> +}

Missing REQUIRE_32BIT tests.

r~

