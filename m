Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwFcK-0001K2-P7
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 00:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwFcI-0001Jk-UG; Wed, 01 Jun 2022 00:05:54 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwFcH-0002Jv-05; Wed, 01 Jun 2022 00:05:54 -0400
Received: by mail-oi1-x232.google.com with SMTP id s188so1125053oie.4;
 Tue, 31 May 2022 21:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtv9VyKyMp/s5zyzM+YG7hW0IBsnu+5ga3Lr0f14M/8=;
 b=QgoEjNUk+tZYKdfdrjjqtRt20NR7e0+jSGoRaRovu5rmXmC50i/HSOJlxFvZJJeQJ4
 3njC/93zEuXjooc+yFHxOId+F6rxlNBrxAUhulb1WGeiY4hN+FFUdAMzNjN9mcpeMama
 mm4l2KGozvwGYpHicQLEsGiNKpEaWBB40prBO2TPxETFsD1uU6K0BhMVFZEOhNdk6GG7
 VBFVtqKvpI0UTWdU5VRu0KZ0GXooGldJ+OASAyhOFXD0HVBwX5uIbjdMzYVR6qcUBz52
 p/vjLRsHLq2NHOkwm6jBFX/fyqlhGjQnctg9F0MPis1zlwSHR3lnxqWDguxYLpjWF0Ct
 t8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtv9VyKyMp/s5zyzM+YG7hW0IBsnu+5ga3Lr0f14M/8=;
 b=xGl5RZPEDzBrpApbZhtZjnjlsSZmqMBpFIC538JkWlamNjeTMEFPls4dz5o0swAjHu
 YQTj93Hkqm+ybIPl91nfs0rSTSY7uqP1vkhyLnXQ9p6y9Ie0a3OXlq0jVev/ORrUg6np
 I6KL0YPlPTTxDsf1/iDPdWigCoH2ARiyA5qoBNtsXtKbrv+whDASJOv8oBikas2r/Y59
 fx6Qc2HipV6GGVA49AWGknSRXcfrrvAnhY74Ak8Gybb5yDkUG5bnVUomfhW4qNBviMhl
 aRbwRfnGo+Y1zh3d0JWC4yMEhjqpK3BpHYRwkZBrypq2o/7uNmPfuBicLJMjj9uFdBge
 QCrQ==
X-Gm-Message-State: AOAM531xfvmyEHlDJDhpcsqKYDn4eOPLRL6F9YHInHbKM7Y4piY/TBxp
 wGmeNZkW57TfDQkjq/qqYvRTNr/srM9LUSRvvGvtBRv7UzDHVA==
X-Google-Smtp-Source: ABdhPJyH0iw/5W8aYsstx7C5MbKsQkXMBbUa+ij5Z/LYv+8YjFz+iklAMEQWzL07cksXnkOD3nNsXAtOLEXCek6Lhvw=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr14298268oib.64.1654056351109; Tue, 31
 May 2022 21:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <3cc626d3c36935d7ad5b4573c6779f6ec88957ea.1653472385.git.research_trasio@irq.a4lg.com>
In-Reply-To: <3cc626d3c36935d7ad5b4573c6779f6ec88957ea.1653472385.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 14:05:24 +1000
Message-ID: <CAKmqyKP+ykfsCpNxJ9bAYryZmvgk-8MPsEFbNpK7n4cYON0BFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Reorganize riscv_cpu_properties
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jun 2022 04:05:55 -0000

On Wed, May 25, 2022 at 7:54 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> This commit reorganizes riscv_cpu_properties for clarity.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 64 +++++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..3f21563f2d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -840,7 +840,7 @@ static void riscv_cpu_init(Object *obj)
>  }
>
>  static Property riscv_cpu_properties[] = {
> -    /* Defaults for standard extensions */
> +    /* Base ISA and single-letter standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
> @@ -853,29 +853,17 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +
> +    /* Standard unprivileged extensions */
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> -    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> -    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> -
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> -
> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> -    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> -    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> -
> -    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> -    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> -    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> +    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
> +    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
> +    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> +    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> @@ -884,6 +872,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
>      DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +
>      DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
>      DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
>      DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
> @@ -895,10 +884,31 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
>      DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
>
> -    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
> -    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
> -    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> -    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
> +    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> +    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> +
> +    /* Standard supervisor-level extensions */
> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> +
> +    /* Base features */
> +    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> +    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> +
> +    /* ISA specification / extension versions */
> +    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +
> +    /* CPU parameters */
> +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> +    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> +    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
> @@ -909,9 +919,9 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
> -    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> -
> +    /* Other options */
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.34.1
>

