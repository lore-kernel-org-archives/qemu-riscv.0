Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBHH-00014z-15
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZBHD-0000zd-PQ; Mon, 06 Mar 2023 08:53:19 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZBHB-0004c1-5i; Mon, 06 Mar 2023 08:53:19 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowACnr_c_8AVk6B1DDA--.48519S2;
 Mon, 06 Mar 2023 21:53:04 +0800 (CST)
Message-ID: <a2a085f6-e92b-598e-075a-9a929fa3620f@iscas.ac.cn>
Date: Mon, 6 Mar 2023 21:53:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 45/70] target/riscv: Avoid tcg_const_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-46-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230227054233.390271-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACnr_c_8AVk6B1DDA--.48519S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWkArWDXrW8uF4UAr15CFg_yoW8KFWDpr
 4rK3y2kr45JFWfZa43tF4UZF1UXa1Yk3yYvw1vvwn5GFs8GrW7ZFs8K347Krs8J3WUur12
 kFZ8Aa15uw40qaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07je1v3UUUUU=
X-Originating-IP: [180.165.240.213]
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
X-List-Received-Date: Mon, 06 Mar 2023 13:53:20 -0000


On 2023/2/27 13:42, Richard Henderson wrote:
> All uses are strictly read-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> ---
>   target/riscv/translate.c                  | 4 ++--
>   target/riscv/insn_trans/trans_rvv.c.inc   | 4 ++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 180fa5d30d..5c558a6f5f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -201,8 +201,8 @@ static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
>    */
>   static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
>   {
> -    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
> -    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
> +    TCGv_i64 t_max = tcg_constant_i64(0xffffffffffff0000ull);
> +    TCGv_i64 t_nan = tcg_constant_i64(0xffffffffffff7e00ull);
>   
>       tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
>   }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 0607eff5e6..cee793a440 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -237,8 +237,8 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
>   
>   static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
>   {
> -    TCGv s1 = tcg_const_tl(a->rs1);
> -    TCGv s2 = tcg_const_tl(a->zimm);
> +    TCGv s1 = tcg_constant_tl(a->rs1);
> +    TCGv s2 = tcg_constant_tl(a->zimm);
>       return do_vsetivli(s, a->rd, s1, s2);
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 03773e2aa8..a563cac97a 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -300,7 +300,7 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
>            * Replace bit 15 in rs1 with inverse in rs2.
>            * This formulation retains the nanboxing of rs1.
>            */
> -        mask = tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
> +        mask = tcg_constant_i64(~MAKE_64BIT_MASK(15, 1));
>           tcg_gen_not_i64(rs2, rs2);
>           tcg_gen_andc_i64(rs2, rs2, mask);
>           tcg_gen_and_i64(dest, mask, rs1);


