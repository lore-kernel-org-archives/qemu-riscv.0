Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3885CD6E68
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 00:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUZkV-0001T0-Te; Tue, 02 Jun 2026 20:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZkV-0001SU-2e
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:46:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZkT-0004Oj-DY
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:46:22 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-bec4639953dso563697566b.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 17:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780447580; cv=none;
 d=google.com; s=arc-20240605;
 b=bTbuh/hcioNVcARblEad1z4teRk6Nfg5qwO6VXsXg8WvlLBkZYc1v2+Bqlywic+AJD
 yW6xciGzuxEp8gNf8dSUlN1GB7Oge8jsGeUygclBu/mnhRzvRiDemc4mjuI0Pz0fIi1X
 zj1dk4ReZkkKvxp+UZEW9MxC0uy5ctBSZm+bY6HwY30wCsKA+7btubWcaRAeoeoBIk5k
 7GIUKYHsHvVUFP/w0Vuopk2068GqQMZbzjXQfx2RAmsdaDyVWxYyvr4zTYoYOVw8mMNp
 ThGt0AW1F3VID+7j1nwEulo2vwtHoOfk3mR/ydu8w1gVD2GWM4JDHHLpvHPqdUoyzGZu
 sAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mV72vRjRa7b/Ga7RHTw4kOyktIkyYNiqpq2SKCB17Qs=;
 fh=QdKGS1hY8MpAX+cGNv8IaAdUOLueh4f+6nxoRAHh1Cw=;
 b=OVm/VZ3PFwC4l96jKgk9xtVjDu1BSTkD/ETSbTTyoYrD3KunshtA4ppNe4Mg9VRfCf
 FtFr/76CMMy1Ch2RvwUBgkULWUJWxi+33uMEgK6oX5NlKuynr+yvUgXzNQXeReQ6MnHT
 8KcKIybISluzW5Go6JzcnVdOqBUo6ShCETur5bak0qsBMgYxljOv6XWnd4ZMYxdI4XO2
 SG0OdX/i7IomT6u8PRm02V5JGmLnKxOA1vYwOEQbCu4Xu/GLgTBGQQhEvruO5tLO7Q74
 CBC1KQGVGgS9iuwiEVGIgbL8El051mY+Jn6RULLY92/Iv6/qV1MXWr4qUcBUxwHrh+Fr
 WQUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780447580; x=1781052380; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mV72vRjRa7b/Ga7RHTw4kOyktIkyYNiqpq2SKCB17Qs=;
 b=dBT556JuPlkm5fNhQF4S+LStlHrJyeTQ/7xgqp7UTPAzAsP8vRYEPeAnlTnQhxA696
 GdwTE9xhn75P5WDPS+tLz1J4v1t2pLy1yN/e2e5xvekDOH79KwhbfM1j75CReo8I7qS8
 MPHDTMkcFK5oUpmzkSDCpbhhWR/m6XRWhH3leybagzsNXJ8xMCmUyMlEqGcmSFFmbS9P
 uNE8uINo+xDyItop6sQHkYr8oTfchsnzLACw5UFNI2I/MFy8kCKtCzRHd0zbdXo6vx9C
 eLPGu6W6QwGlI/+wytlLFZQ+kt84eqa4HEu8Keld6QNM4zykxMIxslcTzIqFwbooRiwk
 HmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780447580; x=1781052380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mV72vRjRa7b/Ga7RHTw4kOyktIkyYNiqpq2SKCB17Qs=;
 b=aogyjlOmj/m14sThJaaEJNWwrDsBRR4ns9hDxpUgDl2v1fC7+rW+P5sQtBPIovQ86t
 0iaXFOCCw99Liqi7FisvIeQmMTx0knqGMDGuqS+THV9IaFG4G4wBKBbNovPIC3FHEt4p
 wFi2Xa9ZBBNuZOkPnxvcRQNjlLs49K/0izCDra1AlI8BbdqWHxzOgCvmK8xpHh0DP0mK
 Gu5M52LRyDglpOqLF6f/qpjJDDfWzgxlZEGF1fx42ZynM3r4RYVzWva/+Ycbu89uQ6lb
 k/cfLmY0hYpkg1QgcmjSk4Pc4IJ6c3GSvDrSEh2jSZRXQ4HGTBPF3xAmu+uGpcVae2ON
 pYzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8TDxjVWng4gY5dEx2J3/cgyHZb+P46FFfdJM7r67/yVz31iXR6vEeoNaK5FQL/t9kN1PKFupeyZUK7@nongnu.org
X-Gm-Message-State: AOJu0Yz32T/RKpbzCMwMRI4Jc/1yaiOq6oBOS6nF8kXUXa08F6YfOb6S
 moTOjfoilOgNI0VOAKSJT0GAt5/rPdscGw0+j7WKZ1A7LMY22PPg2w5Sm+Kng4ZhzvTl2ivX/zX
 dgReL16bgijDff3KNR2k7CzUjvRX1Zco=
X-Gm-Gg: Acq92OE5zSGU9OnyxyALFnirhNbnMlskptLdpMMJzTcYLVV8lgD8R0YW9YtrdICuhrR
 VJKoJRVYI+0vDQFtrDUrcAIeiS78CPzOpV9i4ha68uMS/kyhrxNN+KfH+zbpDdpojbizXZAW0p0
 hmy4baMfe48fqqt+nAfCKGCmDl8kkt4cyxhqTD4ynmEykp7NW1apebZ+idyORP47sHzk+J5QuSp
 bZbC/McQtFiooEe/85znms8tPEyIFF6Rt+gvtCt8ALQ6Mdfnp0JwvvmKl7+sJPc1w1G2cdwXkZD
 /TlX6MvSVwW2c/qXP/TiG8C4kiluX+QfIWUJiNy3bLXIAqdm
X-Received: by 2002:a17:907:7617:b0:bd5:7c2:70ca with SMTP id
 a640c23a62f3a-bf0b43925acmr22548966b.48.1780447579730; Tue, 02 Jun 2026
 17:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260529053519.1224019-1-antonb@tenstorrent.com>
 <20260529053519.1224019-2-antonb@tenstorrent.com>
In-Reply-To: <20260529053519.1224019-2-antonb@tenstorrent.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 10:45:51 +1000
X-Gm-Features: AVHnY4KT0oif0oYLcwiuVQd0Z8KUkO7Wa9ceFZeUhQ54YgGOOsnlvzXZTFF3UDY
Message-ID: <CAKmqyKNY0625bsGo1-k2zYrP+SiQ=Yatuer9t3+FtoYfk5bD_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Improve alignment in
 riscv_cpu_dump_state
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x634.google.com
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

On Fri, May 29, 2026 at 3:37=E2=80=AFPM Anton Blanchard <antonb@tenstorrent=
.com> wrote:
>
> Align all the CSR values. mcountinhibit is the longest CSR name at
> 13 characters, so use that width for PC, implicit state, and CSR names.
> Also remove the redundant '=3D' from the implicit state lines.t
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> This makes it easier to read the output in my eyes, but I wasn't sure if =
the
> format is set in stone. Feel free to drop it if so.
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b38ddc39ea..883aa906a1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -575,7 +575,7 @@ static void riscv_dump_csr(CPURISCVState *env, int cs=
rno, FILE *f)
>       * to do the filtering of the registers that are present.
>       */
>      if (res =3D=3D RISCV_EXCP_NONE) {
> -        qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +        qemu_fprintf(f, " %-13s " TARGET_FMT_lx "\n",
>                       csr_ops[csrno].name, val);
>      }
>  }
> @@ -604,17 +604,17 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE=
 *f, int flags)
>      uint8_t *p;
>
>  #if !defined(CONFIG_USER_ONLY)
> -    qemu_fprintf(f, " %s %s\n", "priv   =3D  ", riscv_priv_str(env->priv=
));
> +    qemu_fprintf(f, " %-13s %s\n", "priv", riscv_priv_str(env->priv));
>
>      if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s %d\n", "V      =3D  ", env->virt_enabled);
> +        qemu_fprintf(f, " %-13s %d\n", "V", env->virt_enabled);
>      }
>
>      if (cpu->cfg.ext_zicfilp) {
> -        qemu_fprintf(f, " %s %d\n", "elp    =3D  ", env->elp);
> +        qemu_fprintf(f, " %-13s %d\n", "elp", env->elp);
>      }
>  #endif
> -    qemu_fprintf(f, " %s %" PRIx64 "\n", "pc      ", env->pc);
> +    qemu_fprintf(f, " %-13s %" PRIx64 "\n", "pc", env->pc);
>  #ifndef CONFIG_USER_ONLY
>      for (i =3D 0; i < ARRAY_SIZE(csr_ops); i++) {
>          int csrno =3D i;
> --
> 2.34.1
>
>

