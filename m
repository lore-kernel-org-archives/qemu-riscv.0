Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pexik-00081Q-BZ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 08:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pexii-0007jb-En; Wed, 22 Mar 2023 08:37:36 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pexif-0002sN-CA; Wed, 22 Mar 2023 08:37:36 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-01 (Coremail) with SMTP id qwCowAAnL8979hpki0UYFQ--.14235S2;
 Wed, 22 Mar 2023 20:37:17 +0800 (CST)
Message-ID: <585bf39e-91e9-bd85-1fee-80ff0b4c0a8f@iscas.ac.cn>
Date: Wed, 22 Mar 2023 20:37:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
To: Fei Wu <fei2.wu@intel.com>
References: <20230322121240.232303-1-fei2.wu@intel.com>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322121240.232303-1-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAAnL8979hpki0UYFQ--.14235S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1UGry8XF4UuF4xZr4fXwb_yoW5uw47pr
 4kG3yak3yDCrZ2ya4ftF15Ww15ArWqgr43Cw4kWr45AF4rJrW5CF1DKw17WFsrXF47Wryj
 93WDZr9xAw4xXrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.240.243]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 12:37:36 -0000


On 2023/3/22 20:12, Fei Wu wrote:
> Kernel needs to access user mode memory e.g. during syscalls, the window
> is usually opened up for a very limited time through MSTATUS.SUM, the
> overhead is too much if tlb_flush() gets called for every SUM change.
>
> This patch creates a separate MMU index for S+SUM, so that it's not
> necessary to flush tlb anymore when SUM changes. This is similar to how
> ARM handles Privileged Access Never (PAN).
>
> Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
> other syscalls benefit a lot from this too.
>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   target/riscv/cpu-param.h  |  2 +-
>   target/riscv/cpu.h        |  2 +-
>   target/riscv/cpu_bits.h   |  1 +
>   target/riscv/cpu_helper.c | 11 +++++++++++
>   target/riscv/csr.c        |  2 +-
>   5 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index ebaf26d26d..9e21b943f9 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -27,6 +27,6 @@
>    *  - S mode HLV/HLVX/HSV 0b101
>    *  - M mode HLV/HLVX/HSV 0b111
>    */
> -#define NB_MMU_MODES 8
> +#define NB_MMU_MODES 16
>   
>   #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..ac8bee11a7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -624,7 +624,7 @@ target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
>   #define TB_FLAGS_PRIV_MMU_MASK                3
> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>   
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..dd9e62b6e4 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -606,6 +606,7 @@ typedef enum {
>   #define PRV_S 1
>   #define PRV_H 2 /* Reserved */
>   #define PRV_M 3
> +#define MMUIdx_S_SUM 5
>   
>   /* Virtulisation Register Fields */
>   #define VIRT_ONOFF          1
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..e52e9765d0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -36,6 +36,17 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #ifdef CONFIG_USER_ONLY
>       return 0;
>   #else
> +    if (ifetch) {
> +        return env->priv;
> +    }
> +
> +    int mode = env->priv;
> +    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
> +        mode = get_field(env->mstatus, MSTATUS_MPP);
> +    }
> +    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> +        return MMUIdx_S_SUM;
> +    }
>       return env->priv;

If we return mode here, whether tlb needn't flush for changes to 
MSTATUS_MPRV and MSTATUS_MPP?

Regards,

Weiwei Li

>   #endif
>   }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab566639e5..eacc40e912 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1246,7 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>   
>       /* flush tlb on mstatus fields that affect VM */
>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> -            MSTATUS_MPRV | MSTATUS_SUM)) {
> +            MSTATUS_MPRV)) {
>           tlb_flush(env_cpu(env));
>       }
>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |


