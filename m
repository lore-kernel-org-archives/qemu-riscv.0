Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpAE-00006U-7x
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 18:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpAC-00005T-9J; Sun, 07 Aug 2022 18:54:28 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpAA-00024H-Ek; Sun, 07 Aug 2022 18:54:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z187so6674447pfb.12;
 Sun, 07 Aug 2022 15:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=43oYjQak69cnmr5Xx/vXh1gHTmr9iNtXaxQK+muUYYU=;
 b=KvGN2K7swFbeuQIbSlviMmEPo0nwIHFD4it3ZK1jHFkL0Hq7cdFXkOEHPdj3Gy/yl8
 phNJh/j1405m7JNK9/v5VOk3DZxrjx7No0EGyeakivCVhb/FOI0d4JV4urRhlJ/kpwtp
 yy6KTPOejyJ38gZhPwQie2JXLr/JI99v2uyDNMUCGeEu3mV7f/+qlUC1n1aCqTEIBuy0
 e7+tdH5q1vcg3cIUQwHWVxNS56/jwiweKiOcdfcC69xVeJ61ht0D61FTEvqAA13H1bXY
 uc5UafhTmvgW6T1N/nwERpzfSGKOELu77y54x7wRtVNaQl1FmbX6y1fIz5Owu3EvmUyF
 znwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=43oYjQak69cnmr5Xx/vXh1gHTmr9iNtXaxQK+muUYYU=;
 b=2bMuVJDKyY8VbWIRaiX0rPVRQOduFs3PQCmH7BmMCJy4Kk0oPT4JTyUvTjtgsDG070
 52AVxUcuyvebrkKnW07K98RNbKagVJJlOuNDMwo37QF3Ts5amN5CQncZlz1Ntli7M6EE
 2ryWEDL732xCjmgCv57OP1MTm8Cltlbbzr90voRdJQVbfcs8Xl+FGfoJ56m8RP1AAus3
 ZgiMvABjVd1wQcqMwKyY8orAaUW3t7uQijydto08AwAKRW4itHvy/Zq5m5rYEl+hg8rN
 D1SF47uwIpsjU6MyFXYt/TFaQ8BGhkhiW5yg4wO6h7z5q9nzXbKaGhe4q3c3kc048a3p
 L/AQ==
X-Gm-Message-State: ACgBeo1J77r2QpjBooQkR1xdnuMUih5eAH47MWOGRoqPFQXo+Q26iSQ6
 hOEC8mvPKih3FaHw6TPPLUj/CHrG8689UOzWgoY=
X-Google-Smtp-Source: AA6agR6iKY1N6dLXfYAISVMIhHFtzbZ3dlNMytM1cpy71UCmt3XYEGVW8tQ5poHoTcvWnRwLpiSnWnmX+aqjc1X6auA=
X-Received: by 2002:a63:5f49:0:b0:41d:85a1:c4da with SMTP id
 t70-20020a635f49000000b0041d85a1c4damr1729915pgb.366.1659912864354; Sun, 07
 Aug 2022 15:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-2-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:53:58 +1000
Message-ID: <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Sun, 07 Aug 2022 22:54:28 -0000

On Sat, Aug 6, 2022 at 2:08 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both S and U cannot exist as single-letter extensions
> and must instead be multi-letter strings.  We're still using the ISA
> strings inside QEMU to track the availiable extensions, so just strip
> out the S and U extensions when formatting ISA strings.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..95fdc03b3d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);

riscv_single_letter_exts doesn't contain S or U, is this patch still required?

Alistair

> +            char lower = qemu_tolower(riscv_single_letter_exts[i]);
> +            switch (lower) {
> +                case 's':
> +                case 'u':
> +                    /*
> +                    * The 's' and 'u' letters shouldn't show up in ISA strings as
> +                    * they're not extensions, but they should show up in MISA.
> +                    * Since we use these letters interally as a pseudo ISA string
> +                    * to set MISA it's easier to just strip them out when
> +                    * formatting the ISA string.
> +                    */
> +                    break;
> +
> +                default:
> +                    *p++ = lower;
> +                    break;
> +            }
>          }
>      }
>      *p = '\0';
> --
> 2.37.1
>
>

