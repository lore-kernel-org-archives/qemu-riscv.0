Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npKAR-0005oL-MP
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 21:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1npKAQ-0005o5-4e; Thu, 12 May 2022 21:32:30 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:53916 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1npKAN-00030s-6t; Thu, 12 May 2022 21:32:29 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAAH6XUgtX1iEsUNBg--.33491S2;
 Fri, 13 May 2022 09:32:18 +0800 (CST)
Subject: Re: [PATCH qemu v3 00/10] Add mask agnostic behavior for rvv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165234571195.20102.85010942779919381-0@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <5672f74a-dd86-6602-59ce-a688571631ce@iscas.ac.cn>
Date: Fri, 13 May 2022 09:32:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165234571195.20102.85010942779919381-0@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAAH6XUgtX1iEsUNBg--.33491S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw4UKFyDGFW5Jw1DXF1xuFg_yoW5Gw4fpF
 40k3ZxJayrXFZrWw1Sgr48Cry5KFZ3Gr4rCFn7A34rt3y5t397tF1vy34j9FsrJF15ury2
 93Wjyr17ZanxAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
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
X-List-Received-Date: Fri, 13 May 2022 01:32:30 -0000


在 2022/5/12 下午4:55, ~eopxd 写道:
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> The following instructions that are always unmasked and not affected:
>
> - Vector add-with-carry and subtract-with-borrow instructions
> - Vector merge and move instructions
> - Vector reduction instructions
> - Vector mask-register logical instructions
> - `vcompress`
>
> This patch set is based on v17 of patch set "Add tail agnostic behavior
> for
> rvv instructions".
> Based on: <165234397852.32492.1203149738524050090-0@git.sr.ht>
>
> v2 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Minor change for vector load/store instructions
>
> v3 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Fix coding style, add missing space
> - Trigger `vma` when encountering vector load instructions and not in
>    vector stores

Instead of add is_load in the helper functions, maybe it's better to 
just not set vta and vma for

vector store instructions in trans_rvv.

Regards,

Weiwei Li

>
> Yueh-Ting (eop) Chen (9):
>    target/riscv: rvv: Add mask agnostic for vv instructions
>    target/riscv: rvv: Add mask agnostic for vector load / store
>      instructions
>    target/riscv: rvv: Add mask agnostic for vx instructions
>    target/riscv: rvv: Add mask agnostic for vector integer shift
>      instructions
>    target/riscv: rvv: Add mask agnostic for vector integer comparison
>      instructions
>    target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic
>      instructions
>    target/riscv: rvv: Add mask agnostic for vector floating-point
>      instructions
>    target/riscv: rvv: Add mask agnostic for vector mask instructions
>    target/riscv: rvv: Add mask agnostic for vector permutation
>      instructions
>
> eopXD (1):
>    target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable optional mask
>      agnostic behavior
>
>   target/riscv/cpu.c                      |   1 +
>   target/riscv/cpu.h                      |   2 +
>   target/riscv/cpu_helper.c               |   2 +
>   target/riscv/insn_trans/trans_rvv.c.inc |  32 +++++
>   target/riscv/internals.h                |   5 +-
>   target/riscv/translate.c                |   2 +
>   target/riscv/vector_helper.c            | 152 ++++++++++++++++++++----
>   7 files changed, 171 insertions(+), 25 deletions(-)
>


