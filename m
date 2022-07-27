Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGcNQ-0005dj-JY
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 04:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcNO-0005ap-NC; Wed, 27 Jul 2022 04:26:42 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:58262 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcNL-0001WI-KM; Wed, 27 Jul 2022 04:26:42 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowAA3fJy59uBi89D6Ag--.4276S2;
 Wed, 27 Jul 2022 16:26:34 +0800 (CST)
Subject: Re: [PATCH v11 5/6] target/riscv: Update the privilege field for
 sscofpmf CSRs
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-6-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <1293559b-9c4e-4162-6453-28e7c51e85a2@iscas.ac.cn>
Date: Wed, 27 Jul 2022 16:26:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220727064913.1041427-6-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAA3fJy59uBi89D6Ag--.4276S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4rCw4DXr4rKFy7tw45GFg_yoWxGrWrpr
 4YkrW3t3Z7Jr1xX393t3ZrJFyrArn5AFsFkr4xAr48AF4kJw1DGa4xXr4qkFy5t3yrCF1k
 K3W3Kr4UZa4rtrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUnXdbUUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 08:26:43 -0000


在 2022/7/27 下午2:49, Atish Patra 写道:
> The sscofpmf extension was ratified as a part of priv spec v1.12.
> Mark the csr_ops accordingly.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 60 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 57dbbf9b09a0..ec6d7f022ad5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3859,63 +3859,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                          write_mhpmevent },
>   
>       [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },

Similar to the first commit, it's better to align with the first element 
"mhpmevent3h" .Otherwise,

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

>       [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>       [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
>       [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
> @@ -4005,7 +4034,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                          write_mhpmcounterh },
>       [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
>                                                          write_mhpmcounterh },
> -    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
> +    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>   #endif /* !CONFIG_USER_ONLY */
>   };


