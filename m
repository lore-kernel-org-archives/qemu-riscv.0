Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uBC-0002PN-CI
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uB7-0002Lo-09; Tue, 19 Jan 2021 11:48:26 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uB2-0001Yu-NU; Tue, 19 Jan 2021 11:48:24 -0500
Received: by mail-io1-xd30.google.com with SMTP id q1so40861815ion.8;
 Tue, 19 Jan 2021 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fm3OfEGwwxiE3Qf6wYnVyiu/kbBV73OWraagFPT+4NU=;
 b=uIfWHICN0E2sZaL1pUkaoACYF21Vt/SaAA9pwkuZuadooaJlQFehrq5GLG+FjkFv94
 hWPQKSIJUQxl/GOwARq0yBtZ8n5fodSBAdsyp8cez95QyW1OYZz551rn/az2V1ibAG0N
 1zDheeuZEAf/nvsMVohI+999wGvubX609IJna3UpvBvMvrswu+r/rKuxZfB4EEHAFnRE
 3wKNgpLQg8JcLzJ+/tFvedio0WxCayPXWqWwiTOIm48ulMIR7xfHOQeHtOQ8kZhU4or5
 ERviZCz3D6dR9CTvcTikJIKaG90NIoC3Q4vJs+WN24MSZhk9l/xI2cZPTgfOuQCBzr56
 XVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fm3OfEGwwxiE3Qf6wYnVyiu/kbBV73OWraagFPT+4NU=;
 b=bjLxSi3LG5FRj5wr1sDz7n4h07yNNhh3YhydUEhGtoQeVj7yA0qBdIO6PKyINGD71/
 CKJC0s4IheU40c0v0v3fcLt1yYWzoKYT3L0pvShqe5XxWUXMTXg42PYm4z1cUdUPe6HM
 yBs1iECfNDaul0FQJdIm0Mri72vxjSXaLM+tYVjbZ3fj05AvEXiqietyl8OKw/bARkMD
 jokhHzP8QcIqB6LDPPgKb6zXXhhi5gJdi3bSMT5Q1bFnLxH1HjOLC0+8GQOO/yOc9ogr
 eK8MPdg37VW+3wJq8+JhxlP9w/iW8zES4n9Dh5Srmya7nRiVnu9DUF1RCdOZDPiuiYkk
 kdkQ==
X-Gm-Message-State: AOAM532ZbP8p3jqNES0q6dZxlk5PlNVnJ03w9zx4oZtbZ/katpslKbS5
 /eXKUzfcaU7FelecsxlYGNyygNYbCKLpXwIWCik=
X-Google-Smtp-Source: ABdhPJziVoKM7bvBcq/vSj9l+4S6l2T4tZZV3IcglvDzLUHRE10YSBSV1vfNto8zOPCHPNdWaiIDBdhjh1yZaIFooOE=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4159870ild.267.1611074896043; 
 Tue, 19 Jan 2021 08:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-8-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-8-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:47:49 -0800
Message-ID: <CAKmqyKMNiqY_NxtiTsa2ai1axb67JNY=_Rh5evHXh+Oy-nmbqw@mail.gmail.com>
Subject: Re: [PATCH v6 07/72] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 16:48:27 -0000

On Tue, Jan 12, 2021 at 1:50 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Remove VXRM and VXSAT fields from FCSR register as they are only
>   presented in VCSR register.
> * Remove RVV loose check in fs() predicate function.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c8b1e4954ec..6eda5bacb7c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,10 +46,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>  static int fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    /* loose check condition for fcsr in vector extension */
> -    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
> -        return 0;
> -    }
>      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
> @@ -254,10 +250,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  #endif
>      *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
>          | (env->frm << FSR_RD_SHIFT);
> -    if (vs(env, csrno) >= 0) {
> -        *val |= (env->vxrm << FSR_VXRM_SHIFT)
> -                | (env->vxsat << FSR_VXSAT_SHIFT);
> -    }
>      return 0;
>  }
>
> @@ -268,13 +260,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>      env->mstatus |= MSTATUS_FS;
> -    env->mstatus |= MSTATUS_VS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> -    if (vs(env, csrno) >= 0) {
> -        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
> -        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
> -    }
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
>      return 0;
>  }
> --
> 2.17.1
>
>

