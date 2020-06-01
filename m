Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfcUJ-00075y-QT
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jun 2020 00:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jfcUE-000746-Vp; Mon, 01 Jun 2020 00:55:47 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:35262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jfcUD-0008S8-Cp; Mon, 01 Jun 2020 00:55:46 -0400
Received: by mail-yb1-xb44.google.com with SMTP id v15so4574333ybk.2;
 Sun, 31 May 2020 21:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XcdeCutnmjbHpIobI2TpR09HxDGQiBHr7dBuG/abO0M=;
 b=e0riX8ZMLtN5RaleqVvR4fYGA8f+jd2wnsm3G+8ReDUMF9pq9SvwwQKXljXGakmYtN
 j2iJBl2379JaQdelEObeFfAhepDWZwH3f8FLhkSa/1VUyvO67KcE11ZxaNcdgmPIB5m1
 VsYp+LWwmAeAESJvvZtlhgtwPCtOTtci6FHus8E+B4oQRs2ozFQqle9Zvapr31JJTV44
 hp8CXc5trFcuRcsz8N90nnT9Ln/CuzBRFrIK7HbUxR4YPALM9GHurbm3/RKRryIJ/3IW
 rv2dBsNlr5fhPaAvr/XRvaM29utXWje2fYCB5X24M546R6c0skYUynHdRSpTSw6xDS9F
 Coag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XcdeCutnmjbHpIobI2TpR09HxDGQiBHr7dBuG/abO0M=;
 b=RpmkzgvADH7TxoDSaxOqtmKS70xGKTI9b5WFyDecG7mGVcQKqRzU4J36w5XB3Xr4Og
 FEpxTNpqqjomLF09Em/+St0FGYKpSQcUELSQsOYqAOt6LhJgx4lNFXFppUU8hLF2j377
 OsfydIDLiW6cuaNnwWM84mRTXLO1YC/kRlw4X1YmvWY4dZEgcCPNfjSS1hEXxYAaAn19
 ZPsMN/DSB7fheCkMi04c4YdeTdFO9qQp//K7xMTnuZ1kWp9Y8+K52a0q6O966p3CtJGB
 yRG2ziaYl7dOLuJqURpPFJcDcfVGqg2SqIhfRaGXMgUB5If1weJZduJE9u1Q8VaJsWmS
 ZiKg==
X-Gm-Message-State: AOAM531MWMhylJ1OrgDJxWlVpl5pnGWThS5ZrdB4cP+qnH880BBJfmfn
 joQ0dSSIr/elBS4hMSEGhyGFokKDPPRAv5Mxb8Y=
X-Google-Smtp-Source: ABdhPJxJ5lX+YDUAq6LfoafnKsgcuWE84J9P/G/zxZYRRq2vu9bo7SqoHPLRqA7kiBj5mXBVb5+yqvrsDxXg7r2Be+0=
X-Received: by 2002:a25:1645:: with SMTP id 66mr31920335ybw.332.1590987344351; 
 Sun, 31 May 2020 21:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590704110.git.alistair.francis@wdc.com>
 <8f4f5104c0687f6c11d41f8b72f6b57cc1e9f4a5.1590704110.git.alistair.francis@wdc.com>
In-Reply-To: <8f4f5104c0687f6c11d41f8b72f6b57cc1e9f4a5.1590704110.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 1 Jun 2020 12:55:32 +0800
Message-ID: <CAEUhbmXsy20KQW_EWXF390EXVssxohoVP8ATMgbHARns2GQ=wQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] target/riscv: Drop support for ISA spec version
 1.09.1
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 01 Jun 2020 04:55:48 -0000

On Fri, May 29, 2020 at 6:24 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The RISC-V ISA spec version 1.09.1 has been deprecated in QEMU since
> 4.1. It's not commonly used so let's remove support for it.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/system/deprecated.rst                    |  20 +--
>  target/riscv/cpu.h                            |   1 -
>  target/riscv/cpu.c                            |   2 -
>  target/riscv/cpu_helper.c                     |  82 ++++-------
>  target/riscv/csr.c                            | 138 ++++--------------
>  .../riscv/insn_trans/trans_privileged.inc.c   |  18 +--
>  target/riscv/monitor.c                        |   5 -
>  target/riscv/op_helper.c                      |  17 +--
>  8 files changed, 73 insertions(+), 210 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

