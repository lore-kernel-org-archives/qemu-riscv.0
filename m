Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3Tuu-0001mg-Hg
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 22:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p3Tur-0001mE-KC; Thu, 08 Dec 2022 22:19:14 -0500
Received: from out30-1.freemail.mail.aliyun.com ([115.124.30.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p3Tup-0002zR-AF; Thu, 08 Dec 2022 22:19:13 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=0; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VWsduJU_1670555941; 
Received: from 30.221.97.222(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VWsduJU_1670555941) by smtp.aliyun-inc.com;
 Fri, 09 Dec 2022 11:19:02 +0800
Message-ID: <0b1aacd6-e1a4-4261-6da4-e59d8ce8967a@linux.alibaba.com>
Date: Fri, 9 Dec 2022 11:18:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] RISC-V: Save mmu_idx using FIELD_DP32 not OR
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20221208151159.1155471-1-christoph.muellner@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221208151159.1155471-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.1;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-1.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.266, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 09 Dec 2022 03:19:15 -0000


On 2022/12/8 23:11, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> Setting flags using OR might work, but is not optimal
> for a couple of reasons:
> * No way grep for stores to the field MEM_IDX.
> * The return value of cpu_mmu_index() is not masked
>    (not a real problem as long as cpu_mmu_index() returns only valid values).
> * If the offset of MEM_IDX would get moved to non-0, then this code
>    would not work anymore.
>
> Let's use the FIELD_DP32() macro instead of the OR, which is already
> used for most other flags.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/cpu_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..d68b6b351d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -80,7 +80,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       flags |= TB_FLAGS_MSTATUS_FS;
>       flags |= TB_FLAGS_MSTATUS_VS;
>   #else
> -    flags |= cpu_mmu_index(env, 0);
> +    flags = FIELD_DP32(flags, TB_FLAGS, MEM_IDX, cpu_mmu_index(env, 0));
> +
>       if (riscv_cpu_fp_enabled(env)) {
>           flags |= env->mstatus & MSTATUS_FS;
>       }

We may should rename cpu_mmu_index to cpu_mem_idx and 
TB_FLAGS_PRIV_MMU_MASK to TB_FLAGS_PRIV_MEM_MASK.

We can also remove the TB_FLAGS_PRIV_MMU_MASK as the position of MEM_IDX 
in tb_flags may change in the future.


Otherwise, this patch looks good to me,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>


