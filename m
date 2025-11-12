Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB23CCFA18
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 00:58:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIzBl-00016D-St; Tue, 11 Nov 2025 19:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIzBk-00015M-T1
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 19:58:20 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIzBj-0007Aq-9k
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 19:58:20 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b7272012d30so47711266b.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 16:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762909098; x=1763513898; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlJOSdY9gejfEjf0mcm+BMw5d1pO7d3fxtdUHg7SH4c=;
 b=RqalWcbFAAkQwI5qFAhg4mmCwZgiAb0Pcj4Eb3jRERUhKknN4Xa+h4A00qz8Jo7yIJ
 wL4MaD44r+OSHB+tSXRswc8IvpOYcN0g5aBvK2NE7O4a2THNrgNzb4JKoTEt7ikzP9pn
 fYGsDqM/RS16GIuGgpEHI1Hood55kufSLbWXOYAj0CfFhtviAK/86rCxnP5Ag3D+PYV1
 kCVxvcFRsQUqch866/WlLrKnrv6iMNl17fV3jwRfiC2n2hj0YgKMC6q3sXnsu+1WOFeB
 QRKYvZO07+hQkDMlI1NDt4tzPrtiGkdhuklGg8TYJm0Wto7IId4KOUk60UxVJFZquljc
 Wqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762909098; x=1763513898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlJOSdY9gejfEjf0mcm+BMw5d1pO7d3fxtdUHg7SH4c=;
 b=sFa2Op0HgdfvnPpSOqL9MV7pkx8RSAmOjt2WJPaH1BVnyyu95QSo7w5/beh7NyF3qs
 Xz01j+yPnoqcxjq/rjPnz1Kjin6HerRVkFfWSNq1oTDl52M2MhwKyuiF6enzHy1PhL6l
 N8X+Cf5MGQrA6jfYj85ZnEsfWODvpLXd688P4h2HYbRfsw4G0nXGJEwsfgSAbZhunSW7
 b/FnVxHaAqHcUC3Es8J7Xy3uvG20kRnlaIijc2MDhpIn6A/ImvkZepjk+zTFIxgG2Zui
 TwJfpwukaXGdNPJ+A96o4XLk7sl+re7mRFxCBWyjUyRJEdi4SN0np2cgHqUtBpren+g2
 +6Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJxzoHG6W8q9Cb4uvGe2D3cAaWAgukujuynLPhslybw461EQebuuoMWNV8b2ZLkGac+oFVPVBE6w2a@nongnu.org
X-Gm-Message-State: AOJu0YwxTuvL6sVrf4JWRKH6SpvNY46i96nVRqd5LQ247dOeB09KulSV
 xszD3Zd20FU0Yu3RX2ciCegtmY0FbQv2XhuVnj6ip5vWcrVDXQy9YuJnFmdRvwafMoaP76zVgr7
 bwxnwQVBh5izZdyXf7YxlYUf/ItniejU=
X-Gm-Gg: ASbGncvuYAMlFw5jPqQRwAuVZlisK0VUZ2NFj1iAKmeGlhS6BncoIq6/D1OhOxtD3h8
 nchvrIACbdk1OrwvxdC5pm9cB8Z8W536nJxpma1knKn8xftqNUs3CJ6LDnAz9hlmPmS6SWizhDE
 qvwhe92rkd5EypUSCqktWp4mBNCROZjoR9WqhyUaicdo07385NztOSWbH5KgNA2i5k2BRxOOYn0
 nOnmkZg9a1hT+KmiFX3mCWWOHP1GSTn9/lCxD0AOvEUEIdsvLjdqntog+5u/6vnCq/tg4h2xgV2
 AvpJfLk7EHnRUsyMRqhMoEjPzA==
X-Google-Smtp-Source: AGHT+IFBz152kEYQZ37uY2dGr3TrxsIba/lsFOaY7WudRrBOw+39emgZnBS1HkKN/ptntZMoJVfRJVBlXUMjRrSYNaI=
X-Received: by 2002:a17:907:9487:b0:b72:58b6:b263 with SMTP id
 a640c23a62f3a-b7331aee8f7mr94546766b.60.1762909097580; Tue, 11 Nov 2025
 16:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20251029-n-novikov-aplic_aia_ro-v1-0-39fec74c918a@syntacore.com>
 <20251029-n-novikov-aplic_aia_ro-v1-2-39fec74c918a@syntacore.com>
In-Reply-To: <20251029-n-novikov-aplic_aia_ro-v1-2-39fec74c918a@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Nov 2025 10:57:51 +1000
X-Gm-Features: AWmQ_bkaoLxAVMDLLvicO39mTCevACWxa5m4oZX8oNl8sGHAYm3oPFWQRVorxjA
Message-ID: <CAKmqyKMj=eLX=ZoruFUXAN2cCtii3tG_47seibneU_mV+Zu2Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc/riscv_aplic: Factor out source_active() and
 remove duplicate checks
To: Nikita Novikov <n.novikov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
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

On Wed, Oct 29, 2025 at 5:19=E2=80=AFPM Nikita Novikov <n.novikov@syntacore=
.com> wrote:
>
> Refactor the APLIC code to consolidate repeated conditions checking
> whether an interrupt source is valid, delegated, or inactive.
>
> Signed-off-by: Nikita Novikov <n.novikov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aplic.c | 44 +++++++-------------------------------------
>  1 file changed, 7 insertions(+), 37 deletions(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 8c3b16074cd3ca1bc3004cfaaa13f34b8860bd48..ccfbc9b4656f3e2a69eb5bcd1=
cee9e5762020351 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -216,22 +216,13 @@ static inline bool riscv_aplic_source_active(RISCVA=
PLICState *aplic,
>  static bool riscv_aplic_irq_rectified_val(RISCVAPLICState *aplic,
>                                            uint32_t irq)
>  {
> -    uint32_t sourcecfg, sm, raw_input, irq_inverted;
> +    uint32_t sm, raw_input, irq_inverted;
>
> -    if (!irq || aplic->num_irqs <=3D irq) {
> -        return false;
> -    }
> -
> -    sourcecfg =3D aplic->sourcecfg[irq];
> -    if (sourcecfg & APLIC_SOURCECFG_D) {
> -        return false;
> -    }
> -
> -    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> -    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> +    if (!riscv_aplic_source_active(aplic, irq)) {
>          return false;
>      }
>
> +    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
>      raw_input =3D (aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0;
>      irq_inverted =3D (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW ||
>                      sm =3D=3D APLIC_SOURCECFG_SM_EDGE_FALL) ? 1 : 0;
> @@ -284,22 +275,13 @@ static void riscv_aplic_set_pending_raw(RISCVAPLICS=
tate *aplic,
>  static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
>                                      uint32_t irq, bool pending)
>  {
> -    uint32_t sourcecfg, sm;
> +    uint32_t sm;
>
> -    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> -        return;
> -    }
> -
> -    sourcecfg =3D aplic->sourcecfg[irq];
> -    if (sourcecfg & APLIC_SOURCECFG_D) {
> -        return;
> -    }
> -
> -    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> -    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> +    if (!riscv_aplic_source_active(aplic, irq)) {
>          return;
>      }
>
> +    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
>      if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
>          (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)) {
>          if (!aplic->msimode) {
> @@ -370,19 +352,7 @@ static void riscv_aplic_set_enabled_raw(RISCVAPLICSt=
ate *aplic,
>  static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
>                                      uint32_t irq, bool enabled)
>  {
> -    uint32_t sourcecfg, sm;
> -
> -    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> -        return;
> -    }
> -
> -    sourcecfg =3D aplic->sourcecfg[irq];
> -    if (sourcecfg & APLIC_SOURCECFG_D) {
> -        return;
> -    }
> -
> -    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> -    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> +    if (!riscv_aplic_source_active(aplic, irq)) {
>          return;
>      }
>
>
> --
> 2.51.0
>
>

