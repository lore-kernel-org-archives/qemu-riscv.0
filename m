Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovqSn-0001It-CH
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 20:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovqSj-0001Dv-92; Thu, 17 Nov 2022 20:46:38 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovqSf-0005tK-4e; Thu, 17 Nov 2022 20:46:36 -0500
Received: from [192.168.3.6] (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowACnrbXt43Zjy6MVCg--.14236S2;
 Fri, 18 Nov 2022 09:46:24 +0800 (CST)
Message-ID: <69b96731-6e36-bdf8-8a5e-e5ef4dff50b0@iscas.ac.cn>
Date: Fri, 18 Nov 2022 09:46:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
To: Richard Henderson <richard.henderson@linaro.org>,
 weiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 mchitale@ventanamicro.com
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-8-liweiwei@iscas.ac.cn>
 <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
 <c117741e-f804-6796-796d-da9cf73dfe8a@iscas.ac.cn>
 <6e529a49-9f1f-d561-e494-de62a0970a0f@linaro.org>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <6e529a49-9f1f-d561-e494-de62a0970a0f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrbXt43Zjy6MVCg--.14236S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr18Ww17KFyDKF1rWr1rZwb_yoW5AFyrpF
 WkKw1I9FWDJF1vyw1xKr48XF9Yyw4fJ3ZrXa4ktF95Aas8Wr1Sqr4SgFWa9a4DXrWfXF1Y
 vayrJrykZrsrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Nov 2022 01:46:38 -0000


On 2022/11/18 04:57, Richard Henderson wrote:
> On 11/17/22 03:44, weiwei wrote:
>>> Missing a smstateen_check.  Not mentioned in the instruction 
>>> description itself, but it is within the State Enable section of JVT.
>>
>> smstateen_check have been added in REQUIRE_ZCMT.
>
>
> Oh. I see.  That's wrong, I think.
>
> Returning false from trans_* means "no match" and continue on to try 
> and match another pattern.  If Zcmt is present in the cpu, but the 
> extension is not enabled by the OS, we have found the matching insn 
> and should not look for another insn.
> You need to separate the check like
>
>     REQUIRE_ZCMT(ctx);
>
>     if (!smstateen_check(ctx, 0, SMTATEEN0_JVT)) {
>         gen_exception_illegal(ctx);
>         return true;
>     }
>
> I see that the fpcr code that you're modifying in this patch, which is 
> not yet upstream, is also incorrect in this.
>
> Looking back through your git history,
>
> https://github.com/plctlab/plct-qemu/commit/09668167880c492f88b74d0a921053ed25fc3b5c
>
> is incorrect:


Yeah. This patchset is not yet upstream but have been added to 
riscv-to-apply.next.  I also suggested  similar way

  in this patchset at the beginning. However, to some extent, JVT and 
FCSR in statenen CSR are  used to enable/disable

Zfinx and Zcmt extensions.  When they are disabled, It seems reasonable 
to look for another insn, just like the

processor doesn't support them at all.

 From the other aspect, is it possible that we support many overlapping 
extensions(such as Zcmt and Zcd or CD) in one

processor  and only one work once (just disable anothers if we need 
another to work)?

>
>> static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
>> {
>>     CPUState *cpu = ctx->cs;
>>     CPURISCVState *env = cpu->env_ptr;
>>     uint64_t stateen = env->mstateen[index];
>
> You cannot read from env during translation like this.
>
> Everything that you use for translation must be encoded in tb->flags.  
> Otherwise the state will not be considered when selecting an existing 
> TranslationBlock to execute, and the next execution through this 
> instruction will not have the *current* state of env.
>
> You probably get lucky with mstateen, because I could imagine that it 
> gets set once while the OS is booting and is never changed again.  If 
> true, then mstateen chould be treated like misa and flush all 
> translations on write: see write_misa().  And also add a large comment 
> to smstateen_check() explaining why the read from env is correct.
>
> But if that "set once" assumption is not true, and mstateen is more 
> like mstatus.fs, where a given extension is enabled/disabled often for 
> lazy migration of state, then you won't want to continually flush 
> translations.
>
Yeah. I didn't realize this question. I think we can use a specific 
helper to do this check, since  tb_flags may not be  big enough to catch 
all the information of xStateen csr.

>
> r~


