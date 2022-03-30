Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXjW-0001du-6Q
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:47:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZXjT-0001ZS-I8; Wed, 30 Mar 2022 08:47:27 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:45034 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZXjQ-0008AV-Kf; Wed, 30 Mar 2022 08:47:27 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_jJSUURiSZuCAA--.32562S2;
 Wed, 30 Mar 2022 20:47:16 +0800 (CST)
Subject: Re: [PATCH qemu v7 00/14] Add tail agnostic behavior for rvv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <937de10f-be69-247b-562f-be34c17ca945@iscas.ac.cn>
Date: Wed, 30 Mar 2022 20:47:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164863587444.17401.9965527486691250478-0@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3_jJSUURiSZuCAA--.32562S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1kCFWxGw4fAFW8uFWktFb_yoW5AF4UpF
 4kCay3J3yrXrZFgw1SgF48Cr15tFZ7Gr48Jrnrt34Ut398trZ7tFn2ka4I9FnrJFyUWry3
 K3WDAr13uws8ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
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
X-List-Received-Date: Wed, 30 Mar 2022 12:47:28 -0000


在 2022/3/30 下午6:24, ~eopxd 写道:
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
>
> v4 updates:
> - Renamed vlmax to total_elems
> - Deal with tail element when vl_eq_vlmax == true
>
> v5 updates:
> - Let `vext_get_total_elems` take `desc` and `esz`
> - Utilize `simd_maxsz(desc)` to get `vlenb`
> - Fix alignments to code
>
> v6 updates:
> - Fix `vext_get_total_elems`
>
> v7 updates:
> - Reuse `max_elems` for vector load / store helper functions. The
>     translation sets desc's `lmul` to `min(1, lmul)`, making
> `vext_max_elems`
>     equivalent to `vext_get_total_elems`.
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
>   target/riscv/insn_trans/trans_rvv.c.inc |  164 +++
>   target/riscv/internals.h                |    5 +-
>   target/riscv/translate.c                |    2 +
>   target/riscv/vector_helper.c            | 1562 ++++++++++++++---------
>   7 files changed, 1121 insertions(+), 617 deletions(-)
>
The patchset looks good to me.

Regards,

Weiwei Li


