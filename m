Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piahK-0005qW-EU
	for mharc-qemu-riscv@gnu.org; Sat, 01 Apr 2023 08:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piahG-0005dw-8a; Sat, 01 Apr 2023 08:51:06 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piahC-0002uD-6g; Sat, 01 Apr 2023 08:51:05 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAC3ukaxKChkeGHCGQ--.7948S2;
 Sat, 01 Apr 2023 20:50:58 +0800 (CST)
Message-ID: <a6f6e74e-997b-538a-da33-efc09001623c@iscas.ac.cn>
Date: Sat, 1 Apr 2023 20:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/6] target/riscv: Fix pointer mask related support
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230401123917.20471-1-liweiwei@iscas.ac.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230401123917.20471-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3ukaxKChkeGHCGQ--.7948S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fGw4fuF1fKFy8uF1xKrg_yoW8CryxpF
 WfC3ySkayDJFZ7Xr1fJa18Cr15GF4fuFWUCwn7Jwn5tw45trWjvrn7K34FkFWDZFyfWry7
 KF1Yyr1fuFWUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4I
 kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
 WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr
 0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
 6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
 4UJbIYCTnIWIevJa73UjIFyTuYvjfUouWlDUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 12:51:06 -0000


On 2023/4/1 20:39, Weiwei Li wrote:
> This patchset tries to fix some problem in current implementation for pointer mask, and add support for pointer mask of instruction fetch.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-pm-fix-v5
>
> v2:
> * drop some error patchs
> * Add patch 2 and 3 to fix the new problems
> * Add patch 4 and 5 to use PC-relative translation for pointer mask for instruction fetch
>
> v3:
> * use target_pc temp instead of cpu_pc to store into badaddr in patch 3
> * use dest_gpr instead of tcg_temp_new() for succ_pc in patch 4
> * enable CF_PCREL for system mode in seperate patch 5
>
> v4：
> * Fix wrong pc_save value for conditional jump in patch 4
> * Fix tcg_cflags overwrite problem to make CF_PCREL really work in new patch 5
> * Fix tb mis-matched problem in new patch 6
>
> v5:
> * use gen_get_target_pc to compute target address of auipc and successor address of jalr in patch 4.
> * separate tcg related fix patches(5, 6) from this patchset
>
> Weiwei Li (6):
>    target/riscv: Fix pointer mask transformation for vector address
>    target/riscv: Update cur_pmmask/base when xl changes
>    target/riscv: Fix target address to update badaddr
>    target/riscv: Add support for PC-relative translation
>    target/riscv: Enable PC-relative translation in system mode
>    target/riscv: Add pointer mask support for instruction fetch
>
>   target/riscv/cpu.c                      | 31 +++++++----
>   target/riscv/cpu.h                      |  1 +
>   target/riscv/cpu_helper.c               | 20 ++++++-
>   target/riscv/csr.c                      | 11 ++--
>   target/riscv/insn_trans/trans_rvi.c.inc | 37 +++++++++----
>   target/riscv/translate.c                | 72 ++++++++++++++++++-------
>   target/riscv/vector_helper.c            |  2 +-
>   7 files changed, 131 insertions(+), 43 deletions(-)
>
Sorry for the wrong version number in Subject. I have re-sent it.

Regards,

Weiwei Li


