Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmTZ3-0007pt-Sc
	for mharc-qemu-riscv@gnu.org; Sun, 14 Nov 2021 23:25:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTZ2-0007mZ-K7; Sun, 14 Nov 2021 23:25:52 -0500
Received: from [2607:f8b0:4864:20::132] (port=38815
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTZ0-0004eg-6n; Sun, 14 Nov 2021 23:25:52 -0500
Received: by mail-il1-x132.google.com with SMTP id m11so15182462ilh.5;
 Sun, 14 Nov 2021 20:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCiVvl8KuezBsrlKMIplRFvandxy1CQUR1kdN7sM44M=;
 b=E6cR2l8Fj3vJ00ftgF5/xEYe+ioAamJDppt/G2Tia8sv0Zjt2i/Bi9JFHh/s82Jq8e
 kwcJ9cTXBg5gaAR4+O5RmT6fyPcqYMnjIypszzypWdSij+ZP9ow3BcQ2mj7LhhHVf8th
 vOQR9KzXU11aHZyIBYcg8rQ4UkJ2kND8NG2tRvRDSO+nFJURW+PxaGTx+Uke7g1nBGp6
 nb2XQfV8GfN/bSzWbusjO+PdVeOjTPABLTKMQVdJukXgN6RrfWmwSRP5GmEHEUeNsBwN
 tOUrizlBNbHcFw5UkvSkdrNY9qVPP920Ji6C74/Usg2ToOUbpOXv+Htg07V7tR0TEeNm
 iEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCiVvl8KuezBsrlKMIplRFvandxy1CQUR1kdN7sM44M=;
 b=Vbd7Dyxl1M3ArPpkJBWtj8HOcleVuXtjUncI3416g1toKHetNS4S8uYz0kXl2VFJEl
 cYC9bF2wBQWHYwSlD7H3ykbPd8Nkk0u0oOytgeXSemJjGtBDYslbM0huyrMavRg+JdIS
 FF6QG6ZBFA5Y+AS5MNwnaJGX4VJKxb1/VpBWs+y5ri/Ny1l5K6ng2YMnf6aBlYx27Gxl
 CjuoVkNHo8NXHEqwWTyEnea5ZvSIITPjLqoE60KmrzEgZED4hDJEtSB6QZ/hA0hVIgDL
 LdnhHTHlqyG5xCgli+SzfxhA0rnyaV6GpJnw99oTd6b/KmOpJaq4H35nkBsyMXzp98Dl
 W3LQ==
X-Gm-Message-State: AOAM532SarhoD/yWgGIL5bYe0wioztnV8yvABbdFS+WxvyalsxEkEgIP
 DVH9KOsHJdmloM2D3CJgugQp5Zd61B45N36y0KH57ksKe/+5yA==
X-Google-Smtp-Source: ABdhPJy+KTowM5zQA5cezS8JKAiFHtNuwV7/teYcKfCFFTzX4gIsPKfX/0RD+PJ+FXmrrUeZS7hBXUvQG4H5FZ3dQQ8=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr18508239ilv.74.1636950348889; 
 Sun, 14 Nov 2021 20:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Nov 2021 14:25:22 +1000
Message-ID: <CAKmqyKO7P4aA23veee-WRQQQebDS76jURV8JiAXgPvDaXAJhQQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] target/riscv: Don't save pc when exception return
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 04:25:53 -0000

On Fri, Nov 12, 2021 at 1:54 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> As pc will be written by the xepc in exception return, just ignore
> pc in translation.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                          | 4 ++--
>  target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
>  target/riscv/op_helper.c                       | 4 ++--
>  3 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c7a5376227..c5098380dd 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -67,8 +67,8 @@ DEF_HELPER_2(csrr, tl, env, int)
>  DEF_HELPER_3(csrw, void, env, int, tl)
>  DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
>  #ifndef CONFIG_USER_ONLY
> -DEF_HELPER_2(sret, tl, env, tl)
> -DEF_HELPER_2(mret, tl, env, tl)
> +DEF_HELPER_1(sret, tl, env)
> +DEF_HELPER_1(mret, tl, env)
>  DEF_HELPER_1(wfi, void, env)
>  DEF_HELPER_1(tlb_flush, void, env)
>  #endif
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 75c6ef80a6..6077bbbf11 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -74,10 +74,8 @@ static bool trans_uret(DisasContext *ctx, arg_uret *a)
>  static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> -
>      if (has_ext(ctx, RVS)) {
> -        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> +        gen_helper_sret(cpu_pc, cpu_env);
>          tcg_gen_exit_tb(NULL, 0); /* no chaining */
>          ctx->base.is_jmp = DISAS_NORETURN;
>      } else {
> @@ -92,8 +90,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> -    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> +    gen_helper_mret(cpu_pc, cpu_env);
>      tcg_gen_exit_tb(NULL, 0); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ee7c24efe7..095d39671b 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -71,7 +71,7 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
>
>  #ifndef CONFIG_USER_ONLY
>
> -target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> +target_ulong helper_sret(CPURISCVState *env)
>  {
>      uint64_t mstatus;
>      target_ulong prev_priv, prev_virt;
> @@ -132,7 +132,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>      return retpc;
>  }
>
> -target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
> +target_ulong helper_mret(CPURISCVState *env)
>  {
>      if (!(env->priv >= PRV_M)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> --
> 2.25.1
>
>

