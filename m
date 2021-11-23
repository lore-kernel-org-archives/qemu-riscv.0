Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpTg4-0005vS-U7
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 06:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpTg2-0005uQ-BA; Tue, 23 Nov 2021 06:09:30 -0500
Received: from [2607:f8b0:4864:20::d36] (port=46646
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpTg0-0004pX-EZ; Tue, 23 Nov 2021 06:09:30 -0500
Received: by mail-io1-xd36.google.com with SMTP id x6so5651558iol.13;
 Tue, 23 Nov 2021 03:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LRb0GDlSRdZMU3P77OMMde0xfc8XtV+5XmpMPMMwMy4=;
 b=ovNz4UAWnkb+ryC6U/5yiNVHAypaSNz7sHCugKFAz7uzrA2pk+IADc5XF3/zSBwS7n
 /5KnB8+gvqIGmPWYovFodcxmyxphfdX1WT2QaN9sia12yCbFZsQBKxhvLTTi6eVEmlyf
 lcNBXAbfKvQAEE3EGSPimo0GrI96+BvwpYLH8UUk6h5TtsSuSBBA4uVvLTEAGg65ux2M
 Rp9cEMq6BbLvhtNst47/NdV9m1IN94D6JqdgQdV+nZDWIv758q+NTCxjrI4RUSb4UFHD
 tOBW3wz/cPgw9NV0urOm/+hWPsfUc/q+6uw0PM9mXt0G110mU1qrrV6eRFLP+YzLuiZq
 qZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LRb0GDlSRdZMU3P77OMMde0xfc8XtV+5XmpMPMMwMy4=;
 b=k+nFWww3kNq81d/Z9ZzcSUaATHKKX96+oVkOOJF1QxZCfX3d5mLni8nQIzxeim3ikK
 cww1Ho+xFjBlTI3tkQrjjfLDHOwGxVAUyLXIaO3Pnl6qwgiwExMk2Ccz6ZCaqI3yD21w
 yJjUt1H91q8o8xb1iafdQNMDYz3XOF3mInsKOgZbD2vO2TU85IoyJjkoOGLzhL/G16gi
 0pJniY8qrcBdaSzTUMQh8l4pTFQF6sz6YC5AfEZWaWkS3eGyhDw1S5VrHvLBB1Rt/6xZ
 m/TvmoGnsEnxEg4qngnKnQn5NUW4NoNoQw8AFsDR3v3EMBXXNlM90rkcQBojhHEeyWLB
 BpfA==
X-Gm-Message-State: AOAM532cgdmUqWvFIH5XSVaBmJoKXJYF/IBR+L6QPwxKp7Hav4zBCHvb
 tBQuVKvn599o0e/W01n9ll7yQJZYiNi6q6DTdfk=
X-Google-Smtp-Source: ABdhPJxnJX92aytUVKG7xRbpFteXLx9rFZD7saOt9wURAXTC0H4BEhBp3XjqKaZwHgBieoEEdt5fvd2tGLGpV2TdX6k=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr4598363iow.57.1637665767247; 
 Tue, 23 Nov 2021 03:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-7-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKOFqe+0n--MkUyw1V_ncsktX_qSHQU6p6r+OqWf-t6g=w@mail.gmail.com>
 <8be6502a-6118-9383-683b-fdbc443a5feb@univ-grenoble-alpes.fr>
In-Reply-To: <8be6502a-6118-9383-683b-fdbc443a5feb@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 21:09:01 +1000
Message-ID: <CAKmqyKNbR=kv5kY-sOLGH-cxvoMf08HC0y51CO1R64RZRQnwog@mail.gmail.com>
Subject: Re: [PATCH v5 06/18] target/riscv: array for the 64 upper bits of
 128-bit registers
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Tue, 23 Nov 2021 11:09:30 -0000

On Tue, Nov 23, 2021 at 8:58 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> On 23/11/2021 07:09, Alistair Francis wrote:
> > On Sat, Nov 13, 2021 at 1:07 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
> > <frederic.petrot@univ-grenoble-alpes.fr> wrote:
> >> +static bool rv128_needed(void *opaque)
> >> +{
> >> +    RISCVCPU *cpu =3D opaque;
> >> +    CPURISCVState *env =3D &cpu->env;
> >> +
> >> +    return env->misa_mxl_max =3D=3D MXL_RV128;
> >> +}
> >
> > I think it would just be better to use riscv_cpu_mxl() directly
> > instead of adding a new function here.
>
>    Ok, thanks.
>    I was doing that because as Zhiwei is progressing on the dynamic handl=
ing
>    of xlen, in the end the "current" mxl could be different from mxl_max,=
 and
>    some state to be saved might live in the registers upper 64-bit.
>    But you are quite right that we are not there yet, so I'll do that.

Ah! You are right.

Ignore me, what you have originally looks good!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
>    Fr=C3=A9d=C3=A9ric
> --
> +------------------------------------------------------------------------=
---+
> | Fr=C3=A9d=C3=A9ric P=C3=A9trot, Pr. Grenoble INP-Ensimag/TIMA,   Ensima=
g deputy director |
> | Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angus=
ta |
> | http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.=
fr |
> +------------------------------------------------------------------------=
---+

