Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO2Ik-00016C-Eb
	for mharc-qemu-riscv@gnu.org; Thu, 01 Oct 2020 13:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2Ih-00013W-Ak
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:23:27 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2Ie-0003tA-Ms
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:23:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id m12so6266627otr.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2020 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aadCQxrYur+RQnESnD9Y8brdfumKt2rm4LSnIfwNy7Q=;
 b=cGXvbEo1398dB0Fb42e+AoxJM+9yGteEJePrC1UOOPSkCV8w2Wocd6jG1ddCgT9BUB
 B1j74ngBNQW/1V9zpKWZRY33Ds5TXeZKwuGW10V0W4RK2bM/NffF1QbA9sfCJGg5JBd+
 tn2X1FrYH2OGWy6olz8ivVxiv+MFDelecoZqz0nJIYgr7T9rFvMvWVkz99Ta85fmxvZJ
 Mpin0MsBWH/aiLIJJbIRxRY3eXQREDN+ixL9Eso7R+OxKF7kJFluGxf/AnwZnxx15j4f
 QqZglNje2BYmtMYknCQ3eakeImPq6+FBU78j3OWqip9z0gOS6PycuQIboH/5p86/0mj7
 7rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aadCQxrYur+RQnESnD9Y8brdfumKt2rm4LSnIfwNy7Q=;
 b=bUi/gnXCjTihdccSkKSFoASh8dZC8zYCTERRCgKkK4zWImUQC0RQy0BtYpOEmaTG4R
 g8MsZ7YfG0srkxXiyuVlJmFEIBvg4n4ZcfwNYPa2DhU30ariHpcli9hP4thUOpNRH8q9
 1Zd76W7cea5T/wzgIsQMzJSujiP+k4SI5xH09g97VSbN8hu4F4WcIMsBLvvV0ozyuKKn
 Fy1M0/mQ3z72M2cgtLIwzfPI7QtarXJxPfl4rQSCtj1E6znllKF5UQwW6S5E8tqC0eps
 Wtxbqal7roe7XNJS9yZKCFIgwYfyM6+dr5wRUHkC7UYwms9gfnJ+qxljPw45IRkfW9LZ
 kduA==
X-Gm-Message-State: AOAM5311QTNZUWXwcI1kp0sBNmMl/fEmV68irCkXZSZUoYPv7pbv+jv9
 cwhGGNXBBxWxDx+HzV/HqnCRwA==
X-Google-Smtp-Source: ABdhPJyulHV+kxqrwa+U4JdcR336SKWaL4xTOn91XXOItuIg8iAoryrt7a00QtA46iCBzlaKunLflg==
X-Received: by 2002:a9d:7242:: with SMTP id a2mr3266767otk.186.1601573003398; 
 Thu, 01 Oct 2020 10:23:23 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s13sm1354517otq.5.2020.10.01.10.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:23:22 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/riscv: Add basic vmstate description of CPU
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 Alistair.Francis@wdc.com, yinyipeng1@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com, dengkai1@huawei.com
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-2-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b70824e1-aed9-1d72-21e8-ac444ccc9a09@linaro.org>
Date: Thu, 1 Oct 2020 12:23:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929020337.1559-2-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
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
X-List-Received-Date: Thu, 01 Oct 2020 17:23:27 -0000

On 9/28/20 9:03 PM, Yifei Jiang wrote:
> --- /dev/null
> +++ b/target/riscv/machine.c
> @@ -0,0 +1,59 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"

All new files must contain license boilerplate.

Otherwise, considering the followups, this seems ok.


r~

