Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7385BC54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:56:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5HrQ-0002zC-Sz; Mon, 20 Nov 2023 22:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HrO-0002yo-QX; Mon, 20 Nov 2023 22:55:38 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HrN-0001KB-Aa; Mon, 20 Nov 2023 22:55:38 -0500
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7ba75345e71so1697717241.0; 
 Mon, 20 Nov 2023 19:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700538934; x=1701143734; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MK+ETp358sAmFlPkJfQamaiDtyOuv2l2WoRSoR7bjy0=;
 b=k/WIb/j7sDFKwzNk4UHpt0H4IAwJyFvASpiiBzK6U/6xwSPfM87D5fadzrmOmKspVt
 v3S/70HDCIC8bW+zOjhMGlFlSi5dOF0fSYWN7GqJXFIt+yblWjn72BB2OTJ7/uTrKL+S
 +9scd/Anhg9a/eJ6A8lc0EX+DzJwDRJebcdG1lL0WCVATFUB16hmTCkqEWJ6lGvJN7aY
 Hzj4cGcsJsJkEbRAx048HR6R1iGid+dcr+mNMLPCZx4fmw7fvoPvvE467KG5e1mZPPaz
 lsy/BI7pks1wXdYz9u//eUFWEzusEonq4MLQbozVM7AmRZsvI4Fqtt9OGnza3Ue57Xn1
 5s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700538934; x=1701143734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MK+ETp358sAmFlPkJfQamaiDtyOuv2l2WoRSoR7bjy0=;
 b=YbeljbEocxCov9aGOM2l4qEo2RZG/SC893JdAyjKWYFE9vxpxEfTvgPTmHdANlppOn
 jjYdruv1OAKj9UScpd86vCuBk+8XPVkUbe6X594wXUr+fh1Qc6kVAIx18XpA9kiUz9Mo
 M/F39QXi4TTs8GR8vM4lv7jbtF/Ky6ay19BKlekIB7Z3LcNaKFEyEPrdAgTEcjY+4xyk
 0fQK/FhTQ4aXjrM1PS445KzuSvaV5Dmcp7zfy0HSzzRimDBZe7XK9bHfg6kJqACyKJOs
 wmKE5Nhaec0VOPAJ9SSgMQ4wXSVZS9mSAWqP4C7vC6JdqQE6MD89Ql+737PU7+0j0mZ2
 6dXQ==
X-Gm-Message-State: AOJu0Yw7nLUjakGRmyxFFgS3rQxay9IK5YMZRZLKQUH+SlvoXonCX8IB
 MKHlAbhfa1ZlUD/0slUd8Rone/flaxgmwzvGgmg=
X-Google-Smtp-Source: AGHT+IH6+WWfswQIUHoZz1/UmOwk+uZJxNQfRaQID0rWZcMj83+TxeIAEhk1ZA98KLs4XY5Vza1In/OAJ9+nDRjb+WY=
X-Received: by 2002:a05:6102:3f0c:b0:45d:9224:a89a with SMTP id
 k12-20020a0561023f0c00b0045d9224a89amr4576870vsv.10.1700538933864; Mon, 20
 Nov 2023 19:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20231030102105.19501-1-heinrich.schuchardt@canonical.com>
 <b1ada8dc-bd6d-4a70-b709-dbbc8407ec08@tls.msk.ru>
In-Reply-To: <b1ada8dc-bd6d-4a70-b709-dbbc8407ec08@tls.msk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:55:07 +1000
Message-ID: <CAKmqyKPoaMS=hw0ZA3oXe7meff-btBWbDgXkmGyOgjBybvNevg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: correct csr_ops[CSR_MSECCFG]
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Nov 8, 2023 at 2:40=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wro=
te:
>
> 30.10.2023 13:21, Heinrich Schuchardt wrote:
> > The CSR register mseccfg is used by multiple extensions: Smepm and Zkr.
> >
> > Consider this when checking the existence of the register.
> >
> > Fixes: 77442380ecbe ("target/riscv: rvk: add CSR support for Zkr")
>
> Is this change worth to pick for -stable (together with 095fe72a128
> "Add epmp to extensions list and rename it to smepmp") ?

I don't think we need to back port these.

ePMP/smepmp support was experimental in QEMU, so I don't think we need
to bother back porting fixes.

Alistair

>
> Thanks,
>
> /mjt
>

