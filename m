Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802EDE95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpf2H-0001ck-By; Sun, 08 Oct 2023 21:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpf2D-0001XR-3m; Sun, 08 Oct 2023 21:26:14 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpf2B-0002UG-Ew; Sun, 08 Oct 2023 21:26:12 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-452951b27d0so1644516137.2; 
 Sun, 08 Oct 2023 18:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814770; x=1697419570; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEeigqdfh74QXrjK7T9Uw8kTR79+w3BYg+J5h8uM8Ls=;
 b=K47epDJduRDPS0Xxtnq3bceBTeTYoV1Vm/4KWCbb78YgD22kH6565E8I82giZgtS9T
 UlJF3sSlZ1D9Ay7LDAkwudO96Eg3goEWPGBpg+HvoTXcC4nm0gJubblodd/ufzrZedZs
 o69hNx5tnt0flvsONM3tOjGqZq3NevgmqRn7+2SLw14HKzxRysKATRLu6FSwlmPXZxa+
 illo5wtW7RfsLkUfIBsEinHvNfYX5eZFOu3gx1uoDzFHSYkTNR1jtCEKYDLfq57Szibq
 yQgPWtT4ANm/8BThNIqF68hVOp8p+w425xb1rRackSqicKCmvTTd4Cs/2hUDHgIFrmAc
 zLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814770; x=1697419570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEeigqdfh74QXrjK7T9Uw8kTR79+w3BYg+J5h8uM8Ls=;
 b=AKy5WKlnQpOfIiR16euZS7zKg4QpdjotCrBWWJioAFehzA7lXIYUXE69tbLL0E5z7z
 FDSlWGdZnsEENWursTWlEQlQgP4898ir6Sv1qpEwCqlilRD/ut6Ni4TstAVztY39EuvQ
 SAlaXpcNPwEE6F0hz+XJZKMRUKkTgmIPOnKt7HY+V9E5W18bjnoCGDj6SZdqnHleaDgm
 SX1/Og5UN5+5zF2CqxVxHCiEgIbFrhWyTnkMluFjIWEKCwU8WKnphj60nVlUTw60r7cU
 sov55nWAAOrRmOl/cLNGqEttFus8o7QshVimIMGVwuWBVTakQBxma9iikCruf1/0Y3jn
 Ncxw==
X-Gm-Message-State: AOJu0Yw88hwzVN4fb7YU5RgAVktIhdcvsE8fk0ck3FRUUisySwBApkM5
 URL4N73p9jMeqpE6SUBpFPi/5hKgJZlHnMp0qVM=
X-Google-Smtp-Source: AGHT+IEklyVc0uiUwSAFdaSZNBcUqcdeZ/9M+2p4Z3wD/VcoZoLlFUZ6sWYWZieYZJCMRkUvbhW/xgCvOZP4VbOYnT4=
X-Received: by 2002:a67:ee58:0:b0:452:5fd3:15b0 with SMTP id
 g24-20020a67ee58000000b004525fd315b0mr13212455vsp.19.1696814769934; Sun, 08
 Oct 2023 18:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230925111025.543094-1-mchitale@ventanamicro.com>
In-Reply-To: <20230925111025.543094-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:25:43 +1000
Message-ID: <CAKmqyKP5kWQRUHBhHsXOFKuiB+Ac6cJGTRq9sBXsGD9G+1SNZA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: pmp: Ignore writes when RW=01
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Sep 25, 2023 at 9:11=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> As per the Priv spec: "The R, W, and X fields form a collective WARL
> field for which the combinations with R=3D0 and W=3D1 are reserved."
> However currently such writes are not ignored as ought to be. The
> combinations with RW=3D01 are allowed only when the Smepmp extension
> is enabled and mseccfg.MML is set.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 5b14eb511a..8e25f145e0 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -120,6 +120,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>          if (locked) {
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lock=
ed\n");
>          } else {
> +            /* If !mseccfg.MML then ignore writes with encoding RW=3D01 =
*/
> +            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> +                !MSECCFG_MML_ISSET(env)) {
> +                val &=3D ~(PMP_WRITE | PMP_READ);
> +            }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule(env, pmp_index);
>          }
> --
> 2.34.1
>
>

