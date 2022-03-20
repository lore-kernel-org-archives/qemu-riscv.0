Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVlRJ-00015Z-7W
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 22:37:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVlRH-000157-0f; Sat, 19 Mar 2022 22:37:03 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:54878 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVlRE-00033x-9d; Sat, 19 Mar 2022 22:37:02 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowABHT_NDkzZioHBsBA--.35277S2;
 Sun, 20 Mar 2022 10:36:52 +0800 (CST)
Subject: Re: [PATCH qemu 06/13] target/riscv: rvv: Add tail agnostic for
 vector integer shift instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-6@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <a83ba422-9934-9472-666b-29daafa72108@iscas.ac.cn>
Date: Sun, 20 Mar 2022 10:36:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-6@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowABHT_NDkzZioHBsBA--.35277S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1xurW3XF1fWFy8ZryUAwb_yoW8Zr4fpw
 4kKFWfZrZ8KFWxuw1SqF4UAr15ZF45Gw4Fyw1kZwn8ArW5Jws5ZF1qk3WIkr17JFyUuF1Y
 93WUZr4S9wsIqFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUTOJ5UUUUU=
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
X-List-Received-Date: Sun, 20 Mar 2022 02:37:03 -0000


在 2022/3/7 下午5:38, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  1 +
>   target/riscv/vector_helper.c            | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index ac6379a8fc..f1838fbf11 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1871,6 +1871,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 56a32adcb9..6d79908ffe 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1216,6 +1216,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>   {                                                                         \
>       uint32_t vm = vext_vm(desc);                                          \
>       uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(TS1);                                           \
> +    uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);        \
> +    uint32_t vta = vext_vta(desc);                                        \
>       uint32_t i;                                                           \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
> @@ -1227,6 +1230,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>           *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
>       }                                                                     \
>       env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
>   }
>   

Use vlmax here and in the previous patches may not contains all the tail 
elements:

"When LMUL < 1, the tail includes the elements past VLMAX that are held 
in the same vector register"

Regards,

Weiwei Li


