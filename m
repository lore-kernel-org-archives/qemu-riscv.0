Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKWKF-0000s2-Ps
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 21:15:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nKWKD-0000kZ-9p; Wed, 16 Feb 2022 21:15:17 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:36442 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nKWK8-0008Rp-LF; Wed, 16 Feb 2022 21:15:15 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADn6MChrw1itXO3AA--.50708S2;
 Thu, 17 Feb 2022 10:14:59 +0800 (CST)
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <2c0fcafe-868a-ba7a-bf42-3a4ed2df19ba@iscas.ac.cn>
Date: Thu, 17 Feb 2022 10:14:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220216154839.1024927-3-cmuellner@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADn6MChrw1itXO3AA--.50708S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWDXryDCF1UCr1rAFy5Arb_yoW5AFy5pF
 Z3GFy3KFs7XF1DZ3y0qwnFvF4F93WxCayjgw48X3sYkw43Gr13XF1vkFs8CrsxJFs7Zw42
 ga1YvF1xA3yqvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 17 Feb 2022 02:15:17 -0000


在 2022/2/16 下午11:48, Christoph Muellner 写道:
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 39ffb883fc..04500fe352 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
Why use two different cache block size here? Is there any new spec 
update for this?
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> +
> +/* helper_zicbom_access
> + *
> + * Check access permissions (LOAD, STORE or FETCH as specified in section
> + * 2.5.2 of the CMO specification) for Zicbom, raising either store
> + * page-fault (non-virtualised) or store guest-page fault (virtualised).
> + */
> +static void helper_zicbom_access(CPURISCVState *env, target_ulong address,
> +                                 uintptr_t ra)
> +{
> +    int ret;
> +    void* phost;
> +    int mmu_idx = cpu_mmu_index(env, false);
> +
> +    /* Get the size of the cache block for management instructions. */
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
> +
> +    /* Mask off low-bits to align-down to the cache-block. */
> +    address &= ~(cbomlen - 1);
> +
> +    /* A cache-block management instruction is permitted to access
> +     * the specified cache block whenever a load instruction, store
> +     * instruction, or instruction fetch is permitted to access the
> +     * corresponding physical addresses.
> +     */
> +    ret = probe_access_range_flags(env, address, cbomlen, MMU_DATA_LOAD,
> +                                   mmu_idx, true, &phost, ra);
> +    if (ret == TLB_INVALID_MASK)
> +        ret = probe_access_range_flags(env, address, cbomlen, MMU_INST_FETCH,
> +                                       mmu_idx, true, &phost, ra);
> +    if (ret == TLB_INVALID_MASK)
> +        probe_access_range_flags(env, address, cbomlen, MMU_DATA_STORE,
> +                                 mmu_idx, false, &phost, ra);
> +}
> +


I think it's a little different here. Probe_access_range_flags may 
trigger different execptions for different access_type. For example:

If  the page for the address  is executable and readable but not 
writable,  and the access cannot pass the pmp check for all access_type,

it may trigger access fault for load/fetch access, and  trigger page 
fault for  store access.

I think the final exception should be access fault instead of the page 
fault caused by probe_access_range_flags with MMU_DATA_STORE.

Regards,

Weiwei Li



