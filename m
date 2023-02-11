Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQfrv-0004Qu-Lt
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 21:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQfrs-0004QQ-AE; Fri, 10 Feb 2023 21:44:00 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQfro-0008Us-Qx; Fri, 10 Feb 2023 21:43:59 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowACXl0PfAOdjVxqABA--.8101S2;
 Sat, 11 Feb 2023 10:43:44 +0800 (CST)
Message-ID: <2a0d5e1e-f2ff-6502-0f88-f6b3005bcaf3@iscas.ac.cn>
Date: Sat, 11 Feb 2023 10:43:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/11] target/riscv: allow users to actually write the
 MISA CSR
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-3-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXl0PfAOdjVxqABA--.8101S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF48tr18KF13Kw4kKryUZFb_yoW5ZFyDpF
 WrKayYkryDtrWxZa97JF1DJF48uw13Gayakwn7uw1Fvr45JrWFgFnrKa43KFn8JFZ3ur42
 gFs8CFy3AF4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
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
X-List-Received-Date: Sat, 11 Feb 2023 02:44:01 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> There is a good chance that the code in write_misa() hasn't been
> properly tested. Allowing users to write MISA can open the floodgates of
> new breeds of bugs. We could instead remove most (if not all) of
> write_misa() since it's never used. Well, as a hardware emulator,
> dealing with crashes because a register write went wrong is what we're
> here for.
>
> Create a 'misa-w' CPU property to allow users to choose whether writes
> to MISA should be allowed. The default is set to 'false' for all RISC-V
> machines to keep compatibility with what we´ve been doing so far.
>
> Read cpu->cfg.misa_w directly in write_misa(), instead of executing
> riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
> simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
> require a riscv_feature() call to read it back.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 1 +
>   target/riscv/cpu.h | 1 +
>   target/riscv/csr.c | 4 +++-
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..69fb9e123f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
>   
>   static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> +    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
>   
>       DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..103963b386 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -498,6 +498,7 @@ struct RISCVCPUConfig {
>       bool pmp;
>       bool epmp;
>       bool debug;
> +    bool misa_w;
>   
>       bool short_isa_string;
>   };
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e149b453da..4f9cc501b2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1329,7 +1329,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.misa_w) {

It's Ok to get it directly from cfg. However, personally, I prefer to 
keep the non-isa features in a separate list.

Regards,

Weiwei Li

>           /* drop write to misa */
>           return RISCV_EXCP_NONE;
>       }


