Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyR38-00038w-Jd
	for mharc-qemu-riscv@gnu.org; Fri, 25 Nov 2022 00:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyR37-00038j-N7; Fri, 25 Nov 2022 00:14:53 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyR36-0004FV-CG; Fri, 25 Nov 2022 00:14:53 -0500
Received: by mail-ua1-x92d.google.com with SMTP id c26so1186127uak.5;
 Thu, 24 Nov 2022 21:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wcOcgu7nkB3LJQDS9LHA4u1QyGvq+fU5PlUw6sjvaYg=;
 b=qVhHY0JTB5L4fIpK54ti6dTGFexq8txLiT+uKIwNtosWvGxJLouiFmpP8wZlS//J21
 Jm8xPduf9vi64wzUlutRFtMW+0w2+SeLd3a/XTCbs2GpDoikZ/caruKhjCPIYuo7Rf3y
 TyrRAchYxD9ZgxWvAGb3ydDuW4fTtPGJLIEgbqu4jFjmII8XbYwbZKDEyZZ7IgfkRvnE
 T8OCbaFJSCwz7sInEODwmqTrc3Q43LTbFkY6ywWSctLbDxNt/mIg5FjXrSeOH2uUqWU8
 3Se6A7e/+cy3B2AZqeeSdCq8UFSCi08IpYtjoXin3D1RQb9wwgfN/Saq8GqMvrF+Gkve
 oydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wcOcgu7nkB3LJQDS9LHA4u1QyGvq+fU5PlUw6sjvaYg=;
 b=FgKmBEDRZLySvE+gU6DHx9Ou9tKDyIVzwqRRBWJHDAVp8HIyV0DA0y/8vRcuQ97Ojn
 wvLh0VgR7No45XqIx3g4c/WhMnVk8ObJ1Co1Q4a/BZtFc/BjPCiPszXjvpV7TsU939HQ
 RTidkHrSHIuyq21FDgTA0CFcTRVwG52Zw2H2qIzkOslfqSKNHvCyB3OlCr21YwkvKjaj
 BbI5qEQJRK5b4EnVjUSv8XW38TwTnJGxrLBNxtJCijpucFLe56k+pPZEg63N6yHWc/B2
 qecBk2NvmFTaG8QFWQ2LjhIe8+csg/HjXryiMpRAHA1bfYXaCq0jz3kq1Ovbuh37p8n3
 Z9OQ==
X-Gm-Message-State: ANoB5pn55nUBdhE5z5eqyWcay6V6u1Yl0iisVYtOTPAXGQsOuC6Cij3S
 zyANFl1Kt9fnv0TtdjM7+vnBcilIOBrTrzWFrwqL753/KsY=
X-Google-Smtp-Source: AA0mqf5PoD7IsZTJuLvacUuJBejvdBnTeWg4nIbw/Fw2f3X4lKoknBFWLA1VMZazBmIqEKp1GDx4j1QrZyo9Danwgyg=
X-Received: by 2002:ab0:65cc:0:b0:418:f104:2ca7 with SMTP id
 n12-20020ab065cc000000b00418f1042ca7mr5601225uaq.70.1669353290895; Thu, 24
 Nov 2022 21:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20221125050354.3166023-1-bmeng@tinylab.org>
In-Reply-To: <20221125050354.3166023-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 15:14:24 +1000
Message-ID: <CAKmqyKNDVg+U-tbEBcoGZyVZCD9YFjFukDrfmtBVBanbL7qw0g@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 05:14:54 -0000

On Fri, Nov 25, 2022 at 3:05 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> sstatus register dump is currently missing in riscv_cpu_dump_state().
> As sstatus is a copy of mstatus, which is described in the priv spec,
> it seems redundant to print the same information twice.
>
> Add some comments for this to let people know this is intentional.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v2:
> - Add some comments for missing sstatus
>
>  target/riscv/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..a6c27977c5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>              CSR_MHARTID,
>              CSR_MSTATUS,
>              CSR_MSTATUSH,
> +            /*
> +             * CSR_SSTATUS is intentionally omitted here as its value
> +             * can be figured out by looking at CSR_MSTATUS
> +             */
>              CSR_HSTATUS,
>              CSR_VSSTATUS,
>              CSR_MIP,
> --
> 2.34.1
>
>

