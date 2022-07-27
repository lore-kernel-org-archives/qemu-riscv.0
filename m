Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGYJz-0008GE-FP
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 00:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oGYJv-0008Ek-Is
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 00:06:53 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oGYJt-0001eG-ND
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 00:06:51 -0400
Received: by mail-lf1-x12e.google.com with SMTP id t1so25355191lft.8
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+q6Pj0FrZt3juRl6sxbSjA0dmzRpgSA74+4NooIBNo=;
 b=fRQ54GZAuLZ3k63QIyxdPuEY8RAvmBwBPx3G4LYI8egZm55UAt0G42tKIPAOg3N1Jz
 ZmlMiTk37DTjvu0hZ4xghHsy1J8vm4OcySyRw7SbZj41lZV/Ukdplcri8AoutRt60+40
 Wwr6T3GXOVQfg03NTOdsQjUVuuP1yhP7tTiIMGTVct1Xg8KUjkXFoQ+iaIZao8f+lAkU
 lw/C09/JYBBWpUGsikNALGS8qzt41U+RpzejP0aAH2P2kOKOJ23M2+bcER0nYxHZUL4m
 7OyTQC35zwOuzhic3CDI0YTfhVzKsY8uMYj38GIgVaw7cX+t/wOJLBDVNg9J+6PPizMW
 sLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+q6Pj0FrZt3juRl6sxbSjA0dmzRpgSA74+4NooIBNo=;
 b=HENvxIXWuJLTbyXXiecnpjOXibup7+IxaTQYY4jvNVtXybWxWCJWdcHJ6f/8U6a/gh
 mnWCjFCAtfUhdsyiTjijpFphd6aNPxPKPxdztp58h77WKq6WFH8Iq2eVD+j42wgjufD4
 pdB93Y0m0JEIlmrJ2E/DQh5i/VyonQ00qPRTHas1C4LzDLn26BR9CQtMVTXOdAGqz7UI
 yjNVIa2XEhxUzli9cJELyTkDxLusrJ/TyzUBE64GreIFSL48EiqDxtHfdzVOQmnSDmef
 S/zcslJth6b24siCs2xhKtbtrpDWWTRfkOO0SPuiTbF+RWp58lcLGdpjkmnZE422bNQ+
 4qZA==
X-Gm-Message-State: AJIora8kKswSvXEGeKw1CCguocnqPbQsKgcLEGOwcPFkWAPXL8XI37Tb
 rt7ArxQ2aOjTJlv3nqJJAmr56L0kigCw+hUZ86jIoA==
X-Google-Smtp-Source: AGRyM1sDG+vyAgFzRu0dOXieArLHZRvX3KuDpGrIVMTc/5XwoCbQ8BcZPH8QVBzGm2jpgC6Gakeh8uJCA1c05Zw7b/I=
X-Received: by 2002:a05:6512:230f:b0:489:676f:2705 with SMTP id
 o15-20020a056512230f00b00489676f2705mr7122809lfu.419.1658894807334; Tue, 26
 Jul 2022 21:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220727032524.101280-1-apatel@ventanamicro.com>
 <ae29e548-c3a6-dca1-81aa-68c4cad27384@linaro.org>
In-Reply-To: <ae29e548-c3a6-dca1-81aa-68c4cad27384@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Jul 2022 09:36:34 +0530
Message-ID: <CAK9=C2Ut-_6_ARpVFKcjeLgau2eqUL5Cbu3FD96hZ-EFD7RC5Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Ensure opcode is saved for every instruction
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 04:06:53 -0000

On Wed, Jul 27, 2022 at 9:24 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/26/22 20:25, Anup Patel wrote:
> > We should call decode_save_opc() for every decoded instruction
> > because generating transformed instruction upon guest page faults
> > expects opcode to be available. Without this, hypervisor sees
> > transformed instruction as zero in htinst CSR for guest MMIO
> > emulation which makes MMIO emulation in hypervisor slow and
> > also breaks nested virtualization.
>
> Then just add decode_save_opc to load/store insns, not everything including plain
> arithmetic...

We will have to add for float load/store, atomics, and HLV/HSV as
well. Basically we end-up adding for everything except integer and
float arithmetic.

I see that decode_save_opc() only saves opcode in an array
through tcg_set_insn_start_param(). Which brings me to the
question about how much are we saving by distributing
decode_save_opc() calls ?

If we distribute decode_save_opc() calls then the code becomes
fragile for future changes and we will miss adding decode_save_opc()
for some new extensions.

Regards,
Anup

>
>
> r~
>
>
> >
> > Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   target/riscv/insn_trans/trans_privileged.c.inc |  4 ----
> >   target/riscv/insn_trans/trans_rvh.c.inc        |  2 --
> >   target/riscv/insn_trans/trans_rvi.c.inc        |  2 --
> >   target/riscv/translate.c                       | 10 ++++------
> >   4 files changed, 4 insertions(+), 14 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> > index 46f96ad74d..53613682e8 100644
> > --- a/target/riscv/insn_trans/trans_privileged.c.inc
> > +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> > @@ -75,7 +75,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
> >   {
> >   #ifndef CONFIG_USER_ONLY
> >       if (has_ext(ctx, RVS)) {
> > -        decode_save_opc(ctx);
> >           gen_helper_sret(cpu_pc, cpu_env);
> >           tcg_gen_exit_tb(NULL, 0); /* no chaining */
> >           ctx->base.is_jmp = DISAS_NORETURN;
> > @@ -91,7 +90,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
> >   static bool trans_mret(DisasContext *ctx, arg_mret *a)
> >   {
> >   #ifndef CONFIG_USER_ONLY
> > -    decode_save_opc(ctx);
> >       gen_helper_mret(cpu_pc, cpu_env);
> >       tcg_gen_exit_tb(NULL, 0); /* no chaining */
> >       ctx->base.is_jmp = DISAS_NORETURN;
> > @@ -104,7 +102,6 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
> >   static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
> >   {
> >   #ifndef CONFIG_USER_ONLY
> > -    decode_save_opc(ctx);
> >       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> >       gen_helper_wfi(cpu_env);
> >       return true;
> > @@ -116,7 +113,6 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
> >   static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
> >   {
> >   #ifndef CONFIG_USER_ONLY
> > -    decode_save_opc(ctx);
> >       gen_helper_tlb_flush(cpu_env);
> >       return true;
> >   #endif
> > diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> > index 4f8aecddc7..cebcb3f8f6 100644
> > --- a/target/riscv/insn_trans/trans_rvh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> > @@ -169,7 +169,6 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
> >   {
> >       REQUIRE_EXT(ctx, RVH);
> >   #ifndef CONFIG_USER_ONLY
> > -    decode_save_opc(ctx);
> >       gen_helper_hyp_gvma_tlb_flush(cpu_env);
> >       return true;
> >   #endif
> > @@ -180,7 +179,6 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
> >   {
> >       REQUIRE_EXT(ctx, RVH);
> >   #ifndef CONFIG_USER_ONLY
> > -    decode_save_opc(ctx);
> >       gen_helper_hyp_tlb_flush(cpu_env);
> >       return true;
> >   #endif
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > index c49dbec0eb..1f318ffbef 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -834,8 +834,6 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
> >
> >   static bool do_csr_post(DisasContext *ctx)
> >   {
> > -    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> > -    decode_save_opc(ctx);
> >       /* We may have changed important cpu state -- exit to main loop. */
> >       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> >       tcg_gen_exit_tb(NULL, 0);
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index a79d0cd95b..5425d19846 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -207,10 +207,10 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
> >       tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
> >   }
> >
> > -static void decode_save_opc(DisasContext *ctx)
> > +static void decode_save_opc(DisasContext *ctx, target_ulong opc)
> >   {
> >       assert(ctx->insn_start != NULL);
> > -    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
> > +    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
> >       ctx->insn_start = NULL;
> >   }
> >
> > @@ -240,8 +240,6 @@ static void generate_exception(DisasContext *ctx, int excp)
> >
> >   static void gen_exception_illegal(DisasContext *ctx)
> >   {
> > -    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> > -                   offsetof(CPURISCVState, bins));
> >       generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> >   }
> >
> > @@ -643,8 +641,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
> >           return;
> >       }
> >
> > -    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> > -    decode_save_opc(ctx);
> >       gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
> >   }
> >
> > @@ -1055,6 +1051,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> >
> >       /* Check for compressed insn */
> >       if (extract16(opcode, 0, 2) != 3) {
> > +        decode_save_opc(ctx, opcode);
> >           if (!has_ext(ctx, RVC)) {
> >               gen_exception_illegal(ctx);
> >           } else {
> > @@ -1071,6 +1068,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> >                                                ctx->base.pc_next + 2));
> >           ctx->opcode = opcode32;
> >           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> > +        decode_save_opc(ctx, opcode32);
> >
> >           for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> >               if (decoders[i].guard_func(ctx) &&
>

