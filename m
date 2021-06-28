Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxf2S-0004Em-Hv
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 20:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lxf2Q-0004D4-MT; Sun, 27 Jun 2021 20:22:10 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lxf2N-00087K-8x; Sun, 27 Jun 2021 20:22:10 -0400
Received: by mail-il1-x12d.google.com with SMTP id s19so15833198ilj.1;
 Sun, 27 Jun 2021 17:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uAQR+s+FHYIqUWMOF/850d9Ijubm7S6IEp04i4syphw=;
 b=vIHyBRfcwrDKolNz1AFQiDTz14NsoqsqVN5xU+o7c0WMk4Cn34dC3A1yenLS/wxYXh
 FZY0DuGzwWMTnn4PkYgr9ficAEl+HjEa7mHRPLD53qyroSu36DacQQS7jvrGm0L2xTAz
 YqgrknZiSB2gTIzaYO4MsNYfAsr+bU321HEqYV41wAn22QWODQI1JXMhKY6OPb2Zu2JE
 NqS3XTkEdFXiwZeNoi8zc7HSARYEdyvdH8aKrRnRAE8MjLBndTlJ9e5vZOOVemMp2WuL
 N+uJGmlIpZe0ZPzBvUB84JpioMMAQlpx/Ct/Eq/oSTJWPSMliEGsM3L1ng0Xuj3yE1Vp
 p/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uAQR+s+FHYIqUWMOF/850d9Ijubm7S6IEp04i4syphw=;
 b=RwKJgaI5Cp32A4GDm9X0rhAIX8bI2h1OUEa/EHry6xs5b6AwJoGWVIOqDUzGX3Ppg4
 ZBiJXeTgAjBWhj70TfUFJfHA+sOrDCYhBQdQ4QycB0+3my5EPiftRIHrkANZothUcut6
 qEhp5CrQaGMsHoavzTtkSI4l9URgH1JOW/B7+Geb8A+N3t4JgeRFNTz/YQ0iuCzS/9q/
 1u9mDsJhUKtStS9y0YXy+xbyq8KI62hVwPeAKDLHjY8vRippMDwJ1q/4C9sUWMw/qdxO
 A/Wq+ByOciqZF60Fbg/M9gMVGmGf2vwI3Tn30pnYyxsy5yNDg6TuM4DfDXkUBbWR6Wwr
 nqOA==
X-Gm-Message-State: AOAM530vWK9izzFH8h7SW2dDM/JsFF8+n4RLdrxBXf21U/WLHWFEVxJ6
 VewzC/BAXDV34+iXqFxa6autk9GwaWII1bGGj+w=
X-Google-Smtp-Source: ABdhPJySEEzKFVVtkxaQSnUI/yDPXLeB/w2wSneYI1xtOTnHk20HiDGPHa9tybcsS7q7X2sDX7aGFOKvsVe/WjK6a/k=
X-Received: by 2002:a05:6e02:d48:: with SMTP id
 h8mr6583276ilj.267.1624839725656; 
 Sun, 27 Jun 2021 17:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210627115716.3552-1-bmeng.cn@gmail.com>
In-Reply-To: <20210627115716.3552-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Jun 2021 10:21:39 +1000
Message-ID: <CAKmqyKOJP2hhewQHO0_+eQFULt5fj0dEf45ySzAZ6R51E_p+sA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Fix some typos
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 28 Jun 2021 00:22:11 -0000

On Sun, Jun 27, 2021 at 9:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> %s/CSP/CSR
> %s/thie/the
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/pmp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 82ed020b10..54abf42583 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -456,7 +456,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>  }
>
>  /*
> - * Handle a write to a pmpcfg CSP
> + * Handle a write to a pmpcfg CSR
>   */
>  void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>      target_ulong val)
> @@ -483,7 +483,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>
>
>  /*
> - * Handle a read from a pmpcfg CSP
> + * Handle a read from a pmpcfg CSR
>   */
>  target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>  {
> @@ -502,7 +502,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>
>
>  /*
> - * Handle a write to a pmpaddr CSP
> + * Handle a write to a pmpaddr CSR
>   */
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val)
> @@ -540,7 +540,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>
>
>  /*
> - * Handle a read from a pmpaddr CSP
> + * Handle a read from a pmpaddr CSR
>   */
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>  {
> @@ -593,7 +593,7 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>
>  /*
>   * Calculate the TLB size if the start address or the end address of
> - * PMP entry is presented in thie TLB page.
> + * PMP entry is presented in the TLB page.
>   */
>  static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>                                       target_ulong tlb_sa, target_ulong tlb_ea)
> --
> 2.25.1
>
>

