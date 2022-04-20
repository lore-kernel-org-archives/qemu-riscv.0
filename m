Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh545-0002x8-9P
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh543-0002u2-Ax; Wed, 20 Apr 2022 03:47:51 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh541-0006UX-EX; Wed, 20 Apr 2022 03:47:50 -0400
Received: by mail-io1-xd29.google.com with SMTP id i196so1002943ioa.1;
 Wed, 20 Apr 2022 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+J0X+F930H9JngbgdoDfpqGo4g6edvBrfDXft2O0FA=;
 b=izxek4E1Rsw/GolynxUeIjUBKraxvYRAEMbsFh9aMq1pcF7VcaHwqIQXUiY0gl1g8U
 fBiaSMRJpJ2A/WaqrnYVRRfDCjJk2dpEHm2nRDRoWwf3tuVHu4hxA/HOyqFj+ApoNXGM
 keiAeTYYjRuayfVhbBwwX2G6dw9IFWwwzPZXxnCGdwJakMxOCNqHPbNLZa3NDBQEKpwC
 2FddOHEHONU0LLC3+01umm7XXs+r8BGObx9Q9WzBnAMgezEZKvvbQ/Yn86qGTt7pycvo
 zXhMbW5PPXLxZl0r7LnWCv0MwKa8RO1rTccaFe7+VDeUbirnFT7Fnl/uyCOkfAQDKW9K
 4ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+J0X+F930H9JngbgdoDfpqGo4g6edvBrfDXft2O0FA=;
 b=eJDt6/+pjqfb90MEhAol/ZwyI2Z9REfwvaTimqRG1Q4VLr192gPZJQRTRyixcOgWfZ
 Fo+QGsSfigUZQtSxxveTRBnLzZV7uQoALHd7XAFUTStRniU3N63p3fcs/o1fGxnFemZe
 wKkUPYjLFWmvVBZjp5L1qgr7OUHB7Oi198OXeZ1YN69ffqfMvkd3kCDl5U1dn5w+aN4U
 KcSpK1O3Jvh1zqmyD5fR7fQa28gFQERd/jTGl+HJnqbKAPbezK2AtO2WhyIqwwVqBgbq
 3Z8g3Nd9ZEneWtekjatIg4VNSx6A5vA3v9EMqPoqc32m1ggAVmTvp0IVgJl/SzYT783R
 hg/w==
X-Gm-Message-State: AOAM532+N39spXim+ZVuMESr1ZTtFZJikLFIvyAP37Auo+t3Ph3gA8rE
 Cn7quQB4tk3hvsGJXyqMPNcJqbgBMVAXw/XekO4=
X-Google-Smtp-Source: ABdhPJz1DcXDQngJ6XSbdKI48conJ/BBaorrvokZnbXlqiYWX3c8yWv1UHjxl8YpykyMt+HkhFBJz3yxCeS6wHg8MhQ=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr8564762iov.93.1650440864651; Wed, 20
 Apr 2022 00:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
In-Reply-To: <20220415093727.15323-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 17:47:18 +1000
Message-ID: <CAKmqyKP-WNHrTYWwft=7RN2FsyfKi-zShNpr6kgAu3_EPzBY9A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 07:47:52 -0000

On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Allow user to set core's marchid, mvendorid, mipid CSRs through
> -cpu command line option.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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

