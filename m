Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F832CCFA18
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 01:06:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIzJo-000447-AE; Tue, 11 Nov 2025 20:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIzJl-00042S-9K
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 20:06:37 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIzJj-0000Up-PA
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 20:06:37 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b729f239b39so50705566b.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 17:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762909593; x=1763514393; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvhMcUh+UpChbQh8PclRGyUbOeZNkjouJKlydi97Kug=;
 b=bEMtIoaOmkD3Mwh58mRwJ/+PNKYe5MYhImrrwLi6vx10+nTkv0RJ48yIFZPiNb2yBT
 EyIUT9WEoVCyKRul5NPc8d4u5bpjQvAUcXmRv1wjeRlBl2/CEp2eHVvB7E035GDBevuP
 MuiG8C0nIdVqTCHkO2/donfHEY8ZdO0R/tmkkUU+Hmk+eacSlPwEMH2PFDuZoqHAuq1S
 HVU41lDxTtUiXfJhRY/hAd8b9gEcrXkC/e9B3ilSB89lHnVqBa7PF9PwDdQqwegFEqfQ
 dY/iHNOtJHRUVc3rFobAmiTO+K4zi+v2tQUO1U+Azu5YBxHkuRE8Xq7ApwXlFdi9k0L/
 DkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762909593; x=1763514393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XvhMcUh+UpChbQh8PclRGyUbOeZNkjouJKlydi97Kug=;
 b=DDoh716LMrq5CIocE39+pUxi06iSWjwoKppS1bgSoG72qdOB7y+kUefKYK5KEf844y
 viOGj54tSqa9QUgLu9t1Q4BssDbqEU7Uuimz8WcwcL89bklSuKlAVMftZHo94a+Z9I5Y
 PWOTEtbQ6G9dcQvKLpPZj3v9Cr5qn6xZGy1anO9RVSYDvEZFsQFD2Nw3/P6AwYWPn62e
 0GT27ZGseA8ZFNBra9tku1Uyl8IzCHe1ATEJD1r/TCM5O/LzAWzRMpBsSqTqq+5NuulA
 fhkgawyGplBjCEPvDFkycpl3RULZYdeMOgRzDITOvceED5MVhVKWzIobi2v15JceEUXf
 ZGtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVek4D3soGYoZbYsF8IpXoi2T5UQEmtmfsyPlBtcj4xW1ck5uAPbVz+474+MO6LgKxpYCkWhdzqbQKj@nongnu.org
X-Gm-Message-State: AOJu0YzH8KBmJX943dxK3zMggkr+DIOJN3Od3KfHcM5Zl2YzTj/6Ovas
 BkZVqgvydF9g92Cl7/hw2/skZI7AwebTrDzb+09iosNtlg8QEBHqo4fqA7eHUumhsb/SFWO0OWi
 ht2dQA0Ddz5aiZ5Fx/9JAMoVzrBEW9Wg=
X-Gm-Gg: ASbGncspLWM4lJYtGnLsfgfSRc24TID9BuZJdKyvZS06pkr3PSOg7BOAj8hVY65hmId
 R7mep3MRBdwof/LhJ1WpHf4djB/KomAmc1AOmkLUdlTMuC3Y/GDys+RF8AzUGqXO4RUK/gayqqZ
 qdKZuLlolaRu1vQkN7Ho3awB9sX05ywTHBaOyI6DFmNLe/z6WRcczsz9Luxuid4979BCtNieeLE
 7CdLWrHdN0pC9ElC2LWLCW7hK5NQnUWFjhMBVrJjkPrImWfp98elEzLjBwNZXTmIigTWwQKbQM+
 8m3iJZJ+z0DsPwA=
X-Google-Smtp-Source: AGHT+IHwiNkthort9wNDYNcLBlZfx6ZsNZlqD5hnI7FfjZLSF6rnpgGNCSmEJhUuwC9vhqtvHnu88bzXVWWrQU0EAjg=
X-Received: by 2002:a17:907:c1a:b0:b73:1b97:5ddd with SMTP id
 a640c23a62f3a-b731d1bff6bmr568082666b.8.1762909593125; Tue, 11 Nov 2025
 17:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20251029-n-novikov-aplic_aia_ro-v1-0-39fec74c918a@syntacore.com>
In-Reply-To: <20251029-n-novikov-aplic_aia_ro-v1-0-39fec74c918a@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Nov 2025 11:06:06 +1000
X-Gm-Features: AWmQ_bkZr7QiJOliWWv6UZQYjUkEazNRc3D--mIs0nhUrkqptE3eFde97147qkw
Message-ID: <CAKmqyKPtufR8H4YiBrVerg9TGPVKfMRxnq1ZGQoUc0rQRd2W8Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/riscv_aplic: Expand AIA target[i] source
 handling and refactor related code
To: Nikita Novikov <n.novikov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x635.google.com
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

On Wed, Oct 29, 2025 at 5:20=E2=80=AFPM Nikita Novikov <n.novikov@syntacore=
.com> wrote:
>
> During the debug of APLIC I faced with the problem with target[i]
> registers of source i. According to RISC-V AIA spec v1.0 ratificated on
> the 12-th of March, 2025, the section 4.5.2 ("Source configurations")
> says, than register target[i] shall be read-only zero when interrupt sour=
ce i
> is inactive in this domain. A source is inactive if it is delegated to a =
child
> domain or its source mode is INACTIVE. Currently we checks the source sta=
tus
> only using sm =3D=3D INACTIVE, but we do not check whether the source is
> delegated.
>
> This series of patches expands current active source checking and reduces
> code the associated code dublication.
>
> Signed-off-by: Nikita Novikov <n.novikov@syntacore.com>
> ---
> Nikita Novikov (2):
>       hw/intc/riscv_aplic: Expand inactive source handling for AIA target=
[i]
>       hw/intc/riscv_aplic: Factor out source_active() and remove duplicat=
e checks

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/riscv_aplic.c | 66 ++++++++++++++++++++++-----------------------=
------
>  1 file changed, 29 insertions(+), 37 deletions(-)
> ---
> base-commit: d1bf06e8cc8197a2b18dbde820d957a51899d374
> change-id: 20251028-n-novikov-aplic_aia_ro-1baa353cd672
>
> Best regards,
> --
> Nikita Novikov <n.novikov@syntacore.com>
>
>

