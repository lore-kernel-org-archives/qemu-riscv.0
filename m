Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1Wq-0004NB-G9
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1Wo-0004Mk-Si; Tue, 18 Jan 2022 22:20:54 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45846
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1Wl-0002S6-QM; Tue, 18 Jan 2022 22:20:53 -0500
Received: by mail-il1-x12e.google.com with SMTP id h30so989824ila.12;
 Tue, 18 Jan 2022 19:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hAi5K/ymxEKoBBwqwnnp2J11F/NVkgBLskUneXyUDGQ=;
 b=Ca8boraTuczqnvuQtueQAtN5gN01geKG022Gh6eC6uCYHqO4Bp/sq8r+UGXqafdwEU
 qvGS0hSef+oeJ6/RTUY48A2oEE1ERL7xkb9bjMafX5dHEAhzSzzM+8apT9CMlDf6JTdd
 Ce/Gby5KSskcQiKwAMUHsXcoCcth70dI1rcsotYedje/7p9WXiygc6TITAbO121H7XWH
 tSmT/dGbXWdtLnjgr0xNVsWgWhInhGhCI6nhGV50SAOnutWlgd36L0AxKTlcWw3e8X+U
 qHYh9cx3QL69peucZbdPSMpTUu9EBgKVzhttvqNBG9A6w7IPVmVWtifEXhftFBQj1uzk
 COpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAi5K/ymxEKoBBwqwnnp2J11F/NVkgBLskUneXyUDGQ=;
 b=6ddX2N9+VVdOdi/zZH55vRnYzOISE4a6sAZc1VV+Ym9EUx703kXtwpcRmUyzNUAH36
 AIn8Kd5pF7Ht/nY59lVOrum0TJk6U8UBMsID6jeNfeC9XUlP3ALvwp17JzyiqmlLY7Vf
 C2KeNc1/5p4Y2gZ7HIBRkbhl4vsOTkmVzAsFRY+xjda6z+xderpY7b57mXkKlsUptvwO
 o33tJqY2Zp61Nxa6NhCmN2BER0eiIVA1P0qf0f+yaMgnylGSkclApdU8gOT+VIYH4gfp
 f0UgoCsJWWYvKZKX05W+BkP8bVTb2Img5amJNPBp0qq8NVnIdvnuhBOCenEoqsQAPkuR
 nBdg==
X-Gm-Message-State: AOAM530vLpX/ePcQj8o/0H/B18CNva52nOJrK+SJsTPMBSf0FpsxV4kA
 8QbwNqQ+FSALvEDcXUi9d4w1pG4BDpmgXQP8arU=
X-Google-Smtp-Source: ABdhPJxhRluCqqyHlkpof3ClJRB0hFa6kuJT6mSSexXESxO6umrOgcvG5S3zGl53TOng8OUrOLFIM7/ZiQK2HZQZMWQ=
X-Received: by 2002:a92:3012:: with SMTP id x18mr14605552ile.221.1642562436174; 
 Tue, 18 Jan 2022 19:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20220113114004.286796-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:20:10 +1000
Message-ID: <CAKmqyKMCwFdRqzd3tcGh++tGbtF6TTOdAY5VKzqNMcCBOnZsXA@mail.gmail.com>
Subject: Re: [PATCH v6 01/22] target/riscv: Adjust pmpcfg access with mxl
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 03:20:55 -0000

On Thu, Jan 13, 2022 at 9:41 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 19 +++++++++++++++++++
>  target/riscv/pmp.c | 12 ++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index adb3d4381d..e7578f3e0f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1493,9 +1493,23 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
> +{
> +    /* TODO: RV128 restriction check */
> +    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
> +        return false;
> +    }
> +    return true;
> +}
> +
>  static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>  {
> +    uint32_t reg_index = csrno - CSR_PMPCFG0;
> +
> +    if (!check_pmp_reg_index(env, reg_index)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
>      *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
>      return RISCV_EXCP_NONE;
>  }
> @@ -1503,6 +1517,11 @@ static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
>  static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>  {
> +    uint32_t reg_index = csrno - CSR_PMPCFG0;
> +
> +    if (!check_pmp_reg_index(env, reg_index)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
>      pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
>      return RISCV_EXCP_NONE;
>  }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 54abf42583..81b61bb65c 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -463,16 +463,11 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>  {
>      int i;
>      uint8_t cfg_val;
> +    int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
>
>      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
> -    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "ignoring pmpcfg write - incorrect address\n");
> -        return;
> -    }
> -
> -    for (i = 0; i < sizeof(target_ulong); i++) {
> +    for (i = 0; i < pmpcfg_nums; i++) {
>          cfg_val = (val >> 8 * i)  & 0xff;
>          pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>      }
> @@ -490,8 +485,9 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>      int i;
>      target_ulong cfg_val = 0;
>      target_ulong val = 0;
> +    int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
>
> -    for (i = 0; i < sizeof(target_ulong); i++) {
> +    for (i = 0; i < pmpcfg_nums; i++) {
>          val = pmp_read_cfg(env, (reg_index * 4) + i);
>          cfg_val |= (val << (i * 8));
>      }
> --
> 2.25.1
>
>

