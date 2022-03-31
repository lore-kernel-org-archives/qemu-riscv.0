Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZjXt-0002ic-3m
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 21:24:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZjXo-0002gf-TE; Wed, 30 Mar 2022 21:24:13 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:46558 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZjXm-0003qp-37; Wed, 30 Mar 2022 21:24:12 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAHcTixAkViz4mnAA--.11215S2;
 Thu, 31 Mar 2022 09:24:02 +0800 (CST)
Subject: Re: [PATCH qemu v7 00/14] Add tail agnostic behavior for rvv
 instructions
To: Alistair Francis <alistair23@gmail.com>
Cc: ~eopxd <yueh.ting.chen@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
 <937de10f-be69-247b-562f-be34c17ca945@iscas.ac.cn>
 <CAKmqyKPtyKub=MChc_C7JpoXP7+bBwTSX_c4WhuRXaoWwWjehg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <1b4004ea-68f9-b0ff-58e1-581eca7be182@iscas.ac.cn>
Date: Thu, 31 Mar 2022 09:24:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPtyKub=MChc_C7JpoXP7+bBwTSX_c4WhuRXaoWwWjehg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAHcTixAkViz4mnAA--.11215S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW5WrW3tr4UGw15Zw1kXwb_yoW5Kry7pa
 18Ca1fJ3y8XrZxWw1SgF4UCr15trZ3Gr48Jrn8J347J39xtrZ7tFn2y340k3ZrAFyUGry2
 k3Wjkr13Zws8ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 31 Mar 2022 01:24:13 -0000


在 2022/3/31 上午8:11, Alistair Francis 写道:
> On Wed, Mar 30, 2022 at 10:52 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/3/30 下午6:24, ~eopxd 写道:
>>> According to v-spec, tail agnostic behavior can be either kept as
>>> undisturbed or set elements' bits to all 1s. To distinguish the
>>> difference of tail policies, QEMU should be able to simulate the tail
>>> agnostic behavior as "set tail elements' bits to all 1s". An option
>>> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
>>> disabled.
>>>
>>> There are multiple possibility for agnostic elements according to
>>> v-spec. The main intent of this patch-set tries to add option that
>>> can distinguish between tail policies. Setting agnostic elements to
>>> all 1s makes things simple and allow QEMU to express this.
>>>
>>> We may explore other possibility of agnostic behavior by adding
>>> other options in the future. Please understand that this patch-set
>>> is limited.
>>>
>>> v2 updates:
>>> - Addressed comments from Weiwei Li
>>> - Added commit tail agnostic on load / store instructions (which
>>>      I forgot to include into the patch-set)
>>>
>>> v3 updates:
>>> - Missed the very 1st commit, adding it back
>>>
>>> v4 updates:
>>> - Renamed vlmax to total_elems
>>> - Deal with tail element when vl_eq_vlmax == true
>>>
>>> v5 updates:
>>> - Let `vext_get_total_elems` take `desc` and `esz`
>>> - Utilize `simd_maxsz(desc)` to get `vlenb`
>>> - Fix alignments to code
>>>
>>> v6 updates:
>>> - Fix `vext_get_total_elems`
>>>
>>> v7 updates:
>>> - Reuse `max_elems` for vector load / store helper functions. The
>>>      translation sets desc's `lmul` to `min(1, lmul)`, making
>>> `vext_max_elems`
>>>      equivalent to `vext_get_total_elems`.
>>>
>>> eopXD (14):
>>>     target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>>>     target/riscv: rvv: Rename ambiguous esz
>>>     target/riscv: rvv: Early exit when vstart >= vl
>>>     target/riscv: rvv: Add tail agnostic for vv instructions
>>>     target/riscv: rvv: Add tail agnostic for vector load / store
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
>>>     target/riscv: rvv: Add tail agnostic for vector integer shift
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vector integer comparison
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vector integer merge and move
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vector floating-point
>>>       instructions
>>>     target/riscv: rvv: Add tail agnostic for vector reduction instructions
>>>     target/riscv: rvv: Add tail agnostic for vector mask instructions
>>>     target/riscv: rvv: Add tail agnostic for vector permutation
>>>       instructions
>>>
>>>    target/riscv/cpu.c                      |    1 +
>>>    target/riscv/cpu.h                      |    2 +
>>>    target/riscv/cpu_helper.c               |    2 +
>>>    target/riscv/insn_trans/trans_rvv.c.inc |  164 +++
>>>    target/riscv/internals.h                |    5 +-
>>>    target/riscv/translate.c                |    2 +
>>>    target/riscv/vector_helper.c            | 1562 ++++++++++++++---------
>>>    7 files changed, 1121 insertions(+), 617 deletions(-)
>>>
>> The patchset looks good to me.
> Do you want to add a reviewed-by or acked-by tag?
>
> Alistair

Is there any other prerequirement to add these tags?  If not, It's OK 
for me to add reviewed-by on this patchset.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

>> Regards,
>>
>> Weiwei Li
>>
>>


