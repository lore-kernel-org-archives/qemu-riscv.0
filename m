Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC17606A330
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=gv7Y7XdF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ74-0007N4-65; Mon, 23 Nov 2026 13:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ73-0007MM-0V
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:01 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6y-0006kh-VR
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:00 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c5187b42a2dso12426966b.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459790; cv=none;
 d=google.com; s=arc-20260327;
 b=OliBFw0awrCJA//gT4uce2elIubx5SEA2EBa9FjgojVSsSK6GsOJpplE365R2PMAeK
 BG6YSfPusSXUsKD+yVr04q9LXXN/bLJhvPtXtMWTM9svmOVh3HAiZZocTbzMfaStR1sY
 WNYkNBlyo6MOwENcfsIXMIbWi5/tGcfPllN8y81B68LpYicgeI1zvRL1nuVf7Q+9pZ+L
 g+vzpdiSO7o3aBD9dXmPdqASXZuewyMX7c0lulYCgkTdoyUS4jL3ZqOZp+KF+hF53xxC
 wS1XVjW8wvsD/fvtr+cBx7wt2niBxyxHNL+/1Kgtp4els5+0x+M/ePRpwb22Y45x8iFi
 Lfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8jHwNtk21ErylvthmVO6qUyoIejTNRMGBp5YDBwKtT4=;
 fh=x7KpTlHyoMNktHgkxM643oz3+/DdaIxmXJibERN3m94=;
 b=X2mf0wQooq1tmCaXZAALyV9ca+9cFPGw1ueGZWXgespxW9F4XtRH9Sp64kYaOoLIWE
 upbBJQeE6io+si6AY31cOp9/DlYsSO3ABYqiM1RhAVuZACgM7JsFO1p9HO9IQSCtPIqf
 dA7DqsxM/6B8QLIltRlUIYGHBe1d2hiFiYXViHp42VDJS4qFH6t8q9YQd47N9ASCDALA
 7mvpZnhnTbhtTKffSUK27eopxtXNmrr8OwmB2GGaXaZbN68BFVkkM82Qh4HtktDeJHJY
 5YCkbcW5L4KvrkC/m2PM/AD0rrA4AAvKFgJ85ukr3/o9PzJtRTIhxsWsGdLzArM37TNv
 Vfbg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459790; x=1796064590; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8jHwNtk21ErylvthmVO6qUyoIejTNRMGBp5YDBwKtT4=;
 b=gv7Y7XdFxem6GGtip1A7NxbtU+jhFarHlmNmPyOU2bQxriGQ1L/8r/Bt+4J841abz5
 AIttxcU6ArKmkV4BcKOQrCjQitL25k0pqtDlsuvWWpboBp8esty5TQEhd5EyErmyqcQR
 3sOfnt706QF9HxRiyWcYFyHIwzhgbZnRNJgPx5Fgh0OnrGEidkKTrnt2meuC+hhpuC3l
 e7l4JqlrrciHlWL9pJysyYRDLZABIMe9nPJq8ZKfrCne5Ur5I7IAr3l74d9obJARn5Fk
 zvzbnk8tH7gXz06WPIlYeUMIOu6YmFdEi479l86q4cOzIoJrF3ulrbmMaVenFaIZgGI9
 xrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459790; x=1796064590;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8jHwNtk21ErylvthmVO6qUyoIejTNRMGBp5YDBwKtT4=;
 b=MELWRJMb2rujrxSlFZ4mtPMlFg7IGo/YF8m428RKt6/zFnJyeA3koEn81yZmzeOnzC
 8PlnBRNz2SfONoz41W7wnPFKZoVTaEbAgVsdohcFGaAag85Tg6rCSzgJa9XXtNfaCE2O
 SYXGrSBfifdXL2qF2OeyrAs49xSFkHf4b6ihXKjs2UUgVi6bTSLLMk8pSHW7l87wW7jo
 yCUPrUN+87NGiukiNVfZmeErGmCP9NPXMoJpLup6rDvAbyHMWwyN56tHh+G9Qd3ilk4n
 XiIxrN54K05QG5aMqzHt8mwYBgtKZEmw+A3bomSIByZxDwfW5hB4QpsCXV+bLL0A47Od
 16LQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGc9p3VReJSGdUmGkUwxQrXxQqax5R1juWxZ2oeOA7ik6Y6iBVwEPn9RibX+GEMDFJEUTPgC4VTegSq@nongnu.org
X-Gm-Message-State: APuU4Z/Xz8GnFuNIAu80WJEMex1D3lcBcU+K7mRo2K6Jwdj9KK34/Ods
 Soan+9ZFhZuF2OeOtuf6LQ2tKGokMVO092u4hCnCt+QBUIh4SugUHoJyYmNQ5/ot5nXwbZt5zc+
 wZHN0WejtyW8/HbXPipCZ8bojpzMD7vsRsar1ydWJEw==
X-Gm-Gg: AZFdTZdgQf3vwciX2cUShBjr1PcAgM3WRnpzyTfMn/oGo4E7QRGXX5XaDKsJ/Ut1bfM
 5lv9/EaDWSX7bgEt9hXftjkeSme0CvM62LuF4nBxD/KMMmfu09HNYLJ4JGPYkZTD80JKqt9Fj3V
 tPZJqB5qoO0a2JfP5ePbSles6ymxfcowlFw0Jq+BY4SjSXm4Dz8RK5dbYuXhAJRrig3aWR2HVo0
 ha0hsIya+qE5MlyyMDI1sDuSEXN7DdS2N1a6okbzoVBLiBKwxzI04ifm/g6Rr09fzkT0bMMxZ0I
 qEKl1+N65cx+DkgFgSSC9dXE6u+IkHMokiW+iJT1/qht0dxl22/n/xEfA6EeI985oNAgZbcPalj
 iwK+F9hzibDXn+DUxhphycPsU7bwGclRKMocaYLS09hQNcmO3llRnfiWbvwqGf4fhOTocPFVmlu
 89MnbCP6kCXoHImKLuTzNO23re7M01e5/XTCA=
X-Received: by 2002:a17:906:91c8:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c513a829d8cmr909977266b.4.1795459790570; Mon, 23 Nov 2026
 10:49:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
 <20261118-zl-master-v1-3-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-3-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:49:39 +0100
X-Gm-Features: Aa3M54qVhuFAc3yB2p2qLH1jalPE1RV7jBmgesUsETSuRIsqgmjdbc_MOoD2n9o
Message-ID: <CAAeLtUAsF8Dbd2K=jH3iAfm-_jbPXMtdQJwDPFa9sL+DSHKv7w@mail.gmail.com>
Subject: Re: [PATCH RFC 3/8] target/riscv: Prepare Zl instruction alignment
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:03, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> Zl requires IALIGN=16 even when compressed instructions are disabled.
> Add an internal ext_zl flag and apply it to jumps, EPC/DPC masking, trap
> returns and misa.C writes. Keep compressed instruction decoding under
> its existing extension checks.
>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---
>  target/riscv/cpu.h                          | 10 +++++++---
>  target/riscv/cpu_cfg_fields.h.inc           |  1 +
>  target/riscv/internals.h                    |  4 ++--
>  target/riscv/tcg/csr.c                      |  7 +++++--
>  target/riscv/tcg/insn_trans/trans_rvi.c.inc |  8 ++------
>  target/riscv/tcg/op_helper.c                | 10 ++++------
>  target/riscv/tcg/translate.c                |  4 +---
>  7 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 49a1186bdbb2b9b56f3d9ad1e8ba18ae2010c7cb..f157a40b019a1bc23408d2a70530d1b58b7278d0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -921,10 +921,14 @@ bool riscv_cpu_eff_priv(CPURISCVState *env, privilege_mode_t *priv, bool *virt)
>      return mode_modified;
>  }
>
> -static inline bool riscv_cpu_allow_16bit_insn(const RISCVCPUConfig *cfg,
> -                                              uint32_t priv_ver,
> -                                              uint32_t misa_ext)
> +/* Instruction alignment is independent of compressed instruction decoding. */
> +static inline bool riscv_cpu_ialign16(const RISCVCPUConfig *cfg,
> +                                    uint32_t priv_ver, uint32_t misa_ext)

Looks like an alignment problem for the continuation line?


>  {
> +    if (cfg->ext_zl) {
> +        return true;
> +    }
> +
>      /* In priv spec version 1.12 or newer, C always implies Zca */
>      if (priv_ver >= PRIV_VERSION_1_12_0) {
>          return cfg->ext_zca;
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 85fc3ad8bb8ca059b4c391afde2ab14c95018145..30a8d21b7553b7d22b1ca2647dc00789330657f5 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -30,6 +30,7 @@ BOOL_FIELD(ext_zks)
>  BOOL_FIELD(ext_zksed)
>  BOOL_FIELD(ext_zksh)
>  BOOL_FIELD(ext_zkt)
> +BOOL_FIELD(ext_zl)
>  BOOL_FIELD(ext_zifencei)
>  BOOL_FIELD(ext_zicntr)
>  BOOL_FIELD(ext_zicsr)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 2d48abeef5dea2cb9d0e97852495fed75d670ae1..4e11888b03e0dcb050426892e1758d733273bf99 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -191,9 +191,9 @@ static inline target_ulong get_xepc_mask(CPURISCVState *env)
>
>      /*
>       * When IALIGN=32, both low bits must be zero.
> -     * When IALIGN=16 (has C or Zc* extensions), only bit 0 must be zero.
> +     * When IALIGN=16 (C, Zc* or Zl fetch), only bit 0 must be zero.
>       */
> -    if (riscv_has_ext(env, RVC) || cpu->cfg.ext_zca ||
> +    if (cpu->cfg.ext_zl || riscv_has_ext(env, RVC) || cpu->cfg.ext_zca ||
>          cpu->cfg.ext_zcb || cpu->cfg.ext_zcd || cpu->cfg.ext_zce ||
>          cpu->cfg.ext_zcf || cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) {
>          return ~(target_ulong)1;
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f32f5d0b6cc86eeb530705a8bcad0e6..3972d1f4112f3ad52ae352d4c55a2799aed0c992 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2231,8 +2231,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>      /* Mask extensions that are not supported by this hart */
>      val &= env->misa_ext_mask;
>
> -    /* drop write if RVC is cleared and next instruction is not aligned */
> -    if ((env->misa_ext & RVC) && !(val & RVC) &&
> +    /*
> +     * Ignore writes that clear C if the next instruction is not 4-byte aligned.
> +     * With Zl, IALIGN remains 16 and the write need not be suppressed.
> +     */
> +    if (!cpu->cfg.ext_zl && (env->misa_ext & RVC) && !(val & RVC) &&
>           (get_next_pc(env, ra) & 3) != 0) {
>          qemu_log_mask(LOG_GUEST_ERROR, "Unable to write MISA ext value "
>                        "0x%x, MISA.C disable failed\n", env->misa_ext);
> diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> index 4784ea1607e74eb5b0076425a732b5d3817b3482..ba5e274da3b778d564930386471387a36ddd63ce 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> @@ -151,9 +151,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>          tcg_gen_ext32s_tl(target_pc, target_pc);
>      }
>
> -    if (!riscv_cpu_allow_16bit_insn(ctx->cfg_ptr,
> -                                    ctx->priv_ver,
> -                                    ctx->misa_ext)) {
> +    if (!riscv_cpu_ialign16(ctx->cfg_ptr, ctx->priv_ver, ctx->misa_ext)) {
>          TCGv t0 = tcg_temp_new();
>
>          misaligned = gen_new_label();
> @@ -302,9 +300,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>
>      gen_set_label(l); /* branch taken */
>
> -    if (!riscv_cpu_allow_16bit_insn(ctx->cfg_ptr,
> -                                    ctx->priv_ver,
> -                                    ctx->misa_ext) &&
> +    if (!riscv_cpu_ialign16(ctx->cfg_ptr, ctx->priv_ver, ctx->misa_ext) &&
>          (a->imm & 0x3)) {
>          /* misaligned */
>          TCGv target_pc = tcg_temp_new();
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index f9c79fe6b9006c7667acfda4865ca59fbb970d5d..0dda250203790840e0c0ed20d917eeb645c61a60 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -318,9 +318,8 @@ target_ulong HELPER(sret)(CPURISCVState *env)
>      }
>
>      target_ulong retpc = env->sepc & get_xepc_mask(env);
> -    if (!riscv_cpu_allow_16bit_insn(&env_archcpu(env)->cfg,
> -                                    env->priv_ver,
> -                                    env->misa_ext) && (retpc & 0x3)) {
> +    if (!riscv_cpu_ialign16(&env_archcpu(env)->cfg, env->priv_ver,
> +                          env->misa_ext) && (retpc & 0x3)) {
>          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
>      }
>
> @@ -395,9 +394,8 @@ static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>      }
>
> -    if (!riscv_cpu_allow_16bit_insn(&env_archcpu(env)->cfg,
> -                                    env->priv_ver,
> -                                    env->misa_ext) && (retpc & 0x3)) {
> +    if (!riscv_cpu_ialign16(&env_archcpu(env)->cfg, env->priv_ver,
> +                          env->misa_ext) && (retpc & 0x3)) {
>          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, ra);
>      }
>
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index 79b0f444efbd954c48c14812b0f566ace7830245..51024ee9a37df548ec27587c9b4bb240afd1d5a5 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -630,9 +630,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>      TCGv succ_pc = dest_gpr(ctx, rd);
>
>      /* check misaligned: */
> -    if (!riscv_cpu_allow_16bit_insn(ctx->cfg_ptr,
> -                                    ctx->priv_ver,
> -                                    ctx->misa_ext)) {
> +    if (!riscv_cpu_ialign16(ctx->cfg_ptr, ctx->priv_ver, ctx->misa_ext)) {
>          if ((imm & 0x3) != 0) {
>              TCGv target_pc = tcg_temp_new();
>              gen_pc_plus_diff(target_pc, ctx, imm);
>
> --
> 2.43.0
>
>

