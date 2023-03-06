Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKch-0001EE-1g
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 18:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKcf-0001D5-MQ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:52:05 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKcd-0000az-5v
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:52:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id q16so10544641wrw.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 15:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ri0swZy8TWMBEHxIghErk16g0IdpnryrsBu51JMMGN8=;
 b=pUAfWhl/ACk14M4SdLfkVS2C/l98BKAQHbMpis8Y36ZCzjKqpGLaw3tzAIBtEhp24z
 30W2bAVYsXJfK7wm5E+nrp/Un38iC0n+YQmwBM8IM+qHXemPwK0Wz5AWVbFtak08H8CG
 uf6O/iqSYNqdkxBemQ27uXRnkkcK4KGwit8Yz5+ZALSstvZIbgncGIwfo/IihSkOCL6x
 oybzKlyfsEUj3b0PMXJNt3YYDOnB3K/kwIgmbXlSRHnhBD/29xThN9sLmWdk/hESRhBM
 JnJkagO8pHmWJMZuGp/A9rNEtc3/375f70MhdT8xXYiwSyv/W+NPQbLOBlzfL2GaLPpI
 IcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ri0swZy8TWMBEHxIghErk16g0IdpnryrsBu51JMMGN8=;
 b=nCw6UcicskFvecmmb5KXxl2Om+fTZcWrZBntWgghchH0K/kLe9W7z8OdzCYOQ8QQPJ
 d9p92BtILx6ybVnTeRcXgkjtKD5I/YMlWM+5nKHJZC265UCxnUXKzBGVzx6Iwkaeetsz
 /ztYYL4+o+ouNNOOQ/XaR15KTwQodb9057OmTFHJC3jvIcLyDDeGOdk2YNJd/4JcJWXC
 iumWaEvk7kTnu+C3CrX6h80OQubVdZ16XkAa4/8pihavbpYJybETdNFCczXVAyLSf3dM
 WePXxdEJG84hyWEy1AVzsK/QHPQCqyVTq6cKQ+Du3PBpg4++d212WqgbK0VJYXi+psm5
 RiiA==
X-Gm-Message-State: AO0yUKVVEy6IPU3tbtZ8zUwB7L443ZdueL41BkEg0w4oX5CehTpj0/uB
 9NdTc697OfztYnDGZfheF5ZV3w==
X-Google-Smtp-Source: AK7set8mtMHno2iIxM4nluQZywpNyiC7RemIvSV770k1W9HlD3TW6gupY3n8K3+UF724HQNYLbLJ3Q==
X-Received: by 2002:adf:f191:0:b0:2c7:d6e:7e6e with SMTP id
 h17-20020adff191000000b002c70d6e7e6emr8437006wro.24.1678146721331; 
 Mon, 06 Mar 2023 15:52:01 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 s25-20020a05600c319900b003db03725e86sm11355189wmp.8.2023.03.06.15.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:52:00 -0800 (PST)
Message-ID: <cb137615-5923-837b-c190-f76c1056dad6@linaro.org>
Date: Tue, 7 Mar 2023 00:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 21/70] target/hppa: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 23:52:05 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> All uses were read-write, so replace with a new
> allocation and initialization.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/translate.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


