Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVnfL-0002Fi-6K
	for mharc-qemu-riscv@gnu.org; Sun, 20 Mar 2022 00:59:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVnfI-0002Ez-L1; Sun, 20 Mar 2022 00:59:40 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:33278 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVnfF-00072p-Nk; Sun, 20 Mar 2022 00:59:40 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_0OxtDZiGcZkBA--.39680S2;
 Sun, 20 Mar 2022 12:59:29 +0800 (CST)
Subject: Re: [PATCH qemu 03/13] target/riscv: rvv: Early exit when vstart >= vl
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-3@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <aaabfae7-d933-ae95-5bf0-fda21c1d8877@iscas.ac.cn>
Date: Sun, 20 Mar 2022 12:59:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-3@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3_0OxtDZiGcZkBA--.39680S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryxurWfJrW5ZFy3uFy5XFb_yoW8ury7pw
 1fCFWrZ3s8Ga4fAw1Sqa1UAr4FvFsYkrWjyFn2yws5Xa95Jw4kXr4qkw1rKr12yF45Wr1v
 y3WjvF9F9anIkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
 3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 20 Mar 2022 04:59:40 -0000


在 2022/3/12 下午2:28, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec (section 5.4):
> When vstart ≥ vl, there are no body elements, and no elements are
> updated in any destination vector register group, including that
> no tail elements are updated with agnostic values.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 30 +++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 275fded6e4..3ae75dc6ae 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>   
>
> @@ -3164,6 +3189,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
>           TCGLabel *over = gen_new_label();                          \
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -3201,6 +3227,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>
> @@ -3674,6 +3702,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>           };
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),

  vmsbf.m, vmsif.m,vmsof.m, viota.m, vcompress require vstart to be 
zero. so these checks seem  unnecessary.

Regards,

Weiwei Li



