Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNgfw-0006tx-QJ
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 16:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNgfw-0006sY-7P
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 16:27:04 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNgft-0002VT-A7
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 16:27:02 -0400
Received: by mail-qt1-x82d.google.com with SMTP id x5so6370332qtv.9
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7kvCSjUGbtTiTEBzCyfkVe/cnxqgIrI2gkhLBAH80cE=;
 b=IX3afyZr6GMYKFotwlsFribmqXeF+YEQEjfChL5dzLFu5/TuBVUr0tXmm+nyY5hr16
 /PscQe46oZj0GS4+Q0Fd1JVRxwgLYwQgpz/8a1HDrtGkqwnTYfIqK0CyNnyvwjqNEbL/
 /6g2SGth2y6afnDduU6ticJ0PClb3o/JJLZqPxUMTYT55sdG+t0yc0WrhOW3xQXiQ/Az
 wgQ3WPgsKYSYyI5eCm36ziimSi8hDjzmZYDFBTS508bF5Pnjke1rVl4JJM2Ahfxxmoyw
 +c8YV0X+zGmXqL6U+8LuIoJbutTgisy0Mdnd6Q0HnOsIcwjiV174phSfhCxr2EfHxgAC
 xmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7kvCSjUGbtTiTEBzCyfkVe/cnxqgIrI2gkhLBAH80cE=;
 b=O9JPCZb98qcueoRmjvuGBqR/cy3GO7vdINOMLnkdTvatC/qio0IMbaGgPIu/5p4bln
 GxVdqMRGRpPAvVAkgXCDaYDQVl/C7VMmWzGVUomQFoNz/P7N+Hda5BMRhoZ8ns/Gg/Fd
 72NEVPD9472WfuXu2d7/m7hQXUNgLSQm2eVevggYMUypT3XqP49qAApiew24sVIEXUsr
 qoaSzYSP7XzUqGYeXlxdqJwpkqCofMwVg3ksE62UbCD63G8MGgvUXnOdcUFhZgNx78R1
 NDLbOlw2tcxOTsAVWPqX8bFcX63hkIjy380QRgPjhiAV8TmLfPUsvSxs6C1TCIsvXcz+
 fpIQ==
X-Gm-Message-State: ACgBeo3YHYxWapSF4Gm2f3KcavSY0Lp8nkO+G72IipzN415HY7sgn0JL
 wfRrp8Mv+31bcByWGug2Z6YAtw==
X-Google-Smtp-Source: AA6agR4imi8S6bmmh3CWG/Q12I+YZIJaNpTGmLDBUea6LH/R7qo/8etEMthUPrYeC1qRoWObvcbpfQ==
X-Received: by 2002:ac8:5ad1:0:b0:343:5e13:795d with SMTP id
 d17-20020ac85ad1000000b003435e13795dmr15694290qtd.625.1660595219306; 
 Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
Received: from [192.168.125.227]
 (173-11-255-51-houston.txt.hfc.comcastbusiness.net. [173.11.255.51])
 by smtp.gmail.com with ESMTPSA id
 a8-20020ac86108000000b003435bb7fe9csm8443384qtm.78.2022.08.15.13.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 13:26:58 -0700 (PDT)
Message-ID: <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
Date: Mon, 15 Aug 2022 15:26:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815190303.2061559-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 20:27:04 -0000

On 8/15/22 14:03, Peter Maydell wrote:
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.
> 
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/riscv/cpu_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b2..49c4ea98ac9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>   #include "exec/exec-all.h"
>   #include "tcg/tcg-op.h"
>   #include "trace.h"
> +#include "semihosting/semihost.h"
>   #include "semihosting/common-semi.h"
>   
>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       target_ulong mtval2 = 0;
>   
>       if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(env->priv < PRV_S)) {
>               do_common_semihosting(cs);
>               env->pc += 4;
>               return;

I think this should be done in translate.  We should not have the overhead of checking the 
three insn sequence around ebreak unless semihosting is enabled.  Note that ctx->mem_idx 
== env->priv, per cpu_mem_index().


r~


