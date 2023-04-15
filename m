Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnUJ9-0008Va-9n
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 21:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pnUJ7-0008V3-Ec; Fri, 14 Apr 2023 21:02:25 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pnUJ0-0002xL-J3; Fri, 14 Apr 2023 21:02:25 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s6I9zlkwwy_Eg--.6592S2;
 Sat, 15 Apr 2023 09:02:00 +0800 (CST)
Message-ID: <3ee55aaa-e8aa-e715-b8c2-2dff938b9553@iscas.ac.cn>
Date: Sat, 15 Apr 2023 09:01:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v2 1/4] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-2-mchitale@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230414160202.1298242-2-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s6I9zlkwwy_Eg--.6592S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF47XF18tw45JrWUtr1fJFb_yoW5Gw4xpw
 4kA39xG395try2v3ZxGFn8WFs8Ga1kJ3yS93W7Ka10qFsIyrWFkF1kt3sxZr1kXFW7Jr1f
 ZayjkFyDur47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 15 Apr 2023 01:02:26 -0000


On 2023/4/15 00:01, Mayuresh Chitale wrote:
> If smstateen is implemented and smtateen0.fcsr is clear and misa.F
> is off then the floating point operations must return illegal
> instruction exception or virtual instruction trap, if relevant.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f4d2dcfdc8..8ae9e95f9f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>           !riscv_cpu_cfg(env)->ext_zfinx) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>   #endif
>       return RISCV_EXCP_NONE;
>   }
> @@ -2081,6 +2085,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -2117,6 +2124,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +

FCSR is bit 1 of mstateen0.  So it seems unnecessary to be added to 
wr_mask for mstateen0h.

Similar to hstateen0h.

Otherwise,  Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2154,6 +2165,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2193,6 +2208,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2240,6 +2259,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>       return write_sstateen(env, csrno, wr_mask, new_val);
>   }
>   


