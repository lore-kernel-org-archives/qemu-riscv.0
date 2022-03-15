Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUG2M-0000B5-TR
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 18:53:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUG2F-0000Aj-1P; Tue, 15 Mar 2022 18:53:01 -0400
Received: from [2607:f8b0:4864:20::d2c] (port=35625
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUG2C-0002xV-Sp; Tue, 15 Mar 2022 18:52:58 -0400
Received: by mail-io1-xd2c.google.com with SMTP id l18so535677ioj.2;
 Tue, 15 Mar 2022 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLP/oThFAq+OPDkGOUaEmErSXHSm/3h7AAe8EIwxF/E=;
 b=gKxsxNEftw8AxSJTZkmPPGMrkB/192dj0AD5uYtvUfJCP7J2INijJpfjWI1FrILLtH
 t4i/4tqc4Xt5OUquDjenttt+K0AT70AN5vkjnUOkNJt8SF8sZvDOhdoeA4Rau37kP20Q
 QUylh5gy/PCATcTI8fTRuWUVZG5iHTNN4ZiDhVvf44zGXZ5nF6cuppYnPt6IvMF2GQI9
 SB65p9nfUMwR6UGVNaXgpmi+u462jNtEH7vJukYeYcCCqBZ3CRiJgIHifNKw3mg6KEq0
 jaep7PJ8uZX3pJaxJIupdRZ5Yymd/D6eRX6oUsTeqFXAdqP/RxcaIJ2CRuILdTOBTIDj
 xkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLP/oThFAq+OPDkGOUaEmErSXHSm/3h7AAe8EIwxF/E=;
 b=n/aKH253fh9/Efng2WSFC6o4044+W3V6LJs4Opt1JhxwUMpSvkmLljsXn0XeWG02Qn
 hsQlM3qdpxcv8ICAS49WoiMfMBzDyMFkvjduEAUKLXLxzryZKUa253Ss+Z9F3Q6p84oQ
 2XBdNznRx+0zW2uPD1vHwnu2uVTXRdZxEiF2dttsVnHxpyJ/a8dv99CWWKVHJCk5N307
 /i4Nja8Cn3XolzWs1tp7NQjF3hBgqiMCNJzWxIgfkQhT2eYYXMyoBF3DmSfrOHgGo+9o
 c56zql7NlQLV3Bz4in6kyhy5l1FwQNWtx5v1ZeUd6nMoUiCMUyTmu34/vuginLX2IlIm
 aTeQ==
X-Gm-Message-State: AOAM531MGRR8QyalWxtViY68LVKEc0nO+cJiqxTKrDE3pWJrOez5gxCH
 13Sq+xPvjaDLCE+FG2X84O1ktsNf3cYGn9gT2ko=
X-Google-Smtp-Source: ABdhPJw+ot+Xmke25PEyc0ZFQNpVFyLowDRI/vmzTrTsqtzRyiJmag+iTPsISJyZaguCf89DUFp7DSGjCL7nH7VewWI=
X-Received: by 2002:a02:a1dd:0:b0:317:b0c9:254b with SMTP id
 o29-20020a02a1dd000000b00317b0c9254bmr24158389jah.68.1647384775209; Tue, 15
 Mar 2022 15:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220315192300.250310-1-idan.horowitz@gmail.com>
In-Reply-To: <20220315192300.250310-1-idan.horowitz@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Mar 2022 08:52:29 +1000
Message-ID: <CAKmqyKPmYyh8+jnmB0O5GeNtSZPgZ5B=YffvQUmjZNH=K7eXbA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 22:53:02 -0000

On Wed, Mar 16, 2022 at 5:26 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> If the pages which control the translation of the currently executing
> instructions are changed, and then the TLB is flushed using sfence.vma
> we have to exit the current TB early, to ensure we don't execute stale
> instructions.
>
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 53613682e8..f265e8202d 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -114,6 +114,13 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      gen_helper_tlb_flush(cpu_env);
> +    /*
> +     * The flush might have changed the backing physical memory of
> +     * the instructions we're currently executing
> +     */
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  #endif
>      return false;
> --
> 2.35.1
>
>

