Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6XDD-0006kI-TK
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 08:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6XDB-0006jb-Lp
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 08:26:45 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6XD9-0001Sp-KB
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 08:26:44 -0500
Received: by mail-ej1-x62d.google.com with SMTP id m18so12122541eji.5
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kWlgrLwh2G0tcInwO2C1v8159j8JCrk459ZJo/zkp9I=;
 b=bZ0FzjCB0nv7B/HNO2eUYF4cAd7KrUb7ckMpZRjuEgM92OMqwr2CHXJ33lbYkDe8IE
 QWXTkXJWpTAkY8BpHp0kLBRwNxKXTeFBkrgcGXJYSGTUSbqK1WtMVjgNWlbCO/pCpZ2g
 b+AvvoDBm7ceRnF0P+DugKTWXg54sLXXAvXAWXO+8y93aBBAPSjKfKPD8q1PlN3k3SIQ
 Z+uX6j4xf9BCJXVk7E2rk4QlxqBgiNcspuQVQBIt5R5UOM2JcI0o7pPlyHvXm+SRvBl1
 +mFAlprgfux+zs3c6mvAvVta9RqLkvQYwC6+vUSKwsk1embY9/v121g6fjMNSL/LQyZn
 3/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWlgrLwh2G0tcInwO2C1v8159j8JCrk459ZJo/zkp9I=;
 b=YlhP7yAGKVmLVRqzVAG4bMC3LoGR+3AjRnLvPMhFi3j51LRB077qrWknI8iBLLkdKQ
 8DFFxbCkI9Bfmrhs4aU6NcFASZERCWL7siEgh2usqkMeUOyMKsCpoDE9/fBkyZZVW3Pc
 PZl6beYEdwFlE7RGpW5JL+I7We6HS6f4R1atJ3I9hCFxCA+J3ITQiwr6p+VNAmUJVJL4
 QbhxXrdjS5dsyDzfyBBQzmC4qfEcKTvA0Oryt4Io9nNtneoPEL1h6VFyUz10oyBlv4I5
 XRoDdN9CxoVInIggjQBorK64/pOMISA/KFKjxKuEJj07+9ZHoW5xWZomjMgyodGTADP9
 y7jw==
X-Gm-Message-State: ANoB5plSlm16jQwCdwjDtidpj/ot+JdhzW979bFrdde+WMVwEIXO8k09
 r1xn/IXdfDZo6Oz0Ewk6Rwmn5Q==
X-Google-Smtp-Source: AA0mqf5aL43z8spYateviZivsoaWUfO6YeGU0C4yjwgd3A/tY9wG0CMsHRoj6gGfjzUbiGm3EWAhYw==
X-Received: by 2002:a17:906:7712:b0:7c0:4ab2:66e8 with SMTP id
 q18-20020a170906771200b007c04ab266e8mr32209410ejm.70.1671283601562; 
 Sat, 17 Dec 2022 05:26:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cf25-20020a0564020b9900b0045b4b67156fsm2007899edb.45.2022.12.17.05.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 05:26:41 -0800 (PST)
Message-ID: <eba81a62-44da-1903-d5b1-18020e53b4b3@linaro.org>
Date: Sat, 17 Dec 2022 14:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 03/10] target/loongarch/cpu: Remove unused "sysbus.h"
 header
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-4-philmd@linaro.org>
 <58744897-B124-49DA-9EA1-79403F319038@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <58744897-B124-49DA-9EA1-79403F319038@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 13:26:46 -0000

On 17/12/22 13:26, Bernhard Beschow wrote:
> 
> 
> Am 16. Dezember 2022 22:05:32 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Nothing requires SysBus declarations here.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> target/loongarch/cpu.h | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
>> index e15c633b0b..c8612f5466 100644
>> --- a/target/loongarch/cpu.h
>> +++ b/target/loongarch/cpu.h
>> @@ -13,7 +13,6 @@
>> #include "hw/registerfields.h"
>> #include "qemu/timer.h"
>> #include "exec/memory.h"
>> -#include "hw/sysbus.h"
>> #include "cpu-csr.h"
>>
>> #define IOCSRF_TEMP             0
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02628.html
> 
> \o/

=)

Please ping me on your flying series, I'm trying to catch up /o\

