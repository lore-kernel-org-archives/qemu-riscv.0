Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEMED-00065b-RA
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 21:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEMEB-00062h-7V; Thu, 12 Aug 2021 21:43:19 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEME9-0005pk-Uj; Thu, 12 Aug 2021 21:43:19 -0400
Received: by mail-io1-xd29.google.com with SMTP id y1so11140012iod.10;
 Thu, 12 Aug 2021 18:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIiPSBRhrt7l92WVusC88oVA7+90joh5Nzx/VnLiPUg=;
 b=rbhO6QZGqa01Bt31zUF6h2IgqFW9hkCEc3e6wyZ5w19pu/hO0vdfnqQS+vqSpLdPgC
 Xf3zTxjl2IJVwmUc1UCDi2nfuF2/GAkI+1G5avsFDLh1sZ0uqPKmcWNb7MI/BY4C67Dh
 MhvHEnPl9doymvEzbuMyKhwda1hK2BdwxmUqyUZJT1gcWvRsB8frWsPbphEzV6eIPDCJ
 zlS1+n23NmPP2hF305dcYvCNOS7ZhPws/G3trx76or3ldeLlpanrzFFjJj5sE0p2XZGS
 f1OyZyM2TewyMlEHgBvZfR7X49e+SJFjHm6NmPzRUNkZI5Ih7dNeTPlGG5kxBao8uOxW
 sRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIiPSBRhrt7l92WVusC88oVA7+90joh5Nzx/VnLiPUg=;
 b=gq2B6xvAs2f/Grk5uDgE+7S+zV4bXW9gXAME6nkL7ymkZat4AUcQZZamZq6qDn38JB
 cZHmsaYMAiRfKbrUBbsJNafhhr5DN3kB7xR8TCk7KN8HdPEvK7Bn575RyKxpXlLwXREj
 rb//XenFi96EhrNjyHzsc3owPEiqq0naTHYU3fCmg43Inkoki2Gxb2Lnb+pvzZCx1yIK
 X9qSDn6Iq/qTNL2jZqbUH6xL0y0jxnheSH/xmoNhX8uLo7M060p7GRpd6j97Da46uYMJ
 8SQ0B/TJWr/0o3BPpykdwuORPTtFTPfROMvHUIfdXfdHBUZI8/y3eVk6h84o78MjzqYp
 Sbiw==
X-Gm-Message-State: AOAM533WI9V+LJvY/3GxVjqm1iSMzxzRAbn6rQUV+blJNm3vQ1cVVKN3
 vY3yrQ65PZnxE/RfFDNweg9UM0xW3DmmB/pZdEM=
X-Google-Smtp-Source: ABdhPJwNuNoQTVLa9fRorMQI+/5jAOL5MeGQz8dWmKUII4szGAc879GLRavywaAHkJVADv8awL6Amac1slyYmYXQKLI=
X-Received: by 2002:a6b:e702:: with SMTP id b2mr50893ioh.118.1628818996550;
 Thu, 12 Aug 2021 18:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210810014552.4884-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210810014552.4884-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:42:50 +1000
Message-ID: <CAKmqyKNGqYyBHEnVQucao1e9f_CLyokFd9F-KA8Ck64BrQrGcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: Add User CSRs read-only check
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 13 Aug 2021 01:43:20 -0000

On Tue, Aug 10, 2021 at 11:48 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For U-mode CSRs, read-only check is also needed.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..5499cae94a 100644
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
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
>
>      /* ensure the CSR extension is enabled. */
>      if (!cpu->cfg.ext_icsr) {
> --
> 2.17.1
>
>

