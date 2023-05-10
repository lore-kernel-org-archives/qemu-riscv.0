Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC849C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 11:10:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwhiU-0001L0-4h; Wed, 10 May 2023 07:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pwhiT-0001Jr-9j; Wed, 10 May 2023 07:10:41 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pwhiQ-0000Rr-D7; Wed, 10 May 2023 07:10:41 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0ViFry.p_1683717024; 
Received: from 30.221.98.74(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0ViFry.p_1683717024) by smtp.aliyun-inc.com;
 Wed, 10 May 2023 19:10:25 +0800
Message-ID: <46a0ec99-ff7e-d1bd-d5f9-edf9e5b042fb@linux.alibaba.com>
Date: Wed, 10 May 2023 19:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
To: Yin Wang <yin.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230510100909.860243-1-yin.wang@intel.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230510100909.860243-1-yin.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -131
X-Spam_score: -13.2
X-Spam_bar: -------------
X-Spam_report: (-13.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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


On 2023/5/10 18:09, Yin Wang wrote:
> Command "qemu-system-riscv64 -machine virt
> -m 2G -smp 1 -numa node,mem=1G -numa node,mem=1G"
> would trigger this problem.Backtrace with:
>   #0  0x0000555555b5b1a4 in riscv_numa_get_default_cpu_node_id  at ../hw/riscv/numa.c:211
>   #1  0x00005555558ce510 in machine_numa_finish_cpu_init  at ../hw/core/machine.c:1230
>   #2  0x00005555558ce9d3 in machine_run_board_init  at ../hw/core/machine.c:1346
>   #3  0x0000555555aaedc3 in qemu_init_board  at ../softmmu/vl.c:2513
>   #4  0x0000555555aaf064 in qmp_x_exit_preconfig  at ../softmmu/vl.c:2609
>   #5  0x0000555555ab1916 in qemu_init  at ../softmmu/vl.c:3617
>   #6  0x000055555585463b in main  at ../softmmu/main.c:47
> This commit fixes the issue by adding parameter checks.
>
> Signed-off-by: Yin Wang <yin.wang@intel.com>
> ---
>   hw/riscv/numa.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 4720102561..183d315839 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -207,6 +207,12 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
>       int64_t nidx = 0;
>   
> +    if (ms->numa_state->num_nodes > ms->smp.cpus) {
> +        error_report("Number of CPUs used by NUMA nodes (%d)"
> +                   " cannot exceed the number of available CPUs (%d).",
> +                   ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        exit(EXIT_FAILURE);
> +    }

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       if (ms->numa_state->num_nodes) {
>           nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
>           if (ms->numa_state->num_nodes <= nidx) {

