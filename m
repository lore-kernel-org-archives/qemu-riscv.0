Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9awn-0000bU-By
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9awk-0000YW-4P; Mon, 17 Jan 2022 17:57:54 -0500
Received: from [2607:f8b0:4864:20::131] (port=46948
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9awi-0001dz-RB; Mon, 17 Jan 2022 17:57:53 -0500
Received: by mail-il1-x131.google.com with SMTP id e8so16017585ilm.13;
 Mon, 17 Jan 2022 14:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LR4WfMKs67yg/RV+w1+70cx/S2LByGXyY/T0F3/R7dU=;
 b=KT8RDVieZctqlq63BkLYETaqnrhqROMJdLYFPt2yWwn9zB3EE8PtXDPKema+7SQS37
 OuWZZswUuF/Ejw5SU5Soc48iGwec+vI9Yiu1SliEhRlRQ0FD0g5ROv/WwrMPBA+lTazi
 WTmLkOCKkDZA/BNSDkBdIQQR+F69pEB1NpAo1NomKsA6GFv1Dg8dHUElnI4coGcpS7xK
 l+ehCvdvjE2KN+4GqTGMSH105pjf2rlL1gkPJ3n4DTzCs8/v6aA/8BKPLObzfxyqscKS
 CjbHZq/6KT1Erp11cFKitfX+FMUDzwn7AG2F1envL05oysekmkgDj/syyEoIdPm3GpHT
 ijIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LR4WfMKs67yg/RV+w1+70cx/S2LByGXyY/T0F3/R7dU=;
 b=bLUppOiLF4Q0vpSXXpVppiaOGDv5h4EOaAIDkFbcLmRy+KtArenFROS8G1CU/gfAU3
 WA8jIPfvE7hHnZy53iCC1pYY5jK6cJPogXvg9dvcpycJrTRH6wHzeUjMPIJRGMDpGiuc
 ZJp8507sUk9xYPCTxdYMMUpVbp7EPwoYHX6asQev49tn1h/czFYsMFrrG23nRGpOPwJy
 oNPBQa2ymZCjmmoJ2feExS7ZB6ARgwTbOvUPtFLKzqzCC/ZpKK+Caxw/H1EMmuv/SmEE
 ugdMJycKOB52Xa7YSsJLKNEqmnOVi7XE4PZvRKEr4VfOpKYhZLb6GbPRXOj4f4PsC6Kw
 3fow==
X-Gm-Message-State: AOAM531ZU7PDNeI/n5BVnQR11V+N4Ekn8U2Pthd22vLVwNaQUNCOjqUX
 YklC3U2G3drSL6kEI0m0+eQf69bpvAa0/YvvbXkfaXAAJ2G/LZX1
X-Google-Smtp-Source: ABdhPJyc2gUEVQ/W6o/xBazOeuuP+sz4eGhxJekuRlh0RkaBW0LIyLqXKH+PiYa6j+M5ZSZxEHLFz/Iql/I33mrQPmY=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr9139202ils.74.1642460271695; 
 Mon, 17 Jan 2022 14:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-18-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-18-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:57:25 +1000
Message-ID: <CAKmqyKNabafdrr-Yimj=Fg7LBKPdH_fzKKXLBkY4vcVKQ22Hbg@mail.gmail.com>
Subject: Re: [PATCH 17/17] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:57:55 -0000

On Wed, Dec 29, 2021 at 12:52 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5e98860a09..2b54c64f56 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> --
> 2.31.1
>
>

