Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfhP9-0000Ja-1y
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhP7-0000J4-64; Fri, 24 Mar 2023 09:24:25 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhOn-0000bj-KH; Fri, 24 Mar 2023 09:24:24 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BRPpB1kFQ8cCQ--.4788S2;
 Fri, 24 Mar 2023 21:23:28 +0800 (CST)
Message-ID: <d88528a0-f83d-18fb-d06b-369154f46a5e@iscas.ac.cn>
Date: Fri, 24 Mar 2023 21:23:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 00/10] support subsets of code size reduction extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BRPpB1kFQ8cCQ--.4788S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfAr1DAw1UGw4fZFWUArb_yoW5uw1kpw
 4rCrWSkrZ8tF97Jw4Sq3WUGw15AF4Fgr45Awn7Jwn5CayavrW7Jrs7K3W3Kw1UJF1rWr1q
 93WUCw13uw45AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 13:24:25 -0000

Ping!

Several updates have been applied to the support of Zc* extensions after 
v9 was dropped from the riscv-to-apply.next list.

Any new comments for them?

Regards,

Weiwei Li

On 2023/3/7 16:13, Weiwei Li wrote:
> This patchset implements RISC-V Zc* extension v1.0.3-1 version instructions.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v12
>
> To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extensions support. We can also specify "x-zce=true,f=true" to enable Zca/Zcb/Zcmp/Zcmt and Zcf.
>
> This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test
>
> v12
> * add patch 10 to support zce property
> * rebase on upstream master: reuse riscv_get_cfg() in patch 7 and remove tcg_temp_free in patch 6
>
> v11
> * update format and field name based on the latest spec in patch 5, 6, 7 (without other functional changes)
> * rebase on riscv-to-apply.next
>
> v10:
> * rebase on Daniel's series(riscv-to-apply.next) and adjust riscv-tests to test on sifive related CPUs
>
> v9:
> * rebase on riscv-to-apply.next
>
> v8:
> * improve disas support in Patch 9
>
> v7:
> * Fix description for Zca
>
> v6：
> * fix base address for jump table in Patch 7
> * rebase on riscv-to-apply.next
>
> v5:
> * fix exception unwind problem for cpu_ld*_code in helper of cm_jalt
>
> v4:
> * improve Zcmp suggested by Richard
> * fix stateen related check for Zcmt
>
> v3:
> * update the solution for Zcf to the way of Zcd
> * update Zcb to reuse gen_load/store
> * use trans function instead of helper for push/pop
>
> v2:
> * add check for relationship between Zca/Zcf/Zcd with C/F/D based on related discussion in review of Zc* spec
> * separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/zcmt
>
> Weiwei Li (10):
>    target/riscv: add cfg properties for Zc* extension
>    target/riscv: add support for Zca extension
>    target/riscv: add support for Zcf extension
>    target/riscv: add support for Zcd extension
>    target/riscv: add support for Zcb extension
>    target/riscv: add support for Zcmp extension
>    target/riscv: add support for Zcmt extension
>    target/riscv: expose properties for Zc* extension
>    disas/riscv.c: add disasm support for Zc*
>    target/riscv: Add support for Zce
>
>   disas/riscv.c                             | 228 +++++++++++++++-
>   target/riscv/cpu.c                        |  69 +++++
>   target/riscv/cpu.h                        |  11 +
>   target/riscv/cpu_bits.h                   |   7 +
>   target/riscv/csr.c                        |  36 ++-
>   target/riscv/helper.h                     |   3 +
>   target/riscv/insn16.decode                |  62 ++++-
>   target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>   target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>   target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>   target/riscv/insn_trans/trans_rvzce.c.inc | 311 ++++++++++++++++++++++
>   target/riscv/machine.c                    |  19 ++
>   target/riscv/meson.build                  |   3 +-
>   target/riscv/translate.c                  |  15 +-
>   target/riscv/zce_helper.c                 |  55 ++++
>   15 files changed, 843 insertions(+), 16 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>   create mode 100644 target/riscv/zce_helper.c
>


