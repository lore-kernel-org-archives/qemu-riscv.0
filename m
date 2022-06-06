Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny5pW-0001ds-IL
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5pF-0001b8-8Z; Mon, 06 Jun 2022 02:03:01 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5pD-000766-Dw; Mon, 06 Jun 2022 02:02:52 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-f33f0f5b1dso17996974fac.8; 
 Sun, 05 Jun 2022 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WWChuW0yfnNklxI5vucLi5Wwj5+tQF+x2PbV4wzi1H8=;
 b=F4nL6bqEboPWDJ5CogCmB9U+b1NASO9RVGlqx5bjYuqU1qEZa7SueR5qHICEr7u9Sn
 /+7cf7/+EJLG0+YCg2L7OWr/f8tINwtaDYMsInPs7N7op0u6aHcRbhFUBpAW+BPI1mu4
 mwXgUeIFOeAMRyMY/JFqOOShydPHFZDbov8AZh+Ho4sMPm5qj0kbeq3G5dc7UvLjHHTH
 rlayYs6plBVAqJ6rgwr+Ngh1Znp+XwtUZ5g/EZcxOYTCHWLv4nCLxvP1FKaNrVO3qm4g
 hKLBvAJlQgCiC+fHHAfmKaX8erFIesYqoF0uI7tEgb4NIVyZpocjL9AyoDZMy8xtb9Tj
 mp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWChuW0yfnNklxI5vucLi5Wwj5+tQF+x2PbV4wzi1H8=;
 b=JL3cqvOWFNuJ0mqg1fiFNB6pS0u9kXSY6C7dksOeYA0P1Y56OLMi2J5bx5/4UOIAbt
 DSlrY3rcnwAIKl5qu2ElW/V94gEsaxZ3YA2TBF33y4vI/CtCQbenCDnT6QY+R7ixhKgm
 ItFbbcGaPM7hI9tSsWfl8c8qyUA2qwLYeB2zZwz87DNeQoZKV/oOMqAU8UaL9+KGTRju
 vMynDE/eZ+F7EG7kdnl9H33HMaJkOnTTMsRN1wZeQUd4tQBuODgN2TO31ariYDI4CtGi
 KmzeTLdn0qGN4szkjsK24HvWnkb3UnbvsotYLSU2+IxZ/57xL1fPv0AEp7aYs0LHgf0a
 pWeQ==
X-Gm-Message-State: AOAM532DWDQpWrhJPUMgqj+9nzrAbz3by1MMGgl3CR3RZbdMbeOGTh6j
 UEVMkWlSWMDl3sftPiIIBiZBVSWTaj4IgA8sKGoWq+SurFrRog==
X-Google-Smtp-Source: ABdhPJwABu603ctr7gUwNFYiJnw0VjWkrqSFFsZCox9xWfBSlnX69Dxhv2zlxeuDx/GjwghjuoxurWozxsYknejltkY=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr12182614oae.278.1654495353377; Sun, 05
 Jun 2022 23:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <cover.1654256190.git.research_trasio@irq.a4lg.com>
 <942cea1d0a0ec0ba2ba54df4c04693dfac75c331.1654256190.git.research_trasio@irq.a4lg.com>
In-Reply-To: <942cea1d0a0ec0ba2ba54df4c04693dfac75c331.1654256190.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 16:02:07 +1000
Message-ID: <CAKmqyKNO+A3WWdr3s1QyOwXaeOywXk4Ggov1k-OOVfH_JULr-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: Reorganize riscv_cpu_properties
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 06:03:03 -0000

On Fri, Jun 3, 2022 at 9:36 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Because many developers introduced new properties in various ways, the
> entire riscv_cpu_properties block is getting too complex.
>
> This commit reorganizes riscv_cpu_properties for clarity on future.
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

