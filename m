Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUMrq-00052B-4c
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 02:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUMro-0004yh-5G; Tue, 21 Feb 2023 02:15:12 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUMrk-00037l-T9; Tue, 21 Feb 2023 02:15:11 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowABXXZlub_RjV92lBg--.3325S2;
 Tue, 21 Feb 2023 15:14:54 +0800 (CST)
Message-ID: <56208597-1552-4522-8223-47297e26027a@iscas.ac.cn>
Date: Tue, 21 Feb 2023 15:14:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v11 0/9] support subsets of code size reduction extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXXZlub_RjV92lBg--.3325S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1fArWDCr45Jr43Wr1fXrb_yoW5AFWfpw
 4rCrWSkrZ8tFyxJw4Sq3WUGw15AF4rWr45Awn7Jwn5CayavrW3Jrs7K3W3Gw1UJF15Wr1q
 9F1UCw13uw45AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5JPEDU
 UUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Tue, 21 Feb 2023 07:15:12 -0000

Hi,  any  new comments for this patchset?

Regards,

Weiwei Li

On 2023/2/9 12:13, Weiwei Li wrote:
> This patchset implements RISC-V Zc* extension v1.0.2-1 version instructions.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v11
>
> To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extensions support.
>
>
> This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test
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
> Weiwei Li (9):
>    target/riscv: add cfg properties for Zc* extension
>    target/riscv: add support for Zca extension
>    target/riscv: add support for Zcf extension
>    target/riscv: add support for Zcd extension
>    target/riscv: add support for Zcb extension
>    target/riscv: add support for Zcmp extension
>    target/riscv: add support for Zcmt extension
>    target/riscv: expose properties for Zc* extension
>    disas/riscv.c: add disasm support for Zc*
>
>   disas/riscv.c                             | 228 +++++++++++++++-
>   target/riscv/cpu.c                        |  56 ++++
>   target/riscv/cpu.h                        |  10 +
>   target/riscv/cpu_bits.h                   |   7 +
>   target/riscv/csr.c                        |  38 ++-
>   target/riscv/helper.h                     |   3 +
>   target/riscv/insn16.decode                |  62 ++++-
>   target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>   target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>   target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>   target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
>   target/riscv/machine.c                    |  19 ++
>   target/riscv/meson.build                  |   3 +-
>   target/riscv/translate.c                  |  15 +-
>   target/riscv/zce_helper.c                 |  55 ++++
>   15 files changed, 833 insertions(+), 16 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>   create mode 100644 target/riscv/zce_helper.c
>


