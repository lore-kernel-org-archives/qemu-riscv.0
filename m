Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgrJ9-00029r-3W
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 14:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrJ7-00029U-45
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:11:02 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrJ5-0007lj-Kp
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:11:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so12615843pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 11:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679940658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FyG8/kHuFLzlJCJ+7W6VUMb7LHSaP66RByXTP6tKQ9U=;
 b=DJitybBwNdtL7OpEifmbqrQKwtP/TPQpocdBJxyqYy7GRxzgdsmVn1z0xTNK9pZGxx
 h4JOOXbOnOxSVP3i36pVwj3jplVapJMebmIhdALZzzUp//j0mnvGRiVmjBj/8j+XY6nn
 9oNQbSuCPMEk1R7I3xh+2irSXH3gi64rzVBsB9blktDyRn7hBfHcu6YIX+TS6rhT2QoO
 3a3ycdujCTKE8Auz9uKySiytJv56FrLIaozUGBZo2/uH8/r15ZiptB58N9LBqshzJbZt
 1Iwb4kmO6Qe93/IR9oP0GVa/5/wnzRkrmA0grGAoOpFaTRHm327Qu173Fz/7XmrbpEWn
 +74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679940658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FyG8/kHuFLzlJCJ+7W6VUMb7LHSaP66RByXTP6tKQ9U=;
 b=SZlLomyfHCpV3hYIiQiSi5jEY1n2/c7ST+bdQXL5IoOClJ5/rhBTpxc9dB7FCeID+u
 V9HfkNJEnaOi/0iAivenTURm9irc8OY1Ji5Pa1YIlYE6y6OMbuoP+PN6CTw4BJ9S+Cu2
 DFuwDHtLperz5TYJAwn2UTihAdyY7kzWJIAM2U4Lx+EVz5T8se4v9rBh1R2oDKJyD2e5
 DJoG6WSOHsRuDMHfO0qx+UjFiGsO7SAqRo3PVtj08LPLWP6uBzU54lwjHqca65PXhxgV
 YSQb6u2oRImKBcq08zQx2a2dR8EFLmjGarn22cFW27ewiyr3CiM7LvjEsFOXTTpcoaGQ
 EpnQ==
X-Gm-Message-State: AAQBX9diuMUlo1xw1xfdMUM2sYZY9D4WRrBtVNlGWeh0QDt2tXoUGj87
 eQtPaZZgTcwQvGv+5Q5PLupVxw==
X-Google-Smtp-Source: AKy350Yy+L+Z4Vo7ObX1zSE8+lEh0y4EcevZTqQNhusY1Rb+md80YOC/6vRRkYVOQvVLnStU1MkcQA==
X-Received: by 2002:a17:902:ecc2:b0:19c:da68:337a with SMTP id
 a2-20020a170902ecc200b0019cda68337amr15976895plh.31.1679940658081; 
 Mon, 27 Mar 2023 11:10:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 jf9-20020a170903268900b001967580f60fsm19468597plb.260.2023.03.27.11.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:10:57 -0700 (PDT)
Message-ID: <27b4d21e-3e29-e0af-ac5f-47a84f36ff12@linaro.org>
Date: Mon, 27 Mar 2023 11:10:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/10] target/riscv: Remove riscv_cpu_virt_enabled()
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327080858.39703-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 18:11:02 -0000

On 3/27/23 01:08, Weiwei Li wrote:
> Directly use env->virt_enabled instead.
> 
> Suggested-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c        |  2 +-
>   target/riscv/cpu.h        |  1 -
>   target/riscv/cpu_helper.c | 51 ++++++++++++++++++---------------------
>   target/riscv/csr.c        | 46 +++++++++++++++++------------------
>   target/riscv/debug.c      | 10 ++++----
>   target/riscv/op_helper.c  | 18 +++++++-------
>   target/riscv/pmu.c        |  4 +--
>   target/riscv/translate.c  |  2 +-
>   8 files changed, 64 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

