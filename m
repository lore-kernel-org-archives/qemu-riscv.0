Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5b5Q-0005Pd-Dk
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 17:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5b5O-0005LI-7h; Thu, 06 Jan 2022 17:18:18 -0500
Received: from [2607:f8b0:4864:20::d29] (port=37744
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5b5M-0007fj-Ov; Thu, 06 Jan 2022 17:18:17 -0500
Received: by mail-io1-xd29.google.com with SMTP id 19so4891770ioz.4;
 Thu, 06 Jan 2022 14:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orP3lgAZmVxYlF8CzUtv2mZyEMf/dTH8Mxa1MVAHRJ4=;
 b=bkBPOKUkro2HglPRBgykVCxQ0u4HAgOh8UZH50c/5VVPXQk3y8U9ZEGK28SeGmc+Ia
 FG1PC4RwOCodsmsQAR66C6FNxuvv9uk5RSlTAMEwtlvdsKpZsXqIpAde4whi7fcffyfM
 PUTGj/m6rZg8tPWygFnaLJiKZlgQStylsAbxSMxQNw4Cz82LVeQzlRa8E7ZUzf0QyG+Z
 IIpeGd4K66gO5YnxCMO1X20uHaQQ6G0v1ry0C0kOGuEI3KNbAWBSv3bu6jEM4qmL+gZA
 udyoxvvOvSVss2yIYe/WNgjUqo3Ej18YoJorvKblugQZHrsqgwF+9CJDAlMOf/hBEImH
 I+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orP3lgAZmVxYlF8CzUtv2mZyEMf/dTH8Mxa1MVAHRJ4=;
 b=60CwZ5aIaQr0TKx8zGNMP2DEIIFjlq9XUpZnanpkNRu53IKDzBi/R+EIHM/wK74Qm8
 O27AiD1dkj5mr3Jpfi5JQYWB1HP+rX4Ng2ZzJ6oxzLEgtT8ZCaKGinT/hNOPXvu8Y1G4
 9CxxF9HouVVTWyW6G37wIKAsOETUuaKYMGInCvS37U20taE1snpiyUkZ8VwVmeCLv+dE
 33UFRQ9vcClmFzqTA0Y49it6hcJ0he6zwfRSDc+ombH7wA58OxKeQt62c+QpPwkvpP7I
 JV7pticpoid42Brkz9ogbQt6MMee3zE2YeDfLR3X5lY1wpuRx8Ktv4N65Sabe6Fjo+5U
 vmkA==
X-Gm-Message-State: AOAM533efsUr1zOWVJAbDRs0FkX5KZ1Y7rACL9+xOqD+s46qQseRenF/
 v6hXcCV9Ri3LlKTIZyebLjJ0v6NF1cLtAjF9E4g=
X-Google-Smtp-Source: ABdhPJwZe+GC7mKkD4S008atjIjKVucbWeCwSrcb9ULviRT6y3x11UjWSSVtb+VNRnTyDKKUH2K+XD+cGkccMm4WduI=
X-Received: by 2002:a5d:8f88:: with SMTP id l8mr29071785iol.91.1641507493786; 
 Thu, 06 Jan 2022 14:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jan 2022 08:17:47 +1000
Message-ID: <CAKmqyKOTqChXoS7h-dNwMRondvCt14D84urZxmD3SnGwZGTBbg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix position of 'experimental' comment
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Vineet Gupta <vineetg@rivosinc.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 06 Jan 2022 22:18:19 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

