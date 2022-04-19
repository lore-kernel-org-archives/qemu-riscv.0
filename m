Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nggJl-0001vD-4e
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 01:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nggJj-0001ur-1d; Tue, 19 Apr 2022 01:22:23 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nggJh-0008TY-9O; Tue, 19 Apr 2022 01:22:22 -0400
Received: by mail-il1-x136.google.com with SMTP id i8so4822597ila.5;
 Mon, 18 Apr 2022 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QTllmhgtR+W6Rl26nsTbGlQAq4JYxrlSiJavVV8P3BA=;
 b=YDek01tKgst6w57+wPxbejkiz9fGwtYygVP0riqes5XKV3ep5yQEkeL4f4+YHXyHyw
 3u/EeDW2xrkZ+JOnTNFVyP+8n36GufQlKUCIsXsXCFRVSZEIQYy9fbwLy2iBcP8P0tTX
 3wnDOUCvgaNlka55pAHpp3ItFFk0qbwvHtCIX4aemybP9WjYWAym6Glu5EP3gce7MTX2
 tYPKTsjVkd43rdrGQE6m5NHNPpw/IMO2fUxXAF5X7hrdgGm5jEpXxkGMuNi8OXKhhlbh
 K7VHGnPlo3aXjg5pe9e4NaGTeDwx+ulfKLXO2iJgRv2wJtXfQwdokkyxO0wWl66oZhLv
 HsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QTllmhgtR+W6Rl26nsTbGlQAq4JYxrlSiJavVV8P3BA=;
 b=Xzc6p3iUfEm99ql/mQVcJjl26uRo3qIagBjipBPkrttTjAnEWQUGLSt/9Fx46ARDhn
 KRPCMP5JNsyCS57Dp/hWu8MYd7ZCtBM49/SYuFtYAvsGOcYKoensRex0SODNpMIqTCb0
 fYRtmCgIIkSA+FIXFVLPD+mfEf97brfnt0q0AdBt5/bYE0gluMxtecsQ+hHc4CNhMjGx
 wRyNbXDCnFqCMkwpOdXR/lxN2cXZycN00Q8mvnAPePKo82CnaCAoLK6/g2FA2MWQjyBQ
 0hPZv71FZYDvGn2zLbXDZt0Jdsu1qNjtOueo7oG/q2xL+Ltcd/HXCjwzgP5xMQpNEo+l
 9ycQ==
X-Gm-Message-State: AOAM530ZvM+mDAer67ftS6sbd9IN2cXh1AwMZQqHiQS2sTbmjss74u+K
 oKIM1ehVr39WxqUH3JfZDejIWpqKezFdTikX20c=
X-Google-Smtp-Source: ABdhPJzHdP1Bqn7lXp1n8dwPndsf7NVHxBTb/EU8cFwHgH5IhB9MdJFMEEKvP0jckqQCSVA6AaMoeKQj/2Jt0HnAYPE=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr5999874ilb.86.1650345737908; Mon, 18
 Apr 2022 22:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
In-Reply-To: <20220415093727.15323-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 15:21:52 +1000
Message-ID: <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 05:22:23 -0000

On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Allow user to set core's marchid, mvendorid, mipid CSRs through
> -cpu command line option.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  target/riscv/cpu.c |  4 ++++
>  target/riscv/cpu.h |  4 ++++
>  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
>  3 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..2eea0f9be7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
> +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),

Should we have non-zero defaults here?

Alistair

> +
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..3ab92deb4b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -370,6 +370,10 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>
> +    uint32_t mvendorid;
> +    uint64_t marchid;
> +    uint64_t mipid;
> +
>      /* Vendor-specific custom extensions */
>      bool ext_XVentanaCondOps;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 341c2e6f23..9a02038adb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
> +                                     target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.mvendorid;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_marchid(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.marchid;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mipid(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.mipid;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
>
>      /* Machine Information Registers */
> -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
>
>      /* Machine Trap Setup */
>      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
> --
> 2.35.1
>
>

