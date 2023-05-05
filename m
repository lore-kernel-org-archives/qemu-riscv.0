Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuKZ-00076H-Cg
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuKX-00075V-Uv
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:14:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuKV-00070t-S2
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:14:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso3285438a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288869; x=1685880869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GZkLd0wmL1n/GDwwG3Amj5HH4HRqlcHjx9jRhfq04ks=;
 b=DFEMtSojedDiM3Nr1/ourhRXl469kJtwx5O0lL59AGDaflhPf2cwdPGtGpm/6bt/8p
 XZFVCaKAn10KM/Prz2yJiRpIxRma4YD3bAGVjh/V+sV8VRRut5RVLHtmFrc2wEH9dlKs
 bVWv+C5Zv1SG2Uadu1ZPNkzdmfxSOdDWknVZo/o87NnRa2Ci3q+goH3yNt9qcR01u+cH
 mDFRuCPU6zSo3H7VLiNWZFXQwhX45lDc4YI0iYwkdqF6cSQihxZeVHCChfbs4WiFzFPw
 CEKn1ogznIEFTqc6UZiD9aona4D6VhxCzov2AoZ/AmqwmaygtFBsNGdOLdguhXGvpbeC
 CDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288869; x=1685880869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZkLd0wmL1n/GDwwG3Amj5HH4HRqlcHjx9jRhfq04ks=;
 b=TpG/GxssgxMBkcFiEHXyNfSaHx31ADhawSH6/+ubytvPlY0UWnbqE9TOugE3li3vlR
 oEOcFDQP4OYUYfEz6ivmSwZL3lWJrO4oLvm4eW4DQEk6ZP0PBe5765tuIn4ZoALDhvj+
 QRwzYqg+oBeKHlwY0r57OI6MLgzwR9qtdA0lS09GZlo6mLN9a2c3XR8njyv48TO2ZMNZ
 MAmrs25RaacCFrovsRwWRNvgh3IMksqzzY5Em38tZ2Cd6aBIx+575LWF///QSSgmfapJ
 zY7ay5n9ATpKO8Kk5crIs77zNbKXrEUpvO4QvtK549zQlCddtp994xIoH35ubEFU+xDD
 T+uA==
X-Gm-Message-State: AC+VfDxYkJhsTUfD/Uo19LKrRlZrvHV5cBTb7e0My3G5baRfhLqk8PpI
 Nh1CksP3QqExCgg4bK0BlbPyWNYj+EiEssdTsCs3xA==
X-Google-Smtp-Source: ACHHUZ7x4+a2u0HZdKNpIJhK4PgkN362pZ8bTzU+olOvyoB7ER9M27ORNYlKDrmcH+OYSIL+z9WwWa/ELdEF/uL24pQ=
X-Received: by 2002:aa7:dd4e:0:b0:50b:fc7f:b281 with SMTP id
 o14-20020aa7dd4e000000b0050bfc7fb281mr1135065edw.1.1683288869317; Fri, 05 May
 2023 05:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-27-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:14:18 +0100
Message-ID: <CAFEAcA_i+XxebX2m448iA-XdbBuN1w0VsEwhAQkP_yQvqnjNhQ@mail.gmail.com>
Subject: Re: [PATCH v4 26/57] tcg/arm: Adjust constraints on qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 12:14:34 -0000

On Wed, 3 May 2023 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
> ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
> to the misaligned trap.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>  /*
> - * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
> - * and r0-r1 doing the byte swapping, so don't use these.
> - * r3 is removed for softmmu to avoid clashes with helper arguments.
> + * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
> + * r14 will be overwritten by the BLNE branching to the slow path.
>   */
>  #ifdef CONFIG_SOFTMMU
> -#define ALL_QLOAD_REGS \
> +#define ALL_QLDST_REGS \
>      (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
>                            (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
>                            (1 << TCG_REG_R14)))
> -#define ALL_QSTORE_REGS \
> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
> -                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
> -                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
>  #else
> -#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
> -#define ALL_QSTORE_REGS \
> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
> +#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
>  #endif

Why is it OK not to remove r0 and r1 from this any more ?
The commit message doesn't say anything about this bit of the change.

-- PMM

