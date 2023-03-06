Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZB5T-0004Lh-7D
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB58-00047O-Jh
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:40:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB4u-0001If-Ga
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:40:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso5195694wmp.4
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=tEuGeBxEJQ4EaB0AGrlzV91EVzQVhbHsQ7ctlcjvgdnWQNgdIjm9+bLf12/qBlDTRk
 04AURAUK9tNilNtmt148N3ttj7Mo2QiUJKOqnInWZaabObgnXz36QrIis0vfnm1Uu92v
 iFSAluxWeEWKkTkGoMtdzgvtTaqyi9kRc1Vv5j/fUpizJWnYupGik02bigLM0KG0F9+f
 Obzkn9gRNOTL/akLFGXSR8LcWgsdWaAZ5AtX/eYYurWareSSIHAk6QeZUDSrLdW/tSSi
 F/mE0NjRKJGKj3d1oUgQSvMOngMD+JHeb5MmOf8ABnm24Y95OSSZaQGUTAsX2pDUz8RS
 JR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=3yN4CFRagYQHhjoEYLWNZduT+OI2IpTYsmloVzJTbqLjPnLm4gY9IpQmcOk1scQF/Y
 +lubr7aqXDXTh+MzXHbgTAs2xhOK3qv15OLVHV+NGVlHOcG+cjC3J7TAZ2klbc0fTDTT
 qGewtLnKoVEwtLR8aMn9XOUYzlDiYRJlKNo1q4yQsgDTgM4ttzL84Qm63NaFL6D2zjuK
 2RMXS8VHufBJik4eBCljWGEpydfVfXJKvqnEntnvz8UQ4ogRHuWmhzbyrpuLw4UYXRDE
 6mv40cHok+q6IeinowXckGGA1ZJO4HMV779rYhMuy6kH24YWmVxu/5eu0h9mRcj6ms3C
 8cGg==
X-Gm-Message-State: AO0yUKWM642g6Se9TfBSxAhoadUWqr84X7gpM0IlNSYu+yyP0mUD57a5
 QSt57KEgQa16TBXWA7Ydl3UCtw==
X-Google-Smtp-Source: AK7set/cY1KHHh/Oh4wLuwsG7PKGePiL/bHrWq+6ZIdPr0Hep9X/M9jj0yOcy9FxFfL/l7a5h1+cNQ==
X-Received: by 2002:a05:600c:3151:b0:3d3:49db:9b25 with SMTP id
 h17-20020a05600c315100b003d349db9b25mr9881206wmo.26.1678110025218; 
 Mon, 06 Mar 2023 05:40:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm13682220wmc.47.2023.03.06.05.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:40:24 -0800 (PST)
Message-ID: <8c2be250-4c17-6fd5-f013-6825b8c9a637@linaro.org>
Date: Mon, 6 Mar 2023 14:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 31/70] target/mips: Split out gen_lxr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 13:40:53 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Common subroutine for LDR and LWR.
> Use tcg_constant_tl of ~1 instead of tcg_const_tl of 0x..fe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c | 116 +++++++++++++-----------------------
>   1 file changed, 40 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


