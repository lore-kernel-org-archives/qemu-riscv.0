Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGJDB-0004rb-H0
	for mharc-qemu-riscv@gnu.org; Sat, 05 Feb 2022 06:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nGJD6-0004rM-FP; Sat, 05 Feb 2022 06:26:33 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60366 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nGJD2-0002tM-Mf; Sat, 05 Feb 2022 06:26:31 -0500
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3f5vdXv5hY35SAA--.24879S2;
 Sat, 05 Feb 2022 19:26:22 +0800 (CST)
Subject: Re: [PATCH v2 4/6] target/riscv: Add support for mconfigptr
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220205003605.1150143-1-atishp@rivosinc.com>
 <20220205003605.1150143-5-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <14f5fa7b-0f6f-4a40-fc19-281c87efa82f@iscas.ac.cn>
Date: Sat, 5 Feb 2022 19:26:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220205003605.1150143-5-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAB3f5vdXv5hY35SAA--.24879S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr47Jw4rAFy5Ww13Ww4rZrb_yoW8Ww1fpr
 s3u3y09w4DXrW0gan3tw45GrnxZwn8WFW2k397Aw1kJrWrXrW8CFnFga1UJr95Wa18WryF
 vFn09F13Aa1kZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWr
 Zr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 05 Feb 2022 11:26:35 -0000


在 2022/2/5 上午8:36, Atish Patra 写道:
> RISC-V privileged specification v1.12 introduced a mconfigptr
> which will hold the physical address of a configuration data
> structure. As Qemu doesn't have a configuration data structure,
> is read as zero which is valid as per the priv spec.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu_bits.h | 1 +
>   target/riscv/csr.c      | 2 ++
>   2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f96d26399607..89440241632a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -148,6 +148,7 @@
>   #define CSR_MARCHID         0xf12
>   #define CSR_MIMPID          0xf13
>   #define CSR_MHARTID         0xf14
> +#define CSR_MCONFIGPTR      0xf15
>   
>   /* Machine Trap Setup */
>   #define CSR_MSTATUS         0x300
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 25a0df498669..4366e5e95ce8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3020,6 +3020,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
>       [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
>       [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> +    [CSR_MCONFIGPTR]   = { "mconfigptr", any, read_zero,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>       /* Machine Trap Setup */
>       [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,

Additional spaces before '=' seems to align with other '='s in near lines.

If you don't want to modify the previous lines, I think  it's better to 
align with the '=' of CSR_MSTATUS  or  doesn't add any additional spaces.

Regards,

Weiwei Li


