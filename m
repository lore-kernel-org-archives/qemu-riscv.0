Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mplgf-0003tc-4f
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 01:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplgb-0003rI-FX; Wed, 24 Nov 2021 01:23:18 -0500
Received: from [2607:f8b0:4864:20::d34] (port=33504
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplgZ-0003Fk-Mw; Wed, 24 Nov 2021 01:23:17 -0500
Received: by mail-io1-xd34.google.com with SMTP id m9so1905384iop.0;
 Tue, 23 Nov 2021 22:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5JwIjRRfLFC5KNEVUe24jaJLfNyEtLz/qEFITb5SQsY=;
 b=U9eHfRaNFDZwTaV3j46RRlYDq2LdTI8sceDbmksb7m2uLA5oBE9r7C25gjj8AwWnNu
 nSRzqvJtO0tu8RfBg8TeeVaeZCUEmoJLB2ZK3nXFUT3UnReyIZUOvGu8RLVQnZnaAGIl
 qPwG1zotrmxm0EGYv+HtnDTHO2nOTzcTIT9FzJXqCTLh8IUwrOkug3AfIjhGVUiTPaLv
 DKKSrXDtBMlAwW5/7Sts26375QGoUZE2CKlLrE5FsFI2VjmqFmZV1bfTvXaOawVTRzJJ
 zfk5q1tl7PEwI3uDfZr8VHECqmnDON2GZPVgpEcOVV6otU12zQQs0LjJ6z8iBF68SQF0
 ukjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5JwIjRRfLFC5KNEVUe24jaJLfNyEtLz/qEFITb5SQsY=;
 b=PAoHOeH3S9o4VCSqVAp6xYtKqq6uTDSVDWHluqESJmbfs5zfJQxiC/UoToskGxp6Wz
 g9zu2Dxjsy5N8y9u4Ls09YyatYR/H/aUXFRe9xTjGLdynEucbO3ZHgc5mCOSqpX5aa4x
 nk0pJ1eeY5zKE/iWWhMw6CA3rY3Nh71GWwuPMjS9N4+/haQOTB7jpek7Mw/TLIa6WPV9
 NBQ1vsG+8FuEHdxnUkhMhfPbERweqXMieFC+qFtZKZtFd1VWvTcyxdMhf7QeEWfd2JDU
 hnzTriD1qQ9wm0lGR4kJeqWqb5CLiL1veu+Q8wvi07A9JKgOIuSYG+yH+qdLlB6TMXcs
 Y4sQ==
X-Gm-Message-State: AOAM531rqECgqT42h0vRak6WQnOdYcUUjo8hEUKZWZsqPWe+8mqmkGYx
 BoPSWmVMOr8rvOWB3SX3SClQynAXIrZME5Om0As=
X-Google-Smtp-Source: ABdhPJzBtF56lY+KXnv5VxiWuUJIhy6QuT2bHbyE7EhlACjKWdMpFK2s71K0JF0msGluRhcHMaQFOUXK+/tsyCdRubM=
X-Received: by 2002:a05:6638:148b:: with SMTP id
 j11mr12571493jak.114.1637734994212; 
 Tue, 23 Nov 2021 22:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-16-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-16-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Nov 2021 16:22:47 +1000
Message-ID: <CAKmqyKOv25FY+jLNSwNVf2oS=pp2S+uVGAoT-nFd4qQROwFePg@mail.gmail.com>
Subject: Re: [PATCH v5 15/18] target/riscv: adding high part of some csrs
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 24 Nov 2021 06:23:18 -0000

On Sat, Nov 13, 2021 at 1:19 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Adding the high part of a very minimal set of csr.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     | 4 ++++
>  target/riscv/machine.c | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ae1f9cb876..15609a5533 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -195,6 +195,10 @@ struct CPURISCVState {
>      target_ulong hgatp;
>      uint64_t htimedelta;
>
> +    /* Upper 64-bits of 128-bit CSRs */
> +    uint64_t mscratchh;
> +    uint64_t sscratchh;
> +
>      /* Virtual CSRs */
>      /*
>       * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 7e2d02457e..6f0eabf66a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -179,6 +179,8 @@ static const VMStateDescription vmstate_rv128 =3D {
>      .needed =3D rv128_needed,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
> +        VMSTATE_UINT64(env.mscratchh, RISCVCPU),
> +        VMSTATE_UINT64(env.sscratchh, RISCVCPU),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.33.1
>
>

