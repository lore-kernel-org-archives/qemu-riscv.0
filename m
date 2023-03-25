Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg5SU-0001iw-GW
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 11:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pg5ST-0001g1-Je; Sat, 25 Mar 2023 11:05:29 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pg5SQ-0006eS-3r; Sat, 25 Mar 2023 11:05:28 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeauBmY_1679756710; 
Received: from 30.13.180.55(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeauBmY_1679756710) by smtp.aliyun-inc.com;
 Sat, 25 Mar 2023 23:05:11 +0800
Message-ID: <05fa4702-0a9e-f5fe-c80c-e0bf030e7457@linux.alibaba.com>
Date: Sat, 25 Mar 2023 23:05:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/8] target/riscv: Simplification for RVH related check
 and code style fix
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 15:05:30 -0000


On 2023/3/24 20:38, Weiwei Li wrote:
> This patchset tries to simplify the RVH related check and fix some code style problems, such as problems for indentation, multi-line comments and lines with over 80 characters.

This patch set looks good to me, except a small comment on patch 
6(target/riscv: Fix format for indentation).

I have sent a patch to convert the env->virt to a bool type.

https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06191.html

With this patch and your patch 3(target/riscv: Remove check on RVH for 
riscv_cpu_virt_enabled), I think we can remove the riscv_cpu_virt_enabled
which has been called so many times.

you can pick it up into this patch set if you desire.

No matter what you choose, after small fix for patch 6,  for this whole 
patch set

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-cleanup-upstream
>
> Weiwei Li (8):
>    target/riscv: Remove redundant call to riscv_cpu_virt_enabled
>    target/riscv: Remove redundant check on RVH
>    target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
>    target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
>    target/riscv: Remove redundant parentheses
>    target/riscv: Fix format for indentation
>    target/riscv: Fix format for comments
>    target/riscv: Fix lines with over 80 characters
>
>   target/riscv/arch_dump.c                |   7 +-
>   target/riscv/cpu.c                      |   6 +-
>   target/riscv/cpu.h                      |  26 ++-
>   target/riscv/cpu_bits.h                 |   2 +-
>   target/riscv/cpu_helper.c               |  86 ++++---
>   target/riscv/csr.c                      |   6 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  54 ++---
>   target/riscv/op_helper.c                |   7 +-
>   target/riscv/pmp.c                      |  48 ++--
>   target/riscv/pmp.h                      |   9 +-
>   target/riscv/pmu.c                      |   3 +-
>   target/riscv/sbi_ecall_interface.h      |   8 +-
>   target/riscv/translate.c                |   8 +-
>   target/riscv/vector_helper.c            | 292 ++++++++++++++----------
>   14 files changed, 316 insertions(+), 246 deletions(-)
>

