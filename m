Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWv2J-0004PJ-FG
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 03:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWv2G-0004Oc-Vl; Tue, 28 Feb 2023 03:08:33 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWv2F-0003ZJ-68; Tue, 28 Feb 2023 03:08:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id da10so36378812edb.3;
 Tue, 28 Feb 2023 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+QVVaB3Mx7TVOaAyXZy+2QXcSZPdcikKeLHJBSGXv8=;
 b=O+5+mV7wXYxg0u1QdvMilGtz8LcLBrX83Zhvyv9Lfg3BI5YPg0hFRSoSnXtsdnXf/+
 CDplj2jNij5jAl7nT956g1fFyK5JDyUdOHizzXkF8wDg1AoN42GmHZgdZPZf5ybQu6G7
 gmaYkOO2LsdoQFytimrxZcP6aeT0Ib3DZL9GKLQGf4WbogiLi3yBZRCIFnkYmEmL2e4J
 /v192dtUfNhu+LCe4K7onOUIxWZUebyFwLrVCPwFG246aARiL4y1oaQnjjZIY1rJQTyt
 l/oFEcpeF+kNgvyJ4VhS07G468btAzP7535mV3lqfksE0LpPA41HURt3H+CpogVabZJ8
 qkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+QVVaB3Mx7TVOaAyXZy+2QXcSZPdcikKeLHJBSGXv8=;
 b=PKsktHBH2b3MmaMW+yIvu82xmOLUg3Od+ADNp9HevJHspzfYoT8XF/rZXMmLm2+QZV
 qgNxE/Iuv948tmYR3HiZ83XYGsg2ZwsQJJqyxppytO2Fyc09QEvudKraxNSVeedtSbBC
 yUW8JycLSFD4lIP6/uqhGrPUh9vKU2mzbI24IcZDpry9VqoOpsyzRBfsUM+TPfLHwcIA
 TH6vCVGKdxHbrICPx6I610yULhSKZOi3o+WtLMKDlNeYCDg46AQPfXaEAuAme1jG5+1D
 8XQxA3EU5HmLvSJJi0VXSucRaaFs6P9sicIcq3INcnDPT/qmoUYtFIxj04FM1N+99W6P
 mbDQ==
X-Gm-Message-State: AO0yUKWkobIlgQ9StrKnByqNV5v7nw6r8MsIR4/H7Ew9owx3RRQcorM5
 25ditbyOtvi2NQvubVq/3G4kH+mv7iNPhs5PBcs=
X-Google-Smtp-Source: AK7set9WOp2ngcieY9GCfmcekq4lLlvCEzdSMOir/E9ddrFZNlPQfxDmV0damPHs2G+AZ/T4IyY9ckS4yLQik4yLz1E=
X-Received: by 2002:a17:906:3bcc:b0:8b1:2fff:8689 with SMTP id
 v12-20020a1709063bcc00b008b12fff8689mr835265ejf.6.1677571708353; Tue, 28 Feb
 2023 00:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
 <20230222185205.355361-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230222185205.355361-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 28 Feb 2023 16:08:17 +0800
Message-ID: <CAEUhbmXwefV7M6gMz=QNfBUwPZnP7Jhz7S3rUZcW+dK4PhcwJA@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] target/riscv: allow MISA writes as experimental
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 08:08:33 -0000

On Thu, Feb 23, 2023 at 2:53=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> After discussions in the mailing list, most notably in [1], we reached
> the consensus that this code is not suited to be exposed to users
> because it's not well tested, but at the same time removing it is a bit
> extreme because we would like to fix it, and it's easier to do so with
> the code available to use instead of fetching it from git log.
>
> The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
> and use a new experimental flag called x-misa-w. The default value is
> false, meaning that we're keeping the existing behavior of doing nothing
> if a write_misa() is attempted. As with any existing experimental flag,
> x-misa-w is also a temporary flag that we need to remove once we fix
> write_misa().
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  target/riscv/cpu.h | 2 +-
>  target/riscv/csr.c | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

