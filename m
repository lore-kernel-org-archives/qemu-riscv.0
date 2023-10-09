Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793F8E95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qppWF-0004SV-U9; Mon, 09 Oct 2023 08:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qppWD-0004RY-2O; Mon, 09 Oct 2023 08:37:53 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qppWA-0005Wm-18; Mon, 09 Oct 2023 08:37:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VtokfK1_1696855049; 
Received: from 30.221.98.57(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtokfK1_1696855049) by smtp.aliyun-inc.com;
 Mon, 09 Oct 2023 20:37:30 +0800
Message-ID: <50894b0f-effe-4e0d-81a9-51dc24a05489@linux.alibaba.com>
Date: Mon, 9 Oct 2023 20:36:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Use a direct cast for better performance
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 pbonzini@redhat.com
References: <20231008215147.3362612-1-rjones@redhat.com>
 <20231008215147.3362612-2-rjones@redhat.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231008215147.3362612-2-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 2023/10/9 5:50, Richard W.M. Jones wrote:
> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> this adds about 5% total overhead when emulating RV64 on x86-64 host.
>
> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> disk.  The guest has a copy of the qemu source tree.  The test
> involves compiling the qemu source tree with 'make clean; time make -j16'.
>
> Before making this change the compile step took 449 & 447 seconds over
> two consecutive runs.
>
> After making this change, 428 & 422 seconds.
>
> The saving is about 5%.
>
> Thanks: Paolo Bonzini
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3a02079290..479d9863ae 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -66,7 +66,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                             uint64_t *cs_base, uint32_t *pflags)
>   {
>       CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    /*
> +     * Using the checked cast RISCV_CPU(cs) imposes ~ 5% overhead when
> +     * QOM cast debugging is enabled, so use a direct cast instead.
> +     */
> +    RISCVCPU *cpu = (RISCVCPU *)cs;

This function is very hot. Maybe we should cache the tbflags instead of 
calculate it here. Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       RISCVExtStatus fs, vs;
>       uint32_t flags = 0;
>   

