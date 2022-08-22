Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPyC4-0001rN-Tz
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 23:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyC3-0001pt-2g; Sun, 21 Aug 2022 23:33:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyC1-0001Sp-IZ; Sun, 21 Aug 2022 23:33:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso12676009pjl.1; 
 Sun, 21 Aug 2022 20:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3xHEHROAWYLbGAgfpSKzjUUujlxh7e8cSX0MVBwf5CE=;
 b=gEFnQBoQw++YXTuVQUJPJxefaeqWsLNjw3RoHHuu6ouh8jNCpZBhIlurZIYF2b7d8T
 7ASmqfwp5ZqvCATTKbhIzGNGuCL9LxhpcNYoF6LVVQSqqml6jOMR9n7GQgux+wNv74KK
 4TApnhNfzzpHvnu0p0e+pdWcp2oh/kmko97c1KnK0/OY7bcHS93UroxIE4vNjuBONaoM
 zXRUeG77jG5fi/V1FstZpnFAu86zZa6l2deo8XeapQYeypczIL0hd13Dciyr3nmlUWYd
 we2fbjmR3ODFiT94/Y6d+/h5O4d1Ls+kRr+0eSVruqYnXo/KvkQz7hsNvMStZLNxWSGx
 xcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3xHEHROAWYLbGAgfpSKzjUUujlxh7e8cSX0MVBwf5CE=;
 b=jyG0xBIJ7Hh9uekpVhM+E+qxDx5csqNxWvv6Oaa629P07HEC0IqYfWCBWPKCObh1H2
 3OpcNSsL8LRvNXh4zsOMNJecVFt3wpgBnd64xtgAXY2GceDlCn7e8HtUZP2XL9zF+Kkd
 6h6AzwBodiEIQjeQRoBFnMBNz8aojh+8csKZKECJSP4yEu+/r4DnPLQ6p/ysrWd9jzRt
 FQFH93SEUDsmhOro/WIXGiaXvCzueuudbOR98Udoavi/eFD2tbGEnrWrbe+XnPMZ9Wcy
 kDTvO+6yC8d+dKmmmviFsd1wGFDxt6WUxRYmfJVhIk1kMoqX84FmLonPuaGgWdIPNCEb
 bw7A==
X-Gm-Message-State: ACgBeo1CRhSi7Ghc2MR1C5P/4CnDv63GrEtuQ38maE5ALr4ILXWJQ3dr
 +chojJQKZMl3MoFs0amEXmUdpvKBaIS/Oi4mzBg=
X-Google-Smtp-Source: AA6agR7tt+byKuwn/MWew23njBWZgSh30Ug7Nq5QiM4WzR2qWCRPO9QWx2YLbT1nRwsYmK6i1cEWFKFCv/zpCcxQUMA=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr18457454plf.83.1661139215923; Sun, 21
 Aug 2022 20:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220819071137.1140627-1-tommy.wu@sifive.com>
In-Reply-To: <20220819071137.1140627-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 13:33:09 +1000
Message-ID: <CAKmqyKNidxPt-Bu81-Eex=g9ZWdTJ29geBdtg+w5sMTvy4hraA@mail.gmail.com>
Subject: Re: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj
 of SiFiveEState.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 22 Aug 2022 03:33:39 -0000

On Fri, Aug 19, 2022 at 5:12 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
> to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/sifive_e.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..24359f9fe5 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.27.0
>
>

