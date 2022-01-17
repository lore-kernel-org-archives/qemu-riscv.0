Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9asm-0003zr-PV
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9ash-0003vP-Um; Mon, 17 Jan 2022 17:53:47 -0500
Received: from [2607:f8b0:4864:20::d33] (port=34421
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9asg-00013Q-8N; Mon, 17 Jan 2022 17:53:43 -0500
Received: by mail-io1-xd33.google.com with SMTP id z19so17713737ioj.1;
 Mon, 17 Jan 2022 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rzcb0XagmAtfpv0+BeP9RWmHTc9dsLBCrrc4Z1V32ec=;
 b=GT4xOIGrE7WYel9t9GNCixlVboUG+CwrfRvBZho2A66a5+Udp1loGlDkNgQhUyUm37
 i0fJvYFnDyVdNAnxBrN66zJP1LGiGq0wmiZ+udQvQxrzn6aCEuL5yXzvnaAE65TJ3eTG
 UZdwEKM2H5igcYy+gsqY5UviRt7vJ97WZLXuR7CnZaQJzJozRWx7epQ45/hV6NboN9dX
 AIMvPnBJqh4dM3sgdMV3pa/IPwWD+1n2SVlJCMc1zqqV8E8AhTZn/FTtTL8nOMxkyLh/
 54HVTEozBvA5LmxojIpWlPXuoFqWPQs+5y4RB8MIOBuHymeYGVpPfDwsWQOwtkwKqzCA
 UBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzcb0XagmAtfpv0+BeP9RWmHTc9dsLBCrrc4Z1V32ec=;
 b=U/EsQ9u+whWshkXv2QCJc7nGooncjncZ8diD4nHa+jkf4vjYbJ4E1TnJAOCk1Rz9Aq
 7VCEIu1Kznc9QOhMc8p6loJbGB3oMIC3nywK9t0TfwPnjAPZdmquKytCyLTTKeECeoYz
 tVKtCi1ZmpHgZBWbZ4RrxwaZe8dHKei0syGjiT36OCp5iIWgg80tDPGRWwXEOLGH6Tf2
 Snk7IKFYzw7XJWC5NEaEK438L2IWldb1Y0GPIHDJ5h2PVMPYo9e2tMHeOWy6t4BJf/R0
 Q+Nm9jy1yjTSn9BRYvA1UlCbw0Raegchvr5jPmynbiNPazU1zeqs0k7hElRrlM2hYFVW
 ZJ3A==
X-Gm-Message-State: AOAM533wmAC+VCELFekb3l1mWHhEkOGcoaMeQ1fgMsOlOzlKzbCiIyZO
 nOa0PLUl92wSXzQNEL6gukipvXFeWkNPc34laLE=
X-Google-Smtp-Source: ABdhPJxOUvRh099DdTYKKZ4OmnqFDk3K/IsOXXfGKmKXNk7Y09BdDND0y3DkRms+PxEcjnxVvTSV//zsrDP0A8ST/Zk=
X-Received: by 2002:a02:5d84:: with SMTP id w126mr9731644jaa.169.1642460020916; 
 Mon, 17 Jan 2022 14:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-10-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-10-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:53:15 +1000
Message-ID: <CAKmqyKO7A2eOESFc_xskzW5ee7TCvri5fTML3YdZSofT9W9G_A@mail.gmail.com>
Subject: Re: [PATCH 09/17] target/riscv: rvv-1.0: Add Zve64f support for
 narrowing type-convert insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 22:53:47 -0000

On Wed, Dec 29, 2021 at 12:45 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector narrowing conversion instructions are provided to and from all
> supported integer EEWs for Zve64f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 9ca8d502b2..230c475d6c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2824,14 +2824,16 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
>  {
>      return opfv_narrow_check(s, a) &&
>             require_rvf(s) &&
> -           (s->sew != MO_64);
> +           (s->sew != MO_64) &&
> +           require_zve64f(s);
>  }
>
>  static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>  {
>      return opfv_narrow_check(s, a) &&
>             require_scale_rvf(s) &&
> -           (s->sew != MO_8);
> +           (s->sew != MO_8) &&
> +           require_scale_zve64f(s);
>  }
>
>  #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
> @@ -2880,7 +2882,8 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>             require_scale_rvf(s) &&
>             vext_check_isa_ill(s) &&
>             /* OPFV narrowing instructions ignore vs1 check */
> -           vext_check_sd(s, a->rd, a->rs2, a->vm);
> +           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve64f(s);
>  }
>
>  #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
> --
> 2.31.1
>
>

