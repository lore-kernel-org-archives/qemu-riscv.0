Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmXal-0005CJ-78
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXaj-0005Bw-NU
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:20:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXaf-0001Xz-Fc
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:20:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e7so258430wrc.12
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294835; x=1683886835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSsFaWaGZiM2AtyO1t0JA5fKBd8lfTHW98v3S2Zf6fU=;
 b=MCATGJuDFvh7N0s3QyTNnSn0cKSahfIG4mR0hx5skk/XsEp5tz61lL6IgIpFlaD8QJ
 v0Fi1aQmzEkaWo1ipy+2jJzy3xecIdKCpUbbvfFsZ9Xzc5KbZqV89jU62kMpuM3GuH5g
 lp9NwOJPX5zcUdpiF212reVwzlWzSzhubvn9AcIDg7Z6n3piVLaPF8NTreWpxG31qyjV
 xdrd7vnUHfLrwqsCtrN812vO9NrV3FRBq2faUnT/WqMzFdBi9zv96Gvamjx+whbhnTC2
 VKvj8doQqYIwS0JtBzfJtOIPbqJsB+HeTqAhtyNdgO4944nVbiJEdL3zkRbqV9a3UuxJ
 hmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294835; x=1683886835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSsFaWaGZiM2AtyO1t0JA5fKBd8lfTHW98v3S2Zf6fU=;
 b=ZlnEPJGlyb1+DXJTw+IXc+2xlmLjvcHTJCoSVwgRn9eLba/0Sp4CPg996J1pOXNXF4
 7OkcZIt+nrFOcdjY06Zv7oEUesmVkaLns4KQZhDuTrBqi+zK/pNnYyhcTpM9FFW/xDUU
 a9Ap8AI6ewpEoH8/2GCzadeMR1H6JWbfQTTYL1bwoLk5pKr2BdtsMHRZhw6nutEZJmdj
 hhV8eoEmRIY11i6fYctCNX0fXtQ2UAO22rgHnatSQNBfs84udEpDADFIm0edd+Ji6tdP
 z3XUEFopkRcuNrgL3oS+FACDEsVJpF2gZMYgOnydLpfDwNdiHcyV3b8VFJ2PZ+JPvSGb
 dG/g==
X-Gm-Message-State: AAQBX9fSvoPpKaUOLmI6JlH5PWMNqhW9bpgr8LKIG5pi8/7u1CU7P8My
 jMUhLqhL+DIk6Q5zRdj7HivkPA==
X-Google-Smtp-Source: AKy350YtJE+3mNKba3ocsgbYm2Dha3yDZ3v1dKqEpmzvf3prwqSKehffA6fDzpJVCOnMu4oNzeBJVQ==
X-Received: by 2002:adf:e542:0:b0:2f2:388e:67d6 with SMTP id
 z2-20020adfe542000000b002f2388e67d6mr4099139wrm.46.1681294835253; 
 Wed, 12 Apr 2023 03:20:35 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d62cd000000b002c70ce264bfsm16925963wrv.76.2023.04.12.03.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:20:34 -0700 (PDT)
Message-ID: <650d7a14-5752-26d3-70a3-07d47e04fb14@linaro.org>
Date: Wed, 12 Apr 2023 12:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 2/5] target/riscv: Add support for Zfbfmin extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412023320.50706-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Wed, 12 Apr 2023 10:20:41 -0000

On 4/12/23 04:33, Weiwei Li wrote:
> Add trans_* and helper function for Zfbfmin instructions.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/fpu_helper.c                  | 12 +++++
>   target/riscv/helper.h                      |  4 ++
>   target/riscv/insn32.decode                 |  4 ++
>   target/riscv/insn_trans/trans_rvbf16.c.inc | 53 ++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvzfh.c.inc  | 12 ++---
>   target/riscv/translate.c                   |  1 +
>   6 files changed, 80 insertions(+), 6 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvbf16.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

