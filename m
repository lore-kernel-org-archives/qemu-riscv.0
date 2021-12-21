Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzYwb-0000eq-17
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 01:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYwO-0000dV-Tc; Tue, 21 Dec 2021 01:48:05 -0500
Received: from [2607:f8b0:4864:20::d36] (port=44887
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYwL-0000UG-7r; Tue, 21 Dec 2021 01:48:03 -0500
Received: by mail-io1-xd36.google.com with SMTP id b187so16402758iof.11;
 Mon, 20 Dec 2021 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MADL4sSEbcrpEAi+a08np2U8YSsjLj7T/O8v4ettDYI=;
 b=od/+SUFZPC7C3JHR5DewjVL6gkZJ//5otfNjUJVuOKzRTmrKivzOmiZotOc0P5akyX
 +SX2Zcq29qeDuDo3CNcMAKP9og4WhTBgQNwrvcNpovm6KyHYrZvnJ1MaQvWYZ4FyWR/D
 kOT4VPl8lGWG/9Nx56Ue9IcZwB1GIxyYEdK7im3eu8OKzWsDhe06F0o7EcUJNB+wqbyB
 2rjCXPEEM1lnbjTGF/nc7OX/z962kEvAaq0/cJqfR6N09FRHq4vjpm3NmKAQx5j9Z1+X
 4BxthGQCsaRvkXnRr961hBZg7lbNAaipa68Jbf6G33kZQ4Etvp/H79gTpZNKNJ88/4wv
 zkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MADL4sSEbcrpEAi+a08np2U8YSsjLj7T/O8v4ettDYI=;
 b=ZPfFbKXD6/wI2OFqAOWJqxGDtdZCRgXV1BVvWdlSDvwmLdCsE8xWmou8OBLa5UrpAO
 4puKIvNMB54+hE0TebLCnKVr9lTXvsevNRNOWxFxpyoeG9YrAq0WK1EBhlF9ojaJGFH9
 b+nUPNWVTAgs9xj3AoTH+YS44RvI1fKtw6W52WTA61MGdO3Kn1naG7YLmnp9qmqMojlt
 4B1CsuVPAD4RClsmaNgcYUAASw86hyJWryf9vNKHmxZcGnTnjTMkmo2xii9nIf3utkFe
 +tJNHYXyLcM61uIX9+aPXnkfFwdF/FLibMbVKPmjmftGypbtmzkgynFREGFFrVa8XAhI
 +WpA==
X-Gm-Message-State: AOAM533N89VeR/8I2oSyfa4mHOj2n5UYADHAd5t7Ug+EvoV8NWfYcxCy
 fMyuOsQJITK7+APp2sDkjXwkHj4iM1pKYZIKPAI=
X-Google-Smtp-Source: ABdhPJw6vyzBNDrRU+5o35OK2IfJBCweVXJn1TJjU4M4urYKUBAXE+RGkRjO8lYzTK/I8qpCBo2wc7jFrhf3gt5uaFM=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr916292ioc.91.1640069279861;
 Mon, 20 Dec 2021 22:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-14-anup.patel@wdc.com>
In-Reply-To: <20211211041917.135345-14-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Dec 2021 16:47:34 +1000
Message-ID: <CAKmqyKNTF7mQP-oxeWL94XgywQGehSL6y6U_JJws9wOkT8dUPg@mail.gmail.com>
Subject: Re: [PATCH v5 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 21 Dec 2021 06:48:05 -0000

On Sat, Dec 11, 2021 at 2:34 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA specification introduces new [m|s|vs]topi CSRs for
> reporting pending local IRQ number and associated IRQ priority.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/csr.c | 155 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 155 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4b3edc1043..6f613d182d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -189,6 +189,15 @@ static int smode32(CPURISCVState *env, int csrno)
>      return smode(env, csrno);
>  }
>
> +static int aia_smode(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
>  static int aia_smode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -833,6 +842,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
>      return ret;
>  }
>
> +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq;
> +    uint8_t iprio;
> +
> +    irq = riscv_cpu_mirq_pending(env);
> +    if (irq <= 0 || irq > 63) {
> +       *val = 0;
> +    } else {
> +       iprio = env->miprio[irq];
> +       if (!iprio) {
> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
> +               iprio = IPRIO_MMAXIPRIO;
> +           }
> +       }
> +       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +       *val |= iprio;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -1362,6 +1393,121 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq, ret;
> +    target_ulong topei;
> +    uint64_t vseip, vsgein;
> +    uint32_t iid, iprio, hviid, hviprio, gein;
> +#define VSTOPI_NUM_SRCS 5

This should be defined at the top of the file.

Alistair

