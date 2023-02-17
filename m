Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqQE-0002bg-S4
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqQD-0002bH-6p; Thu, 16 Feb 2023 21:24:25 -0500
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqQA-0002ST-Qy; Thu, 16 Feb 2023 21:24:24 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqZz9e_1676600655; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqZz9e_1676600655) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:24:15 +0800
Message-ID: <9f30a217-d429-1ce1-e5de-3678af40e8e3@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:24:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 05/18] target/riscv: Coding style fixes in csr.c
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-6-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-6-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:24:25 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> Fix various places that violate QEMU coding style:
>
> - correct multi-line comment format
> - indent to opening parenthesis
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
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

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   {
>       mseccfg_csr_write(env, val);
>       return RISCV_EXCP_NONE;

