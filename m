Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osuK9-0008Vx-1C
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 18:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuK6-0008RH-J0; Wed, 09 Nov 2022 18:17:34 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuK4-0003f2-RL; Wed, 09 Nov 2022 18:17:34 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o13so53400pgu.7;
 Wed, 09 Nov 2022 15:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P4J8rXGUOT05Jc0hge0ob+XRsdso3FnkgfkbRpAnEDE=;
 b=EwYcrynLwmyCzm0fwMzqNTYEcuYbAFfmusoPpr3oi8TO7CVKD2TNzR7csPj5+eJsQ+
 lS5B12TO4OcR8knrx6s1O06mHNYyENLpT1n2+NAwovEHgwnTQbOmv5ssJIrb2AeCXIAy
 4c9FFmeeYHJa6ew848QkqWORJW6H+4HVbWgikkjqcug7UUS6+aN+vKj0u0w+LD6eFY81
 rofSlAhm5UzYE5y15FKc67kT/a3wVBOZZeSpRwxPO4Noh5095VQwkJKKy+9XwGKSbPO6
 Uy4eWhq9vKCG8j8WZEpGHqkE0L2LE7ZougqfYY7MEDz45k0kjq+WKOqXGTiqMCf+4k3c
 kPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4J8rXGUOT05Jc0hge0ob+XRsdso3FnkgfkbRpAnEDE=;
 b=7JwlJpcryJaLd5ej2yS1Ta5mavmDFyu8V84pet0C33oiKbKjRndlLpN+jSvOQXtKZi
 59zwmC7Fup2GS7etSHoh2b2MWFaT/l3Y+3TB06YsmQnRQcf0Mr+NEhxKrOUPU+RSEOl+
 FxKM/jiksBJay38BL/DAru88Qlcy+h5b4nXbUqVnbwz2U57/+ruvFn6iWbwaVLkr1vVw
 g3u0dCUxLM9Rv+53a/wuvN5rHTxkn1B8AIHRxFBfsQv6gXuIB3prQQwMO2VDQZEbnQLx
 8FldhQE1YEiiWynfwlh4gWTG1oeK/9KoljzzDpHpwdHNEOom4t1xhXmeR5cOrqHenUgT
 aIAA==
X-Gm-Message-State: ACrzQf2HLhWOJtU9HqAUAcbrn+3fwbDR6Myn5CSz+oPwu27vrpzHmq/3
 MAtr5EpWrIncstGf1rrRGCOuk7HKJLWagf2AgM44ifXDZfrc7iFq
X-Google-Smtp-Source: AMsMyM7Cg/ITZ97qKrtyr9x2ygyoH7m1nFuqtipZLN33NCPvup0RlmfwcS7BbtsgFj51tEyVFhbnduhr+IePZHCyxYc=
X-Received: by 2002:aa7:92c7:0:b0:557:ef5e:6db3 with SMTP id
 k7-20020aa792c7000000b00557ef5e6db3mr1312572pfa.13.1668035850851; Wed, 09 Nov
 2022 15:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-4-mchitale@ventanamicro.com>
In-Reply-To: <20221016124726.102129-4-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 09:17:04 +1000
Message-ID: <CAKmqyKMPpDsWF6xgXvy=Bu4fLtSz+AznGCzEjp78HcOUZXB1wA@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] target/riscv: generate virtual instruction
 exception
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 09 Nov 2022 23:17:35 -0000

On Sun, Oct 16, 2022 at 10:58 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> This patch adds a mechanism to generate a virtual instruction
> instruction exception instead of an illegal instruction exception
> during instruction decode when virt is enabled.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..8b0bd38bb2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -76,6 +76,7 @@ typedef struct DisasContext {
>         to reset this known value.  */
>      int frm;
>      RISCVMXL ol;
> +    bool virt_inst_excp;
>      bool virt_enabled;
>      const RISCVCPUConfig *cfg_ptr;
>      bool hlsx;
> @@ -243,7 +244,11 @@ static void gen_exception_illegal(DisasContext *ctx)
>  {
>      tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
>                     offsetof(CPURISCVState, bins));
> -    generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> +    if (ctx->virt_inst_excp) {
> +        generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> +    }
>  }
>
>  static void gen_exception_inst_addr_mis(DisasContext *ctx)
> @@ -1062,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>      };
>
> +    ctx->virt_inst_excp = false;
>      /* Check for compressed insn */
>      if (insn_len(opcode) == 2) {
>          if (!has_ext(ctx, RVC)) {
> --
> 2.25.1
>
>

