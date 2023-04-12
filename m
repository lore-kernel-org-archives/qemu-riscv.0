Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmXd3-0006e9-JD
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXd2-0006e1-OS
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:23:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXd1-0001x2-2R
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 06:23:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id v27so1128951wra.13
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294980; x=1683886980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7KSLShETURCw+/v0Lf/BM/x+QDDuxdvZ7GRc6yX/CVw=;
 b=D8ihJPUaigBIwxj1shQGhv9A1wnUh1ej8zM0Otk2UzCH0MRnVUIrYnKV2JttSuEIFh
 2VKMD/Z8Bo7psWx9794WQWAri51Bxo8iHk8+4oxpBm+ZEwuXiocI8VWoGkC2VFyDgND3
 hKPpgLFPMkB7z0I9FqPIrStTyvQ0seUum5q17ysihRKLvBSM3D7m9hWvpuBEWFq55ud8
 XkWCjYqPHpH2W2f11f5X5ZhjEu/3VgQT10Te/mtZrh9HGtvkQbAlSYrLYb7n+o1nMhz1
 eP0gAreT+vca98kk3rwCrntDTPSK4mNzlidLIF7nX9R81vAPRAt52MheULrjnW+2ozAm
 r01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294980; x=1683886980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7KSLShETURCw+/v0Lf/BM/x+QDDuxdvZ7GRc6yX/CVw=;
 b=XsTniCyqfJMgxI3kIEODz5QNp7GFJ83SLM2Us34y/pRCJbG13jYt2HRWEIQ/ULdnsM
 YLSrplGu8i1gi4dfGP6J4zEnB2MbDHthb7LXGp/6p41yJmqZqAclaMfsKyeNf/F2Ug+m
 fVqnwIYrM4hFCr1UIgznZKmGmxalVBrJbplGwIc9zBzg5Nm6CFKj3jM93eINwIfwX5+V
 BnUi9XAcUxhPE2zvV8Et0cIYoVmmm/0aa9IGBMQe/N5qmAT2nuhT2mYdDHd9lPpA2ziw
 L48gmZj/0qgPyh8FF9IagIPxTNgX8LZO3uJWKG8VDxermLtTzQmRl88+ERWVPnHgQP/i
 Lvnw==
X-Gm-Message-State: AAQBX9eIjO2thHzsc2E5KDBaTG6lgfG3UlZVM6fK0/s0IhswZN5h+qTY
 fHm2gEnfhC/FYd5aQSohv46p8w==
X-Google-Smtp-Source: AKy350ZUCHL4PgdrlLrqpxxEp4PGK8xbqgGc2LWpY86M6s6obyMhC9zvOCTH5vS1VLuip49jp6x02A==
X-Received: by 2002:adf:e750:0:b0:2ef:b4ac:8e5 with SMTP id
 c16-20020adfe750000000b002efb4ac08e5mr6776413wrn.28.1681294980198; 
 Wed, 12 Apr 2023 03:23:00 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002e4cd2ec5c7sm16861182wri.86.2023.04.12.03.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:22:59 -0700 (PDT)
Message-ID: <42166203-10f9-b6e4-9cf5-7a15131d58c8@linaro.org>
Date: Wed, 12 Apr 2023 12:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 4/5] target/riscv: Add support for Zvfbfwma extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412023320.50706-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Wed, 12 Apr 2023 10:23:05 -0000

On 4/12/23 04:33, Weiwei Li wrote:
> Add trans_* and helper function for Zvfbfwma instructions.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/helper.h                      |  3 ++
>   target/riscv/insn32.decode                 |  4 ++
>   target/riscv/insn_trans/trans_rvbf16.c.inc | 58 ++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvzfh.c.inc  | 13 ++---
>   target/riscv/vector_helper.c               | 11 ++++
>   5 files changed, 83 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

