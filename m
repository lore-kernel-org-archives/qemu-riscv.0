Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8O3B-0005hQ-OH
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 11:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8O2s-0005fQ-Ni; Mon, 04 Jul 2022 11:31:33 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:37346 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8O2m-0003dP-SU; Mon, 04 Jul 2022 11:31:27 -0400
Received: from [192.168.0.138] (unknown [117.151.235.183])
 by APP-05 (Coremail) with SMTP id zQCowAD3pu3HB8NiGY5gCg--.10032S2;
 Mon, 04 Jul 2022 23:31:20 +0800 (CST)
Subject: Re: [PATCH v10 05/12] target/riscv: Implement mcountinhibit CSR
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-6-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <51d95cb9-8607-3667-98ff-e60157c56f70@iscas.ac.cn>
Date: Mon, 4 Jul 2022 23:31:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220620231603.2547260-6-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3pu3HB8NiGY5gCg--.10032S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArWDWF4rXry8Xr1fZryrZwb_yoW5Kw1rpr
 4UCay5C3y0qrySva1ft3WDGw13Jw4xGayakw4xur48Jw4rJrWrGF1qganFqFZ5Ja4rGr1F
 9Fn09r13Cw48ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUx73kUUUUU=
X-Originating-IP: [117.151.235.183]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 15:31:34 -0000


在 2022/6/21 上午7:15, Atish Patra 写道:
> From: Atish Patra <atish.patra@wdc.com>
>
> As per the privilege specification v1.11, mcountinhibit allows to start/stop
> a pmu counter selectively.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h      |  2 ++
>   target/riscv/cpu_bits.h |  4 ++++
>   target/riscv/csr.c      | 25 +++++++++++++++++++++++++
>   target/riscv/machine.c  |  1 +
>   4 files changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ffee54ea5c27..0a916db9f614 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -275,6 +275,8 @@ struct CPUArchState {
>       target_ulong scounteren;
>       target_ulong mcounteren;
>   
> +    target_ulong mcountinhibit;
> +
>       target_ulong sscratch;
>       target_ulong mscratch;
>   
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d064e..b3f7fa713000 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -367,6 +367,10 @@
>   #define CSR_MHPMCOUNTER29   0xb1d
>   #define CSR_MHPMCOUNTER30   0xb1e
>   #define CSR_MHPMCOUNTER31   0xb1f
> +
> +/* Machine counter-inhibit register */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>   #define CSR_MHPMEVENT3      0x323
>   #define CSR_MHPMEVENT4      0x324
>   #define CSR_MHPMEVENT5      0x325
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b4a8e15f498f..94d39a4ce1c5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1475,6 +1475,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
> +                                         target_ulong *val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +

This seems can be done by add  .min_priv_ver=PRIV_VERSION_1_11_0 in 
csr_ops table.

Regards,

Weiwei Li

> +    *val = env->mcountinhibit;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
> +                                          target_ulong val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    env->mcountinhibit = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
>                                         target_ulong *val)
>   {
> @@ -3745,6 +3767,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
>       [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>   
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
> +                                                       write_mcountinhibit },
> +
>       [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>       [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
>       [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 2a437b29a1ce..87cd55bfd3a7 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -330,6 +330,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINTTL(env.siselect, RISCVCPU),
>           VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>           VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
>           VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>           VMSTATE_UINT64(env.mfromhost, RISCVCPU),


