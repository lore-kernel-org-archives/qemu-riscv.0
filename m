Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3F6-0004xy-Ld
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3F5-0004xa-4g
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:56:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3F2-0005UK-Lq
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:56:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso1577118pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681178175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a40LqqFQ81uejjkElYBRcj562e4Rbwns7ss0XDmJbiU=;
 b=C0H8z7pVo1/X8IH0gKIPXHfKESZXRXS4lRmTCHP8lngb/A1ZNWh9vipIHpghAxrfaJ
 FWExAOsOkr+p4oLoxWSeI7+3HyH+MpOHFyDwT8a1JdIQvnrhpxUbvVvkR29cIyhZ/Nxc
 04aSJVZAL+7eONEr66oC+CMSXRL+43yhhloSlOnG7APBwSFJw6nE1ua3bXO4Z6071Gz0
 7M6qHH332cMptTZdejJz0O/BXHKEyudt70T0pGGxPO3MUsDp6sRe6jUX4/MrvUBHHSFB
 55kkRPreVCJ99GYZbVZCnh5/qvV3I8bC3nYlUZ21Zy4ITqP+fmV9KsnWujm2pQCMnabI
 Njsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a40LqqFQ81uejjkElYBRcj562e4Rbwns7ss0XDmJbiU=;
 b=N+SEIRD1Ugj33vuhXZo3vfwtft0OdoJCIIB/Ao8Rb/HPRSPwTWerqk+042ysQaEigp
 5rqBfN7Qe6yzsdh6cTZBUy8yErJ7xDDtWLsskqDbHxlD0pWpAInMuwxUzTE/7djMKhzf
 tejMsTGx0cxu0uHVlDrQPglQxYLu7dDxm9csHQ211dSDBa0gYrXMWW4v8vuCemx6xxnH
 SaoZa/psBYWIgMvS+FrhlXj1ZdEVP5pW4phWe9SJV7QM/zUKt8637jOpIoRL8PZ/ugAN
 8ztHJ2AJd9sstNDYZtVufvVSLj7qorWkH099hqOabpWNIqhJHoIpdIU1seOqkPIeI262
 sGMQ==
X-Gm-Message-State: AAQBX9d5VNBX8wOIm/+x4Fg/ZC8KVxqo9GDTloSX3bewLNL5QQTWnUmV
 EJpfu/nz8ZFkAvzu0rCiz7lWWA==
X-Google-Smtp-Source: AKy350aDRygf2tULQsfQUF4CcBbXHzRJg38CTw+yS3ngZ9QGa9npA5kURZfblc7DYM8Vn5x3eOzUCQ==
X-Received: by 2002:a17:902:c945:b0:1a6:51a6:ca76 with SMTP id
 i5-20020a170902c94500b001a651a6ca76mr2432310pla.11.1681178174892; 
 Mon, 10 Apr 2023 18:56:14 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1709027c9800b001a05122b562sm8364960pll.286.2023.04.10.18.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:56:14 -0700 (PDT)
Message-ID: <fb45b129-2f3f-ac88-5875-ad7e87e1e0c3@linaro.org>
Date: Mon, 10 Apr 2023 18:56:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] target/riscv: add CPU QOM header
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
 <20230410165251.99107-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410165251.99107-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Tue, 11 Apr 2023 01:56:19 -0000

On 4/10/23 09:52, Daniel Henrique Barboza wrote:
> QMP CPU commands are usually implemented by a separated file,
> <arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
> This file uses a CPU QOM header with basic QOM declarations for the
> arch.
> 
> We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
> but first we need a cpu-qom.h header with the definitions of
> TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
> cpu.h to the new file, and cpu.h now includes "cpu-qom.h".
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu-qom.h | 70 ++++++++++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h     | 46 +--------------------------
>   2 files changed, 71 insertions(+), 45 deletions(-)
>   create mode 100644 target/riscv/cpu-qom.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

