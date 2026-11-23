Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4C606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=BT6r3Ljz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ7g-0000Uy-LM; Mon, 23 Nov 2026 13:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ7d-0000L5-A2
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:37 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ7b-000722-1x
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:37 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6ba1e6068c3so344662a12.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459833; cv=none;
 d=google.com; s=arc-20260327;
 b=O5pTmzMjPbriRl3GO7wchf3EtyGkGj7v4+WRhSgFPF0CpHJtgzP+SI9qs4vT0ZRyZ5
 5+kT5WRc6krFhuBe5EMJy+Ar6hWg7oauWhSkEIlVlDB/CyoLf51vKMxhEN3hfLijS77z
 +ZxVMGnGV+a58iVVaD8aZ5aZ7Sb+aFMFf9yDw7vFAIyBxTYArADV5ImBpkmoTqOOOmr8
 IgJXoTCGnYIaMATJJDWzY/uQkJO2+smAzk237/f6dRp9bDpwKWe+rLsz5CoFXRKm93yq
 qiEt4ZPyN4TewAj59JyYbF4rzoBKPeN1zPP/mycyK7s+yUk2TEZtXo6dg4h6NnHE7OTf
 r3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cCwDZE3YyAgrM5yGEHH/wZzCJXpWnHg9FNGccI7u0VI=;
 fh=4aJrm9xA96PEMhK9o8TPRSddRsdO4KEHs/LvufZCbHk=;
 b=TrrgfCR5X5QN79+K06Amw50mcLVsBHri/NC2Y9gcpMp+T6geTCHUVesbjwA0RbL/ZI
 upJFXhdrd/2Dpjju004294LIb9hdC9tKhwqCwtQQQzjNuoZoVVOZ4GbPAFS4dkPI4CMa
 pP6OMLnVNkWhaFWWs3zVmlTrJLSNjl55GnMNfCyGohGYzWUTrCnAgoRqmTucOZLSg09m
 FPGV6oENP5JNFyu7Tz+uyaTYI735URQb6C8yh1B/oEiXfNcApDvO2o8kRxwZ0NHMSSqW
 0CDD5TBs+OBelmH2Zskq963M9CJoTNXG40SNYETA1vDrtDB3SRJGcirPeZ/J1LcH1RF0
 uThA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459833; x=1796064633; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cCwDZE3YyAgrM5yGEHH/wZzCJXpWnHg9FNGccI7u0VI=;
 b=BT6r3Ljzp3A46zpCzOGQMaxD0kiqxsZEqyKeMpBDygMX7JFmLOnXp8ViAKQPM/CgoF
 Eqyo8x4hSi1OLbe30/woAfO38q64NtbJvNyyguF64VSTSpW4QEF2UfS+fA2RfQEDzMpp
 E0Ejtt4oRS41ZNSf6bs8Mk0ji9DHjnwuG+PP3ir6WxDiVb4jSqCkfvA5pHYOZnyUOXcE
 eYlFI3peByZY+tAhJFfKsDUwsLmuRxL3j/mNk0b9QiSTSrwMvus1j/LymVRGeYH8UV3k
 zIQ1H8cGRF1WFhRN617iFr5VGtqTnrxP/VcbY/cCAdpRUQUK8lXItP8kSQPzkag9kblB
 LVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459833; x=1796064633;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cCwDZE3YyAgrM5yGEHH/wZzCJXpWnHg9FNGccI7u0VI=;
 b=amRcxka9bKD0taPWpQSwJZjNK+W0PmJtZQsJkFxAGgLeXfCm8zWVeANMvXeGkyWblL
 FvtUivFeLeNUZh94BAi5dPGJ62Lb0Fdt15fMjE22pcy/QLwNluXeqMlFAEpqKwwNPGmh
 LcQWuLyorgl/NORAQsGNjcdDPw+ct1NGB5NJjC19Zt6QfDFRZDEEM3YdiT9Mp7HNziwn
 /iEbcuuQhSCT7Rw4PTobh1xd+QSGKdUhpDodZp8F5G6YQTTgfl9wgkie4ltodo1BtPm4
 z7jEj9oe7osnxdqguO8K+Zr7BQJVRB8dHbdCfs0cHMX4sPqmTmlIeFDbxWJoCMObs1j5
 w6zw==
X-Forwarded-Encrypted: i=1;
 AL+hErH5gaHXMGHUqqKLmlfbvtJZucY1Y1pAsevsl9Bb1JzsSJlsLovR11HUMUZ18vibMZcGDe71GNsCZnr9@nongnu.org
X-Gm-Message-State: APuU4Z/mC2rHFhCvbW1FMdYrJl1l8P/nK7QuURhGgXOkYDk41/RYp0Z7
 dnetKIsUt/KokUUbRLsApgl1EFVFVz08T5apCxDem4rGZJDZd/ciG4bGU6UAJZB8OvpwLQA3ENM
 mJOOJyhYnCezRWQNE0z8ZdLte9T/J/g9YywUG8C7KAA==
X-Gm-Gg: AZFdTZe8A/34rPx8DFDZBuLPR6C74Tgq5ripPPGtUGfDiH7ff0M/48xkunhMe4aGUKq
 pIQ+syeq6PXpAD342hASmwYitJy7YNZXXOIymQ0U+ykfVF4rkREJyH7QuFTs2sQrRsB8VHan8Y2
 8Qlox7TU84qy106/NNUe2hrZnjLbt7u/1108MdMLLv2lGVtnzue76VGPV+jDynC1tzju33lXKLX
 rne2nwkildOCU4WK1RLIAYG8C+UI23fEf0NVrotd3Evr83oRLpDAKAbPaij5MpzdWKvYUvW2Lut
 pHjv5DmbbtH5w5FeInXT1y+ch9eRQ+hJTOag9G/6Nf282JdNTGzyQh+shOqRBW+2JdvITLxxCXp
 XdUxJ1wMQ40zclmQdWN0yZm5doCkgVJxq4ZWKDQBWpjFjuppWPch2Kr0N6QSzRtJ4vx6YHa2crV
 FmaWbssC/OxUK/Pw==
X-Received: by 2002:a17:907:932:b0:c51:8bf:9f22 with SMTP id
 a640c23a62f3a-c513a5c0549mr911078566b.2.1795459833384; Mon, 23 Nov 2026
 10:50:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
 <20261118-zl-master-v1-6-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-6-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:50:22 +0100
X-Gm-Features: Aa3M54rLpieLF58-rwLxRtNnG8x7xeUuqkTkkdtI-xbj-gI1Ld79PLcz2tUe4fQ
Message-ID: <CAAeLtUDaRJm45p2reebNfEWPjqnfSS2KfuKO4ZMw+bYtpyQd9w@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] target/riscv: Fetch 48-bit and 64-bit instructions
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:03, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> Preserve the existing aligned word fetch and halfword fetch sequence.
> When Zl is enabled, use parcels A and C to determine the instruction
> length and fetch parcel D only for 64-bit encodings.
>
> Keep the complete encoding in ctx->opcode so gen_exception_illegal()
> can report it through env->bins.
>
> For an undefined length, stop after parcel C and set env->bins to zero.
> This implementation reports no instruction bits rather than fetching
> additional parcels solely for trap reporting.
>
> Stop translation near page ends before a subsequent instruction could
> require another page.
>
> Link: https://github.com/riscv/riscv-long-instruction/blob/65c377a665feb29a4848384ad566a9873c5fd423/src/unpriv/zl.adoc
>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---
>  target/riscv/internals.h     |  7 ++++
>  target/riscv/tcg/translate.c | 97 ++++++++++++++++++++++++++++++++------------
>  2 files changed, 79 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 4e11888b03e0dcb050426892e1758d733273bf99..ddd5ca65adc99d9538c98f4ce28c3c723a967824 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -185,6 +185,13 @@ static inline float16 check_nanbox_bf16(CPURISCVState *env, uint64_t f)
>      }
>  }
>
> +/* Long encodings must already include parcel C. */
> +static inline bool riscv_zl_insn_has_undefined_length(uint64_t opcode)
> +{
> +    return riscv_insn_is_long(opcode) &&
> +           riscv_zl_insn_length(opcode >> 32) == 0;
> +}
> +
>  static inline target_ulong get_xepc_mask(CPURISCVState *env)
>  {
>      RISCVCPU *cpu = env_archcpu(env);
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index 51024ee9a37df548ec27587c9b4bb240afd1d5a5..b301c41d3341dce777422a9c70a407818d3407bd 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -30,6 +30,7 @@
>  #include "semihosting/semihost.h"
>
>  #include "internals.h"
> +#include "insn_length.h"
>
>  #define HELPER_H "helper.h"
>  #include "exec/helper-info.c.inc"
> @@ -64,7 +65,7 @@ typedef struct DisasContext {
>      RISCVMXL xl;
>      RISCVMXL address_xl;
>      uint32_t misa_ext;
> -    uint32_t opcode;
> +    uint64_t opcode;
>      RISCVExtStatus mstatus_fs;
>      RISCVExtStatus mstatus_vs;
>      uint32_t mem_idx;
> @@ -265,7 +266,11 @@ static void generate_exception(DisasContext *ctx, RISCVException excp)
>
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> -    tcg_gen_st_i64(tcg_constant_i64(ctx->opcode), tcg_env,
> +    uint64_t bits = ctx->cfg_ptr->ext_zl &&
> +        riscv_zl_insn_has_undefined_length(ctx->opcode) ? 0 : ctx->opcode;
> +
> +    /* Undefined lengths have no complete instruction to report. */
> +    tcg_gen_st_i64(tcg_constant_i64(bits), tcg_env,
>                     offsetof(CPURISCVState, bins));
>      if (ctx->virt_inst_excp) {
>          generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);

gen_exception_illegal() is shared by every decoder; rather than
re-deriving "undefined length" from ctx->opcode here, could
fetch_insn() record it (or clear ctx->opcode) once?

Related, for when long loads/stores arrive: env->bins can now hold a
48/64-bit encoding, but riscv_transformed_insn() treats any value with
[1:0] == 11 as a 32-bit instruction, so htinst/mtinst would be garbage
for a long load/store.  It should return 0 for long encodings.

> @@ -1240,8 +1245,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> -/* The specification allows for longer insns, but not supported by qemu. */
> -#define MAX_INSN_LEN  4
> +#define MAX_INSN_LEN  8
>
>  const RISCVDecoder decoder_table[] = {
>      { always_true_p, decode_insn32 },
> @@ -1254,12 +1258,11 @@ const RISCVDecoder decoder_table[] = {
>
>  const size_t decoder_table_size = ARRAY_SIZE(decoder_table);
>
> -static void decode_opc(CPURISCVState *env, DisasContext *ctx)
> +static bool fetch_insn(CPURISCVState *env, DisasContext *ctx)
>  {
> -    uint32_t opcode;
> +    uint64_t opcode;
>      bool pc_is_4byte_align = ((ctx->base.pc_next % 4) == 0);
>
> -    ctx->virt_inst_excp = false;
>      if (pc_is_4byte_align) {
>          /*
>           * Load 4 bytes at once to make instruction fetch atomically.
> @@ -1276,42 +1279,82 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx)
>           * For unaligned pc, instruction preload may trigger additional
>           * page fault so we only load 2 bytes here.
>           */
> -        opcode = (uint32_t) translator_lduw_end(env, &ctx->base,
> -                                                ctx->base.pc_next,
> -                                                MO_LE);
> +        opcode = translator_lduw_end(env, &ctx->base, ctx->base.pc_next, MO_LE);
>      }
> -    ctx->ol = ctx->xl;
>
>      ctx->cur_insn_len = insn_len((uint16_t)opcode);
>      /* Check for compressed insn */
>      if (ctx->cur_insn_len == 2) {
>          ctx->opcode = (uint16_t)opcode;
> +        return true;
> +    }
> +
> +    if (!pc_is_4byte_align) {
> +        /* Load last 2 bytes of instruction here */
> +        opcode = deposit64(opcode, 16, 16,
> +                           translator_lduw_end(env, &ctx->base,
> +                                               ctx->base.pc_next + 2, MO_LE));
> +    }
> +    ctx->opcode = opcode;
> +
> +    if (ctx->cfg_ptr->ext_zl && riscv_insn_is_long(opcode)) {
> +        uint16_t third_parcel =
> +            translator_lduw_end(env, &ctx->base, ctx->base.pc_next + 4, MO_LE);
> +        unsigned len = riscv_zl_insn_length(third_parcel);
> +
> +        ctx->opcode = deposit64(ctx->opcode, 32, 16, third_parcel);
> +        if (len == 8) {
> +            uint16_t fourth_parcel =
> +                translator_lduw_end(env, &ctx->base, ctx->base.pc_next + 6,
> +                                    MO_LE);
> +
> +            ctx->opcode = deposit64(ctx->opcode, 48, 16, fourth_parcel);
> +        }
> +        /* An undefined length stops fetching after three parcels. */
> +        ctx->cur_insn_len = len ? len : 6;
> +        return len != 0;

This leaves stval = 0 on an illegal-instruction exception, but
Sstvala, which QEMU advertises, requires the faulting instruction.
For an encoding longer than ILEN, the priv spec defines that as the
first ILEN bits, i.e. 64 here.
Counterexample: delegate illegal-instruction to S, execute 003f 2468
5a7f 9abc (reserved length, D in RAM):
  cause:2 epc:0x80000090 tval:0x0000000000000000
  (expected 0x9abc5a7f2468003f)

Also: without x-zl, the all-ones encoding reported tval 0xffffffff;
with x-zl it reports 0.

> +    }
> +    return true;
> +}
> +
> +static void decode_opc(CPURISCVState *env, DisasContext *ctx)
> +{
> +    bool valid_length;
> +
> +    ctx->virt_inst_excp = false;
> +    ctx->ol = ctx->xl;
> +    valid_length = fetch_insn(env, ctx);
> +    if (!valid_length) {
> +        goto illegal;
> +    }
> +
> +    switch (ctx->cur_insn_len) {
> +    case 2:
>          /*
>           * The Zca extension is added as way to refer to instructions in the C
> -         * extension that do not include the floating-point loads and stores
> +         * extension that do not include the floating-point loads and stores.
>           */
>          if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
> -            decode_insn16(ctx, opcode)) {
> +            decode_insn16(ctx, (uint16_t)ctx->opcode)) {
>              return;
>          }
> -    } else {
> -        if (!pc_is_4byte_align) {
> -            /* Load last 2 bytes of instruction here */
> -            opcode = deposit32(opcode, 16, 16,
> -                               translator_lduw_end(env, &ctx->base,
> -                                                   ctx->base.pc_next + 2,
> -                                                   MO_LE));
> -        }
> -        ctx->opcode = opcode;
> -
> +        break;
> +    case 4:
>          for (guint i = 0; i < ctx->decoders->len; ++i) {
>              riscv_cpu_decode_fn func = g_ptr_array_index(ctx->decoders, i);
> -            if (func(ctx, opcode)) {
> +            if (func(ctx, (uint32_t)ctx->opcode)) {
>                  return;
>              }
>          }
> +        break;
> +    case 6:
> +    case 8:
> +        break;

decodetree already supports --insnwidth=64 (target/ppc uses it for
prefixed instructions); could this add a decode_insn64 (or a 48/64
slot in decoder_table) now, even if empty?

> +    default:
> +        g_assert_not_reached();
>      }
>
> +illegal:
>      gen_exception_illegal(ctx);
>  }
>
> @@ -1419,7 +1462,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>          } else {
>              unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
>
> -            if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
> +            if (ctx->cfg_ptr->ext_zl) {
> +                if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
> +                    ctx->base.is_jmp = DISAS_TOO_MANY;

This ends the TB for every instruction in the last 7 bytes of a page.
With -d in_asm, a 32-bit addi at PAGE-4 that fits on the page becomes
its own TB under x-zl.


> +                }
> +            } else if (page_ofs > TARGET_PAGE_SIZE - 4) {
>                  uint16_t next_insn =
>                      translator_lduw_end(env, &ctx->base, ctx->base.pc_next,
>                                          MO_LE);
>
> --
> 2.43.0
>
>

