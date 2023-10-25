Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE1FC25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXOj-0004BQ-8G; Wed, 25 Oct 2023 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXOh-0004Aw-U6; Wed, 25 Oct 2023 02:29:43 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXOe-0002OT-LP; Wed, 25 Oct 2023 02:29:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutUeU2_1698215366; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutUeU2_1698215366) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:29:27 +0800
Message-ID: <3dd247e8-5f4f-411c-9ada-7597cdc1ed0b@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:28:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] target/riscv/kvm: add 'rva22u64' flag as
 unavailable
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-3-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
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


On 2023/10/21 6:39, Daniel Henrique Barboza wrote:
> KVM does not have the means to support enabling the rva22u64 profile.
> The main reasons are:
>
> - we're missing support for some mandatory rva22u64 extensions in the
>    KVM module;
>
> - we can't make promises about enabling a profile since it all depends
>    on host support in the end.
>
> We'll revisit this decision in the future if needed. For now mark the
> 'rva22u64' profile as unavailable when running a KVM CPU:
>
> $ qemu-system-riscv64 -machine virt,accel=kvm -cpu rv64,rva22u64=true
> qemu-system-riscv64: can't apply global rv64-riscv-cpu.rva22u64=true:
>      'rva22u64' is not available with KVM
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/kvm/kvm-cpu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 5246fc2bdc..dc14c54ce4 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -360,7 +360,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>       }
>   
>       if (value) {
> -        error_setg(errp, "extension %s is not available with KVM",
> +        error_setg(errp, "'%s' is not available with KVM",
>                      propname);
>       }
>   }
> @@ -440,6 +440,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>       riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
>       riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
>       riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
> +
> +   /* We don't have the needed KVM support for profiles */
> +    for (i = 0; riscv_profiles[i] != NULL; i++) {
> +        riscv_cpu_add_kvm_unavail_prop(cpu_obj, riscv_profiles[i]->name);
> +    }

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   }
>   
>   static int kvm_riscv_get_regs_core(CPUState *cs)

