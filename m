Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXPrJ-0004Tg-4V
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 12:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPr3-00044Q-V0; Wed, 01 Mar 2023 12:03:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPr1-0000hF-Mm; Wed, 01 Mar 2023 12:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZKM4q0f9aPHbo0kvvOKBzsA2Iuo1Vk6cQ0bSvg/CRY=; b=05+FCQzcws4DRtv04vJJfghpkk
 f0lJoH4NLVgn8UXUwXJJ7Sh2KIrCq48CYgkHR5weDHeO7mKGnUgl4dGaT5kUKXJpPb5TIWNbiv2kA
 TktqfrM6OhcEUQ1FRFuZJ5oYn3tvoMTM5b4T7FUGcoNMNbLUX/a58CyGvwyNJYGqVbXmNJsrHLh8h
 gSKJkpRgVH50ozcOqnUqpH2WNqecnKmV8oF8MXF4IMNaa2sfbVBIYEvyRD0GvgEFP8nOznXsUx+Xj
 +KkDQhe0CXDYJrxefGBiX1tupi5gHLe/AOQ7IuGpp2cBi7MsAstZrIZz1RGcNjeLoijtRQ067phLC
 FeCnv7AXGdSykfj/dRD2H7b7vTsAzXosNb77Z4fs8co0HAyJstJNSDTcKabt4P+op6W5PCMhAcBh/
 YgIrMORqAT38om2Xgwb9w25XIqS6Jt2nS/4DLJz0P0oMDBDDv/nl5hv5Q0RoR2tpVo8Ewonco/Ewb
 W8zzf9Gj7fInyuLPkj2L9PLXiNsAV880yPe2KgX9tHuswCe3IiuzSZLsC75K6YS7vmO8n9ff/OyiQ
 0Tf7iE0JesikxIsefSqN5/ywrzMnMyh2Mwewg3YZ08ECjz+BMUN3IPdGyGwhb+YgJu+q1P48Rcy0k
 Uhupy3+8lo/yp69YoUGHBQxP9EcYnG6+qAgTZ9Qqw=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXPqF-0002bA-4K; Wed, 01 Mar 2023 17:02:15 +0000
Message-ID: <195c75eb-136d-57d9-cf08-bbfc339cac51@ilande.co.uk>
Date: Wed, 1 Mar 2023 17:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-56-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230227054233.390271-56-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 55/70] target/sparc: Avoid tcg_const_{tl,i32}
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Mar 2023 17:03:08 -0000

On 27/02/2023 05:42, Richard Henderson wrote:

> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 80 +++++++++++++++++++---------------------
>   1 file changed, 38 insertions(+), 42 deletions(-)
> 
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 925023adef..137bdc5159 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -550,7 +550,7 @@ static inline void gen_op_mulscc(TCGv dst, TCGv src1, TCGv src2)
>       if (!(env->y & 1))
>           T1 = 0;
>       */
> -    zero = tcg_const_tl(0);
> +    zero = tcg_constant_tl(0);
>       tcg_gen_andi_tl(cpu_cc_src, src1, 0xffffffff);
>       tcg_gen_andi_tl(r_temp, cpu_y, 0x1);
>       tcg_gen_andi_tl(cpu_cc_src2, src2, 0xffffffff);
> @@ -928,8 +928,8 @@ static void gen_branch_n(DisasContext *dc, target_ulong pc1)
>           tcg_gen_mov_tl(cpu_pc, cpu_npc);
>   
>           tcg_gen_addi_tl(cpu_npc, cpu_npc, 4);
> -        t = tcg_const_tl(pc1);
> -        z = tcg_const_tl(0);
> +        t = tcg_constant_tl(pc1);
> +        z = tcg_constant_tl(0);
>           tcg_gen_movcond_tl(TCG_COND_NE, cpu_npc, cpu_cond, z, t, cpu_npc);
>   
>           dc->pc = DYNAMIC_PC;
> @@ -938,9 +938,9 @@ static void gen_branch_n(DisasContext *dc, target_ulong pc1)
>   
>   static inline void gen_generic_branch(DisasContext *dc)
>   {
> -    TCGv npc0 = tcg_const_tl(dc->jump_pc[0]);
> -    TCGv npc1 = tcg_const_tl(dc->jump_pc[1]);
> -    TCGv zero = tcg_const_tl(0);
> +    TCGv npc0 = tcg_constant_tl(dc->jump_pc[0]);
> +    TCGv npc1 = tcg_constant_tl(dc->jump_pc[1]);
> +    TCGv zero = tcg_constant_tl(0);
>   
>       tcg_gen_movcond_tl(TCG_COND_NE, cpu_npc, cpu_cond, zero, npc0, npc1);
>   }
> @@ -981,18 +981,14 @@ static inline void save_state(DisasContext *dc)
>   
>   static void gen_exception(DisasContext *dc, int which)
>   {
> -    TCGv_i32 t;
> -
>       save_state(dc);
> -    t = tcg_const_i32(which);
> -    gen_helper_raise_exception(cpu_env, t);
> +    gen_helper_raise_exception(cpu_env, tcg_constant_i32(which));
>       dc->base.is_jmp = DISAS_NORETURN;
>   }
>   
>   static void gen_check_align(TCGv addr, int mask)
>   {
> -    TCGv_i32 r_mask = tcg_const_i32(mask);
> -    gen_helper_check_align(cpu_env, addr, r_mask);
> +    gen_helper_check_align(cpu_env, addr, tcg_constant_i32(mask));
>   }
>   
>   static inline void gen_mov_pc_npc(DisasContext *dc)
> @@ -1074,7 +1070,7 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
>           cmp->cond = logic_cond[cond];
>       do_compare_dst_0:
>           cmp->is_bool = false;
> -        cmp->c2 = tcg_const_tl(0);
> +        cmp->c2 = tcg_constant_tl(0);
>   #ifdef TARGET_SPARC64
>           if (!xcc) {
>               cmp->c1 = tcg_temp_new();
> @@ -1127,7 +1123,7 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
>           cmp->cond = TCG_COND_NE;
>           cmp->is_bool = true;
>           cmp->c1 = r_dst = tcg_temp_new();
> -        cmp->c2 = tcg_const_tl(0);
> +        cmp->c2 = tcg_constant_tl(0);
>   
>           switch (cond) {
>           case 0x0:
> @@ -1192,7 +1188,7 @@ static void gen_fcompare(DisasCompare *cmp, unsigned int cc, unsigned int cond)
>       cmp->cond = TCG_COND_NE;
>       cmp->is_bool = true;
>       cmp->c1 = r_dst = tcg_temp_new();
> -    cmp->c2 = tcg_const_tl(0);
> +    cmp->c2 = tcg_constant_tl(0);
>   
>       switch (cc) {
>       default:
> @@ -1307,7 +1303,7 @@ static void gen_compare_reg(DisasCompare *cmp, int cond, TCGv r_src)
>       cmp->cond = tcg_invert_cond(gen_tcg_cond_reg[cond]);
>       cmp->is_bool = false;
>       cmp->c1 = r_src;
> -    cmp->c2 = tcg_const_tl(0);
> +    cmp->c2 = tcg_constant_tl(0);
>   }
>   
>   static inline void gen_cond_reg(TCGv r_dst, int cond, TCGv r_src)
> @@ -1908,7 +1904,7 @@ static void gen_swap(DisasContext *dc, TCGv dst, TCGv src,
>   
>   static void gen_ldstub(DisasContext *dc, TCGv dst, TCGv addr, int mmu_idx)
>   {
> -    TCGv m1 = tcg_const_tl(0xff);
> +    TCGv m1 = tcg_constant_tl(0xff);
>       gen_address_mask(dc, addr);
>       tcg_gen_atomic_xchg_tl(dst, addr, m1, mmu_idx, MO_UB);
>   }
> @@ -2163,8 +2159,8 @@ static void gen_ld_asi(DisasContext *dc, TCGv dst, TCGv addr,
>           break;
>       default:
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(memop);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(memop);
>   
>               save_state(dc);
>   #ifdef TARGET_SPARC64
> @@ -2217,7 +2213,7 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
>           {
>               TCGv saddr = tcg_temp_new();
>               TCGv daddr = tcg_temp_new();
> -            TCGv four = tcg_const_tl(4);
> +            TCGv four = tcg_constant_tl(4);
>               TCGv_i32 tmp = tcg_temp_new_i32();
>               int i;
>   
> @@ -2236,8 +2232,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
>   #endif
>       default:
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(memop & MO_SIZE);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(memop & MO_SIZE);
>   
>               save_state(dc);
>   #ifdef TARGET_SPARC64
> @@ -2313,15 +2309,15 @@ static void gen_ldstub_asi(DisasContext *dc, TCGv dst, TCGv addr, int insn)
>           if (tb_cflags(dc->base.tb) & CF_PARALLEL) {
>               gen_helper_exit_atomic(cpu_env);
>           } else {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(MO_UB);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(MO_UB);
>               TCGv_i64 s64, t64;
>   
>               save_state(dc);
>               t64 = tcg_temp_new_i64();
>               gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
>   
> -            s64 = tcg_const_i64(0xff);
> +            s64 = tcg_constant_i64(0xff);
>               gen_helper_st_asi(cpu_env, addr, s64, r_asi, r_mop);
>   
>               tcg_gen_trunc_i64_tl(dst, t64);
> @@ -2382,7 +2378,7 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
>   
>               /* The first operation checks required alignment.  */
>               memop = da.memop | MO_ALIGN_64;
> -            eight = tcg_const_tl(8);
> +            eight = tcg_constant_tl(8);
>               for (i = 0; ; ++i) {
>                   tcg_gen_qemu_ld_i64(cpu_fpr[rd / 2 + i], addr,
>                                       da.mem_idx, memop);
> @@ -2409,8 +2405,8 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
>   
>       default:
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(da.memop);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(da.memop);
>   
>               save_state(dc);
>               /* According to the table in the UA2011 manual, the only
> @@ -2491,7 +2487,7 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr,
>   
>               /* The first operation checks required alignment.  */
>               memop = da.memop | MO_ALIGN_64;
> -            eight = tcg_const_tl(8);
> +            eight = tcg_constant_tl(8);
>               for (i = 0; ; ++i) {
>                   tcg_gen_qemu_st_i64(cpu_fpr[rd / 2 + i], addr,
>                                       da.mem_idx, memop);
> @@ -2566,8 +2562,8 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
>              real hardware allows others.  This can be seen with e.g.
>              FreeBSD 10.3 wrt ASI_IC_TAG.  */
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(da.memop);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(da.memop);
>               TCGv_i64 tmp = tcg_temp_new_i64();
>   
>               save_state(dc);
> @@ -2625,8 +2621,8 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
>           /* ??? In theory we've handled all of the ASIs that are valid
>              for stda, and this should raise DAE_invalid_asi.  */
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(da.memop);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(da.memop);
>               TCGv_i64 t64 = tcg_temp_new_i64();
>   
>               /* See above.  */
> @@ -2686,8 +2682,8 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
>           break;
>       default:
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(MO_UQ);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(MO_UQ);
>   
>               save_state(dc);
>               gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
> @@ -2724,7 +2720,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
>              as a cacheline-style operation.  */
>           {
>               TCGv d_addr = tcg_temp_new();
> -            TCGv eight = tcg_const_tl(8);
> +            TCGv eight = tcg_constant_tl(8);
>               int i;
>   
>               tcg_gen_andi_tl(d_addr, addr, -8);
> @@ -2736,8 +2732,8 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
>           break;
>       default:
>           {
> -            TCGv_i32 r_asi = tcg_const_i32(da.asi);
> -            TCGv_i32 r_mop = tcg_const_i32(MO_UQ);
> +            TCGv_i32 r_asi = tcg_constant_i32(da.asi);
> +            TCGv_i32 r_mop = tcg_constant_i32(MO_UQ);
>   
>               save_state(dc);
>               gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
> @@ -2786,7 +2782,7 @@ static void gen_fmovs(DisasContext *dc, DisasCompare *cmp, int rd, int rs)
>       s1 = gen_load_fpr_F(dc, rs);
>       s2 = gen_load_fpr_F(dc, rd);
>       dst = gen_dest_fpr_F(dc);
> -    zero = tcg_const_i32(0);
> +    zero = tcg_constant_i32(0);
>   
>       tcg_gen_movcond_i32(TCG_COND_NE, dst, c32, zero, s1, s2);
>   
> @@ -3215,7 +3211,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           TCGv_i32 r_const;
>   
>                           r_tickptr = tcg_temp_new_ptr();
> -                        r_const = tcg_const_i32(dc->mem_idx);
> +                        r_const = tcg_constant_i32(dc->mem_idx);
>                           tcg_gen_ld_ptr(r_tickptr, cpu_env,
>                                          offsetof(CPUSPARCState, tick));
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> @@ -3267,7 +3263,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           TCGv_i32 r_const;
>   
>                           r_tickptr = tcg_temp_new_ptr();
> -                        r_const = tcg_const_i32(dc->mem_idx);
> +                        r_const = tcg_constant_i32(dc->mem_idx);
>                           tcg_gen_ld_ptr(r_tickptr, cpu_env,
>                                          offsetof(CPUSPARCState, stick));
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> @@ -3397,7 +3393,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           TCGv_i32 r_const;
>   
>                           r_tickptr = tcg_temp_new_ptr();
> -                        r_const = tcg_const_i32(dc->mem_idx);
> +                        r_const = tcg_constant_i32(dc->mem_idx);
>                           tcg_gen_ld_ptr(r_tickptr, cpu_env,
>                                          offsetof(CPUSPARCState, tick));
>                           if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

