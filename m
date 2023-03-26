Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgRhJ-0005Hw-L4
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 10:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgRhI-0005Hc-3G; Sun, 26 Mar 2023 10:50:16 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgRhF-0006OT-CO; Sun, 26 Mar 2023 10:50:15 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowADX8NSbWyBkWtA2Fw--.38864S2;
 Sun, 26 Mar 2023 22:50:03 +0800 (CST)
Message-ID: <55967195-eb20-3940-937d-ad306f30e911@iscas.ac.cn>
Date: Sun, 26 Mar 2023 22:50:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/1] target/riscv: Convert env->virt to a bool
 env->virt_enabled
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowADX8NSbWyBkWtA2Fw--.38864S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UWF13Xr1rJw17Jw1UZFb_yoWrXw13pr
 4kCayIkrWDJFZ3Ca1xtF1UWw15Jws0gr4Y9w4kuw48Ga1rJrW5WFnrKw4IyFs5JF18ur1j
 9F4jyFy3Ar48Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Sun, 26 Mar 2023 14:50:16 -0000


On 2023/3/25 22:53, LIU Zhiwei wrote:
> Currently we only use the env->virt to encode the virtual mode enabled
> status. Let's make it a bool type.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

I'm not quite sure the original reason to use a int for virt.

However, this change is acceptable to me.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.h        | 2 +-
>   target/riscv/cpu_bits.h   | 3 ---
>   target/riscv/cpu_helper.c | 6 +++---
>   target/riscv/machine.c    | 6 +++---
>   target/riscv/translate.c  | 4 ++--
>   5 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..3c8041c5a4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,7 +183,7 @@ struct CPUArchState {
>   #ifndef CONFIG_USER_ONLY
>       target_ulong priv;
>       /* This contains QEMU specific information about the virt state. */
> -    target_ulong virt;
> +    bool virt_enabled;
>       target_ulong geilen;
>       uint64_t resetvec;
>   
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..45ddb00aa5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -607,9 +607,6 @@ typedef enum {
>   #define PRV_H 2 /* Reserved */
>   #define PRV_M 3
>   
> -/* Virtulisation Register Fields */
> -#define VIRT_ONOFF          1
> -
>   /* RV32 satp CSR field masks */
>   #define SATP32_MODE         0x80000000
>   #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..56f4ff9ccc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -564,7 +564,7 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env)
>           return false;
>       }
>   
> -    return get_field(env->virt, VIRT_ONOFF);
> +    return env->virt_enabled;
>   }
>   
>   void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> @@ -574,11 +574,11 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>       }
>   
>       /* Flush the TLB on all virt mode changes. */
> -    if (get_field(env->virt, VIRT_ONOFF) != enable) {
> +    if (env->virt_enabled != enable) {
>           tlb_flush(env_cpu(env));
>       }
>   
> -    env->virt = set_field(env->virt, VIRT_ONOFF, enable);
> +    env->virt_enabled = enable;
>   
>       if (enable) {
>           /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9c455931d8..0fb3ddda06 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>   
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 7,
> -    .minimum_version_id = 7,
> +    .version_id = 8,
> +    .minimum_version_id = 8,
>       .post_load = riscv_cpu_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -352,7 +352,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
>           VMSTATE_UINTTL(env.priv, RISCVCPU),
> -        VMSTATE_UINTTL(env.virt, RISCVCPU),
> +        VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
>           VMSTATE_UINT64(env.resetvec, RISCVCPU),
>           VMSTATE_UINTTL(env.mhartid, RISCVCPU),
>           VMSTATE_UINT64(env.mstatus, RISCVCPU),
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..c3adf30b54 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1255,8 +1255,8 @@ static void riscv_tr_disas_log(const DisasContextBase *dcbase,
>   
>       fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
>   #ifndef CONFIG_USER_ONLY
> -    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
> -            env->priv, env->virt);
> +    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: %d\n",
> +            env->priv, env->virt_enabled);
>   #endif
>       target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
>   }


