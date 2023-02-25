Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqgo-0006my-Na
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqgn-0006Y1-3L
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:17:57 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqgl-0002f1-GW
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:17:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y2so1418354pjg.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z9o8lSNDVgDzgK+zbye3s+P1topoY4svJSWTC0b8hC4=;
 b=kmjKp1WH/jLiioaCCjMJJAuhcz0xbnPp4hyDOgiQ3GXpLcCBpJXRdgK8okeBFwEFV3
 jhQXVCIWCh2pneNnf/gBZnNL1NAe3O+Q4JkCDNTe5yFHCnYKMZuZyZLH75jKVbKoyE/K
 dH4K8CG1l+UB4nxB0U/+B9LqrQcOXoFbsZIkZrK1VaK3F092HveWz5couWfFxnUU0dhe
 dqb56xs5KDNYQrGAOiOnhT/IcQYEti8lw7sA1PDme5yLB272vppiHUk/53xui235jGjm
 +FvrVbebvTyhACBlSnHDCYVD/kgQfU2ymyS0E5PtCtCyAi9+q3ExvawRbRXO74yhorm1
 Nplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9o8lSNDVgDzgK+zbye3s+P1topoY4svJSWTC0b8hC4=;
 b=q8o3BBlCaqyDOLXmvgbS1kS6a5d0gSvgCWskEeEgn5+Mjz0yO1w7oEKDsNGHdKJhZp
 dqP3X2Y37EZL73VmYXLzUISzUiUr1XYU9HnZVeSOl8V4HRQmjFG89bOXmEP/yHXE8Mt+
 U1/1OFJMrfurBhsggJcycHFA5jiuViPnM9Y1OIabPCkd3AJRDaZgGejlb2VAhfJxNoxm
 en9OVSXCPrgkYaEsRAFuuP9ALOyK5AXnPbe/CCe4paywIJyY3B0RJLjPpPQgmwi0qHvR
 EjRY0QWXRbyUqBMslwhxz428dR2X3JjSqNTSEDTSwi8p9Xc1bmXQweQ4M/oEw9WsaIt3
 q9bQ==
X-Gm-Message-State: AO0yUKUorjNgH2fzICfW3oDpATypsyYNTjbBi7sLa1BnewVBB59+FAwA
 zbKc1bBWOAENJUW6kqlUvzwm7A==
X-Google-Smtp-Source: AK7set/UeZQG6nwnP4+gLEa3lCLP+6UEjTVZDkc96L6y0VJwIiQq5Qo/NrDGFanXf6qHz6pCbZuUbQ==
X-Received: by 2002:a05:6a20:6909:b0:cc:f39:5094 with SMTP id
 q9-20020a056a20690900b000cc0f395094mr13291962pzj.30.1677316673704; 
 Sat, 25 Feb 2023 01:17:53 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 13-20020aa7910d000000b005a8173829d5sm828694pfh.66.2023.02.25.01.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:17:53 -0800 (PST)
Message-ID: <4f6f45fd-5f97-b7dd-ebc9-e2e72570c7d3@linaro.org>
Date: Fri, 24 Feb 2023 23:17:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 25/76] target/cris: Drop tcg_temp_free from C code
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-26-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230225091427.1817156-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Sat, 25 Feb 2023 09:17:57 -0000

On 2/24/23 23:13, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/gen_tcg.h     | 29 ------------------
>   target/hexagon/gen_tcg_hvx.h | 15 ----------
>   target/hexagon/macros.h      |  7 -----
>   target/hexagon/genptr.c      | 58 ------------------------------------
>   target/hexagon/translate.c   |  7 -----
>   target/hexagon/README        |  5 ----
>   6 files changed, 121 deletions(-)

Bah.  s/cris/hexagon/ in $SUBJECT.


r~

