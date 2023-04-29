Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psati-0004mT-NZ
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 23:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psath-0004mB-6G; Fri, 28 Apr 2023 23:05:17 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psate-0001Dv-C2; Fri, 28 Apr 2023 23:05:16 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowAAn_xZaiUxk0b1KGw--.62712S2;
 Sat, 29 Apr 2023 11:04:59 +0800 (CST)
Message-ID: <d51c563d-08aa-f711-1fe5-253e9da19051@iscas.ac.cn>
Date: Sat, 29 Apr 2023 11:04:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 05/19] target/riscv: Move vector translation checks
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 richard.henderson@linaro.org, liweiwei@iscas.ac.cn
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <20230428144757.57530-6-lawrence.hunter@codethink.co.uk>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230428144757.57530-6-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAn_xZaiUxk0b1KGw--.62712S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArykJFWxAw48tF4fZr4fKrg_yoW5KrWUpw
 45GrW3AF18Ga4rXw48G3WjqrnrAFs5ur4YvwnYyw1rWrWvqrsYyrnxtr4F9ryUJrZ5WFnF
 y3WUCr1akw1akFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYnYwUUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
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
X-List-Received-Date: Sat, 29 Apr 2023 03:05:17 -0000


On 2023/4/28 22:47, Lawrence Hunter wrote:
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> Move the checks out of `do_opiv{v,x,i}_gvec{,_shift}` functions
> and into the corresponding macros. This enables the functions to be
> reused in proceeding commits without check duplication.
>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/insn_trans/trans_rvv.c.inc | 28 +++++++++++--------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2660dda42be..21731b784ec 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1183,9 +1183,6 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>                 gen_helper_gvec_4_ptr *fn)
>   {
>       TCGLabel *over = gen_new_label();
> -    if (!opivv_check(s, a)) {
> -        return false;
> -    }
>   
>       tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>   
> @@ -1218,6 +1215,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
>           gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
>       };                                                             \
> +    if (!opivv_check(s, a)) {                                      \
> +        return false;                                              \
> +    }                                                              \
>       return do_opivv_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
>   }
>   
> @@ -1276,10 +1276,6 @@ static inline bool
>   do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>                 gen_helper_opivx *fn)
>   {
> -    if (!opivx_check(s, a)) {
> -        return false;
> -    }
> -
>       if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
>           TCGv_i64 src1 = tcg_temp_new_i64();
>   
> @@ -1301,6 +1297,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
>           gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
>       };                                                             \
> +    if (!opivx_check(s, a)) {                                      \
> +        return false;                                              \
> +    }                                                              \
>       return do_opivx_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
>   }
>   
> @@ -1432,10 +1431,6 @@ static inline bool
>   do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
>                 gen_helper_opivx *fn, imm_mode_t imm_mode)
>   {
> -    if (!opivx_check(s, a)) {
> -        return false;
> -    }
> -
>       if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
>           gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                   extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
> @@ -1453,6 +1448,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           gen_helper_##OPIVX##_b, gen_helper_##OPIVX##_h,            \
>           gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
>       };                                                             \
> +    if (!opivx_check(s, a)) {                                      \
> +        return false;                                              \
> +    }                                                              \
>       return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
>                            fns[s->sew], IMM_MODE);                   \
>   }
> @@ -1775,10 +1773,6 @@ static inline bool
>   do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
>                       gen_helper_opivx *fn)
>   {
> -    if (!opivx_check(s, a)) {
> -        return false;
> -    }
> -
>       if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
>           TCGv_i32 src1 = tcg_temp_new_i32();
>   
> @@ -1800,7 +1794,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
>           gen_helper_##NAME##_b, gen_helper_##NAME##_h,                     \
>           gen_helper_##NAME##_w, gen_helper_##NAME##_d,                     \
>       };                                                                    \
> -                                                                          \
> +    if (!opivx_check(s, a)) {                                             \
> +        return false;                                                     \
> +    }                                                                     \
>       return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);    \
>   }
>   


