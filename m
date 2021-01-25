Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BaQ-0005Vz-E6
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BaO-0005Ve-JJ; Mon, 25 Jan 2021 18:47:56 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BaJ-00032s-T7; Mon, 25 Jan 2021 18:47:56 -0500
Received: by mail-io1-xd35.google.com with SMTP id q1so30229965ion.8;
 Mon, 25 Jan 2021 15:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltdvLRut9jt05WqQ6n3EYDa6CKdHO+XAquo+pviXuRM=;
 b=k1WvJlfWpR+wgosKJJdeKBIlc+L1jA6Jd5gqzM1A0eIz5EyQd6WDtFpTZwFcL4SFzJ
 qcRTvAbYh27q3wRw8EHwnmGDkCMQNy3dckyRb2nObJeaPBvUfce0109TSi41P1z5VANI
 JWMYm7YoID0JKA9BTHcsONZcLcJywhqfrNV3Iz2kCPD7sn7ofJj6YnOqyOa1iMUg41Bk
 94H+QFO6apXb3M9y38z/JZbC5gC+2UGkM6JjrmdvnafY5Th37GHjpU61Wqiqbc9bBMoe
 x4IdK00n2UWIVqsAlf2TdXkmppJPsQYQY1yXyHaHmPlgoZfbT84o7AVSwSBF5RYpg6Y3
 h4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltdvLRut9jt05WqQ6n3EYDa6CKdHO+XAquo+pviXuRM=;
 b=ibVAMj1VK5PHqvBgPw7zYEFaEHitbUtavo3PbgBp5K3lEAHCoci66rHiAEs/APXNEN
 1tTaFiXA7M2sPjP1i5HWN4GvtxzAeI+0L9CLZLy/0hHyEqpgyt/96oZtOMc+i8I1s3An
 L/LpC1mURc7HnOQG7K37kbaCSHr9J6SbkDB1iarhkxjruN5ttSxbWRlx3F6KhdEYtrTS
 qqeUVfTteA3oONL5VW+VDzDRZYCE2XMss+NKDVWdkfORLvEAAek5IowMgStcmyQtMWYg
 T1CGnDPYiF4FGLjtLAPuDSPhJQCl8j5ROrK+z3oA6nub10ciugf0qzVgUhS1qZDD1tBj
 R0HQ==
X-Gm-Message-State: AOAM531mVt3iY3FkTWbKa2eKbg/8WI+1ytwCQyLLrfQan2Eq54XWZAPA
 cvZmav4ZpjquO0a3Z7+himRH8gi34r9hcYPNovs=
X-Google-Smtp-Source: ABdhPJzxiD7HKEGSKwRjlDrWNmXIP2uXAb0OWNDBx2tVdSRDpT3Zqvp0UMnG/Ot2CbERf/e0g8twAgdxVc9XmBI5N1Y=
X-Received: by 2002:a92:8455:: with SMTP id l82mr2441375ild.40.1611618470127; 
 Mon, 25 Jan 2021 15:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20210113071350.24852-1-frank.chang@sifive.com>
 <20210113071350.24852-2-frank.chang@sifive.com>
In-Reply-To: <20210113071350.24852-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:47:23 -0800
Message-ID: <CAKmqyKONT0oB4Wzf5wQop7veOz=hOs1ceMJ2MttdhOBRnUoT=w@mail.gmail.com>
Subject: Re: [RFC v4 01/16] target/riscv: reformat @sh format encoding for
 B-extension
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:47:57 -0000

On Tue, Jan 12, 2021 at 11:18 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 84080dd18ca..3823b3ea800 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -22,7 +22,7 @@
>  %rs1       15:5
>  %rd        7:5
>
> -%sh10    20:10
> +%sh7    20:7
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -58,7 +58,7 @@
>  @u       ....................      ..... ....... &u      imm=%imm_u          %rd
>  @j       ....................      ..... ....... &j      imm=%imm_j          %rd
>
> -@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
> +@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -122,9 +122,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
>  xori     ............     ..... 100 ..... 0010011 @i
>  ori      ............     ..... 110 ..... 0010011 @i
>  andi     ............     ..... 111 ..... 0010011 @i
> -slli     00.... ......    ..... 001 ..... 0010011 @sh
> -srli     00.... ......    ..... 101 ..... 0010011 @sh
> -srai     01.... ......    ..... 101 ..... 0010011 @sh
> +slli     00000. ......    ..... 001 ..... 0010011 @sh
> +srli     00000. ......    ..... 101 ..... 0010011 @sh
> +srai     01000. ......    ..... 101 ..... 0010011 @sh
>  add      0000000 .....    ..... 000 ..... 0110011 @r
>  sub      0100000 .....    ..... 000 ..... 0110011 @r
>  sll      0000000 .....    ..... 001 ..... 0110011 @r
> --
> 2.17.1
>
>

