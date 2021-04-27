Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGum-0007LF-6k
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGue-0007Ii-FZ; Tue, 27 Apr 2021 02:09:38 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGuY-0002qt-HS; Tue, 27 Apr 2021 02:09:33 -0400
Received: by mail-io1-xd2b.google.com with SMTP id p8so5819971iol.11;
 Mon, 26 Apr 2021 23:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajvijVnbKEqN/VqS92zVhYQJ3kKRjwmWQoCZWU2UhEc=;
 b=lz97tKCs8mBsjG27LA0ErRvKor0DY6uIdS9/wwiTSsVXKgLhlvHVDzij/ju0iADP5D
 iRmOjWEJNrOoUr1SRbQjkanyfLCibbseqjcPCkHR0CRri3mU/lvj7ThwKCxQF2zQ/6px
 kFQisqt/bzI1CfyaYPSMP91kQjWCYWaSWOpIjhZSvZje03P16Fdvwpbu5nrS8SVJ0Mu9
 UqjkeRNid10TEbeFDSQF8/XgCcLT/hsMPAYZ71SQEVZ1UujIBENJJ1SaPgft2DwwtBeN
 HzFb4eL/Ez36jHEXQdvI+y5N/s3TVFuuS1eaLazchVFLrmlzeMY8dpSRt1CV6MwL9TSC
 nwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajvijVnbKEqN/VqS92zVhYQJ3kKRjwmWQoCZWU2UhEc=;
 b=akCmwFnAuPW89IuiyBswGOoPCv4LzTn1GNSAR1BFVHGB8sFy5JVKqOJN0tvXivt/3j
 ssVBjanxzTHL3+Ox/kzsiX8XrUpSj72jAtY/Fsb1qtnOcBgyBPIT7EwTtr6YFRnNB8Th
 iJfAqzOc+aqWJ9zGAa5xnlx65FgPBuBKkR328Tbz0AimqeI8Sj/qp8D0RbS9TIyoNrbN
 b2dL5Wr80mhXAt9ZgLlsg9CWuMkAaYJmQ77s9qU+dpHYjWXytbBAbFbve8Fcrp7icJAI
 xTklODE2cgrGZM3NJ9mrnGmgzwt0yvysxEKxNpmaD5tT1aVdh6tnY2h8AwlJI4psIdiY
 bOuQ==
X-Gm-Message-State: AOAM532pHiNCUF+C6UDG/ioES0shTCPWx1uJWhFJORgwI3aJxvEEGQ4S
 jhbM6ejD8TFybApOqTMeZ0KCzKKLNjEt0H7ticM=
X-Google-Smtp-Source: ABdhPJyOWzoYiZxwD7CZrbp4obxaHwqAbaTruU+XUgfxog2p5C3JXsykEVAttpSOUOGxySOYEBLIlGtkPdFNPe0NxCI=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr19870542jak.91.1619503767609; 
 Mon, 26 Apr 2021 23:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213656.85148-1-josemartins90@gmail.com>
In-Reply-To: <20210420213656.85148-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:09:01 +1000
Message-ID: <CAKmqyKOr5bMi__F+C6PJ3CKRd_4v3LEROirEtV_rJyCwO5zncA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix wfi exception behavior
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 06:09:38 -0000

On Wed, Apr 21, 2021 at 7:37 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The wfi exception trigger behavior should take into account user mode,
> hstatus.vtw, and the fact the an wfi might raise different types of
> exceptions depending on various factors:
>
> If supervisor mode is not present:
>
> - an illegal instruction exception should be generated if user mode
> executes and wfi instruction and mstatus.tw = 1.
>
> If supervisor mode is present:
>
> - when a wfi instruction is executed, an illegal exception should be triggered
> if either the current mode is user or the mode is supervisor and mstatus.tw is
> set.
>
> Plus, if the hypervisor extensions are enabled:
>
> - a virtual instruction exception should be raised when a wfi is executed from
> virtual-user or virtual-supervisor and hstatus.vtw is set.
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Alistair, I hope you've agreed with my argumentis for the previous version
> of the patch. As promised, I submit this version which takes into account M/U
> only harts. It checks for the presence of the RVS extension. If it is
> not present mstatus.tw takes effect over the exection of wfi in user
> mode.
>
>  target/riscv/cpu_bits.h  |  1 +
>  target/riscv/op_helper.c | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..ed8b97c788 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -436,6 +436,7 @@
>  #define HSTATUS_HU           0x00000200
>  #define HSTATUS_VGEIN        0x0003F000
>  #define HSTATUS_VTVM         0x00100000
> +#define HSTATUS_VTW          0x00200000
>  #define HSTATUS_VTSR         0x00400000
>  #if defined(TARGET_RISCV64)
>  #define HSTATUS_VSXL        0x300000000
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d55def76cf..15982a7a33 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -173,10 +173,15 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>  void helper_wfi(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
> +    bool rvs = riscv_has_ext(env, RVS);
> +    bool prv_u = env->priv == PRV_U;
> +    bool prv_s = env->priv == PRV_S;
>
> -    if ((env->priv == PRV_S &&
> -        get_field(env->mstatus, MSTATUS_TW)) ||
> -        riscv_cpu_virt_enabled(env)) {
> +    if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
> +        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
> +        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>      } else {
>          cs->halted = 1;
> --
> 2.25.1
>
>

