Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nobln-0008WB-7X
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noblm-0008Vw-26; Tue, 10 May 2022 22:08:06 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:33662 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noblj-0000Yp-Im; Tue, 10 May 2022 22:08:05 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3Vhh+GntiHkKyBQ--.8561S2;
 Wed, 11 May 2022 10:07:58 +0800 (CST)
Subject: Re: [PATCH qemu v2 03/10] target/riscv: rvv: Add mask agnostic for vx
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-3@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <1c9215c5-4b7c-4183-8b1f-238ec0dd9574@iscas.ac.cn>
Date: Wed, 11 May 2022 10:07:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-3@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3Vhh+GntiHkKyBQ--.8561S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4rJF43GFykAr1ftFy7Wrg_yoW8tr4xpr
 48KrW29rZ8tFyxAw1fZF4UAr15Zan8Kw4jk3WkZws5u398XrsxXF4Dta1Ikry2y3ZxAr40
 k3WUZFZ3uanaqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUov
 38UUUUU
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
X-List-Received-Date: Wed, 11 May 2022 02:08:06 -0000


在 2022/3/17 下午4:38, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 2 ++
>   target/riscv/vector_helper.c            | 3 +++
>   2 files changed, 5 insertions(+)

Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li

>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 9a2d54313a..de8dda31fe 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1316,6 +1316,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                         s->cfg_ptr->vlen / 8, data));
>   
> @@ -1493,6 +1494,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                         s->cfg_ptr->vlen / 8, data));
>   
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 89eea33eb3..98c9f21182 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -901,10 +901,13 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>       uint32_t i;
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>               continue;
>           }
>           fn(vd, s1, vs2, i);


