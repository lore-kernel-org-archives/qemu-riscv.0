Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGIH-0006ao-Bl
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGI9-0006Vw-Qg; Tue, 26 Oct 2021 02:50:38 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGI6-0003fn-Mr; Tue, 26 Oct 2021 02:50:37 -0400
Received: by mail-io1-xd34.google.com with SMTP id f9so230384ioo.11;
 Mon, 25 Oct 2021 23:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ntQwdx3JTwDDBAjGbHa4+IDJv+LyHGJDpXhU15URMt8=;
 b=Vccv54EF45KMqZAjibvN3PNpEMWM+rFvL17SpJMi3ekJeOBSgbTuEqNCqr75mEt9pT
 NRBFcIE748BjDO9XoiEw3V2KeFEZYVGUOFFX0wGg3guw9bXSE29kp+hMveEjRI67Ggj0
 7wvnSEjpfizd06RnUttSUaVDTR0ViaMDCuFE82V0IwfgCmhwPzUBwdjczQF79QqidyFJ
 YzFVdWifEYA8I0lG6M8orMRAyxDvnYTt0rLRewJx2sJl8sM64mZrBPTsOxAFTgIZGabB
 4dygaXHQmAS/ycdQ99zuYXJ9kplU6jFYGqrTNlqWP+f2MTUdn1JfA9R00ryWI//j9dAK
 6YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ntQwdx3JTwDDBAjGbHa4+IDJv+LyHGJDpXhU15URMt8=;
 b=zOBXkssIVXVYaSrliUZKQpJwdnp/aICarDYtMzkxlV1J7IRssp36JAAV9yN6Y2VDzU
 Gom55QyWH3vtvmt9RSTVdDqPasx9tgLcerQJF7qrWRExcxF+r45d+VZuCkUFSbg8vITv
 gt5Bb5DOANXY/at6Pf4nmruVJf2mKbQPSy5faAXw1uGbPWgHFe5LYYBlJYKd/1yzc3TH
 BKHOoJQzA/21VAhPyJdsZKbXSrK0fW9oMgARLq3SU0xTFQO9x+SoV88Cdc+mlTvBrRLB
 6VIgu2qTuQRsIbTiPx5wS3DB/8CAIOmiUC/b+vnVMSdW6+sTMrsmXBjYUSNgu3IlyLTW
 6+bw==
X-Gm-Message-State: AOAM533FDlifaGyI0EAxvVESl05Nq0Uo6vltzQxArKEqcGj9jW+orqVF
 5uyJCCWWaftQiyqk55GuIsAx70TmZ3ZX+DKqqCg=
X-Google-Smtp-Source: ABdhPJyzGWaiSzR1opDXdL1J87+Pi/W5mK/V8r24IQmyIz/JyvX+deRySa6PkOSBX3cteru1mWaDd+MYSTh8RkDqqmQ=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr13703217ioy.187.1635231031378; 
 Mon, 25 Oct 2021 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-81-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-81-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:50:05 +1000
Message-ID: <CAKmqyKMNoiF8Adxewp3dNDkXiddoPs+dK3k_xB5sBjwc=CVxQw@mail.gmail.com>
Subject: Re: [PATCH v8 73/78] target/riscv: rvv-1.0: rename r2_zimm to
 r2_zimm11
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:50:40 -0000

On Fri, Oct 15, 2021 at 6:50 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
> vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 952768f8ded..d7c6bc9af26 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -78,7 +78,7 @@
>  @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
>  @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
>  @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
> -@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
> +@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
>  @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
>
>  @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
> @@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
>  vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
>  vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
>
> -vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
> +vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>
>  # *** RV32 Zba Standard Extension ***
> --
> 2.25.1
>
>

