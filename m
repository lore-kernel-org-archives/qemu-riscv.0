Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocnqh-00036D-Nz
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 09:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ociv9-0002y1-2f
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 03:53:02 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ociv6-0001MM-KR
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 03:52:54 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 198so7347528ybc.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Sep 2022 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=EGB7+yjzj15PYb2o1+bxGEGrruR/uJhwcRRBQRBNkKs=;
 b=izo9hBKMrhHlXLE/RYKjOoj6FyESH8ne7N9S8rbLI1YkFQ1ShBu9hWdrDCdu9IJ+RE
 H1UZ5c3Znc1k1UI9VdGGVWyCW8eTA0QLiGy8rGDE9XuUQEbXyc38zeDkl+shkCZTaUMN
 b1uXY/9OK2enHccdApgipYVPD2b+UW6kMUWZy+tR4YAvoo3LAypNF5c4d3yo7ziRqZyf
 BdoyQPZ7KeWDslfdL4ylcbwhWxX4yDt6jhUJGBzzJLkdmu+CVPTJyc7W6JVLAjxEjalD
 neYAPTWARk9JyQfcQEAgl4BJTO65Kix+VaI88MBCdMgOfkAS1z0MkevfqXcFs+hdzqSA
 i+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EGB7+yjzj15PYb2o1+bxGEGrruR/uJhwcRRBQRBNkKs=;
 b=LPCNcC84ifvJ0T+BLjjbAPYR2hGhirT0fl+4cKncyhm3iuooLkDJqWO1fWfVhupK+1
 DhMAB6HCiviWL3NOn+Uj0BN/kLzy8OR0Kf7cUnVzkhArVe3MmKKtyE+MKOwmGxNeWsV0
 hTX7gsrnSFBWqI+lYsn/wZ/DwR0YLqwYDAvbdpTBrUX/by43uFfFLXqUDJCzbCNtE6Rc
 rEqOSHmz0cyJBfkvRFyZUafk7kCLa41K+Un8IK6Th2Nm39UApO1GPV7V5T08EDQzV7aH
 OUxsjOH4rx/ZLNfgjZK5uADX5Vcof4qP1AXObAt3ScNmQq/f817npshf16Lvqf3QU12b
 4Edw==
X-Gm-Message-State: ACrzQf2AkeemFXTRynFAoM9kKBge7DfLHL2NCKVy8plNjmAyz3R7Vh5B
 8vdfZCOeBkFwgANKPlMLhIP0dlWsGHWMxaotsIpBDW4CjpzBKA==
X-Google-Smtp-Source: AMsMyM6s5uCAGzIda0dfhDosF2DPTnohVheNoVXMe9fvp7IwUrpQHBQZCKtObVtyxWnUCzyUI1OiW+/TRAmxayk57tU=
X-Received: by 2002:a05:6902:692:b0:6b0:4102:3600 with SMTP id
 i18-20020a056902069200b006b041023600mr21046974ybt.450.1664178771136; Mon, 26
 Sep 2022 00:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220925132010.5336-1-jim.shu@sifive.com>
In-Reply-To: <20220925132010.5336-1-jim.shu@sifive.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Mon, 26 Sep 2022 09:52:40 +0200
Message-ID: <CAJ307Eg7xYVKY3Yr_+BDedX0gzuCAm2RdcS5rFMv0N44+J++sw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: fix hard-coded max priority level
To: Jim Shu <jim.shu@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-riscv@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=chigot@adacore.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Sep 2022 09:08:35 -0400
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
X-List-Received-Date: Mon, 26 Sep 2022 07:53:03 -0000

Hi Jim,

On Sun, Sep 25, 2022 at 3:26 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> The maximum priority level is hard-coded when writing to interrupt
> priority register. However, when writing to priority threshold register,
> the maximum priority level is from num_priorities Property which is
> configured by platform.
>
> Also change interrupt priority register to use num_priorities Property
> in maximum priority level.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/intc/sifive_plic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af4ae3630e..f864efa761 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
>          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
>
> -        plic->source_priority[irq] =3D value & 7;
> -        sifive_plic_update(plic);
> +        if (value <=3D plic->num_priorities) {
> +            plic->source_priority[irq] =3D value;
> +            sifive_plic_update(plic);
> +        }

If I'm not mistaking the documentation [1], these registers are WARL
(Write-Any-Read-Legal). However, in your case, any value above
"num_priorities" will be ignored.

We had an issue related to that and ended up making a local patch.
However, we are assuming that "num_priorities+1" is a power of 2
(which is currently the case)

-        plic->source_priority[irq] =3D value & 7;
+        /* Interrupt Priority registers are Write-Any Read-Legal. Cleanup
+         * incoming values before storing them.
+         */
+        plic->source_priority[irq] =3D value % (plic->num_priorities + 1);

Note that it should also be done for target_priority a bit below.
-            if (value <=3D plic->num_priorities) {
-                plic->target_priority[addrid] =3D value;
-                sifive_plic_update(plic);
-            }
+            /* Priority Thresholds registers are Write-Any Read-Legal. Cle=
anup
+             * incoming values before storing them.
+             */
+            plic->target_priority[addrid] =3D value % (plic->num_prioritie=
s + 1);
+            sifive_plic_update(plic);

[1] https://static.dev.sifive.com/FE310-G000.pdf

Thanks,
Cl=C3=A9ment

