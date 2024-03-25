Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45306C54E64
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:52:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1roiru-0000LI-7N; Mon, 25 Mar 2024 07:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1roirp-0000L0-82
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 07:51:53 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1roirl-0004jq-0M
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 07:51:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so3065363a12.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2024 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1711367507; x=1711972307; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p+B9HA+Vo3yeONZaUTp3gGNqBQ5FF02I2NN1oNtG9yA=;
 b=OpqhYiPyIHgN0cH6P0eNa8q4nDVZYuMQAeeGobY8NzIvCsxokWX1Ugji01IR63G5gx
 CAmr5qY3bDCNYTsM6kueeePgqXlSEAwhZyuS4o4jVYzJKoVI0X5spa2owYjxAf7Rmqcp
 kCWzCDm4eSmHcZtS/RQNRmdgRecOfqAwixu+LFPQT9C5Nsgtw5Fi5vndOm2rV/eQhdMk
 RioWLHfxdAJl8MEQqhgNhT41wt+FVAvExrR/a4ZUXLqLByJqrCGcrY7Q0ORaIxbDcNj/
 1C1wra9wT94rxab/dixQSQpwAEjdEssdKfnZjLRw+QUmzUZyBF+j66h3wU3HqLH5pjaC
 gLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711367507; x=1711972307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p+B9HA+Vo3yeONZaUTp3gGNqBQ5FF02I2NN1oNtG9yA=;
 b=oZ+HsBwr/ywesS2VcZvpfHT6yay3PQ95B3hyZeMaPjhnRUmIJN6tkThUVe0fy6h8un
 v7OgH4vfNDGao31D+hni6e9DxnllREFpVDsvBkzsAucqg4cyoaNdw0SNCKwwqoyybeO0
 RrxyTCR1AXyazBZpsE2MfXRPIHgyTQaydEgcrmiLFPgWUPfqbrtu92marKnmmORCm4vZ
 eTLwh6HP/J6VWbyE/5lS5bm8HeIJx6HWtoFBvNkKP7cjbBOZFYYCTKLL42wc90Xa+50L
 h331vHFiAkzdnVkAi99+FZRiJyUsim5kD4xM0jjFuVuKpLA6PVJ2A7GWUGDSf++RsXTE
 hvYQ==
X-Gm-Message-State: AOJu0Yxbe6IZ2S4MaU0WJqw1zfYfENZDMXpE0LwJxy+NuzY1TCyAf98Y
 P+x9kB8FMjFhQ5r7h4nlnvPtjjP67d0R+kucNrRDvKGBkqDnUYG/EPT/3MCTQHo=
X-Google-Smtp-Source: AGHT+IFiCyMGLmbn+x6UjAlRrC97FrPfuAnqdeEpCHr6YOh9S9fmG0FWrvfJseF+3eaW6i9ctOtpfg==
X-Received: by 2002:a05:6a20:7501:b0:1a3:5c61:5ec2 with SMTP id
 r1-20020a056a20750100b001a35c615ec2mr5947759pzd.16.1711367507276; 
 Mon, 25 Mar 2024 04:51:47 -0700 (PDT)
Received: from [192.168.68.110] ([177.45.186.241])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a170902bd9700b001ddc93c5759sm4495265pls.196.2024.03.25.04.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 04:51:46 -0700 (PDT)
Message-ID: <b7fff1e9-f2b3-4a45-8966-1dbd76263457@ventanamicro.com>
Date: Mon, 25 Mar 2024 08:51:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm/kvm-cpu.c: kvm_riscv_handle_sbi() fail
 with vendor-specific SBI
To: Alexei Filippov <alexei.filippov@syntacore.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
References: <20240325101428.8875-1-alexei.filippov@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240325101428.8875-1-alexei.filippov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

CCing Anup as well

On 3/25/24 07:14, Alexei Filippov wrote:
> kvm_riscv_handle_sbi() may return not supported return code to not trigger
> qemu abort with vendor-specific sbi.
> 
> Added SBI related return code's defines.


Please add:

Fixes: 4eb47125 ("target/riscv: Handle KVM_EXIT_RISCV_SBI exit")

> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/kvm/kvm-cpu.c         |  5 +++--
>   target/riscv/sbi_ecall_interface.h | 11 +++++++++++
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6a6c6cae80..a4f84ad950 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1404,7 +1404,7 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>           if (ret == sizeof(ch)) {
>               run->riscv_sbi.ret[0] = ch;
>           } else {
> -            run->riscv_sbi.ret[0] = -1;
> +            run->riscv_sbi.ret[0] = SBI_ERR_FAILURE;
>           }
>           ret = 0;
>           break;
> @@ -1412,7 +1412,8 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: un-handled SBI EXIT, specific reasons is %lu\n",
>                         __func__, run->riscv_sbi.extension_id);
> -        ret = -1;
> +        run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
> +        ret = 0;
>           break;
>       }
>       return ret;
> diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
> index 43899d08f6..0279e92a36 100644
> --- a/target/riscv/sbi_ecall_interface.h
> +++ b/target/riscv/sbi_ecall_interface.h
> @@ -69,4 +69,15 @@
>   #define SBI_EXT_VENDOR_END              0x09FFFFFF
>   /* clang-format on */
>   
> +/* SBI return error codes */
> +#define SBI_SUCCESS                  0
> +#define SBI_ERR_FAILURE             -1
> +#define SBI_ERR_NOT_SUPPORTED       -2
> +#define SBI_ERR_INVALID_PARAM       -3
> +#define SBI_ERR_DENIED              -4
> +#define SBI_ERR_INVALID_ADDRESS     -5
> +#define SBI_ERR_ALREADY_AVAILABLE   -6
> +#define SBI_ERR_ALREADY_STARTED     -7
> +#define SBI_ERR_ALREADY_STOPPED     -8
> +
>   #endif

