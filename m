Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp1ot-00041P-8I
	for mharc-qemu-riscv@gnu.org; Mon, 22 Nov 2021 00:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mp1oo-00040y-UL; Mon, 22 Nov 2021 00:24:43 -0500
Received: from [2607:f8b0:4864:20::d29] (port=33333
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mp1on-0007n5-Fd; Mon, 22 Nov 2021 00:24:42 -0500
Received: by mail-io1-xd29.google.com with SMTP id m9so21809564iop.0;
 Sun, 21 Nov 2021 21:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QRgEjlYAf56it6F+JCW1JomV/SUdQ3mSwbq6WuhvgW0=;
 b=ouSTNCcNm7ZPjqIcPOgOkyTUEwTHCQhHYz91dRMCW4PhFFpN1xt8fhoEBpLYu2Kxjl
 AM3JQE2SKdGY4LQcU1iA2sZokfWeQTYAzSR9eG06piIk1hXDhMqqPSzmB6hjDSGsGqSV
 ObEzvGho8V6HXc/sBZxsPasNRHd9v+Eqk9txLws4pagv1r9EFmBTu9uQN2orMcGPtyjb
 q8myXoDw+FlXzlpDdvb8jOiEiDHTg6jsFELHpGxsyuqmeq2MoieS1e2J/2npV8SF2f9N
 Oepr9M4FoAeiWYYj4lR21BvQYDfDAp/OWDcIanoPmaVWPUMPvqh303a8vRqXrESRGKQ4
 9Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QRgEjlYAf56it6F+JCW1JomV/SUdQ3mSwbq6WuhvgW0=;
 b=2S5LU6TKzq+OgTvVxyh73c5vM8OgxHqBRUs7UVyGsibvGulBdnt0Y9A3VEkTQ9PXaD
 6gjRi02O9xAhZc5W4boAl5YOPUh3WxKHstMUOpCQ42nO/HAB3f0J9HC3TxtZHq4FdCG5
 /hJ52vrwD4siOxaSwgbkDtbilv8uRYcExO5aJalZ7wFv3DvTrEPoUelv1R0M/CGJTrlW
 b5PP+GcOKfU+dvedclKRuQsT6uM39ZEv2rPq7tC+IXVIbWdEBtapcPv+/I0tkZ73s30H
 oTy0csDN5+JDSqi0tTpPhmg9F5V0kds+pjLiiJbvvAjnJMYuOBCeJL/DgKNdYskPIA5s
 qteQ==
X-Gm-Message-State: AOAM532tNnPCViTUb5s29Tk1iSmNV3xTytd+57yI8JiL9NDHcDZqxrbT
 s7d/NBrVxh9cywkS4JFDjLzIeKburK34RMvVInk=
X-Google-Smtp-Source: ABdhPJygwGJkAvnktod+e3YvBfspNEP3TQWifZda7DsQRMu90ucQjBdKlj4Mluo64Hvq2wXaWMRVR0oHV4itDX9e1LA=
X-Received: by 2002:a6b:f212:: with SMTP id q18mr19451148ioh.16.1637558679737; 
 Sun, 21 Nov 2021 21:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Nov 2021 15:24:13 +1000
Message-ID: <CAKmqyKOzeSYYW_cjv9qrnX8poLxpLo1X10sRf23V4C9B571B9g@mail.gmail.com>
Subject: Re: [PATCH v5 02/18] exec/memop: Adding signed quad and octo defines
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 22 Nov 2021 05:24:45 -0000

On Sat, Nov 13, 2021 at 1:13 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
> memory accesses.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/memop.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 72c2f0ff3d..2a885f3917 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -86,28 +86,35 @@ typedef enum MemOp {
>      MO_UW    =3D MO_16,
>      MO_UL    =3D MO_32,
>      MO_UQ    =3D MO_64,
> +    MO_UO    =3D MO_128,
>      MO_SB    =3D MO_SIGN | MO_8,
>      MO_SW    =3D MO_SIGN | MO_16,
>      MO_SL    =3D MO_SIGN | MO_32,
> +    MO_SQ    =3D MO_SIGN | MO_64,
> +    MO_SO    =3D MO_SIGN | MO_128,
>
>      MO_LEUW  =3D MO_LE | MO_UW,
>      MO_LEUL  =3D MO_LE | MO_UL,
>      MO_LEUQ  =3D MO_LE | MO_UQ,
>      MO_LESW  =3D MO_LE | MO_SW,
>      MO_LESL  =3D MO_LE | MO_SL,
> +    MO_LESQ  =3D MO_LE | MO_SQ,
>
>      MO_BEUW  =3D MO_BE | MO_UW,
>      MO_BEUL  =3D MO_BE | MO_UL,
>      MO_BEUQ  =3D MO_BE | MO_UQ,
>      MO_BESW  =3D MO_BE | MO_SW,
>      MO_BESL  =3D MO_BE | MO_SL,
> +    MO_BESQ  =3D MO_BE | MO_SQ,
>
>  #ifdef NEED_CPU_H
>      MO_TEUW  =3D MO_TE | MO_UW,
>      MO_TEUL  =3D MO_TE | MO_UL,
>      MO_TEUQ  =3D MO_TE | MO_UQ,
> +    MO_TEUO  =3D MO_TE | MO_UO,
>      MO_TESW  =3D MO_TE | MO_SW,
>      MO_TESL  =3D MO_TE | MO_SL,
> +    MO_TESQ  =3D MO_TE | MO_SQ,
>  #endif
>
>      MO_SSIZE =3D MO_SIZE | MO_SIGN,
> --
> 2.33.1
>
>

