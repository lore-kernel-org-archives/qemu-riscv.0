Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3My-0008Kj-29
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3Mh-00088j-Db
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 22:04:13 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3Mf-00071f-A1
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 22:04:10 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so9380034pja.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681178648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A/rXlUaTOBMfqnsZ4WhTJq2+AC4/ZxhPhGzM5cLA1/M=;
 b=PJGH0rr1TJWJwS2WbC1ASYw3Yiw1fQr/0sh6Ccf6MSSSikGaCTc/lOZZgywjddtvr3
 u2uF/hCU1IJLltGv0W0vBLkylaRlA4EYd2KH1PKpTnryRGPunlceBgsYr8GSGXoKDsce
 /yRJnP8+HGR6Zd8tcHfYXjXvN3K0d4/yjroJougxbX8bjcua+k7NE0bxMJgCkekFySWf
 KNOgOdHKqiQC89/mal5tp7cvDjcABBBiPs0eDgkCHvBu19A32H/t2QazUB6EyrGzQ8zq
 MuWxf1K4G8dgQz2cWbMC0vm9/gr0bOWj3jVE1kBdl79saVu8JaT/J74y/hT18eDbN56E
 5O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A/rXlUaTOBMfqnsZ4WhTJq2+AC4/ZxhPhGzM5cLA1/M=;
 b=JFL1tCwzPtI45XMBmWj7cuLYdqAVu3pWrAIvdS2+xXLO8PIFGxtdVAiUQi2fVm9Jm6
 X2qNH6TCj6BWAR3FVKPIKxExgK7/WxMzXkEKsnPgjAmoOIJbIPiqPa8dOEH4jWFKUwvW
 jJxgq1kA+VwQLVQKe4bDrJ1X0EGzHhUIjvK+5seMSS1x+1eFsCzV0yKPOcfsb4aIvkEO
 Yrpzs9wPwUMXqtAZpmxF10uhyn6oikBaA2Pt3s/Pzktu0o6OkqSsdukDJmP7b4EXr8vN
 TPPdNP0XfK6CxEGH78zHQSbz0fTuTLVsvZDjmiu1uK41wlk0RXbmK4+33k4hek4EXG3x
 YXRA==
X-Gm-Message-State: AAQBX9dIwsMQIqDXnCb9UAV/vEDVicYVVXdMGyoAz/+pMWyvzoKEKTgZ
 z/vCOGa+QqEjqKznD+q8NwsZZA==
X-Google-Smtp-Source: AKy350Z8Uqm2JWBXvRCstOtc9m/lab5HqDGhSXiTAk8Ft809wiyaKDGi3C/AznRhuw4bRf8WN3i3zw==
X-Received: by 2002:a05:6a20:1326:b0:d9:3257:f2b3 with SMTP id
 g38-20020a056a20132600b000d93257f2b3mr13260120pzh.40.1681178648079; 
 Mon, 10 Apr 2023 19:04:08 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 f15-20020aa78b0f000000b0063aab52aef4sm669844pfd.152.2023.04.10.19.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 19:04:07 -0700 (PDT)
Message-ID: <7bdf0305-bd5f-68d2-525c-3ec8106f90c5@linaro.org>
Date: Mon, 10 Apr 2023 19:03:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] target/riscv: add 'static' attribute of
 query-cpu-definitions
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
 <20230410165251.99107-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410165251.99107-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Tue, 11 Apr 2023 02:04:20 -0000

On 4/10/23 09:52, Daniel Henrique Barboza wrote:
> 'static' is defined in the QMP doc as:
> 
> "whether a CPU definition is static and will not change depending on
> QEMU version, machine type, machine options and accelerator options. A
> static model is always migration-safe."
> 
> For RISC-V we'll consider all named CPUs as static since their
> extensions can't be changed by user input. Generic CPUs will be
> considered non-static.
> 
> We aren't ready to make the change for generic CPUs yet because we're
> using the same class init for every CPU. We'll deal with it next.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu-qom.h        | 3 +++
>   target/riscv/cpu.c            | 6 ++++++
>   target/riscv/riscv-qmp-cmds.c | 2 ++
>   3 files changed, 11 insertions(+)

Is 'static = true' really what you want as default?
Perhaps 'dynamic = false' (considering zero initialization) would be better?
Do you want an attribute that can be changed at all?

You could plausibly implement this via class inheritance instead.
E.g.

static const TypeInfo dynamic_cpu_type_info = {
     .name = TYPE_RISCV_DYN_CPU,
     .parent = TYPE_RISCV_CPU,
     .abstract = true,
     ...
};

and then the dynamic cpus inherit from that.  Your dynamic attribute becomes 
object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYN_CPU) != NULL.


r~

