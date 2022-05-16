Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqk0g-0005GW-C2
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk0d-0005FW-JK; Mon, 16 May 2022 19:20:16 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk0c-0006EF-2m; Mon, 16 May 2022 19:20:15 -0400
Received: by mail-il1-x12c.google.com with SMTP id i5so11602716ilv.0;
 Mon, 16 May 2022 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffeV+cKKmHA0t3IQ4j95Jxfai9AQ/7UA0+r4BOgnX8w=;
 b=DALv/Uvu2M/1VLvyQq7dXgzLNb0XtC1FtPETgRQGDlxSa6yPCvDQvlEJDyzpXlbZ/T
 TyIwz6PG2Gu9XxEb/m7j33E6PnaPk/eHYMFkZTFFJxDu70XmW3+uYdHYLP0I3xl+mAVN
 9eW443UE223LFB1vTYn5e4ipjoXEjtMXO5QlILHWsWxhUthBVMCnAkx8EVPRWbrt30Fm
 d9lfm8IR0Z7hFlSYzpdK1Rdb9YKKfvdWCppGq+GLvy1NGUjPsRl02RQ4Sg2moALCc7Me
 MtxgoNF9cR6kHgMayk6VUmkyVilAVUBVeJxslLNLxuePWHN3OussqT5Ci9WFeGBdYtlV
 rexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffeV+cKKmHA0t3IQ4j95Jxfai9AQ/7UA0+r4BOgnX8w=;
 b=x8YqmxbpoDumrcv/Ah1QIcFkhbLFL5kwu/yeFBdoNJ9VGx3Ln/Yl88N5P90z4ppWEP
 EQ+7vA7rJBr+Xssnfcj9ukQVE9PwfF3nzFQa5fioCIhkbiH85ztFHUVx4tumImcORtni
 0XySBVDdaW5vNaw6OqNPE1HdWT39BjxkuIPzeDMuTSSDDInByAlknDWr3zAPcXPwak2n
 V1idwqcC9xiSIJrG0zTJE6x1frsidQUy5vIfI5pk93G5S9i6uj7AqR4h5+DpbHXq3qT1
 rZsuCyQ/gAk1u1Gr8DqNITYHijrkkrJxOdfyWQrZhUmqiZaoQSWACLVs7BGPrbudJ6me
 8eQw==
X-Gm-Message-State: AOAM531AdXrBFmAiA95o/Ne0obXqnRfPXhmZzSpTnxpSIIAC09q5qJht
 Im58VTPa43+RXVZFobtHAvZXXOE45E4fXQkx7es=
X-Google-Smtp-Source: ABdhPJzWeiwPVB681I7vVPXrhOalDFknAhwB3RA0jpEvgWBJo7BG5ohzmtF5xQssGT/sMxMVDkW52oEld4mz9WjuFhU=
X-Received: by 2002:a05:6e02:2146:b0:2d1:261a:6578 with SMTP id
 d6-20020a056e02214600b002d1261a6578mr2932364ilv.55.1652743209754; Mon, 16 May
 2022 16:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652181972.git.research_trasio@irq.a4lg.com>
 <7a988aedb249b6709f9ce5464ff359b60958ca54.1652181972.git.research_trasio@irq.a4lg.com>
In-Reply-To: <7a988aedb249b6709f9ce5464ff359b60958ca54.1652181972.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:19:43 +1000
Message-ID: <CAKmqyKO9CRvyTaqf36QSV6ffj=srLmUgjQL-28du=AO9K8rM8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Move Zhinx* extensions on ISA string
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 16 May 2022 23:20:17 -0000

On Tue, May 10, 2022 at 9:29 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> This commit moves ISA string conversion for Zhinx and Zhinxmin extensions.
> Because extension category ordering of "H" is going to be after "V",
> their ordering is going to be valid (on canonical order).
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..9f38e56316 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -999,8 +999,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>          ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>          ISA_EDATA_ENTRY(zba, ext_zba),
>          ISA_EDATA_ENTRY(zbb, ext_zbb),
> @@ -1021,6 +1019,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zkt, ext_zkt),
>          ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>          ISA_EDATA_ENTRY(svinval, ext_svinval),
>          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> --
> 2.34.1
>

