Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdSVu-0005TC-Kc
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 03:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSVs-0005OZ-Ov; Thu, 21 Oct 2021 03:29:20 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSVr-0007A8-65; Thu, 21 Oct 2021 03:29:20 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bl14so6285774qkb.4;
 Thu, 21 Oct 2021 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDmyAxWOAGTN68YB82shn9jEsW5qiI5KsA0e/AvRFNc=;
 b=cThZJsMqbEdyOHxo40e+xXMk/OiDwm5/6U5HEkCsJimSAQ2MiQAWIOOnBxXIT4yXZN
 BizDGM3WooXBahfDela6jxT49iiXOPFIoVs+xNmrGeXs5DoBWIJqF89tvYJl+o4NIann
 ETgNPPNDThPwKTRKsiWqNpQgf1JkS3lIPhKz2Lep66T0RkN9Ri0aeouKgXnjZrb960Xc
 4jQVD4tD0AuwNfod0rklA73hYv0pQwuPJ24+dcTlct0v43Z4GAZhMXEB3j8ESP9hD4kP
 KnIdr3iZpfv6t5VC/9ecxaPuFEo3a/Fb9kqHJcdOOSF47wNKWP8C3f0zRCAQgdhUMUNW
 s1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDmyAxWOAGTN68YB82shn9jEsW5qiI5KsA0e/AvRFNc=;
 b=gyY3SAN4hHPo5Y86Pi8g/SLAHAevSNEA2rX1DyHt07EKzxkBK0RfUDazXkkDrT+Jyt
 CJuXakB0xS10J+6pFYGVGRRC/dd12qxeI5wQOByfVH5UPmkcS9xLN0UwBN36HcSp3s+P
 FgpOwRD0NeTRrx+3ThjuSAFe6VX3w8965CnBhSsBiDViAyGO9rDwj9JYies+JSGmNv0L
 pbcAmDkvca7e5LwOJQ7RRKPs7LEg0CESTDb3EZ+OuOGqPhcQB58kXL5VUJNrcPrN6VEP
 yjP88cUDfXryWvWhNmZrXImE1thcimOIbXo0A7gUMARNwv/2ZpbSfe0mmC3om1tFYhra
 vbmg==
X-Gm-Message-State: AOAM531pCPU3OWxCi4xdDt65soxzp5FX+H+JlnFPBErc9jNJbQ37vU5l
 F80oH/1GgGrvBO7ASeTR8dJHS5hIZIwZOe2gAQA=
X-Google-Smtp-Source: ABdhPJxey2bxPXuUOLn5+hthMNvFsKAlc7vRza3Gg4QBhtXLJleLHYtaQ/FrSorNpziVGq/hD+F+MK/WTh5yqNVbcEM=
X-Received: by 2002:a25:df84:: with SMTP id w126mr3965587ybg.109.1634801357830; 
 Thu, 21 Oct 2021 00:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <3c125e27c49a4969df82bf8b197535ccd1996939.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <3c125e27c49a4969df82bf8b197535ccd1996939.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:29:06 +0800
Message-ID: <CAEUhbmVrfX0vfAVmv61PVS3EVM2_7tK-GN5CW+u2oi7pGUCnVg@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] hw/intc: sifive_plic: Move the properties
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 07:29:21 -0000

On Mon, Oct 18, 2021 at 10:39 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

