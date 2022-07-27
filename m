Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGcK0-0002x4-Ly
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 04:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcJu-0002ud-Cv; Wed, 27 Jul 2022 04:23:06 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:56934 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcJp-0000yy-OM; Wed, 27 Jul 2022 04:23:06 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowADXc7za9eBimoX6Ag--.1547S2;
 Wed, 27 Jul 2022 16:22:51 +0800 (CST)
Subject: Re: [PATCH v11 6/6] target/riscv: Remove additional priv version
 check for mcountinhibit
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-7-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <28a7cf36-72a4-32af-2c3f-c765d4573ddb@iscas.ac.cn>
Date: Wed, 27 Jul 2022 16:22:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220727064913.1041427-7-atishp@rivosinc.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowADXc7za9eBimoX6Ag--.1547S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1xGry7ur48CFy7GF1fXrb_yoW8Jw4fpw
 4UW397CrZ5t3sF9anrGw1DX3W3Aw1UKw45Kw4xGr48twsrJ34YyFn0qws7Xa4kW3y7CF40
 vFsYkr1fAF4Iva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUTOJ5UUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 08:23:06 -0000


ÔÚ 2022/7/27 ÏÂÎç2:49, Atish Patra Ð´µÀ:
> With .min_priv_version, additiona priv version check is uncessary
> for mcountinhibit read/write functions.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/csr.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ec6d7f022ad5..eac003d6b950 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1484,10 +1484,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
>   static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
>                                            target_ulong *val)
>   {
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>       *val = env->mcountinhibit;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1498,10 +1494,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
>       int cidx;
>       PMUCTRState *counter;
>   
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>       env->mcountinhibit = val;
>   
>       /* Check if any other counter is also monitoring cycles/instructions */

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li


