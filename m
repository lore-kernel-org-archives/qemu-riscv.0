Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUQvM-0008Uj-4P
	for mharc-qemu-riscv@gnu.org; Thu, 08 Apr 2021 05:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUQvL-0008UZ-1a; Thu, 08 Apr 2021 05:26:03 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUQvJ-00052u-0d; Thu, 08 Apr 2021 05:26:02 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id c195so1893364ybf.9;
 Thu, 08 Apr 2021 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kL6259XroHkSoz6VrN39UuA3jRA5YPBCapzPEg3T+S8=;
 b=XGualytqsS+b3MYchlnhLKAJYXe7ohRqRd4qmDriHWrMW8/dyHdUsSGmQu0q6DCIAa
 AbBaBwWsxKNnJpokn74E158eGa1lh7eGP+oIA2EeIn5HiBg/vfqqroSaCeLOVfWG8+vD
 y4Gs35AkcoGTT9dPuqWggKmYZlg692JsPtcpd+DntD9NDXKVQubnCD2uICutBjYTUwhE
 O7V9kB0hO15Dbi+N5WIvMqmXcIFWOl6+ei05LSTI+gKl+eaAk48zML3FyVtf82bgR2aA
 4S9ErM3qNR1rbuhf+axnj2uBt245W4Ts/+b5F5D0Q3W/wF5viLZgaPdktuAGvv6ypFEZ
 o8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kL6259XroHkSoz6VrN39UuA3jRA5YPBCapzPEg3T+S8=;
 b=GEcBoSbamCcbXzOxZwMF3eo8GYpJ8Iewn42KCZVT5f+B3UtuMMa+qR4/W8K4cxtZ1Z
 v9C/hX4KOR8qoVLBw41sWMBWie38K+hJN807UPfrxzevtY1EpMVHBQo0EefD1SjJ2qJ/
 qD+gcuM7tHBK03tBtUU4Ygaq5rFwjpphAzSGpbnz7E0/dyXg1S8rcIGJ6X8eX6MSVg9L
 GjIMJtRfgUUa6E0b8/n/sTmRKcf0Rt2COf6rYbogx4pjMf1lddtqpbkZUZbDigbNR4TE
 tW74qcWJCRbE41np0Fc5RkJQGRpChH+lw4Nu7QvziZc4O2Jp4WDJPblSbZu6I/rvfYBC
 0dRQ==
X-Gm-Message-State: AOAM533kOCiUN4+4StezvAtYqrLXEERnQyUJ9dgZ6htT5UNcE6ieOYFt
 sUateA8ut5l+IPcFzvk4goNCEoZRJOKzAmfZrnA=
X-Google-Smtp-Source: ABdhPJwMj4K+udphQ7AMac+XM7ikvqgjyi4hVrIZCAqi/hxyAsxO1d4aIHWRHc/ophLwSuueYl9g/VEr79pPHH9Mxsk=
X-Received: by 2002:a25:3f07:: with SMTP id m7mr8397585yba.314.1617873959251; 
 Thu, 08 Apr 2021 02:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <4123032daa32329ded1b4c7690dd0886d5ffe135.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <4123032daa32329ded1b4c7690dd0886d5ffe135.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Apr 2021 17:25:47 +0800
Message-ID: <CAEUhbmXgCrW72JbnUK+OWOCEFbfoMC_9burnoZNnBjGcicUu9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] target/riscv: Fix the PMP is locked check when
 using TOR
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 08 Apr 2021 09:26:03 -0000

On Fri, Apr 2, 2021 at 8:49 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The RISC-V spec says:
>     if PMP entry i is locked and pmpicfg.A is set to TOR, writes to
>     pmpaddri-1 are ignored.
>
> The current QEMU code ignores accesses to pmpaddri-1 and pmpcfgi-1 which
> is incorrect.
>
> Update the pmp_is_locked() function to not check the suppording fields

typo: supported?

> and instaed enforce the lock functionality in the pmpaddr write operation.

typo: instead

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index cff020122a..6141d0f8f9 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -59,16 +59,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>          return 0;
>      }
>
> -    /* In TOR mode, need to check the lock bit of the next pmp
> -     * (if there is a next)
> -     */
> -    const uint8_t a_field =
> -        pmp_get_a_field(env->pmp_state.pmp[pmp_index + 1].cfg_reg);
> -    if ((env->pmp_state.pmp[pmp_index + 1u].cfg_reg & PMP_LOCK) &&
> -         (PMP_AMATCH_TOR == a_field)) {
> -        return 1;
> -    }
> -
>      return 0;
>  }
>
> @@ -380,7 +370,22 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val)
>  {
>      trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
> +
>      if (addr_index < MAX_RISCV_PMPS) {
> +        /* In TOR mode, need to check the lock bit of the next pmp

nits: should use correct multi-line comment block format

> +         * (if there is a next).
> +         */
> +        if (addr_index + 1 < MAX_RISCV_PMPS) {
> +            uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
> +
> +            if (pmp_cfg & PMP_LOCK &&
> +                PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "ignoring pmpaddr write - pmpcfg + 1 locked\n");
> +                return;
> +            }
> +        }
> +
>          if (!pmp_is_locked(env, addr_index)) {
>              env->pmp_state.pmp[addr_index].addr_reg = val;
>              pmp_update_rule(env, addr_index);
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

