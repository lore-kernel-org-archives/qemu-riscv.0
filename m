Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F3EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 09:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIQXZ-0005V5-Sv; Sun, 09 Jul 2023 05:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qIQXY-0005UJ-28; Sun, 09 Jul 2023 05:17:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qIQXW-0008Jt-6g; Sun, 09 Jul 2023 05:17:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 55137128B9;
 Sun,  9 Jul 2023 12:17:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 44A3013B25;
 Sun,  9 Jul 2023 12:17:02 +0300 (MSK)
Message-ID: <45231603-3635-0e9e-dcf2-08053ba73c98@tls.msk.ru>
Date: Sun, 9 Jul 2023 12:17:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/2] target/riscv: Optimize ambiguous local variable in
 pmp_hart_has_privs
Content-Language: en-US
To: Ruibo Lu <reaperlu@hust.edu.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, luruibo2000@163.com, alistair.francis@wdc.com,
 liweiwei@iscas.ac.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230708091055.38505-1-reaperlu@hust.edu.cn>
 <20230708091055.38505-3-reaperlu@hust.edu.cn>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230708091055.38505-3-reaperlu@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

08.07.2023 12:10, Ruibo Lu пишет:
> These two values represents whether start/end address is in pmp_range.
> However, the type and name of them is ambiguous. This commit change the
> name and type of them to improve code readability and accuracy.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1735
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
> ---
>   target/riscv/pmp.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1a9279ba88..ea3d29217a 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -203,16 +203,16 @@ void pmp_update_rule_nums(CPURISCVState *env)
>       }
>   }
>   
> -static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
> -                           target_ulong addr)
> +static bool pmp_is_in_range(CPURISCVState *env, int pmp_index,
> +                            target_ulong addr)
>   {
> -    int result = 0;
> +    bool result = false;
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

And the initial assignment of result isn't needed.  How about this:

  return (addr >= env->pmp_state.addr[pmp_index].sa) &&
         (addr <= env->pmp_state.addr[pmp_index].ea);

instead? :)

> @@ -287,8 +287,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>   {
>       int i = 0;
>       int pmp_size = 0;
> -    target_ulong s = 0;
> -    target_ulong e = 0;
> +    bool sa_in = false;
> +    bool ea_in = false;
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

Dunno how for others, but to me this is a bit difficult to
read, as an exclusive or isn't a commonly used operation.
Maybe sa_in != ea_in ?

Thanks,

/mjt

>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "pmp violation - access is partially inside\n");
>               *allowed_privs = 0;
> @@ -339,7 +339,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>               (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
>               ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
>   
> -        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> +        if (sa_in && ea_in && (PMP_AMATCH_OFF != a_field)) {
>               /*
>                * If the PMP entry is not off and the address is in range,
>                * do the priv check


