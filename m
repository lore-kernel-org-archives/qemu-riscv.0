Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRrbH-0003qm-Dr
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 04:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrbB-0003Tk-GL; Tue, 14 Feb 2023 04:27:43 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrb7-00084P-Ss; Tue, 14 Feb 2023 04:27:40 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAA3PuoGVOtj6G8tBQ--.42801S2;
 Tue, 14 Feb 2023 17:27:34 +0800 (CST)
Message-ID: <32b4a037-ce32-d541-b9c3-0ac3c2d8258e@iscas.ac.cn>
Date: Tue, 14 Feb 2023 17:27:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 17/18] target/riscv: Group all predicate() routines
 together
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-18-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-18-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAA3PuoGVOtj6G8tBQ--.42801S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWkXrWUAFWUGFW7ZrWUArb_yoW5KF47pa
 15X3sxG3yIqas2v3W7XFs0gF1fAw18tay5Xw47GwsYyr45Jrn8AF1DWayqyayrXryDGw4v
 yF48uFn7CF4jya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU5JPEDU
 UUU
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
X-List-Received-Date: Tue, 14 Feb 2023 09:27:45 -0000


On 2023/2/14 12:31, Bin Meng wrote:
> Move sstc()/sstc32() to where all predicate() routines live.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/csr.c | 108 ++++++++++++++++++++++-----------------------
>   1 file changed, 54 insertions(+), 54 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 40aae9e7b3..37350b8a6d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -399,6 +399,60 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException sstc(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    bool hmode_check = false;
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> +        hmode_check = true;
> +    }
> +
> +    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    /*
> +     * No need of separate function for rv32 as menvcfg stores both menvcfg
> +     * menvcfgh for RV32.
> +     */
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
> +              get_field(env->henvcfg, HENVCFG_STCE))) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException sstc_32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return sstc(env, csrno);
> +}
> +
>   /* Checks if PointerMasking registers could be accessed */
>   static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   {
> @@ -942,60 +996,6 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> -static RISCVException sstc(CPURISCVState *env, int csrno)
> -{
> -    RISCVCPU *cpu = env_archcpu(env);
> -    bool hmode_check = false;
> -
> -    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> -        hmode_check = true;
> -    }
> -
> -    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
> -    if (ret != RISCV_EXCP_NONE) {
> -        return ret;
> -    }
> -
> -    if (env->debugger) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    if (env->priv == PRV_M) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * No need of separate function for rv32 as menvcfg stores both menvcfg
> -     * menvcfgh for RV32.
> -     */
> -    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> -          get_field(env->menvcfg, MENVCFG_STCE))) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (riscv_cpu_virt_enabled(env)) {
> -        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
> -              get_field(env->henvcfg, HENVCFG_STCE))) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -    }
> -
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException sstc_32(CPURISCVState *env, int csrno)
> -{
> -    if (riscv_cpu_mxl(env) != MXL_RV32) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    return sstc(env, csrno);
> -}
> -
>   static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {


