Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRxCh-000649-6A
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRxCf-00063w-Sh; Tue, 14 Feb 2023 10:26:45 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRxCd-00044n-PV; Tue, 14 Feb 2023 10:26:45 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowACnrs4tqOtjWTMYBQ--.27683S2;
 Tue, 14 Feb 2023 23:26:37 +0800 (CST)
Message-ID: <7500b03d-c6c9-9747-6d98-ead645785c86@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:26:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 11/11] target/riscv/cpu: remove CPUArchState^features and
 friends
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-12-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowACnrs4tqOtjWTMYBQ--.27683S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3Ar4rKw13uFyxGFyDZFb_yoW5JryUpw
 s5CayUuFWDJrZrZayxJrs5XF4rCws8Ga15Cw18Cw1fKF45GrW2vFyDt3WIyrn5Ja48ur12
 9F4qvry3Aw4UZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsiSdUUU
 UU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 15:26:46 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> The attribute is no longer used since we can retrieve all the enabled
> features in the hart by using cpu->cfg instead.
>
> Remove env->feature, riscv_feature() and riscv_set_feature(). We also
> need to bump vmstate_riscv_cpu version_id and minimal_version_id since
> 'features' is no longer being migrated.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li
> ---
>   target/riscv/cpu.h     | 12 ------------
>   target/riscv/machine.c |  5 ++---
>   2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 83a9fa38d9..6290c6d357 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -173,8 +173,6 @@ struct CPUArchState {
>       /* 128-bit helpers upper part return value */
>       target_ulong retxh;
>   
> -    uint32_t features;
> -
>   #ifdef CONFIG_USER_ONLY
>       uint32_t elf_flags;
>   #endif
> @@ -525,16 +523,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
>       return (env->misa_ext & ext) != 0;
>   }
>   
> -static inline bool riscv_feature(CPURISCVState *env, int feature)
> -{
> -    return env->features & (1ULL << feature);
> -}
> -
> -static inline void riscv_set_feature(CPURISCVState *env, int feature)
> -{
> -    env->features |= (1ULL << feature);
> -}
> -
>   #include "cpu_user.h"
>   
>   extern const char * const riscv_int_regnames[];
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 67e9e56853..9c455931d8 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>   
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 6,
> -    .minimum_version_id = 6,
> +    .version_id = 7,
> +    .minimum_version_id = 7,
>       .post_load = riscv_cpu_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
> -        VMSTATE_UINT32(env.features, RISCVCPU),
>           VMSTATE_UINTTL(env.priv, RISCVCPU),
>           VMSTATE_UINTTL(env.virt, RISCVCPU),
>           VMSTATE_UINT64(env.resetvec, RISCVCPU),


