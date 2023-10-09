Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BB9E95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:24:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpezZ-0000TI-FD; Sun, 08 Oct 2023 21:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpezY-0000T3-B4; Sun, 08 Oct 2023 21:23:28 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpezW-00020g-V3; Sun, 08 Oct 2023 21:23:28 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-45260b91a29so1479085137.2; 
 Sun, 08 Oct 2023 18:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814603; x=1697419403; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4z9HUP6uBtA2QGWO+Cy4ghfvhJeMU7NF7IJ6bKWo1h8=;
 b=Xo3ANy3Izonfsl+8aYtPyy0pfYHBkK0mqgq9zpvGtlOnwvqQ66pooE4kAtY2yUU7je
 44Lx7DpVRUQHqCHi9eit3PruWXBno1H94Z4FA7Clobz9Srx2pBFixSueIuS29P96Oa5D
 xn2ViPv/17jmNUrIZUr5OT26+6BhjJzNrH/vuJ3gg/4PWccVruSdC3eS2nkZs5TR+DZC
 YwTbm8GJWI2VvS6POHpeNZUdQUqDwCO3jUDBZkpYrdF7a6oxw3Tf7wDFXi3ac9ucIPwP
 hZQltd/f67TuGmmwhQtorIJ3PF8Z9PTgZpByoUE/fHzU2I8oxy3K6RWaLBVMJ+tIMucz
 +8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814603; x=1697419403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4z9HUP6uBtA2QGWO+Cy4ghfvhJeMU7NF7IJ6bKWo1h8=;
 b=fiX7/f/RCjDZ3zInOYi82t2gTqFB1Xd7/TIkd6809v/5EbYheomnmgv6fOLpIzWd9e
 TQ9ORBeOs5q6CAClODCHN0qWkfcppD9kLixGWHsEI9HOfeHIiG7UADxXV4kgLVn4AEPO
 uedZ7hZgJX44OQ0UVUheX+Go+Avh5YLHHiHDIWqeZufChIU6VIKQMRPH8FAI2YDWKAGA
 JsfefuZHUhTIeFaVRMvdoZRPN5nRaj/Iy3mCB1KW3YIJz7Ksq7sylwQipIjNs2r6kC56
 LmUipdXVGjCmsfzduaFnnqObMlNVvtYJej5UdpxAssMjFDY9jY8hJhSrL7MYoDxv11t0
 aI+w==
X-Gm-Message-State: AOJu0Yzdw5d8nRJ0YOpW/9FPlMfQTs/JD4WdE3hxt9uwqSa6eVSn3lYA
 3YU5hmtulsCpwlf3Lkbi/VFK864FlvnkACcur5M=
X-Google-Smtp-Source: AGHT+IFUiWz7X1f6iLQ9vrr25lJYHxnQncL4hZipiJagS9OiWiU0EdKofZT5dhkTruHi+LTisp0tmzncEby75N2wekg=
X-Received: by 2002:a67:af0d:0:b0:452:82c4:d641 with SMTP id
 v13-20020a67af0d000000b0045282c4d641mr13690580vsl.31.1696814603220; Sun, 08
 Oct 2023 18:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230925111025.543094-1-mchitale@ventanamicro.com>
In-Reply-To: <20230925111025.543094-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:22:56 +1000
Message-ID: <CAKmqyKM5qb_VPwhnGSV6HyQRhba=3AySiG8rRozOG4v04VNw_A@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: pmp: Ignore writes when RW=01
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

