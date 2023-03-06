Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBAz-0000wz-1M
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAr-0000ux-4E
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:46:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAp-0003P1-J2
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:46:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so8213921wmb.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 05:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=kTkpyZfHmLwD33iRcyFXfmwA8L8hVnd6JkVAZQSP/F1qoguqXPfZAuhP9rS2OfgXJc
 dfTQzZnG/TNNLVsc03zYPyyspe0jAFqwZuXhmQthsMu7h28frQGBRGkRzOkljsNLV8Ze
 k5LeBMiqkm02f90f1br416MRRpsAGQyde8PkUv6O6ScPFC//a0YkXWoEIy7Jo0HrINVU
 /CwoTW2+quwxK9IgHtQtWCSmT2mYUP6vR1xpgeiU+9i37cWOfYgf4huMF0eU6lSOIYPG
 +UXfJGwr8W5ilSp3oChj3rXqiPkIgScgzYvjFAyhh8ldZWjTuu11C+Wg92M5AI5IjZmq
 28OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=Ysve9kFnnkQHggLrH00E7a60ow64LKDDrvNZ9o5vZMiJgvfJLROOC4s8NNTgvhRkn0
 pyY8+zEDx+7+Uv5p3ydEaoIJkYUZXuT85EUweEB7hwf9sp4ulKy97+iQ7IpsJQG2j7iq
 ZNEjFL+iuE/y+w3RV2FHhJBRX8+/BegJM/yAwdPbOO5ZMByhrOdv0Qh7AIj+1/i8ZK3q
 GWwFhIfSSEhdVl7+BYRVY2mQhDzKYpVmleAcXz4k9evrjMoiFS+j6rfhwwomE1kNw8gP
 BgNoWuzNuh7I3U3bAFtGlV+jPB93hzWF7XNaJlML7Vbe9BALTYHPHuc31qRGrlvAf4xY
 sPNw==
X-Gm-Message-State: AO0yUKUHlfxmejK3zbKQgH7VmQ6vRmz+IzT1Mp9rNU6loPuAp9c7+4a1
 EAJCiXxBRs+dfO49aKhRokyZaQ==
X-Google-Smtp-Source: AK7set+jceZd0PoJBJ40YpVEnsqykgKK8sAXq3rjd3wpP2o3NQEIy9DhdTqU1ovoSrCs70sQjaTMdg==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id
 o39-20020a05600c512700b003eaf01d2346mr9578742wms.15.1678110402130; 
 Mon, 06 Mar 2023 05:46:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b41-20020a05600c4aa900b003dc42d48defsm10447543wmp.6.2023.03.06.05.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:46:41 -0800 (PST)
Message-ID: <605a242e-f5d5-788f-fc78-e24abb186ee7@linaro.org>
Date: Mon, 6 Mar 2023 14:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 33/70] target/mips: Avoid tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 13:46:47 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/mxu_translate.c           |  4 +-
>   target/mips/tcg/translate.c               | 56 +++++++++++------------
>   target/mips/tcg/tx79_translate.c          |  4 +-
>   target/mips/tcg/micromips_translate.c.inc |  4 +-
>   target/mips/tcg/nanomips_translate.c.inc  | 16 ++++---
>   5 files changed, 43 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


