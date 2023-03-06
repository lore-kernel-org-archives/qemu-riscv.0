Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCqJ-0001rB-Vh
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCqI-0001lr-TQ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:33:38 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCqH-00021F-An
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:33:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id f11so9241260wrv.8
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lbbLOVKHkRk+7r2ZXiU6jTEDatttkJTN2y6ZqqHi/iY=;
 b=WBut2yjki4D/8GxNBXuQ4xpHzc2pFLXqSGTQ+UaK/hYqivzjz9OppNrQIsInxmDa2T
 uai3o1i1XdbpFr49bTlPOfBDBMPxCX2PSUpDVQFLTA175ts1XkxfQmCpDzQk1X0i6Ufl
 qT1yfEAgvzycuq4iUbOYcs9z/PvZvx+yxnOurYGbXaylqwId7I8NgQmz9QV2cc3fU78A
 zHHwr8sPcUY9M2h3/Q/QOi/X/AbFCjSLCURMPyLddYSJ/lW+Yhy9VYnYS27ivSOJ7i10
 lu8Poc0cWSLeA0oyVVbR4tYlyZVChcjehMdblz+H4b5qvIIDnt3dCgjbID15TLKslj1w
 LTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lbbLOVKHkRk+7r2ZXiU6jTEDatttkJTN2y6ZqqHi/iY=;
 b=FKBdkeG2fKdrI3zte/YS6y2+W/716erGGyhoy2uizrrxchKyMtyG3fBoeX90AkqeZi
 O2HSzWWYr5Y4hVJb9npmOXtGqzC5/BFcavVTL37977G8tjxK26HrrkVf4fGlTiu2sIOV
 nddyIxIwLEFC3z4SEwMD0fpgoycieJ3XmjhvIiY8SQXm82eXgDHwReXZITo63KoE3YEl
 fQgAMw3KQjIXBt/bx4TDK/0wp/BO/j9JAsFuJo6dWMwxEPOGfNtdH7EP2rgrug0OuGyT
 zbIWtcW+D/ScjIWhY5coOjXVmpI/c4NccRsJss1tRMggMqO6OxsAhKcjX13voP28qwk7
 q97g==
X-Gm-Message-State: AO0yUKXm4ngMW9XN+JjYHd7wuh6YVTzdTZ2z4KH8KVgx08fUwrdriuga
 QTZmRD7HmE7na5iKYYIS4xbGQw==
X-Google-Smtp-Source: AK7set93eR4s6ApmqtRwumq5vkBLQUPTC6cGIrdzi6kW94fot2ggfQ2myzo2lDeeSZ5GowAjIHO4Zg==
X-Received: by 2002:adf:f8c7:0:b0:2c5:52c3:3f05 with SMTP id
 f7-20020adff8c7000000b002c552c33f05mr7133749wrq.37.1678116815989; 
 Mon, 06 Mar 2023 07:33:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6706000000b002c573778432sm9932658wru.102.2023.03.06.07.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:33:35 -0800 (PST)
Message-ID: <e668a393-c709-b2a9-5836-0a39e41f8944@linaro.org>
Date: Mon, 6 Mar 2023 16:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 68/70] tcg: Replace tcg_const_i64 in tcg-op.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-69-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-69-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:33:39 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> These three instances got missed in previous conversion.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


