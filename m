Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229E0C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 09:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxOKL-0000D2-BN; Mon, 30 Oct 2023 05:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qxOKI-0000Cf-Cc; Mon, 30 Oct 2023 05:12:50 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qxOKG-0003SJ-OW; Mon, 30 Oct 2023 05:12:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c5b313b3ffso626347266b.0; 
 Mon, 30 Oct 2023 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698657166; x=1699261966; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VP+R3Q+TYgZJQr2tiX1ZibcvIpQauSNa+wcCC0xO0gU=;
 b=nIr5n5yQr4Eno6jPpvjJqO7BjIHc/9jwt1J2kzuyT2WD4Tz1VfcNoIUv3XZpHCTBvF
 1Pwq2HEYB/WQrc7OTEJG3/4uhj2tCk3VGIlQLgDQBnpNYnrBtaXx5kot6yFAsAw0E3Zu
 tK8yYUYyz57jaFZDdDoWYp9Kw2l22xjSm6ka7PMJu7ktknSK2n+zZzALOAyge1WdFcca
 EeePxvlTi7MnIxizA6cAfv5pYjPTfVyPd1ImleahsOOdQclJsoOqYfvS5qD0aZUS8Wa5
 bZKI4BVjqYt97Zjj+jkm2+mxw33ZKIdkk/elfNY/nhxi5lrSLWbaphJTa59XiISb35Ks
 VYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698657166; x=1699261966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VP+R3Q+TYgZJQr2tiX1ZibcvIpQauSNa+wcCC0xO0gU=;
 b=IwC7Kz/O5VGARfiSiYA5ZD14tJ4AgaNLuuF/CM7K0bnr7+qGRZ91CiDtbzaJcXoLLt
 SHNPGmfD9qXUk47snZkogJLCvE02DghF3QUYn3GboqbV9bsbaL6NZ1e3793LthJTpoFD
 JQxhvAne3s59z7rn5Te+KSKcU80GL1EmCxC/jvg7UpdFMVD/TkG1ieuwgYNu+EkQW9JW
 BA0z4mpm1fQSjJCxj9Szv5iEittVEuJB8aIzrQKSPc5ifNGP7ZRNj06W9z8br1wUT4a/
 C1LcQnN1UiYlQIrCTdTOLEGYeSco6LAjyzmuzqEz58PK85tq6jtZV88n+F4tX0b1erWO
 xllg==
X-Gm-Message-State: AOJu0Yzrt/RsBvjKUGpHUddEyZQ+M96LAQVbO+qn/EirHwmy5Vbfbq24
 dbQhWp3RKAlRZi+VJZMyV0jRsFgCrgosDucDKf4=
X-Google-Smtp-Source: AGHT+IEXCspb3Tj2W/7pGFZowzzrOqKehz/xX+E0RPubUbh4/WWPgGqE4YiW/iuzW+h7gLlbpUgz2m+VQvp0MCQrV4w=
X-Received: by 2002:a17:907:2d0f:b0:9bf:d65d:dc0f with SMTP id
 gs15-20020a1709072d0f00b009bfd65ddc0fmr8962516ejc.4.1698657166133; Mon, 30
 Oct 2023 02:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231030081607.115118-1-liweiwei@iscas.ac.cn>
 <20231030081607.115118-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20231030081607.115118-2-liweiwei@iscas.ac.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Oct 2023 17:12:36 +0800
Message-ID: <CAEUhbmX4uV8eymdM4iEEUcRFJwt0C+j_xjCG7cVxJk+HH_NozA@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: update mail address for Weiwei Li
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, lazyparser@gmail.com, 
 Weiwei Li <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Oct 30, 2023 at 4:17=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> My Iscas mail account will be disabled soon, change to my personal
> gmail account.
>
> Signed-off-by: Weiwei Li <liwei1518@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Wish you best of luck on your new journey!

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

