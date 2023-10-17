Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F3ECDB465
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 02:30:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsZqn-0007xT-WA; Mon, 16 Oct 2023 22:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qsZqi-0007wb-9A; Mon, 16 Oct 2023 22:30:26 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qsZqa-0002mb-An; Mon, 16 Oct 2023 22:30:22 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VuL5f.G_1697509803; 
Received: from 30.221.98.192(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VuL5f.G_1697509803) by smtp.aliyun-inc.com;
 Tue, 17 Oct 2023 10:30:04 +0800
Message-ID: <5147b65f-8211-4355-b667-f450dc189ae3@linux.alibaba.com>
Date: Tue, 17 Oct 2023 10:29:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] target/riscv: Remove misa_mxl validation
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
 <20231012054223.37870-2-akihiko.odaki@daynix.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231012054223.37870-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/10/12 13:42, Akihiko Odaki wrote:
> It is initialized with a simple assignment and there is little room for
> error. In fact, the validation is even more complex.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/riscv/cpu.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f5572704de..550b357fb7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1042,7 +1042,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       }
>   }
>   
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPUClass *cc = CPU_CLASS(mcc);
> @@ -1062,11 +1062,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>       default:
>           g_assert_not_reached();
>       }
> -
> -    if (env->misa_mxl_max != env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
>   }
>   
>   /*
> @@ -1447,11 +1442,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> +    riscv_cpu_validate_misa_mxl(cpu);

This it not right.  As we are still working on the supporting for MXL32 
or SXL32, this validation is needed.

And we can't ensure the all RISC-V cpus have the same misa_mxl_max or 
misa_mxl,   it is not right to move it to class.
For example, in the future, riscv64-softmmu can run 32-bit cpu and 
64-bit cpu. And maybe in heterogeneous SOC,
we have 32-bit cpu and 64-bit cpu together.

I am afraid that we can not accept this patch set.

Thanks,
Zhiwei

>   
>       riscv_cpu_validate_priv_spec(cpu, &local_err);
>       if (local_err != NULL) {

