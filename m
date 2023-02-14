Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRwmE-0003C2-Ay
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 09:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRwmA-0003BX-SA; Tue, 14 Feb 2023 09:59:22 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRwm8-0007G1-3P; Tue, 14 Feb 2023 09:59:22 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowADn5EC3oetjgsEXBQ--.27649S2;
 Tue, 14 Feb 2023 22:59:04 +0800 (CST)
Message-ID: <e0c10cb9-c83b-bb35-3041-0f388dc48267@iscas.ac.cn>
Date: Tue, 14 Feb 2023 22:59:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20230213180215.1524938-19-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-19-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn5EC3oetjgsEXBQ--.27649S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4fJw18ZF1fKFWrZF1fWFg_yoWrZF4xpF
 yjqasrKa4vqFn7Z3ZxGF1DGFW3Aw18Jw43Zwsru39YyFsrCr15Gr9Fgry2qaykWrWrCr4F
 va1UGr15ur4qya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUb0D73UUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 14 Feb 2023 14:59:24 -0000


On 2023/2/14 22:27, Bin Meng wrote:
> At present the envcfg CSRs predicate() routines are generic one like
> smode(), hmode. The configuration check is done in the read / write
> routine. Create a new predicate routine to cover such check, so that
> gdbstub can correctly report its existence.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>
> ---
>
>   target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 61 insertions(+), 37 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 37350b8a6d..284ccc09dd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>   }
>   
>   /* Predicates */
> -#if !defined(CONFIG_USER_ONLY)
> -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> -                                       uint64_t bit)
> -{
> -    bool virt = riscv_cpu_virt_enabled(env);
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    if (!(env->mstateen[index] & bit)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (virt) {
> -        if (!(env->hstateen[index] & bit)) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -
> -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -    }
> -
> -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> -        if (!(env->sstateen[index] & bit)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        }
> -    }
> -
> -    return RISCV_EXCP_NONE;
> -}
> -#endif
>   
>   static RISCVException fs(CPURISCVState *env, int csrno)
>   {
> @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>       return umode(env, csrno);
>   }
>   
> +static RISCVException envcfg(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    riscv_csr_predicate_fn predicate;
> +
> +    if (cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

This check seems not right here.  Why  ILLEGAL_INST is directly 
triggered if smstateen is enabled?

It seems that smstateen related check will be done  for 
senvcfg/henvcfg{h} when smstateen is enabled.

Regards,

Weiwei Li

> +
> +    switch (csrno) {
> +    case CSR_SENVCFG:
> +        predicate = smode;
> +        break;
> +    case CSR_HENVCFG:
> +        predicate = hmode;
> +        break;
> +    case CSR_HENVCFGH:
> +        predicate = hmode32;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return predicate(env, csrno);
> +}
> +
>   static RISCVException mstateen(CPURISCVState *env, int csrno)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
> @@ -1946,6 +1938,38 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> +                                       uint64_t bit)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->mstateen[index] & bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (virt) {
> +        if (!(env->hstateen[index] & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +
> +        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> +        if (!(env->sstateen[index] & bit)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>   {
> @@ -4087,11 +4111,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                          .min_priv_ver = PRIV_VERSION_1_12_0              },
>       [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
>                          .min_priv_ver = PRIV_VERSION_1_12_0              },
> -    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
> +    [CSR_SENVCFG]  = { "senvcfg",  envcfg, read_senvcfg,  write_senvcfg,
>                          .min_priv_ver = PRIV_VERSION_1_12_0              },
> -    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
> +    [CSR_HENVCFG]  = { "henvcfg",  envcfg, read_henvcfg,  write_henvcfg,
>                          .min_priv_ver = PRIV_VERSION_1_12_0              },
> -    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
> +    [CSR_HENVCFGH] = { "henvcfgh", envcfg, read_henvcfgh, write_henvcfgh,
>                          .min_priv_ver = PRIV_VERSION_1_12_0              },
>   
>       /* Smstateen extension CSRs */


