Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD2gi-0007Gq-KW
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 06:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD2gd-0007GH-Oe; Mon, 09 Aug 2021 06:39:15 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD2gc-0004WE-4t; Mon, 09 Aug 2021 06:39:15 -0400
Received: by mail-yb1-xb31.google.com with SMTP id c137so28188706ybf.5;
 Mon, 09 Aug 2021 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dqAlm6szh22vXsbovZP/lAtHWdsPlQqSNM71+utZXg=;
 b=C1z9B97AhUE+qLut/MOnWW7j2TdCFXkZ/3GLL0jBX5g777lguOIveK3sMfCquTfZ2W
 kuy9pqHJ8Ff9c9hT6nAJSgS/XdAV+28q71a9tbofJx/rVR2WgNNoZNfB970WcW75j3CC
 HHFrlTDN2Y1k3hS6zNITfkkhDDFfodBOk6NTKbb4efm41TAwqJPxxgWGCzv7Vc2LH5rr
 7vHMhlZ6BJxV0bNTPuzlo5KbRSPZXIVrlejNxfa0eNChhSKR6d3HoBT9rGuBC3RyZl4T
 UrWpoffk/eUZ2eDyuqV9FOIT9TsCs3ISDMfoBnrm4xsOA34a1Z2/FA8E1VSCaqO6JzfH
 Tx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dqAlm6szh22vXsbovZP/lAtHWdsPlQqSNM71+utZXg=;
 b=Y09MHN3mNB3dwmyfOMlEpc5FhPNH9aPuuOL5iNZN8VhSy9nGedBJySdikgzGmTa50s
 XZg52BgeeVYLV3qGqF0TRzzTgW4S9MZlDE+qeEMQiuuY6QwPre2x0m/p1Nv03QZ8PC6J
 i1GM+F4BeAGyhMdXbApiGJdc7Ta8ef7YOrBpwe2h0ZC0jM385XeV+WbytFt6VV9Wc10n
 OV2MPJsjinGVw4k3TFqU/uqlOxy9jTSjKAbGxu9kL4GwwWjMBJ/yxQDd+da+MeDF3FDw
 9iAHK+vO8XnimAMkS7Q0PlPVOGQ6XPR3lWmFOfhtcWpa8uY2zIAhHoaiQxaqX8sQ5Ve6
 codg==
X-Gm-Message-State: AOAM532+x3FH7BBacikt1BKt9URXywLhdbGRv8FgIsTQ/u31fVzEk1Yq
 9S0qrToNa6epMQiPSns38jSG3tYoikTKKj/koAU=
X-Google-Smtp-Source: ABdhPJw4hM6nbJhhrPYcIpCZJUMXPKUoOQhMagsTCUK0qZKak/BIlkfuX0eMcfM+64e2PZMlZpgqmZHIf41EltCLCZk=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr32122303ybg.306.1628505552652; 
 Mon, 09 Aug 2021 03:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210809103233.405-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210809103233.405-1-zhiwei_liu@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Aug 2021 18:39:01 +0800
Message-ID: <CAEUhbmWc3GVRayARngeopoyyrruAs4_=dApwr2iZpLsav2yZEA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add User CSRs read-only check
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Mon, 09 Aug 2021 10:39:16 -0000

On Mon, Aug 9, 2021 at 6:37 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For U-mode CSRs, read-only check is also needed.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..360e4bfa33 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      RISCVException ret;
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
> +    int read_only = get_field(csrno, 0xC00) == 3;
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
> -    int read_only = get_field(csrno, 0xC00) == 3;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -1439,11 +1439,13 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>          effective_priv++;
>      }
>
> -    if ((write_mask && read_only) ||
> -        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
> +    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> +    if (write_mask && read_only) {
> +        return -RISCV_EXCP_ILLEGAL_INST;

This should be RISCV_EXCP_ILLEGAL_INST

> +    }
>
>      /* ensure the CSR extension is enabled. */
>      if (!cpu->cfg.ext_icsr) {

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

