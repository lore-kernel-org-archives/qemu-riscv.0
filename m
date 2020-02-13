Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2JTG-0006ey-7I
	for mharc-qemu-riscv@gnu.org; Thu, 13 Feb 2020 13:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j2JTD-0006dK-3i
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2020 13:44:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j2JTB-0002Et-2U
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2020 13:44:15 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j2JTA-00029C-R5
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2020 13:44:13 -0500
Received: by mail-pg1-x542.google.com with SMTP id w21so3569515pgl.9
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2020 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lF8cg/+QniS/8crnOoiSQJaSy/JUvfCFg8+8SNK/r9E=;
 b=q5jASd28cyUetgoyaFDw9yERRByGN4UoDCchSu6OdPnProuGyfOK17AXMRbKZe4J2p
 t//L+N4+6CsGcyOnxLRFr2A6xKzKDMQN2h+bLoQNj58chMnmv3LpUSVNcrAk7stgRkco
 HlBuwxh9TGwIJOMnNVMO1lm3uRfU4R/uvMtu7YDbdn2o8otvfSTLEeKCiFtGFiQ+G9En
 Drw3zWPi3R7W6tz8W+ThuHreKOChAv5Md75jmsKZPhfqwAdLBmNmySRZC+KIGQ7QXSfm
 vLNYcvYKtHSd3GsXRa5f5FUTa8MJkyTMxhUHQLYzZgtawsVCgOTVt4wEZl3bPfc5k3Os
 FTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lF8cg/+QniS/8crnOoiSQJaSy/JUvfCFg8+8SNK/r9E=;
 b=YR3ElIpRjB0bXJgtFLP5O1AK5wugqRWT/kssK/HtbgXSZGzVp6tTgwjYbybRE4rSVU
 3OAvhseEQKF2pB+Uo5NIIvVnMZYRwqJKtsgnBqVwq4NeVMiOOqhLBEaA0eDJkHOZXM+1
 Cz7z+k4x+IGVXbOQ43dTtxKB/3cid+W4RKm2GUlN2Z9+XlLYtEBJBJp/Ybeu6oTjHq3M
 4uZKetITwflLghOifHBJFDi2sgqgh8l27ZYNylfQi3VTl5VbkTNAKzCtzegEuivYFcGi
 hLC+VX8YPop+ikSK2gfpMsTDiaLshG5Vdrc3ljg8MQBraJSx5W49juxmZFrhQU3NShMR
 h8sg==
X-Gm-Message-State: APjAAAWJ+Ig5RlCNzBGeRCzYPiPOYdX+48XNy8zXLF0cUuIp7gBnuPQf
 aq5sGF37xWKHxtIc4pP6s7F5FBsNrR0=
X-Google-Smtp-Source: APXvYqzUGXarw6AA9QRiZGlkEypHS1SY2ld8xsqbeQvv9dCB6xLg2R8cPJt4Pbb7tYteSFFx+R1UmA==
X-Received: by 2002:aa7:8654:: with SMTP id a20mr15073872pfo.88.1581619448571; 
 Thu, 13 Feb 2020 10:44:08 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id d22sm3801549pfo.187.2020.02.13.10.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 10:44:07 -0800 (PST)
Date: Thu, 13 Feb 2020 10:44:07 -0800 (PST)
X-Google-Original-Date: Thu, 13 Feb 2020 10:44:05 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 27/35] target/riscv: Mark both sstatus and msstatus_hs
 as dirty
In-Reply-To: <5f3b8fd9e9743c13fd9e40bf811303bc2937667a.1580518859.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-47cdaa98-793e-4dd1-8307-f53d1daec9e1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Thu, 13 Feb 2020 18:44:16 -0000

On Fri, 31 Jan 2020 17:02:46 PST (-0800), Alistair Francis wrote:
> Mark both sstatus and vsstatus as dirty (3).
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index afa2d6eea2..61fe9f03be 100644
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
> @@ -396,6 +397,12 @@ static void mark_fs_dirty(DisasContext *ctx)
>      tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
>      tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +
> +    if (ctx->virt_enabled) {
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +    }

I suppose we could #ifdef this, but I don't think it's worth it.

>      tcg_temp_free(tmp);
>  }
>  #else
> @@ -740,6 +747,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

