Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npY0p-0002Bw-PL
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 12:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1npY0o-00027p-Ip; Fri, 13 May 2022 12:19:30 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49688 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1npY0l-0005y9-F7; Fri, 13 May 2022 12:19:30 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADX3Y0EhX5iEPhjBg--.9235S2;
 Sat, 14 May 2022 00:19:16 +0800 (CST)
Subject: Re: [PATCH qemu v4 02/10] target/riscv: rvv: Add mask agnostic for
 vector load / store instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>, ~eopxd <yueh.ting.chen@gmail.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>
References: <165244308918.21805.1094821418229175817-2@git.sr.ht>
 <ebdab126-c45f-9fbf-3b98-8dc1e5bb87e5@iscas.ac.cn>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <15c1e146-f2e5-ee85-fe17-3bddc6bf2b28@iscas.ac.cn>
Date: Sat, 14 May 2022 00:19:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ebdab126-c45f-9fbf-3b98-8dc1e5bb87e5@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowADX3Y0EhX5iEPhjBg--.9235S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar1rKr1rCrWfZr1xWw1Dtrb_yoW3Jr18pw
 1kGrW7Xry5Krn5Jr15Jr1UJryUXr1UG3WDJr10qF1UCr4UJr1jqr4UXr40gr1UAr4kJr1U
 JF1UArnruF15JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aP
 UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Fri, 13 May 2022 16:19:30 -0000


在 2022/5/14 上午12:09, Weiwei Li 写道:
>
> 在 2022/3/17 下午3:47, ~eopxd 写道:
>> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>>
>> Signed-off-by: eop Chen <eop.chen@sifive.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>   target/riscv/insn_trans/trans_rvv.c.inc |  5 ++++
>>   target/riscv/vector_helper.c            | 35 +++++++++++++++++--------
>>   2 files changed, 29 insertions(+), 11 deletions(-)
>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
>
> Regards,
> Weiwei Li
>
Sorry, miss a space.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>> b/target/riscv/insn_trans/trans_rvv.c.inc
>> index df5a892150..a6daf20714 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -712,6 +712,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm 
>> *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>>   }
>>   @@ -777,6 +778,7 @@ static bool ld_us_mask_op(DisasContext *s, 
>> arg_vlm_v *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, NF, 1);
>>       /* Mask destination register are always tail-agnostic */
>>       data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>>   }
>>   @@ -866,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, 
>> false);
>>   }
>>   @@ -996,6 +999,7 @@ static bool ld_index_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, 
>> false);
>>   }
>>   @@ -1114,6 +1118,7 @@ static bool ldff_op(DisasContext *s, 
>> arg_r2nfvm *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>>   }
>>   diff --git a/target/riscv/vector_helper.c 
>> b/target/riscv/vector_helper.c
>> index 6c55d5a750..5d392d084e 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -282,14 +282,18 @@ vext_ldst_stride(void *vd, void *v0, 
>> target_ulong base,
>>       uint32_t esz = 1 << log2_esz;
>>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>>       uint32_t vta = vext_vta(desc);
>> +    uint32_t vma = vext_vma(desc);
>>         for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>> -        if (!vm && !vext_elem_mask(v0, i)) {
>> -            continue;
>> -        }
>> -
>>           k = 0;
>>           while (k < nf) {
>> +            if (!vm && !vext_elem_mask(v0, i)) {
>> +                /* set masked-off elements to 1s */
>> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
>> +                                  (i + k * max_elems + 1) * esz);
>> +                k++;
>> +                continue;
>> +            }
>>               target_ulong addr = base + stride * i + (k << log2_esz);
>>               ldst_elem(env, adjust_addr(env, addr), i + k * 
>> max_elems, vd, ra);
>>               k++;
>> @@ -481,15 +485,19 @@ vext_ldst_index(void *vd, void *v0, 
>> target_ulong base,
>>       uint32_t esz = 1 << log2_esz;
>>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>>       uint32_t vta = vext_vta(desc);
>> +    uint32_t vma = vext_vma(desc);
>>         /* load bytes from guest memory */
>>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>> -        if (!vm && !vext_elem_mask(v0, i)) {
>> -            continue;
>> -        }
>> -
>>           k = 0;
>>           while (k < nf) {
>> +            if (!vm && !vext_elem_mask(v0, i)) {
>> +                /* set masked-off elements to 1s */
>> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
>> +                                  (i + k * max_elems + 1) * esz);
>> +                k++;
>> +                continue;
>> +            }
>>               abi_ptr addr = get_index_addr(base, i, vs2) + (k << 
>> log2_esz);
>>               ldst_elem(env, adjust_addr(env, addr), i + k * 
>> max_elems, vd, ra);
>>               k++;
>> @@ -578,6 +586,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>>       uint32_t esz = 1 << log2_esz;
>>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>>       uint32_t vta = vext_vta(desc);
>> +    uint32_t vma = vext_vma(desc);
>>       target_ulong addr, offset, remain;
>>         /* probe every access*/
>> @@ -623,10 +632,14 @@ ProbeSuccess:
>>       }
>>       for (i = env->vstart; i < env->vl; i++) {
>>           k = 0;
>> -        if (!vm && !vext_elem_mask(v0, i)) {
>> -            continue;
>> -        }
>>           while (k < nf) {
>> +            if (!vm && !vext_elem_mask(v0, i)) {
>> +                /* set masked-off elements to 1s */
>> +                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
>> +                                  (i + k * max_elems + 1) * esz);
>> +                k++;
>> +                continue;
>> +            }
>>               target_ulong addr = base + ((i * nf + k) << log2_esz);
>>               ldst_elem(env, adjust_addr(env, addr), i + k * 
>> max_elems, vd, ra);
>>               k++;
>


