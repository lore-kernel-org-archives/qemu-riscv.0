Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5EpM-0001NH-0b
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jan 2021 16:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5EpK-0001M2-Gc; Thu, 28 Jan 2021 16:27:42 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5EpI-0001P1-Mv; Thu, 28 Jan 2021 16:27:42 -0500
Received: by mail-io1-xd2d.google.com with SMTP id u7so7124104iol.8;
 Thu, 28 Jan 2021 13:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMU76YP2IqE83zZ7S1884zxsM/lfWjzticjIwLeVpEQ=;
 b=AVbVQpAJP0w6etptFv+7D7uUTs1vvZtEMevnXO8a6afb0N/M0qnQURT6NWty53r7oo
 pKd8z9elJmcffxwliFs9RzLanjNn9YGwWZsVnTFBRmyAEXVQ57emWzogLuhjpcaQ6akW
 xO//3Cnq6Fq3JhkhSQHSp5gYek6xslmKIPyCMgziaysLHACXSwh2V7wWcOpiESQDnbW7
 7bRf/hACAIRiXBtGuq8+qd5+1DXM8bte1MrMgEMp8FiOuKVaArB/UbihaIokVeqvdcu4
 UXujdkUaHyI616H74KB6sgOnOOo8oASMuzdHCWSb/uHj/orRPwyl9lB24ggBBbE5xvIQ
 AqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMU76YP2IqE83zZ7S1884zxsM/lfWjzticjIwLeVpEQ=;
 b=dCTEUGcaPXBKYcjoeouxWe4ZRchq9YZUSCs55y0Z7SJNS9O3TmWx0N/2Xm48SFBGBC
 2BUAgmvJKJfG4U7/PT9qv43n34DSCZtLhKEMDWScMUBQ0qzKjM8UIgNzrGNbwEUSD43X
 DEPfNjDhLR/8MnaciKVt3SQacVl9EGgwALMeFfX7Gn3D4PJ8tzxIMNNQ/b5SDwaUvKBi
 JphJ26gKRa27ycV6GZL58wyQzuibzlTbht64lZO/ASMnIGWy8CWYXc1lkm5Y2Q8ZHLR5
 nMy+vDHRqfBsv0HWJENRq3bN9DUm+GNDkbn1j4yCTwNIxQS/hEfpYC9XucuRw3mEflwA
 sBFg==
X-Gm-Message-State: AOAM532EbuSwP9GXdXzZbB7OgUoT4IeFEU6O7nA1ZWwRlGIh2Y/MsssQ
 aqJTDHQKIONudIt00JOuxpKjdUdpqt3YqHuM678=
X-Google-Smtp-Source: ABdhPJxyum4oaFO0FVDUlyFhfGISPtl/xN0yfGvjwffJe6pHeW0PeNKzNbK0YkpSK2h5vlM2n9vrSg1HjqXvSZY2cXk=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr1600451ioq.176.1611869259083; 
 Thu, 28 Jan 2021 13:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-68-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-68-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Jan 2021 13:27:12 -0800
Message-ID: <CAKmqyKNy16AhV_u-jzzvWt9uYh7PMDbxoiN0qX-mBpFQQpP_4A@mail.gmail.com>
Subject: Re: [PATCH v6 67/72] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Thu, 28 Jan 2021 21:27:42 -0000

On Tue, Jan 12, 2021 at 2:30 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 28c1ce7928a..176010674e8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -301,7 +301,7 @@ static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
>      if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>          return -1;
>      }
> -    env->mstatus |= MSTATUS_VS;
> +    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
>  #endif
>
>      env->vxrm = val;
> @@ -320,7 +320,7 @@ static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
>      if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>          return -1;
>      }
> -    env->mstatus |= MSTATUS_VS;
> +    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
>  #endif
>
>      env->vxsat = val;
> @@ -339,7 +339,7 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
>      if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>          return -1;
>      }
> -    env->mstatus |= MSTATUS_VS;
> +    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
>  #endif
>
>      /*
> @@ -362,7 +362,7 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
>      if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>          return -1;
>      }
> -    env->mstatus |= MSTATUS_VS;
> +    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
>  #endif
>
>      env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
> --
> 2.17.1
>
>

