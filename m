Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHnU-0002OG-9V
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntHnS-0002M6-2X; Mon, 23 May 2022 19:49:10 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntHnQ-0008IO-FD; Mon, 23 May 2022 19:49:09 -0400
Received: by mail-il1-x136.google.com with SMTP id 3so10872532ily.2;
 Mon, 23 May 2022 16:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Gh02cx22PukGVClU8ig+swAr7L7KRRNgaepl5ZTEVk=;
 b=ndHB5vLbazDymmTKNthR6+OnzCfaqe0Hk6yVIyi5E5zhsG1T4nMLBuC2Rjyffl5q2T
 xo4DioT78j2sndweoKMLrVy7DJeJajh4XLaM+V6mB1DbBaUpoSMFD11fknwcNmFeIMC7
 Mo0eUry1nfVN5n1VuOOUEBeE1V2AvrdLUOl4ffr8+1b+vuyoce15UKBw+0qOQXy43h4I
 WRMYPQZ2tCHbdBhoCa6HO7zlRWaKyyTyq1RWC/0mPGhasLe019MDWQQ11wGMHn/5aGlC
 vrdee8HZCuNMmHzPD/mqMm1AymLx+fKT2YEVba5xz87qFzwwlVCoVXdJBoZEHZSSbaXx
 d/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Gh02cx22PukGVClU8ig+swAr7L7KRRNgaepl5ZTEVk=;
 b=uq2rkHvFwFmfDZqTjP5w7BVoZDs567R8tnmDfW9B3YhgEslGhn9e4+roBrCiVhMpdi
 8t6qCnCyztl1i/50MXn81DF8iPgaTLFHNV9Ctu9i4kpXxaijQ0ov4jn0UU+S5MtqOtLw
 NZM5YOQ4DXFx+eaYoi0fMmA1VY2Yo1DameRDNEqdAWIPgFb4X2a9fIqPsH0cKSHDxeVJ
 FvrEsZiFmchegHlx/Jyf0r0pAVRi04N2WKRuiV+e2zcm7dBowsfIVjsuhzNJiG4wyX5o
 txZSzxhGOhG2ighO3Dx90/dTqgozKyK8Gw+iqRB6LuzvfCGoyn1ORAxFaLvzMmGwme2s
 Nvqw==
X-Gm-Message-State: AOAM530tsyEj+fhlPt0KcRzWRLTagX2haroEMpwkg89MHFP+5kdO1lpt
 M2mp9j9NWDUTc5bH7OjUh89U0ntSygsTYnpxW+I=
X-Google-Smtp-Source: ABdhPJwWjw02iLB4P1B+ANhELmwNSmBvxpvlI2HtKxD0Gakynv3+HtZCRu9PfcRcwVzkznj4Ixmxd8wMRDQecfQXZ9U=
X-Received: by 2002:a05:6e02:188f:b0:2d1:58f:41a6 with SMTP id
 o15-20020a056e02188f00b002d1058f41a6mr12446920ilu.86.1653349745722; Mon, 23
 May 2022 16:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <YoTqwpfrodveJ7CR@Sun>
In-Reply-To: <YoTqwpfrodveJ7CR@Sun>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 09:48:38 +1000
Message-ID: <CAKmqyKNgN-8h79LDEOxvuVA5LZWjenPT2Xkqap8dyEDahJyMvg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add zicsr/zifencei to isa_string
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Mon, 23 May 2022 23:49:10 -0000

On Wed, May 18, 2022 at 10:50 PM Hongren (Zenithal) Zheng <i@zenithal.me> wrote:
>
> Zicsr/Zifencei is not in 'I' since ISA version 20190608,
> thus to fully express the capability of the CPU,
> they should be exposed in isa_string.
>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6d01569cad..61fa9b97a4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1027,6 +1027,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zicsr, ext_icsr),
> +        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> --
> 2.35.1
>
>

