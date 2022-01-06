Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5aLN-00051F-U0
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5aLM-0004zJ-PN; Thu, 06 Jan 2022 16:30:44 -0500
Received: from [2607:f8b0:4864:20::133] (port=41865
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5aLL-0002Dj-61; Thu, 06 Jan 2022 16:30:44 -0500
Received: by mail-il1-x133.google.com with SMTP id r16so1413997ile.8;
 Thu, 06 Jan 2022 13:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHDqSzQq9d5rvs/fWBJCpGh6zHf8jrG5WwPdUWwMyXM=;
 b=dqG2cIO6KptW68YgjwqyNheBcixS50kBIoKw6NVVLubxJJXa/J+Rp7CpAujHoDxYjR
 pwh64gzjlHjRwFi1Ank2C69RA5WV79Jx4zTvE/8cj7290dDM0Aic09JhiYUIMQjFxSX8
 hdhmPRZIbZl/WFmxe4Bo1R0eTSYXKqIS3hiub7VnIUaYAU2kaEnu2NRVfSKS4Q3h35NH
 iWltrX4DLKKrI/xgzUXWHiVO5A9Z+BuXBAoxGs9NZ4G9oN/KwP6bVy2aW2I79JmEo7BI
 82cCl214HAqWb7wSKV14OviqXd/MfrIRVGLav/kyNl1AJyurd1g+K4nRFfmbyzMHnUJk
 y36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHDqSzQq9d5rvs/fWBJCpGh6zHf8jrG5WwPdUWwMyXM=;
 b=5f6Hs5YuRaR1ICbSQuQyCtSE9FRZLTGpWkkVTXXntSqy0GWSAR/5gbs1iK3tD4JfGq
 gdjSDsjQVmFu8R62NdBayfCKWtUlZjQm3NM4IliwBcSZVDXjhS5rrk4o7hQYksxveTGt
 Gu/vx6sAaORM0rgyyoECrntl1YwxfoKVhxtmqpqsc3fm5n4Gz4tPPtFsZUY8qDVGzi+Q
 Es/jFA3y+SCNGzF4L12XsxZ3pggKMrtNWrsJHSYs3pk9pTkWaMKvg09N+ShbBpoDDQeG
 LUbiYPbFSyk/IFu8ddXX5GHB7oyJXx6x3c+CtIgL212wwYVbYuQAFOVoXmwahfj2v0ge
 eO2A==
X-Gm-Message-State: AOAM533DFCwqVjLPN7sgYsbQMKWd6q2d9Bw0xnlozTluaoRa90/vllv/
 Neyxs0hxeRfFqdTWMfqO4GQnDeRKS7yBvUcg9vQ=
X-Google-Smtp-Source: ABdhPJwA9SCEbsMGgMzmgIY0dWI2keuo7ceaxVTH3TYQ38WzVu67+6kVddsLI1FO55nxKZtgi8RpJo5fifKouluXSUA=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr27251063ilu.290.1641504641577; 
 Thu, 06 Jan 2022 13:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jan 2022 07:30:15 +1000
Message-ID: <CAKmqyKPcYRPsvLvCUs-kL6f+4YJPZBgcL02Eoegrmv=HLiAUrg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix position of 'experimental' comment
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Vineet Gupta <vineetg@rivosinc.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 21:30:45 -0000

On Fri, Jan 7, 2022 at 12:30 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> When commit 0643c12e4b dropped the 'x-' prefix for Zb[abcs] and set
> them to be enabled by default, the comment about experimental
> extensions was kept in place above them.  This moves it down a few
> lines to only cover experimental extensions.
>
> References: 0643c12e4b ("target/riscv: Enable bitmanip Zb[abcs] instructions")
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..e322e729d2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -640,11 +640,12 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> -    /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +
> +    /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
> --
> 2.33.1
>
>

