Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaDZ-0004N4-VV
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaDU-0004LA-5k
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaDS-0003AF-Rt
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:39:08 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40020)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaDS-00039c-6M
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:39:06 -0400
Received: by mail-ot1-x330.google.com with SMTP id r19so1771869otn.7
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ttFRTy1miBphiIkRdmeJ7d7lmPHn2JFJgTlTt9y5xDY=;
 b=oy7ZsYMiDp5Es2IvFowVFh0nr4+ydviKOk/cJWOGWV5G+4UZRor6v6j5BnVXyTDQAw
 qpU1jNIl9XhNxR270tB+3awACdQY1r4P++FIVs6Lo0ILF1gPhqIqvd5mFPHRupPdaYSA
 D/iQ43oXoU7RDdcGDg0B24Pt7TMnj0pjNbevqM9Ghc/YVjO1fJRnJ+JFZuzq2fMmpxlh
 1TsShaNqjV9qNHBtkeGGWtvi6H6Jvp5kWS3pW8gf/yTUyrV4ihYcAZYe/ptsDR6pmYBH
 Q1fs90oCKS/D0oCmhg/oeooj2jorB2nHEVa9ZoxRW5od8NRNy7LUAzQMegm32ikfkyvX
 89QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ttFRTy1miBphiIkRdmeJ7d7lmPHn2JFJgTlTt9y5xDY=;
 b=Xqz1bQQcRunJgcDzkypBJNwYKDv6JdsHo6VpOPHLPqW7OdcTOWsTVt/WEPwZZ/tTxw
 mEX6cnSUlGDSCmPl3G58SPZYY3lrrafEeyyB1Nt6pSE3PXsFgGWAadkEFZEq3RwCleLQ
 kBvnQBbcjFZ/6wXzixPmh9SX/BUjIqn8uchqYlPKcLkUHknvxTjtb8/nU3swuimgu1Tz
 hOz4dk6cYhfvwJ78GWDowa3qC11M/BgvUT3nyoM00OyfoiNVPQWr/6vPDLnTQle7RexA
 R1yVBobMi1JLUlEvmOkeAXgYa5nGMdHXtlehhbHTIvScgml66pgyuvOgdz75BF9RxMBF
 8d/Q==
X-Gm-Message-State: ANhLgQ3qKxh2nlbfEMVkZELdU3toiVBJHHwbIdPQwOmgIPbcSa8+Eet9
 AYEr7oA5BwK778IhdpfZmZsqf7KhrxRmcU/32B4MTg==
X-Google-Smtp-Source: ADFU+vsr5IzCSl9lBQiEgE2XocyyR3ZWLPD05jdlPB06nPoyvel5brs0CtYjgJGaAaTtMs341LbocOOpyzqiC2yYx9E=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr7656604ota.221.1585258744877; 
 Thu, 26 Mar 2020 14:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-6-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:38:53 +0000
Message-ID: <CAFEAcA97j0LD__A4eSkf1Aq2GpcQ5up1e76Hwfcj-Dd3o6iOeg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 05/12] hw/i386/x86: Add missing error-propagation
 code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
X-List-Received-Date: Thu, 26 Mar 2020 21:39:11 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/x86.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 87b73fe33c..0a4865d4a9 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -103,13 +103,17 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState=
 *x86ms,
>  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>  {
>      Object *cpu =3D NULL;
>      Error *local_err =3D NULL;
>
>      cpu =3D object_new(MACHINE(x86ms)->cpu_type);
>
>      object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>      object_property_set_bool(cpu, true, "realized", &local_err);
>
>      object_unref(cpu);
>      error_propagate(errp, local_err);
>  }

Hmm, not sure about this one -- in the error-exit path
for failure-to-realize we object_unref(), do we need to
do so also if we error-exit for failure to set the apic-id ?

(Since apic-id is a PROP_UINT32 with no set function, there
is not currently any way for the set_uint to fail, as it
happens. But we ought to either have the error-propagation
right or use error_abort if we truly believe it can never fail.)

thanks
-- PMM

