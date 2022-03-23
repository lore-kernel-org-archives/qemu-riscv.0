Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWvpV-0000I6-FQ
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 03:54:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWvpQ-0000Gv-Gn; Wed, 23 Mar 2022 03:54:48 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:48646 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWvpM-00028D-0U; Wed, 23 Mar 2022 03:54:48 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3vkI60jpiRYkDBQ--.38288S2;
 Wed, 23 Mar 2022 15:54:34 +0800 (CST)
Subject: Re: [PATCH qemu v3 00/14] Add tail agnostic behavior for rvv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164800788276.12449.15168787569124374586-0@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <ec87cb8d-423f-794e-0864-2f4f7cf483e2@iscas.ac.cn>
Date: Wed, 23 Mar 2022 15:54:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164800788276.12449.15168787569124374586-0@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3vkI60jpiRYkDBQ--.38288S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWDtrW7Cr1UWryfGry8Krg_yoW5XF1kpF
 4kCa13GrZ5XrZrWw1SgF48Ar15tFZ3Gw4rJwnrJ34UJ39xtrWktF1kK34j9FnrJFyUWry7
 K3WDAr13Zws8ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
 a9aPUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Mar 2022 07:54:48 -0000


在 2022/3/23 上午11:58, ~eopxd 写道:
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, QEMU should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s". An option
> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
> disabled.
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between tail policies. Setting agnostic elements to
> all 1s makes things simple and allow QEMU to express this.
>
> We may explore other possibility of agnostic behavior by adding
> other options in the future. Please understand that this patch-set
> is limited.
>
> v2 updates:
> - Addressed comments from Weiwei Li
> - Added commit tail agnostic on load / store instructions (which
>     I forgot to include into the patch-set)
>
> v3 updates:
> - Missed the very 1st commit, adding it back

I find  some trans_* function for vector instructions are optimized  to 
use tcg_gen_gvec_*

directly when vl = vlmax (vl_eq_vlmax is true). However, as discussed 
before,

tail elements may pass vlmax when lmul < 0.

So additional tail elements  may also need to overwrite here.

Regards,

Weiwei Li

>
> eopXD (14):
>    target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>    target/riscv: rvv: Rename ambiguous esz
>    target/riscv: rvv: Early exit when vstart >= vl
>    target/riscv: rvv: Add tail agnostic for vv instructions
>    target/riscv: rvv: Add tail agnostic for vector load / store
>      instructions
>    target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
>    target/riscv: rvv: Add tail agnostic for vector integer shift
>      instructions
>    target/riscv: rvv: Add tail agnostic for vector integer comparison
>      instructions
>    target/riscv: rvv: Add tail agnostic for vector integer merge and move
>      instructions
>    target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
>      instructions
>    target/riscv: rvv: Add tail agnostic for vector floating-point
>      instructions
>    target/riscv: rvv: Add tail agnostic for vector reduction instructions
>    target/riscv: rvv: Add tail agnostic for vector mask instructions
>    target/riscv: rvv: Add tail agnostic for vector permutation
>      instructions
>
>   target/riscv/cpu.c                      |    1 +
>   target/riscv/cpu.h                      |    2 +
>   target/riscv/cpu_helper.c               |    2 +
>   target/riscv/insn_trans/trans_rvv.c.inc |   66 +
>   target/riscv/internals.h                |    5 +-
>   target/riscv/translate.c                |    2 +
>   target/riscv/vector_helper.c            | 1571 ++++++++++++++---------
>   7 files changed, 1026 insertions(+), 623 deletions(-)
>


