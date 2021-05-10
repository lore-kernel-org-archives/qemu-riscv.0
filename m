Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lg0GQ-0004ls-E0
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 03:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0GO-0004jy-Kw; Mon, 10 May 2021 03:23:36 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0GM-0004tY-NX; Mon, 10 May 2021 03:23:36 -0400
Received: by mail-il1-x130.google.com with SMTP id e2so13249832ilr.1;
 Mon, 10 May 2021 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PiWDHaV5vgCRmmHZnNSSordF7z33/2Af1cgcU28V7a8=;
 b=kZg8DqMTUHsT53CUeTIzxLW6whNXazlWdn5+fud0/k9mb4B/TAKFNnublYydFvsflk
 Gaqp95wBevjQ0jd+KWXNtJrCLZJn2IVatTjN8l73Jvyvqny9e6/6YxGSFYlmKeX1S4St
 n8FANhLFFwgYtA8qMFMGcmnYlm/C0XhS2xRtlTLpI2MuE7+6KvAQ0Oeo2EEZMGK1B6S7
 5Vc3deCGFSGXFUnDD/97sHPquerUho/FoSX/i/dRp6qAuecbk/y80ar4jaGz6h9lHo6f
 qKkUGAOq44yuNTkCk12cOgjLnlIQEp6vCN91jo6f+e/VxjQDyx71k5926YLqURpyZKYr
 KhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiWDHaV5vgCRmmHZnNSSordF7z33/2Af1cgcU28V7a8=;
 b=aLQVbyFeUyY1altEkYEhITQsjPP4yRr6nOd425IadAjvAbU9cROy3x+pJYqHLOkfDt
 DshQdL0kir4H4iyzgjZrLbasFwgFc/DtVBbznpues4sY1GAHsW1eki3tk7akbXo+Z0kn
 h0qT123Z0/ctE7wgS1HPKUfn8dEdqcRilLQozboMNKknSJBmqlaYxkQEAS8XeObINW7+
 5Y+tV6Ql1Qh/XncR7Q0b1ifL2wtBtSUQMorh9cS766Gpq6S52jNUpYTjmeKopVCUiPxE
 qnUtper1/afAQpDMjbCilpLyXw+MAQOvq+3hGnky9DEQaxmNt8IJ+hthOu5VwgjmYDHs
 8NYw==
X-Gm-Message-State: AOAM532iRQTaMP8zsz7KIX2t8ekEYlEr7sG4o6yD78D1/ThU4TEGsh6y
 9Xi0ojXxVEwkLuhSIgoggSt7NwVhTKIRqseJKCM=
X-Google-Smtp-Source: ABdhPJy/u1cWJ0bLI9kaGJQRf5tUlelwyDDuJs8Ij0azbOx7S4BZTJfkFxb/8tXrZud25rI9DoAABXQysnRmiVWnaT0=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr20302004ilc.40.1620631413071; 
 Mon, 10 May 2021 00:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-9-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-9-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 May 2021 17:23:06 +1000
Message-ID: <CAKmqyKP70tfbu1MOXnria1GFUS3eKxe=SrASbLSsA=yz--rc0w@mail.gmail.com>
Subject: Re: [PATCH v6 08/17] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Mon, 10 May 2021 07:23:37 -0000

On Thu, May 6, 2021 at 2:26 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
> interfaces for immediate shift instructions.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
>  target/riscv/translate.c                | 39 ++++++++++++++++++
>  2 files changed, 43 insertions(+), 50 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index bd93f634cf0..6e736c9d0d1 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -268,54 +268,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
>  }
>  static bool trans_slli(DisasContext *ctx, arg_slli *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
> -    if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_shli_tl(t, t, a->shamt);
> -
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> -    } /* NOP otherwise */
> -    return true;
> +    return gen_shifti(ctx, a, tcg_gen_shl_tl);
>  }
>
>  static bool trans_srli(DisasContext *ctx, arg_srli *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
> -    if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_shri_tl(t, t, a->shamt);
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> -    } /* NOP otherwise */
> -    return true;
> +    return gen_shifti(ctx, a, tcg_gen_shr_tl);
>  }
>
>  static bool trans_srai(DisasContext *ctx, arg_srai *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
> -    if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_sari_tl(t, t, a->shamt);
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> -    } /* NOP otherwise */
> -    return true;
> +    return gen_shifti(ctx, a, tcg_gen_sar_tl);
>  }
>
>  static bool trans_add(DisasContext *ctx, arg_add *a)
> @@ -377,16 +340,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
>  static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv source1;
> -    source1 = tcg_temp_new();
> -    gen_get_gpr(source1, a->rs1);
> -
> -    tcg_gen_shli_tl(source1, source1, a->shamt);
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(a->rd, source1);
> -
> -    tcg_temp_free(source1);
> -    return true;
> +    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
>  }
>
>  static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5f1a3c694fe..292cf09932d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -652,6 +652,45 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>      return cpu_ldl_code(env, pc);
>  }
>
> +static bool gen_shifti(DisasContext *ctx, arg_shift *a,
> +                       void(*func)(TCGv, TCGv, TCGv))
> +{
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +
> +    tcg_gen_movi_tl(source2, a->shamt);
> +    (*func)(source1, source1, source2);
> +
> +    gen_set_gpr(a->rd, source1);
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +    return true;
> +}
> +
> +static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
> +                        void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    tcg_gen_movi_tl(source2, a->shamt);
> +
> +    (*func)(source1, source1, source2);
> +    tcg_gen_ext32s_tl(source1, source1);
> +
> +    gen_set_gpr(a->rd, source1);
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +    return true;
> +}
> +
>  static void gen_ctz(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
> --
> 2.17.1
>
>

