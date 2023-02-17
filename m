Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqMr-00014t-4h
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqMp-00014T-RR; Thu, 16 Feb 2023 21:20:55 -0500
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqMn-0008Ba-SI; Thu, 16 Feb 2023 21:20:55 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqSSjU_1676600446; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqSSjU_1676600446) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:20:47 +0800
Message-ID: <f188c38c-ca5f-d89b-14ce-aab4152265ec@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:20:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 03/18] target/riscv: gdbstub: Minor change for better
 readability
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-4-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-4-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:20:56 -0000


On 2023/2/14 2:01, Bin Meng wrote:
> Use a variable 'base_reg' to represent cs->gdb_num_regs so that
> the call to ricsv_gen_dynamic_vector_xml() can be placed in one
> single line for better readability.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index e57372db38..704f3d6922 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -385,9 +385,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>                                    32, "riscv-32bit-fpu.xml", 0);
>       }
>       if (env->misa_ext & RVV) {
> +        int base_reg = cs->gdb_num_regs;
>           gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
> -                                 ricsv_gen_dynamic_vector_xml(cs,
> -                                                              cs->gdb_num_regs),
> +                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>                                    "riscv-vector.xml", 0);
>       }
>       switch (env->misa_mxl_max) {

