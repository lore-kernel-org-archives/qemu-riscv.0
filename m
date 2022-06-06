Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny5qA-0002W5-3p
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5q3-0002RX-0y; Mon, 06 Jun 2022 02:03:44 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5q1-0007D9-EU; Mon, 06 Jun 2022 02:03:42 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 a21-20020a9d4715000000b0060bfaac6899so1305868otf.12; 
 Sun, 05 Jun 2022 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AgR3h019pUOoRboSvzSt+MYxJmAfH733xDP12woHTCA=;
 b=CELGmOVaek91/NjfQhbkYKh9pYhq3PRuEhWqvOGQc9+ZnxopY8EbxPQiK0JfCPhZhU
 Pr7Nk4jO3avpuj4j6ECyWqa986tDW403mp2QlIF4KVFLvJNq1CJiU+ZVv1mtXw5IdTnD
 r2nLQaGRN+U60QkntYSCgbddhHnwyLnEqTs46E06G36EESax7eXOC/vG4+uPqvrbKi9m
 t9djbdjV1JegEIkvWsYBTLatAaHDFETi9Lbx19Gy06PhQ52J4c8H/GqHOW+aqH+RyLJ9
 6Q2mdMpu3Gk+KXuntGEVaevOh78Wfx72JynUoge83JFRFBIbiDzy/pWbbzWehtneCSmr
 hV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgR3h019pUOoRboSvzSt+MYxJmAfH733xDP12woHTCA=;
 b=HGijqWfj1ZebGoJD9PIwifxlHK8grmPsuvq9RjoTOePPfYOb1dX2OVXX9T4N2jL1v4
 dtYSmLOrOB/A0rVNeixGOSbFaVc00p30l6AlROoQ1eXrISCdO3osvR77L/0fKonX6ZMo
 gTjBAVFgJC3WHHayMO3c4LoG5Ex1tOt0Zt0aoHg43lOuDgAEsFRM9RuL7bw1MpjcQlvy
 y/pE4gvkr6l4MgKYBk6kU0Ls+D7QpHNuxVOi1mA9jDwLjuaYC+nLpREkf2emjFzmfdVR
 8sGSLdvUCj/7WWy382qNfiMMku79TjEibJSjQ7iFOEwKPcQ0To2uOHIx0Lnrjv6ghfyc
 036Q==
X-Gm-Message-State: AOAM5321iJaGshsRoWthYBFdRxYsk5mzVIir/LVL6tJf7gQNWPMfhC+I
 pVPTFcc6ugpxFHzD5eLcKVHACoQgncbQbDGTdgNOUCCwXgKDVw==
X-Google-Smtp-Source: ABdhPJzjNfRU1K9fa2eqZZgKKknfyrmATNP8xzbMPzo91R3UuPVXWJIwznNCBeRQqxRMqS/3ysgQBX35GB1MpZ4DiWA=
X-Received: by 2002:a05:6830:448e:b0:60b:254e:7439 with SMTP id
 r14-20020a056830448e00b0060b254e7439mr9588571otv.338.1654495419326; Sun, 05
 Jun 2022 23:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <cover.1654256190.git.research_trasio@irq.a4lg.com>
 <9c2b3ae5456566a098907e1e33c39c98b523ecea.1654256190.git.research_trasio@irq.a4lg.com>
In-Reply-To: <9c2b3ae5456566a098907e1e33c39c98b523ecea.1654256190.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 16:03:13 +1000
Message-ID: <CAKmqyKPY=YWaHkTgzxXQPYnu5eBSwZxvFYijK43tvTKueMPtCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: Make CPU property names lowercase
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32e.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 06:03:45 -0000

On Fri, Jun 3, 2022 at 9:37 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Many CPU properties for RISC-V are in lowercase except those with
> "capitalized" (or CamelCase) names:
>
> -   Counters
> -   Zifencei
> -   Zicsr
> -   Zfh
> -   Zfhmin
> -   Zve32f
> -   Zve64f
>
> This commit makes lowercase names primary but keeps capitalized names
> as aliases (for backward compatibility, but with deprecated status).
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3f21563f2d..83262586e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -840,6 +840,10 @@ static void riscv_cpu_init(Object *obj)
>  }
>
>  static Property riscv_cpu_properties[] = {
> +    /*
> +     * Names for ISA extensions and features should be in lowercase.
> +     */
> +
>      /* Base ISA and single-letter standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> @@ -855,11 +859,11 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>
>      /* Standard unprivileged extensions */
> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +    DEFINE_PROP_BOOL("zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zifencei", RISCVCPU, cfg.ext_ifencei, true),
>
> -    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> -    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("zfh", RISCVCPU, cfg.ext_zfh, false),
> +    DEFINE_PROP_BOOL("zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
>      DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
>      DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> @@ -884,8 +888,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
>      DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
>
> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> +    DEFINE_PROP_BOOL("zve32f", RISCVCPU, cfg.ext_zve32f, false),
> +    DEFINE_PROP_BOOL("zve64f", RISCVCPU, cfg.ext_zve64f, false),
>
>      /* Standard supervisor-level extensions */
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> @@ -893,7 +897,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
>      /* Base features */
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> @@ -922,6 +926,15 @@ static Property riscv_cpu_properties[] = {
>      /* Other options */
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>
> +    /* Capitalized aliases (deprecated and will be removed) */
> +    DEFINE_PROP("Counters", RISCVCPU, cfg.ext_counters, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zifencei", RISCVCPU, cfg.ext_ifencei, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zicsr", RISCVCPU, cfg.ext_icsr, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfh", RISCVCPU, cfg.ext_zfh, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfhmin", RISCVCPU, cfg.ext_zfhmin, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve32f", RISCVCPU, cfg.ext_zve32f, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve64f", RISCVCPU, cfg.ext_zve64f, qdev_prop_bool, bool),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.34.1
>

