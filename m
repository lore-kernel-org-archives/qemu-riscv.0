Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVaKv-0003Do-Jl
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 10:45:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVaKt-0003Br-1u; Sat, 19 Mar 2022 10:45:43 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:46482 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVaKq-0006uS-Bt; Sat, 19 Mar 2022 10:45:42 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACHj8eL7DVim4VUBA--.5272S2;
 Sat, 19 Mar 2022 22:45:32 +0800 (CST)
Subject: Re: [PATCH qemu 00/13] Add tail agnostic behavior for rvv instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-0@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3fdb7da2-7f68-ad7b-d23f-cd3a3845bcfd@iscas.ac.cn>
Date: Sat, 19 Mar 2022 22:45:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-0@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACHj8eL7DVim4VUBA--.5272S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF13WrWrCr4fJr43KF45Wrg_yoW8Cry3pF
 48Ga13G398XrZFgw1SgF48Cr15tFZ3Gr4rAwnrJ348t3y3trZ5tF1vk34I9FnrJFyUWr12
 k3WDAr13uws8ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUUyCJPUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 19 Mar 2022 14:45:43 -0000


在 2022/3/19 下午8:50, ~eopxd 写道:
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, qemu should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s". An option
> 'rvv_ta_all_1s' is added to enable the behavior, it is default as
> disabled.

Another question: when rvv_ta_all_1s for vta  is enabled, How about vma? 
Is it necessary to set the inactive elements to all 1s?

Regards,

Weiwei Li

>
> eopXD (13):
>    target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>    target/riscv: rvv: Rename ambiguous esz
>    target/riscv: rvv: Early exit when vstart >= vl
>    target/riscv: rvv: Add tail agnostic for vv instructions
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
>   target/riscv/insn_trans/trans_rvv.c.inc |   58 +
>   target/riscv/internals.h                |    5 +-
>   target/riscv/translate.c                |    2 +
>   target/riscv/vector_helper.c            | 1508 ++++++++++++++---------
>   7 files changed, 961 insertions(+), 617 deletions(-)
>


