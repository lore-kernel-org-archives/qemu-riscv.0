Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqz5-0007pJ-IK
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqz3-0007oy-P3; Tue, 14 Feb 2023 03:48:17 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqz1-0008HV-2u; Tue, 14 Feb 2023 03:48:17 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAA3PfXJSutjm4YsBQ--.41800S2;
 Tue, 14 Feb 2023 16:48:09 +0800 (CST)
Message-ID: <1208b86d-ea9e-2767-91f2-fce0144dd2e4@iscas.ac.cn>
Date: Tue, 14 Feb 2023 16:48:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 05/18] target/riscv: Coding style fixes in csr.c
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-6-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-6-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAA3PfXJSutjm4YsBQ--.41800S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar1rAF1DKw1UWr1DZFykAFb_yoWfGryUpF
 4UZrn3GFZ3ta40va93GryqgF13Cw17K3y7Jws7Wa95t3W5AryrtF1DJFZIyr1UWas8Wr40
 va9xCFn5Ar4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULID
 7UUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 14 Feb 2023 08:48:18 -0000


On 2023/2/14 02:02, Bin Meng wrote:
> Fix various places that violate QEMU coding style:
>
> - correct multi-line comment format
> - indent to opening parenthesis
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/csr.c | 62 ++++++++++++++++++++++++----------------------
>   1 file changed, 32 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c2dd9d5af0..cc74819759 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -963,7 +963,7 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
>   }
>   
>   static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> -                                    target_ulong *val)
> +                                     target_ulong *val)
>   {
>       *val = env->vstimecmp;
>   
> @@ -971,7 +971,7 @@ static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> -                                    target_ulong *val)
> +                                      target_ulong *val)
>   {
>       *val = env->vstimecmp >> 32;
>   
> @@ -979,7 +979,7 @@ static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> +                                      target_ulong val)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> @@ -996,7 +996,7 @@ static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> +                                       target_ulong val)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> @@ -1020,7 +1020,7 @@ static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> -                                    target_ulong *val)
> +                                     target_ulong *val)
>   {
>       if (riscv_cpu_virt_enabled(env)) {
>           *val = env->vstimecmp >> 32;
> @@ -1032,7 +1032,7 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> +                                     target_ulong val)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> @@ -1055,7 +1055,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> +                                      target_ulong val)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> @@ -1342,7 +1342,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>   
>       /* 'E' excludes all other extensions */
>       if (val & RVE) {
> -        /* when we support 'E' we can do "val = RVE;" however
> +        /*
> +         * when we support 'E' we can do "val = RVE;" however
>            * for now we just drop writes if 'E' is present.
>            */
>           return RISCV_EXCP_NONE;
> @@ -1364,7 +1365,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           val &= ~RVD;
>       }
>   
> -    /* Suppress 'C' if next instruction is not aligned
> +    /*
> +     * Suppress 'C' if next instruction is not aligned
>        * TODO: this should check next_pc
>        */
>       if ((val & RVC) && (GETPC() & ~3) != 0) {
> @@ -1833,28 +1835,28 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_mepc(CPURISCVState *env, int csrno,
> -                                     target_ulong *val)
> +                                target_ulong *val)
>   {
>       *val = env->mepc;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_mepc(CPURISCVState *env, int csrno,
> -                                     target_ulong val)
> +                                 target_ulong val)
>   {
>       env->mepc = val;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_mcause(CPURISCVState *env, int csrno,
> -                                     target_ulong *val)
> +                                  target_ulong *val)
>   {
>       *val = env->mcause;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_mcause(CPURISCVState *env, int csrno,
> -                                     target_ulong val)
> +                                   target_ulong val)
>   {
>       env->mcause = val;
>       return RISCV_EXCP_NONE;
> @@ -1876,14 +1878,14 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
>   
>   /* Execution environment configuration setup */
>   static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +                                   target_ulong *val)
>   {
>       *val = env->menvcfg;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +                                    target_ulong val)
>   {
>       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
>   
> @@ -1896,14 +1898,14 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +                                    target_ulong *val)
>   {
>       *val = env->menvcfg >> 32;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +                                     target_ulong val)
>   {
>       uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
>       uint64_t valh = (uint64_t)val << 32;
> @@ -1914,7 +1916,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +                                   target_ulong *val)
>   {
>       RISCVException ret;
>   
> @@ -1928,7 +1930,7 @@ static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +                                    target_ulong val)
>   {
>       uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
>       RISCVException ret;
> @@ -1943,7 +1945,7 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +                                   target_ulong *val)
>   {
>       RISCVException ret;
>   
> @@ -1957,7 +1959,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +                                    target_ulong val)
>   {
>       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
>       RISCVException ret;
> @@ -1977,7 +1979,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +                                    target_ulong *val)
>   {
>       RISCVException ret;
>   
> @@ -1991,7 +1993,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> -                                  target_ulong val)
> +                                     target_ulong val)
>   {
>       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>       uint64_t valh = (uint64_t)val << 32;
> @@ -2034,13 +2036,13 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
> -                                      target_ulong new_val)
> +                                         target_ulong new_val)
>   {
>       return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
>   }
>   
>   static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
> -                                      target_ulong *val)
> +                                     target_ulong *val)
>   {
>       *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
>   
> @@ -2061,7 +2063,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
> -                                      target_ulong new_val)
> +                                       target_ulong new_val)
>   {
>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>   
> @@ -2069,7 +2071,7 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
> -                                      target_ulong new_val)
> +                                          target_ulong new_val)
>   {
>       return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
>   }
> @@ -2106,7 +2108,7 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
> -                                      target_ulong new_val)
> +                                         target_ulong new_val)
>   {
>       return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
>   }
> @@ -2145,7 +2147,7 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
> -                                       target_ulong new_val)
> +                                          target_ulong new_val)
>   {
>       return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
>   }
> @@ -3338,7 +3340,7 @@ static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
>   }
>   
>   static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
> -                         target_ulong val)
> +                                    target_ulong val)
>   {
>       mseccfg_csr_write(env, val);
>       return RISCV_EXCP_NONE;


