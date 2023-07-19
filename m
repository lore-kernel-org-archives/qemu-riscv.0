Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423AFEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvwX-00077X-UZ; Tue, 18 Jul 2023 21:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLvwW-00076u-7Z; Tue, 18 Jul 2023 21:25:28 -0400
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLvwT-0004Ub-IQ; Tue, 18 Jul 2023 21:25:28 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-03 (Coremail) with SMTP id rQCowACXnmZ2O7dkjcldDA--.9526S2;
 Wed, 19 Jul 2023 09:25:10 +0800 (CST)
Message-ID: <a3ce50f7-0ff7-a646-06ac-36b26e96547c@iscas.ac.cn>
Date: Wed, 19 Jul 2023 09:25:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Kumar Patra <atishp@atishpatra.org>,
 Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Subject: Re: [PATCH 3/3] target/riscv: Add cycle & instret privilege mode
 filtering support
Content-Language: en-US
To: Kaiwen Xue <kaiwenx@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <cover.1689631639.git.kaiwenx@rivosinc.com>
 <3ed71e9812a806b98dd519594af52b9525ec459c.1689631639.git.kaiwenx@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <3ed71e9812a806b98dd519594af52b9525ec459c.1689631639.git.kaiwenx@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: rQCowACXnmZ2O7dkjcldDA--.9526S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4fXw4DAFyxAw4xXr13Arb_yoWrWry5pr
 4UG3sxCws7tryIvan3Xr1DtF13A34rGa9rAws7W3W0yFs8JryrGFn7XwsIyFn5GayDWr10
 qF4DKw1DuF4vyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbE_M3UUUUU==
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.81; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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


On 2023/7/19 06:47, Kaiwen Xue wrote:
> QEMU only calculates dummy cycles and instructions, so there is no
> actual means to stop the icount in QEMU. Hence this patch merely adds
> the functionality of accessing the cfg registers, and cause no actual
> effects on the counting of cycle and instret counters.
Maybe you can record/accumulate them when privilege mode changes/switchs.
>
> Signed-off-by: Kaiwen Xue <kaiwenx@andrew.cmu.edu>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> ---
>   target/riscv/csr.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..b1d5e85a79 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -218,6 +218,17 @@ static RISCVException sscofpmf(CPURISCVState *env, int csrno)
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_smcntrpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException any(CPURISCVState *env, int csrno)
>   {
>       return RISCV_EXCP_NONE;
> @@ -800,6 +811,54 @@ static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   #else /* CONFIG_USER_ONLY */
>   
> +static int read_mcyclecfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mcyclecfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mcyclecfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mcyclecfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mcyclecfgh = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->minstretcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->minstretcfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfgh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->minstretcfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfgh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->minstretcfgh = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
>   {
>       int evt_index = csrno - CSR_MCOUNTINHIBIT;
> @@ -4506,6 +4565,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                write_mcountinhibit,
>                                .min_priv_ver = PRIV_VERSION_1_11_0       },
>   
> +    [CSR_MCYCLECFG]      = { "mcyclecfg",   smcntrpmf, read_mcyclecfg,
> +                             write_mcyclecfg,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0       },
> +    [CSR_MINSTRETCFG]    = { "minstretcfg", smcntrpmf, read_minstretcfg,
> +                             write_minstretcfg,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0       },
> +
>       [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
>                                write_mhpmevent                           },
>       [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_mhpmevent,
> @@ -4565,6 +4631,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
>                                write_mhpmevent                           },
>   
> +    [CSR_MCYCLECFGH]     = { "mcyclecfgh",   smcntrpmf, read_mcyclecfgh,
> +                             write_mcyclecfgh,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0        },
> +    [CSR_MINSTRETCFGH]   = { "minstretcfgh", smcntrpmf, read_minstretcfgh,
> +                             write_minstretcfgh,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0        },

This two CSRs are RV32-only, they cannot directly share the same 
predicate as MCYCLECFG/MINSTRETCFG.

Regards,

Weiwei Li

> +
>       [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
>                                write_mhpmeventh,
>                                .min_priv_ver = PRIV_VERSION_1_12_0        },


