Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOXS-0002CF-Lh
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXQ-00029c-OQ
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXO-0007F4-5u
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so3811453f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451677; x=1685043677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L1oX0IUmN6a1E/gKUL7LjPtwnHIjzCfveBQHzkwnpoM=;
 b=Ea+Uisb4N/yRnaCRJ6SdIK39PwKo5kqHJxWoz8NR8J5hT1cr/KqUdFyWd1F9dAwo4F
 EuBmM3gWU1FMFDeXy0Aal1v6AkyXom9wAr6MrxYOzVX/rSFQp9NxKbWKc0fS602p54PO
 msQ4lYXIL+mJ6/P09nnPzS185L9R3HDasKOMLIO6jB4M7EgPdhU81q33II6DL+dgKGsG
 6QmreFgiE4lup9YZIqy2TEMC5LY4VamzyKTejqGl11qxF7onlKbqH2qVJftrD9EkAjyh
 e+z5Xhs/npcpLGnWdCaYF4X0TkqOrQoELI9lVCitQVi1SvNEjTW0tLRiVhPOOmRQ5+UZ
 bm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451677; x=1685043677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1oX0IUmN6a1E/gKUL7LjPtwnHIjzCfveBQHzkwnpoM=;
 b=l2wZJSekhjMAJPE57bqeONVmCOseRUO9zxmH9o8w/4EnSj/jWOVv5OaTcpM5j8uhIt
 H1/2Py9gSwxETdXWEpKzQ6jQCgZUZunXdDn28djKsIYcIuwKgkhLwgB5HXD41m49d1EU
 w/KQklMAmKMTmG2IhaUXpbFR0iYDAv+mOUwZK1e8Ppq2ZZPlG9dA93ZABvumHlmihho9
 TSBmC4pPASJ3y4AdiAUyX3eWU6pUj112X65JRh0il6vhVwhqB0rOP0OpmN3hyzRt7e8n
 sXjL2Bne9RtwUo3y/lAs0o5xPtSz6CsLEcVxGRW9hjRfGLFayNNonTYrI2x4cwjT64OZ
 LapA==
X-Gm-Message-State: AAQBX9fx1m8UCGKbL4KN6YWcF7dRCC/PS5iqWwpmwPMXN+YydQw5qAPA
 KdIuijM7NqZHTw0t9jqB2HFbUw==
X-Google-Smtp-Source: AKy350YGDrsNLTbqTzUegfWKws00heSPIeftkaf92KK+Ywrlb3FmLlZMN2JSlyilpWoz6jOrWhbyMg==
X-Received: by 2002:a5d:5252:0:b0:2dd:a3:c2e8 with SMTP id
 k18-20020a5d5252000000b002dd00a3c2e8mr12468234wrc.44.1682451676733; 
 Tue, 25 Apr 2023 12:41:16 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d5402000000b002da75c5e143sm13803219wrv.29.2023.04.25.12.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:41:16 -0700 (PDT)
Message-ID: <ff19c274-0252-cc5d-ef56-0643fcebe2ee@linaro.org>
Date: Tue, 25 Apr 2023 20:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/57] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:41:21 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept zero-extended in registers, via
> omission of the REXW bit, we need not extend if the register matches.
> This is already relied upon by qemu_{ld,st}.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


