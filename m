Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVleW-0004gp-O6
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 22:50:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVleR-0004eI-Qi; Sat, 19 Mar 2022 22:50:39 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:56544 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVleO-00050t-PJ; Sat, 19 Mar 2022 22:50:39 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACXnvp0ljZihgxtBA--.35737S2;
 Sun, 20 Mar 2022 10:50:28 +0800 (CST)
Subject: Re: [PATCH qemu 07/13] target/riscv: rvv: Add tail agnostic for
 vector integer comparison instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-7@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <d657d625-5288-238d-0224-02a2e84f7a00@iscas.ac.cn>
Date: Sun, 20 Mar 2022 10:50:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-7@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACXnvp0ljZihgxtBA--.35737S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4DZw1xZFWUtw4UKF48Zwb_yoW8KFykp3
 Z7KrWfArs3JFZ7Ww1ftayUZ3W5WFnxGr15Aw4Du3WrArZ5Ja1kWr1DGa1jyF13KF9rCF1Y
 v3WvvF1IvwsFvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
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
X-List-Received-Date: Sun, 20 Mar 2022 02:50:40 -0000


在 2022/3/7 下午5:43, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/vector_helper.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 6d79908ffe..9a08d14689 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1317,6 +1317,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>   {                                                             \
>       uint32_t vm = vext_vm(desc);                              \
>       uint32_t vl = env->vl;                                    \
> +    uint32_t vlmax =                                          \
> +        vext_get_vlmax(env_archcpu(env), env->vtype);         \
> +    uint32_t vta = vext_vta(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
> @@ -1328,6 +1331,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>           vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
>       }                                                         \
>       env->vstart = 0;                                          \
> +    /* clear tail element */                                  \
> +    if (vta) {                                                \
> +        for (; i < vlmax; i++) {                              \
> +            vext_set_elem_mask(vd, i, 1);                     \
> +        }                                                     \
> +    }                                                         \
>   }
>   

Why comment 'clear tail element' here?

"In addition, except for mask load instructions, any element in the tail 
of a mask result can also be written with the value the
mask-producing operation would have calculated with vl=VLMAX.

Furthermore, for mask-logical instructions and vmsbf.m,
vmsif.m, vmsof.m mask-manipulation instructions, any element in the tail 
of the result can be written with the value the
mask-producing operation would have calculated with vl=VLEN, SEW=8, and 
LMUL=8 (i.e., all bits of the mask register can
be overwritten)."

Regards,

Weiwei Li


>   GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
> @@ -1366,6 +1375,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>   {                                                                   \
>       uint32_t vm = vext_vm(desc);                                    \
>       uint32_t vl = env->vl;                                          \
> +    uint32_t vlmax =                                                \
> +        vext_get_vlmax(env_archcpu(env), env->vtype);               \
> +    uint32_t vta = vext_vta(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
> @@ -1377,6 +1389,12 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>                   DO_OP(s2, (ETYPE)(target_long)s1));                 \
>       }                                                               \
>       env->vstart = 0;                                                \
> +    /* clear tail element */                                        \
> +    if (vta) {                                                      \
> +        for (; i < vlmax; i++) {                                    \
> +            vext_set_elem_mask(vd, i, 1);                           \
> +        }                                                           \
> +    }                                                               \
>   }
>   
>   GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)


