Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nygaM-0001zH-3Q
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 17:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nygaJ-0001qz-Ri
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 17:17:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nygaH-0006KQ-J9
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 17:17:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id j7so16744369pjn.4
 for <qemu-riscv@nongnu.org>; Tue, 07 Jun 2022 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQpzIjqm2Z7NYHnECe0WedSpG9SrTZLDXt9SwpdfwHs=;
 b=W+CKRMaFHziZ/ALwQe04LFlIxY+EXHc29CnVyuqA5rZ20dFs2SJvO04etVOB6zfOd5
 5YynNWDlXxgDIWnKeAsiH5FjndbI/Yifg48zB4O5on6241UeXw2ejJuf8iGhSIEvdPQy
 aDRn0t8xC1lMLWhUKKGxD9yacBni1lcjEUItdIxz+4IZRybqY0f0me7P/ZjUGAXzPHP9
 11upEZ40Zetbq+YNPwZXXw/7VmeKxoTI9+VOmpV7Nfk9gFKVFUdOzbfTRZ4QHdaj9oJ3
 E21Plvw2zT1zBTPAAWtHmljwcEn65ODuipHInkyWJJ3pD3zeBJfdxkIhnfBwOi0p57ik
 QyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQpzIjqm2Z7NYHnECe0WedSpG9SrTZLDXt9SwpdfwHs=;
 b=xq6WqsXMrP3SZcX3XZdmz1ZirDCb40wqYRzt6rudydnjOulxR4ELPFSSZLv31401PV
 zFOFHfa4r81vCMbp/3w52/cRnED6Uiu3ORT9aYYvjihmobkt28mZpKzZs1Y+kvv6nGQB
 Lm7MqUoTS81TSMcms99A6nD3tqzexDdUYw5glKqQPDsE/NP85wNzil6cP+0rvAfaSxy8
 4tW8WoNVxn+Y1+TyCcYrT/xVC54LMfrcJmxomz+ts2ZjCk94ZNtIov2NcJPtgpEt51Jg
 ynk8rNhgFaWsM+djaiVSpmiz9ZtxNlFo0fxDVpjqv872MpAOjYMNAi4ZCdnmYqRiFPMF
 pIKQ==
X-Gm-Message-State: AOAM532zay0rq5/171y/Yn3AEUpLVG60PXcS+PTh8XerpEtZ69vwuMaC
 bW0CgyUR7osb3WNtSF9oqq8izO3FJWfXjUs5oM60sg==
X-Google-Smtp-Source: ABdhPJwBbe2ZXsJ9VBUpMpwy7qzanUzJGca5n2a1tUZpmeZbmECytU0EEVrcCvqbtIiD4GYAwbF2px+vIdU4bFkg/BY=
X-Received: by 2002:a17:90b:682:b0:1e3:142:a562 with SMTP id
 m2-20020a17090b068200b001e30142a562mr49816155pjz.91.1654636671399; Tue, 07
 Jun 2022 14:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220524203647.31435-1-daolu@rivosinc.com>
 <20220524203647.31435-2-daolu@rivosinc.com>
In-Reply-To: <20220524203647.31435-2-daolu@rivosinc.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 7 Jun 2022 14:17:40 -0700
Message-ID: <CAKh7v-Se705qE16UgV92UsrfhkcJCUtKByOt6Hs80MhV1Wh88w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: Add Zihintpause support
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Jun 2022 21:17:56 -0000

Ping

On Tue, May 24, 2022 at 1:36 PM Dao Lu <daolu@rivosinc.com> wrote:
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>
> ---
>  target/riscv/cpu.c                      |  2 ++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn32.decode              |  7 ++++++-
>  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..183fb37fdf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe6c9a2c92..e466a04a59 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
>      bool ext_counters;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zihintpause;
>      bool ext_svinval;
>      bool ext_svnapot;
>      bool ext_svpbmt;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..595fdcdad8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +
> +{
> +  pause  0000 0001   0000   00000 000 00000 0001111
> +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> +}
> +
>  fence_i  ---- ----   ----   ----- 001 ----- 0001111
>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index f1342f30f8..ca75e05f4b 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
>  }
>
> +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> +{
> +    if (!ctx->cfg_ptr->ext_zihintpause) {
> +        return false;
> +    }
> +
> +    /*
> +     * PAUSE is a no-op in QEMU,
> +     * however we need to clear the reservation,
> +     * end the TB and return to main loop
> +     */
> +    tcg_gen_movi_tl(load_res, -1);
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
>
>  static bool trans_fence(DisasContext *ctx, arg_fence *a)
>  {
> --
> 2.30.1 (Apple Git-130)
>

