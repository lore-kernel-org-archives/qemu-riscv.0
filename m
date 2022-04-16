Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfYWl-0004O9-4g
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 22:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYWj-0004NC-Rb
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 22:51:09 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYWi-0003V6-AJ
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 22:51:09 -0400
Received: by mail-pj1-x102e.google.com with SMTP id o5so8895115pjr.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Apr 2022 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OcSW40ivplWynaPtysiaX5v+rRRaY+4JHspclU179IQ=;
 b=cCiEbW+JTk1XC3JypG/Y7YCa7QAJYkqlwfJZsdtRywdC2lZh39rBu0zD43yJSPgZwn
 PIgw+C0ZACYJ1GVRGr9R261D63dsDm3+fTU8LMb7aoxnxYtnrD9oEKNicMG27snPu+5t
 mNEzzR8c7CYDjkG4SmUSZq9sJdkKSvXuwl5t8KqYaplA3bw09MTMVAlD1KLwMwLyo/jY
 giKHogS1t+lJJdhUyx3ezp7QsTgwyC/44qjsqyzCtzpOZD/dR7JKjzmAX27qirLkcuPx
 /NhVI/QKOgzqdJHIksGHJc4uTDP7PpTLQNZBtdmhnXMPQBItRfly9cB/vc4grk4gPAX6
 gvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OcSW40ivplWynaPtysiaX5v+rRRaY+4JHspclU179IQ=;
 b=T2gzO3M95lETGDRtB8zU2OGgKAED2SpBrLH4VP+j+v9RVhAPwXzKzFNnS6dk0CkJz3
 1PoDoNmDziDODGMm0XnZBUS/cq7SnMQQaxr0ev6bDdQuHb5X6uyIjTdq6S6bN86KoxAk
 Gn90wHmp7h7Qqx5xm+frOzZYYyQB1lBCPTb3pZ0rtPQv/sh+gVhCuwHc411shSvfoRQD
 j/Ve9/P/e4JrehN+IAy/cMeFdq750zbSoOJMuaG///R34xRvvy3I7maGdl3Ak75kgm0l
 8rRHdtbgA6tNiXUKqkDqbR1TB5ufxtgFBCxR091bhm+QcMRuK2cyK9toXRh0KiANWeC4
 TwAQ==
X-Gm-Message-State: AOAM530EX77cg0O8gYN0LYk7HtZtPlx6H5/wM54DQFLdE7uEthTBF5Ud
 UuKQn2jTr85GdVeZ5HA8lgHPnQ==
X-Google-Smtp-Source: ABdhPJxiUZzRBHLi8iruQNkyFJgnV8lRTCM0IcGnrr/B+nEfrjeHtsNjuQWDO4DRGpfVs+okeIJyaQ==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id
 q17-20020a170902edd100b001588318b51emr1852573plk.89.1650077467019; 
 Fri, 15 Apr 2022 19:51:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a62e819000000b0050a442a510bsm2928546pfi.31.2022.04.15.19.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 19:51:06 -0700 (PDT)
Message-ID: <ce7d328a-276e-9dac-9784-9142b760902d@linaro.org>
Date: Fri, 15 Apr 2022 19:51:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v10 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220416023549.28463-1-liweiwei@iscas.ac.cn>
 <20220416023549.28463-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220416023549.28463-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Sat, 16 Apr 2022 02:51:10 -0000

On 4/15/22 19:35, Weiwei Li wrote:
> +target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, true);
> +}
> +
> +target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, false);
> +}
> +
> +target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, false);
> +}
> +
> +target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, true);
> +}

Missing REQUIRE_64BIT tests.


r~

