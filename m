Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CAC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 15:47:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6vNc-0005lq-4f; Wed, 07 Jun 2023 11:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q6vNQ-0005kM-Ur; Wed, 07 Jun 2023 11:47:12 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q6vNN-00036X-D5; Wed, 07 Jun 2023 11:47:12 -0400
Received: from [192.168.100.156] (unknown [117.61.101.195])
 by APP-05 (Coremail) with SMTP id zQCowADn7IhrpoBkfPP3DA--.51920S2;
 Wed, 07 Jun 2023 23:46:53 +0800 (CST)
Message-ID: <d5b2fa4d-8595-bc9f-0d33-327fddd560e5@iscas.ac.cn>
Date: Wed, 7 Jun 2023 23:46:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] target/riscv/vector_helper.c: Remove the check for
 extra tail elements
To: Xiao Wang <xiao.w.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230607091646.4049428-1-xiao.w.wang@intel.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230607091646.4049428-1-xiao.w.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn7IhrpoBkfPP3DA--.51920S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr17JF48Aw17GrWxZrWkJFb_yoWrJw1Dpa
 1xGFZxuFWFq39ruw13GF4jvr48C3WrJrW7Kr1xKr1qv345urZ7KFnFyF47CFyqyF9avr1F
 kF1qyw4furWv9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [117.61.101.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/6/7 17:16, Xiao Wang wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added an extra check for LMUL fragmentation,
> intended for setting the "rest tail elements" in the last register for a
> segment load insn.
>
> Actually, the max_elements derived in vext_ld*() won't be a fraction of
> vector register size, since the lmul encoded in desc is emul, which has
> already been adjusted to 1 for LMUL fragmentation case by vext_get_emul()
> in trans_rvv.c.inc, for ld_stride(), ld_us(), ld_index() and ldff().
>
> Besides, vext_get_emul() has also taken EEW/SEW into consideration, so no
> need to call vext_get_total_elems() which would base on the emul to derive
> another emul, the second emul would be incorrect when esz differs from sew.
>
> Thus this patch removes the check for extra tail elements.
>
> Fixes: 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector load / store instructions")
>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
> v2:
> * Rebased on top of Alistair's riscv-to-apply.next branch.
> ---
>   target/riscv/vector_helper.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7505f9470a..f261e726c2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -264,11 +264,10 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>   GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>   
> -static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> -                                   void *vd, uint32_t desc, uint32_t nf,
> +static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
> +                                   uint32_t desc, uint32_t nf,
>                                      uint32_t esz, uint32_t max_elems)
>   {
> -    uint32_t total_elems, vlenb, registers_used;
>       uint32_t vta = vext_vta(desc);
>       int k;
>   
> @@ -276,19 +275,10 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>           return;
>       }
>   
> -    total_elems = vext_get_total_elems(env, desc, esz);
> -    vlenb = riscv_cpu_cfg(env)->vlen >> 3;
> -
>       for (k = 0; k < nf; ++k) {
>           vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                             (k * max_elems + max_elems) * esz);
>       }
> -
> -    if (nf * max_elems % total_elems != 0) {
> -        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
>   }
>   
>   /*
> @@ -324,7 +314,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -383,7 +373,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
>   }
>   
>   /*
> @@ -504,7 +494,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -634,7 +624,7 @@ ProbeSuccess:
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \


