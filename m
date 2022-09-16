Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ14s-000374-7y
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 22:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ14q-0002yB-MB; Thu, 15 Sep 2022 22:27:36 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:49140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ14i-0003bU-Dx; Thu, 15 Sep 2022 22:27:31 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VPv.rFc_1663295236; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPv.rFc_1663295236) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 10:27:17 +0800
Message-ID: <e5b7cb5c-78b1-5eff-3b3a-1e1783b7f69e@linux.alibaba.com>
Date: Fri, 16 Sep 2022 10:26:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 5/8] target/riscv: debug: Introduce tinfo CSR
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
 <20220909134215.1843865-6-bmeng.cn@gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220909134215.1843865-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -116
X-Spam_score: -11.7
X-Spam_bar: -----------
X-Spam_report: (-11.7 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 16 Sep 2022 02:27:37 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

On 2022/9/9 21:42, Bin Meng wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> tinfo.info:
>    One bit for each possible type enumerated in tdata1.
>    If the bit is set, then that type is supported by the currently
>    selected trigger.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> (no changes since v1)
>
>   target/riscv/cpu_bits.h |  1 +
>   target/riscv/debug.h    |  2 ++
>   target/riscv/csr.c      |  8 ++++++++
>   target/riscv/debug.c    | 10 +++++++---
>   4 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7be12cac2e..1972aee3bb 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -321,6 +321,7 @@
>   #define CSR_TDATA1          0x7a1
>   #define CSR_TDATA2          0x7a2
>   #define CSR_TDATA3          0x7a3
> +#define CSR_TINFO           0x7a4
>   
>   /* Debug Mode Registers */
>   #define CSR_DCSR            0x7b0
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 76146f373a..9f69c64591 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -95,6 +95,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val);
>   target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
>   void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
>   
> +target_ulong tinfo_csr_read(CPURISCVState *env);
> +
>   void riscv_cpu_debug_excp_handler(CPUState *cs);
>   bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>   bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3d0d8e0340..e66019048d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3089,6 +3089,13 @@ static RISCVException write_tdata(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException read_tinfo(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    *val = tinfo_csr_read(env);
> +    return RISCV_EXCP_NONE;
> +}
> +
>   /*
>    * Functions to access Pointer Masking feature registers
>    * We have to check if current priv lvl could modify
> @@ -3893,6 +3900,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
>       [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
>       [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
> +    [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
>   
>       /* User Pointer Masking */
>       [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,  write_umte },
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index d6666164cd..7d546ace42 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -37,9 +37,7 @@
>    * - tdata1
>    * - tdata2
>    * - tdata3
> - *
> - * We don't support writable 'type' field in the tdata1 register, so there is
> - * no need to implement the "tinfo" CSR.
> + * - tinfo
>    *
>    * The following triggers are implemented:
>    *
> @@ -372,6 +370,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>       }
>   }
>   
> +target_ulong tinfo_csr_read(CPURISCVState *env)
> +{
> +    /* assume all triggers support the same types of triggers */
> +    return BIT(TRIGGER_TYPE_AD_MATCH);
> +}
> +
>   void riscv_cpu_debug_excp_handler(CPUState *cs)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);

