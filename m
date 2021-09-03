Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLzwx-0007AU-13
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 23:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLzwv-0007AI-OI; Thu, 02 Sep 2021 23:33:05 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLzwu-00023T-8P; Thu, 02 Sep 2021 23:33:05 -0400
Received: by mail-io1-xd35.google.com with SMTP id y18so5223812ioc.1;
 Thu, 02 Sep 2021 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pf0Q68togFfaME1zOoQmIqokI9mZ61b85mqndOKje2k=;
 b=KyL6GnSXMG23cZCZE0s688oAm3nsdxez5r0ExuZGdqDG4/9PsmMpSb26z/azFk5Ir3
 HgsI357IPCAJ3FbOrkF8Tex+4DNzDaptZ7Xn7IWAg6A4Rd0aBDtHq+p3Fean5llmnUPb
 zp+JEnkPS/Yojo7VuVcVexPNwjfx6dMS+SOr0JVwAkqUfHa7se9Df4Poip+z3S/iFFqn
 BX9fDp5fMFBo/CRzH4spTFlOGUMD55X5ZsMF1k7EEFoFU/uMYFEa5/fK/3cjdS+UcGyw
 Zr6HkCXz+XBkupfN1TovyDfMljtSpIQTLgmVxZ5YSVANHA+4J6tXnXGBNrK1iqRj5vdc
 ZANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pf0Q68togFfaME1zOoQmIqokI9mZ61b85mqndOKje2k=;
 b=LLhndlfUeaFfhTHgOicsRZdn6kkF7Uqqf8cXNuRKpgNlSvnsqFIynSeSML8lKeu7Wq
 Y8qXuARUCnkcblC4weE4yVjyvmwYElR4Ar6lm/YUAroNdwN5pBgy+C3SBL5W90nX8uwc
 Tv7IaRq/ekCQCqCXcib2vz4EQTsPCJ8s4Mdmy9NbfOKCJBoqiH65r/LGtYr3dDw8noD8
 169MFO6is0FlhHEnWIwmPAVVplbpBR3oGclHjccXUrFh8K3pV53A5RrGYmzBUIbf7Lu6
 VW3LKMdps75kqHiuDrqLK8axVej4C2prab07h6AhKIkIuTy4/0I43BUTwbRyISAxHahE
 4tyA==
X-Gm-Message-State: AOAM53072ikZoEFyE/IouwZLoOWrdKjFyoMUMjh2O2OHmr1jf0o7YD3g
 qYEJoJ7IayCR3MgeGMZvCQw/6WlzxjxGPl/pO6g=
X-Google-Smtp-Source: ABdhPJy3DVxVN8If7pgwgLL9JbP5cI0rvm9DSwNyWpTL/mERZUtfPWlfpP2+Fe1Mh1H0fX2aRyJyemdBqg0KUslsEJE=
X-Received: by 2002:a05:6602:3c5:: with SMTP id
 g5mr1354682iov.42.1630639979163; 
 Thu, 02 Sep 2021 20:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-2-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-2-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Sep 2021 13:32:33 +1000
Message-ID: <CAKmqyKNNCj_Q_s2TAPbP-G+eXnGGzZbe=OwnjvZvWMFOHzDpCA@mail.gmail.com>
Subject: Re: [PATCH v2 01/22] target/riscv: Fix trap cause for RV32 HS-mode
 CSR access from RV64 HS-mode
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 03:33:06 -0000

On Thu, Sep 2, 2021 at 9:36 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should be returning illegal instruction trap when RV64 HS-mode tries
> to access RV32 HS-mode CSR.
>
> Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50a2c3a3b4..1f13d1042d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -181,7 +181,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
>  static RISCVException hmode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_cpu_is_32bit(env)) {
> -        if (riscv_cpu_virt_enabled(env)) {
> +        if (!riscv_cpu_virt_enabled(env)) {
>              return RISCV_EXCP_ILLEGAL_INST;
>          } else {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> --
> 2.25.1
>
>

