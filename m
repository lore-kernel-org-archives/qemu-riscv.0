Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA09C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:05:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pxMqT-0007CG-5L; Fri, 12 May 2023 03:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pxMqG-00077w-1O; Fri, 12 May 2023 03:05:28 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pxMqB-00028E-WB; Fri, 12 May 2023 03:05:27 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowAAnLs4n5V1kNriQIg--.46166S2;
 Fri, 12 May 2023 15:05:12 +0800 (CST)
Message-ID: <68ec4cdb-1ef5-8d8d-53ac-a581dcbc0e0a@iscas.ac.cn>
Date: Fri, 12 May 2023 15:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
To: Yin Wang <yin.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230510100909.860243-1-yin.wang@intel.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230510100909.860243-1-yin.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAnLs4n5V1kNriQIg--.46166S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1kAryDuFWfWrWUAFy5urg_yoW8Ar4kpF
 W7Gr95Cr48JF9FkanFkr12gr97Xwn2ka909w4Ikwn8uFZ8GrWYqFWxGwn5ArWUGFWjyr1F
 kFyvgFn0qw10qwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUBpB-UUUUU=
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

It's better to align this '"' with the upper line.

Otherwise, LGTM. Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> +                   ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        exit(EXIT_FAILURE);
> +    }
>       if (ms->numa_state->num_nodes) {
>           nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
>           if (ms->numa_state->num_nodes <= nidx) {


