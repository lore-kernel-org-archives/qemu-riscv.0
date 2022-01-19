Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1kT-00083I-Ew
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1kP-0007vl-4F; Tue, 18 Jan 2022 22:34:57 -0500
Received: from [2607:f8b0:4864:20::12c] (port=33395
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1kN-0004kJ-FQ; Tue, 18 Jan 2022 22:34:56 -0500
Received: by mail-il1-x12c.google.com with SMTP id o10so1096152ilh.0;
 Tue, 18 Jan 2022 19:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aafrOq+OiW6EwexWrh58vkIroWS898mzCdP8oJzt4iQ=;
 b=K+mlOgREuqdNpI5QpveMdJuI4iiW8wd8QA6gZO74Z7Ulyiq5DO9jR38UbqONIOlnLw
 SBObJKOCMGnbgbWq4PSVclljiUBbqKQkCKur545r2y8QeCESrcTjsdqYe3aLKpSDxebv
 uO8InCpJ9/mzSHen1mkoLv4l96IE6HxVRjxguTkyy4xH6i2dXqZcipln5YZUJ2+0T1+3
 ntVVI2kOGQd0qNTAkvL6U4wQGn7auIkSQpkZZVmr2GkdcDwCOIFczryc4F1SMjoQtaJS
 Je99P95kj1y6AFiqUUfHTRlxMPuinreZ0Hj9uwV9DK1VKH5l0AoYeO+V0DGq2VO/dNYC
 wrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aafrOq+OiW6EwexWrh58vkIroWS898mzCdP8oJzt4iQ=;
 b=MWo5XRA8Hsvc9rN2VgeZmAudPKUcJAG4UKzwPWlKi5w/hJ+KjELjZO8nlSOTmLnfPh
 M7BNkYa/3JHRpSBsj9TlJ5hfD6nrhkudtvUOVPNhsG0RxU+zhilsuf4bjwgZafxLtGUG
 5nUaCDzevH+pTO1AxNPDpEWc/AZMP2QKUglasdyDbQug/+EDn6IplHm3jM+xhCv7Oj9f
 i1hjpMV1P4f7g45pN35EViBRvtkQISnHQAVO+QpIEJMLZw390wqRYCBGPkC20mGk2Vdu
 l53weUff/tfbpO45ELM+zF1K3OvxPd7FsszhszOvuoh1pdPANtcjCR3rZCcWz+t8210J
 YNMA==
X-Gm-Message-State: AOAM5312pLoSOwX/2oJ8sXYgFS4Sizdqbjl3Ge0QZGInZM03GglbLO00
 ofdTaxotU+Ks3da5ReSQqeAnPELUzCj5L/hruzI=
X-Google-Smtp-Source: ABdhPJz5skIhoV8JFWxsJmYWnLp660Zr/dGm50J4aZYe0z5fhYtj0NphJvigJHl2ac8aKNQKK7b+VnSaviKU+LfXfY8=
X-Received: by 2002:a05:6e02:b4c:: with SMTP id
 f12mr15702297ilu.208.1642563294071; 
 Tue, 18 Jan 2022 19:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-23-zhiwei_liu@c-sky.com>
In-Reply-To: <20220113114004.286796-23-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:34:28 +1000
Message-ID: <CAKmqyKPUgYmoXYNjMEMVPHWwQxQ71e=MpKF6wt7itNdX7ROLng@mail.gmail.com>
Subject: Re: [PATCH v6 22/22] target/riscv: Relax UXL field for debugging
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 03:34:59 -0000

On Thu, Jan 13, 2022 at 10:23 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d944ee9caf..1037c6b15d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -580,7 +580,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>          MSTATUS_TW | MSTATUS_VS;
>
> -    if (xl != MXL_RV32) {
> +    if (xl != MXL_RV32 || env->debugger) {
>          /*
>           * RV32: MPV and GVA are not in mstatus. The current plan is to
>           * add them to mstatush. For now, we just don't support it.
> @@ -905,7 +905,7 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
>      target_ulong mask = (sstatus_v1_10_mask);
> -    if (env->xl != MXL_RV32) {
> +    if (env->xl != MXL_RV32 || env->debugger) {
>          mask |= SSTATUS64_UXL;
>      }
>      /* TODO: Use SXL not MXL. */
> @@ -917,7 +917,8 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
>      target_ulong mask = (sstatus_v1_10_mask);
> -    if (env->xl != MXL_RV32) {
> +
> +    if (env->xl != MXL_RV32 || env->debugger) {
>          mask |= SSTATUS64_UXL;
>      }
>      target_ulong newval = (env->mstatus & ~mask) | (val & mask);
> --
> 2.25.1
>
>

