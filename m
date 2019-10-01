Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFMz3-0000Sf-99
	for mharc-qemu-riscv@gnu.org; Tue, 01 Oct 2019 14:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iFMyw-0000QM-0S
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iFMyt-00030v-OH
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iFMyr-0002zE-R0
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2019 14:34:37 -0400
Received: by mail-pg1-x543.google.com with SMTP id i14so10239685pgt.11
 for <qemu-riscv@nongnu.org>; Tue, 01 Oct 2019 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OQi8CqLf3Tb5M+LSz1qzY7Pv1ZfhCTbNTGqS3rwVxX4=;
 b=Kp/vdRSiqArrA5SkRH8eV0CAzQp1ZegVPyzGK9YO/JiUom8yVMHS3zvJfwTQqbk7fg
 KTgMsdSIPvwo1s3/hTlUiXGojditaHxHhltRlx6AmmnvNqQ0uIrhusfknpJJT5iiSp8S
 4wzvON3tORrseAf2fPF3VpWY62vLcBdQJoj+hx9z9PpHo7wqj5ugdJAM0HU62BNblZLe
 cBz3v6kvUDtBaoZKXqoCzO0ow8y7G1QjYt179ChJcokZLbiQf0w0HqTujJ+3xfEKOy/5
 RcExy65nEvWy5dKIG7FmWoigZacbq0UU8TasrDwTa8Se6ojsFpUSqB14xhalUxehHL+P
 K+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OQi8CqLf3Tb5M+LSz1qzY7Pv1ZfhCTbNTGqS3rwVxX4=;
 b=hM9KG9HvVOQjskbtxxpdC9rjjARirdMA5fntEcZ506mjYV0t0ZFmeqr7pFWV+HaKmg
 m+nOaaFX2YAzis+Nh7U5S6FrAUwF/SKtbA0EH9ME2g1JpRYAzAAgZQ2k+g/gbmfs+y9l
 tSwa8cFNF2yHnUHrOJpJcN7fvMzoyAZfN8yUuOdU1VT1Lop9m5FWNUuZm/DA2vYQ692d
 LL0kO6QDo7zt0Rwn+xqKaaM28hht7X7cFiYWQ7TOtiUc+PW+R0mQDO4lgPu5muMoyDp0
 gMzx4PkIM0GCTX0ihFv/8Zz0+7KgM36D9VRV6fV39/qgOybP02bFyOLoOm6PTRn0SW9k
 kaNg==
X-Gm-Message-State: APjAAAVmqGd6NssXKjEvRPHHYPgkhwh/CsjyBAJLJe+8zCCGftBYBNGC
 2GhJaU3jjpNUhQ+8NfATByOq6Q==
X-Google-Smtp-Source: APXvYqxYvkk9MUEcdlMnSf2Nc4OHtWzpFc5Lct4D1ZB5TqSDApfpimxMUgCzWQ6EJc3Ao3bNmtVAsg==
X-Received: by 2002:a65:4785:: with SMTP id e5mr30973147pgs.407.1569954875513; 
 Tue, 01 Oct 2019 11:34:35 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f15sm16250203pfd.141.2019.10.01.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 11:34:34 -0700 (PDT)
Date: Tue, 01 Oct 2019 11:34:34 -0700 (PDT)
X-Google-Original-Date: Tue, 01 Oct 2019 11:34:23 PDT (-0700)
Subject: Re: [PATCH v1 20/28] target/riscv: Mark both sstatus and vsstatus as
 dirty
In-Reply-To: <035e50d6438660130233c472de56b883e369f6d4.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-de7a25b6-4610-45a6-9718-25ceeed0429f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 18:34:44 -0000

On Fri, 23 Aug 2019 16:38:42 PDT (-0700), Alistair Francis wrote:
> Mark both sstatus and vsstatus as dirty (3).
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8ac72c6470..19771904f4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -44,6 +44,7 @@ typedef struct DisasContext {
>      /* pc_succ_insn points to the instruction following base.pc_next */
>      target_ulong pc_succ_insn;
>      target_ulong priv_ver;
> +    bool virt_enabled;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
>      uint32_t misa;
> @@ -398,6 +399,12 @@ static void mark_fs_dirty(DisasContext *ctx)
>      tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>      tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +
> +    if (ctx->virt_enabled) {
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, vsstatus));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, vsstatus));
> +    }
>      tcg_temp_free(tmp);
>  }
>  #else
> @@ -742,6 +749,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
>      ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
>      ctx->priv_ver = env->priv_ver;
> +#if !defined(CONFIG_USER_ONLY)
> +    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +#else
> +    ctx->virt_enabled = false;
> +#endif
>      ctx->misa = env->misa;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

