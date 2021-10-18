Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLX9-0003Qh-St
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLX4-0003PP-BI; Mon, 18 Oct 2021 01:49:59 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:34660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLX2-0002Xj-9K; Mon, 18 Oct 2021 01:49:58 -0400
Received: by mail-il1-x12f.google.com with SMTP id g2so13701185ild.1;
 Sun, 17 Oct 2021 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rL0n/DJubepnTlku2Sad2UZHnkizjwKyDWv6jXgjtjw=;
 b=ZV2ZOORU4b4WhjxMktbmSHK3ExsDqlqCW1vxRxDBSYsEjJ05bDfdYRLVgWbUe+Y5J5
 7TuGR9PK4wjFJ/ie7HemzHGzYSprKg5OxhJpPnCyH7nkvbHtBABC/VAt0dHBiZGbxLfx
 5qaiZropP4/Ivl/03a3w2utaDUbl8YHh2KPdacdm/Ca8lc02KLUp4gF+SrAXZF+sXDiS
 e+O7c7ux2+6WJYpGlUKn21K3oZ/OAvpno+DsOq6nzTWfPHK0NN+D1RL+d0lGCdo8Su5O
 s6zQaXz4pKGHTMUEHHsOLlj/1kBu1MfzyHhutnA5DDIaRH2bbC9LYf20nCYLMRfTfQhY
 TaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rL0n/DJubepnTlku2Sad2UZHnkizjwKyDWv6jXgjtjw=;
 b=zUIcoJ+iCzTWKJ69VgRTHdIDX60a5w/y8XhSTmlr1zGzrEndSWyDlGfvfsj4Sir/Jc
 cMJvLcJtjuhFxxqbhGDp39KcqqhCTOQE4kKsum0h2DFrvcMo/5jzIfsazzekQ0OqXnub
 OkgXAZXJfAOOulLaxryBz9ilHmGGgLa+j3R8KR1JNPAbWTe6+gHIZPWYsf+N3vWVkoQ3
 uCIWu9+4FwN9EU9pAm2H4aBsIbT6rUgXSIf56O/iNBR3dCRXuX2EKLKEbzOXcKoecRED
 +rv43VUNbzyTBlbD4aJMC3oXSEBMVfVFuA7+QqPEDqRqQK6ER+qgQ9kftrk9JHZcB3bd
 FBKA==
X-Gm-Message-State: AOAM533lyCpMIlQ4nLHaTuIQvbNoZSyrmXg0WhzSnK+353n+fABVsgvr
 N3sJgZhbghD+bHMtmGoLqBp1SPsZ/2CsPzWUBLU=
X-Google-Smtp-Source: ABdhPJzHWRFlz6jxLIBAQ16uwkkebQS2ygma5aquHhifVs6riQMIv68hiEzhQVUL21meq6WAayCgVxTCGZUGPXiIdQo=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr13110034ilo.208.1634536194893; 
 Sun, 17 Oct 2021 22:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-40-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-40-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:49:28 +1000
Message-ID: <CAKmqyKM4LPqToVgdwz95OX0z4WZj63A0nLjg2yqpLNFGzZgZ1Q@mail.gmail.com>
Subject: Re: [PATCH v8 32/78] target/riscv: rvv-1.0: iota instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:50:02 -0000

On Fri, Oct 15, 2021 at 6:25 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d139c0aade7..3ac5162aeb7 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
>  vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
>  vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
>  vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
> -viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
> +viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
>  vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
>  vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 538a32a605a..3751496676f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2756,12 +2756,18 @@ GEN_M_TRANS(vmsbf_m)
>  GEN_M_TRANS(vmsif_m)
>  GEN_M_TRANS(vmsof_m)
>
> -/* Vector Iota Instruction */
> +/*
> + * Vector Iota Instruction
> + *
> + * 1. The destination register cannot overlap the source register.
> + * 2. If masked, cannot overlap the mask register ('v0').
> + * 3. An illegal instruction exception is raised if vstart is non-zero.
> + */
>  static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>  {
>      if (require_rvv(s) &&
>          vext_check_isa_ill(s) &&
> -        require_noover(a->rd, s->lmul, a->rs2, 0) &&
> +        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
>          require_vm(a->vm, a->rd) &&
>          require_align(a->rd, s->lmul)) {
>          uint32_t data = 0;
> --
> 2.25.1
>
>

