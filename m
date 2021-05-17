Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lilt3-0004He-MN
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 18:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lilt2-0004Gj-16; Mon, 17 May 2021 18:38:56 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lilsn-00033E-9q; Mon, 17 May 2021 18:38:55 -0400
Received: by mail-il1-x135.google.com with SMTP id z1so7505542ils.0;
 Mon, 17 May 2021 15:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zoFFE10DYsTBXBI+yYki8pfr6+B/a9aZGVKnNngoRjc=;
 b=MXqd4nrgrs5KJJi3ulKRRjZaUVrd6ks4UZOWRPrcdDNBuewYWLaKERTOMvCnOIoV4S
 U2qn4umwKEgjO/czGJumiwN9ONXXtzsmBoY69Bt6gAWg63XIQhe0eFkRM3kMbt4ycq4p
 9iUckkiKFyikXOOkqPeMa+qcJspN4AAULhMbf3Ch3siu4os3ndqFAkXJRnSTCkBW0ZXu
 UCBb9OWRfbNgrvPgFF6FOHgyupsiIDAGHCg3CSHph/rJSWEUlF1sxx8RgFpTyoezqM7K
 u24SZUufZJibA7gG+Dq7+ped2RpC+st5KSE9ettTfUUYD0Qfnp7oJLdjeBXLldj2xlkI
 B1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zoFFE10DYsTBXBI+yYki8pfr6+B/a9aZGVKnNngoRjc=;
 b=XBG1kyfFgCsP8779kvXsrQbFh37mZ5TfG68lddScKEZuiLDCggAPqwf0LMWgOmYk+2
 ppCSR1SEf4Kgs8YYxph5Sg9Z8+juxKUi+NdOwkRFGcO9KsEJgsJGoro85bbXEeDJjohw
 yhCPmgmZel+WbG7bEl+0VISx54tMnN2NnwPb7vetJd5AnuWKhSup+dI5d56SdaskwE06
 fbUt9G6uORtRl6VPMUzpF6j+ZYLpVsew/SbwaL387o9naruteAT/45u++2sVIh8DbtQ9
 28KgBbElf/jsQ91OGAb7hXVIbftt4Wbtz5Steo0ylJ6ub8RrUQ92ird6ny9i+ObtO6Ds
 CijQ==
X-Gm-Message-State: AOAM532Sg9BjU9bGGfivFE8qIJNDPDnuuGE0eRFuifs3sHaMdkpsLqFB
 baXb+FI0LmCP0w8OSEHXD5E+fVHIFbmohJ6J5zg=
X-Google-Smtp-Source: ABdhPJyfqP41Hz5fVMikPvQA+msmLmdZwncldf2dB7t7HyJAUIjuqJoOY3xv0O+hzo7+08P0IGbSYXdYe520lFFrx0I=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr1620286ilt.267.1621291118400; 
 Mon, 17 May 2021 15:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210517070851.857841-1-f4bug@amsat.org>
In-Reply-To: <20210517070851.857841-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 May 2021 08:38:12 +1000
Message-ID: <CAKmqyKNya4DfidO-9baQnE7=rV_XSKxfujoVRaukvB+SGJ_b_A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 17 May 2021 22:38:56 -0000

On Mon, May 17, 2021 at 5:09 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The RISCV CPU is migratable since commit f7697f0e629
> ("target/riscv: Add basic vmstate description of CPU"),
> so remove an obsolete comment which is now incorrect.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3191fd00822..d459e8427e2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -638,7 +638,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      cc->disas_set_info =3D riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
> -    /* For now, mark unmigratable: */
>      cc->vmsd =3D &vmstate_riscv_cpu;
>      cc->write_elf64_note =3D riscv_cpu_write_elf64_note;
>      cc->write_elf32_note =3D riscv_cpu_write_elf32_note;
> --
> 2.26.3
>
>

