Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551ADEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEVCu-0004MR-GR; Wed, 28 Jun 2023 09:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qEVCs-0004Lq-F5; Wed, 28 Jun 2023 09:27:38 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qEVCp-0008O7-NM; Wed, 28 Jun 2023 09:27:38 -0400
Received: from [192.168.0.120] (unknown [114.95.176.74])
 by APP-01 (Coremail) with SMTP id qwCowABHTQk7NZxkBl+KBQ--.3213S2;
 Wed, 28 Jun 2023 21:27:24 +0800 (CST)
Message-ID: <d1f1d247-e5dc-5d49-6930-333aea9bcaa1@iscas.ac.cn>
Date: Wed, 28 Jun 2023 21:27:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, luruibo2000@163.com,
 alistair.francis@wdc.com
Subject: Re: [PATCH 2/2] target/riscv: Optimize ambiguous local variable in
 pmp_hart_has_privs
Content-Language: en-US
To: Ruibo Lu <reaperlu@hust.edu.cn>, qemu-devel@nongnu.org
References: <20230628103818.55471-1-reaperlu@hust.edu.cn>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230628103818.55471-1-reaperlu@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABHTQk7NZxkBl+KBQ--.3213S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryfZF48tw4fXFWfury3urg_yoW8KF43pr
 WxArZ7KryktayDta17GF4UJFyUXryfGr4UAan7KFy0kwsxWFWfAr1kK3sIyF1DG3srurWj
 9FWDuwn8ArsFvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWCJPUUUU
 U==
X-Originating-IP: [114.95.176.74]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/6/28 18:38, Ruibo Lu wrote:
> These two values represents whether start/end address is in pmp_range.
> However, the type and name of them is ambiguous. This commit change the
> name and type of them to improve code readability and accuracy.
>
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
> ---
>   target/riscv/pmp.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1a9279ba88..aa573bab14 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -203,16 +203,16 @@ void pmp_update_rule_nums(CPURISCVState *env)
>       }
>   }
>   
> -static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
> +static bool pmp_is_in_range(CPURISCVState *env, int pmp_index,
>                              target_ulong addr)
Maintain the alignment here.
>   {
> -    int result = 0;
> +    int result = false;
>   
>       if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
>           (addr <= env->pmp_state.addr[pmp_index].ea)) {
> -        result = 1;
> +        result = true;
>       } else {
> -        result = 0;
> +        result = false;
>       }
>   
>       return result;
> @@ -287,8 +287,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>   {
>       int i = 0;
>       int pmp_size = 0;
> -    target_ulong s = 0;
> -    target_ulong e = 0;
> +    bool sa_in = 0;
> +    bool ea_in = 0;
Better to use false here.
>   
>       /* Short cut if no rules */
>       if (0 == pmp_get_num_rules(env)) {
> @@ -314,11 +314,11 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>        * from low to high
>        */
>       for (i = 0; i < MAX_RISCV_PMPS; i++) {
> -        s = pmp_is_in_range(env, i, addr);
> -        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
> +        sa_in = pmp_is_in_range(env, i, addr);
> +        ea_in = pmp_is_in_range(env, i, addr + pmp_size - 1);
>   
>           /* partially inside */
> -        if ((s + e) == 1) {
> +        if (sa_in ^ ea_in) {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "pmp violation - access is partially inside\n");
>               *allowed_privs = 0;
> @@ -339,7 +339,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>               (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
>               ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
>   
> -        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> +        if ((sa_in & ea_in) && (PMP_AMATCH_OFF != a_field)) {

I think it's better to use "sa_in && ea_in &&(...)" here.

Regards,

Weiwei Li

>               /*
>                * If the PMP entry is not off and the address is in range,
>                * do the priv check


