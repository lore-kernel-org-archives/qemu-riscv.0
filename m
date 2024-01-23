Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD145C47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 05:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS9ep-0007QQ-MX; Tue, 23 Jan 2024 00:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9en-0007PF-DX; Tue, 23 Jan 2024 00:49:09 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9el-0008Tl-QW; Tue, 23 Jan 2024 00:49:09 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-46771fc85cdso828095137.2; 
 Mon, 22 Jan 2024 21:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705988945; x=1706593745; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XGWFIgPM+i7sy9OAsZEHC3tF/I68FLzyifoG6R+5O+0=;
 b=JthRGq4aQ3XqACeD3RVRYTFvhkUK9NvxzOr1ZixKwM3R0AzTo0ly1pNfBVb2f/edpP
 uKgF4kXYl1Mx2MiNKUb+Vlo0alspETNVygapO4IMdsnCdvIOvCe46lHBNYMly9Y6K9wb
 nmkJCwUd4D0MYXQbx4AplSer6j1tGQQkyVeoXOux0gTfMrnw5L8if9iZa+nyH9TnqTsm
 hT8L2YfBQ1c3oTpvFIUVMnhFEydIUFCphXJuqzoZKqL1YrFHCedEtIbDS9tCtFzPqgNS
 3120VrxgitOVQk+/3tvO2RnWFP+gLTTMcF4r27IYE87qTwDewTUaESfPSq8hCQsRPBZ5
 /zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705988945; x=1706593745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XGWFIgPM+i7sy9OAsZEHC3tF/I68FLzyifoG6R+5O+0=;
 b=a2j52BB5zxxKlpM5NWNERFtp7RxePQqLgfL5ZH3RlpiBddrHotHrttsTGhbYOnqduD
 zUFREwD6cj9t127PyzYoLXj+sort+iLjpwKfrEvt3iRTnm94dHn8Bv6n3MIAMk2z6NxM
 8ZgjYuvrRnqB6QuMrBtO47jzLUL9sKusvfMcM2Hp5FYWx5b++y2WkQ2hzkcVjMteEMRi
 DVRKg3VsGAtDQjGD+rR+A32Ri89xumhC9DHCnN0pBCreVO6O0hmzuzKeJHHoyU8dpDpn
 OdJXpB7Y/wV5BySPxkSZIwxVBE/fIlU5OSh/QhlkUMlhB5pjBLADWcJV6DgV1d1YeZeN
 J3fg==
X-Gm-Message-State: AOJu0Yz5ZCdMVjNzWhc95O03wt9pPbbbdcwR15mDBzyEUwCwLHt/uLXk
 geSkVM1paVXoobmRFykwiUvifOWT5oQONbITPYTvyEEgUHWU2n/P6IGjTYxylFR9t3d5BEDm9Vr
 J68tRfaF7AOWqJ/oXLtRzwVA1o/s=
X-Google-Smtp-Source: AGHT+IEGeNkPgWGB2ABOu+k0n1xgc8g0ke5OU9+x6qKIzezRXOSKHl+yIjtOmtVfaKEE0HM4paszPnbDaOrSmaVRSdk=
X-Received: by 2002:a67:e3a7:0:b0:469:aec1:b42c with SMTP id
 j7-20020a67e3a7000000b00469aec1b42cmr2494332vsm.5.1705988945512; Mon, 22 Jan
 2024 21:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
In-Reply-To: <20240122145610.413836-2-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jan 2024 15:48:39 +1000
Message-ID: <CAKmqyKPawDYf1DBhGb05qnphOKNt8PATHiwaZVBuhS14sHAR0w@mail.gmail.com>
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
 John Snow <jsnow@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, 
 David Hildenbrand <david@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>, 
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>, Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Tue, Jan 23, 2024 at 12:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> The effective MXL value matters when booting.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0ffca05189f..bc67c0bd189 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
> +    return harts->harts[0].env.misa_mxl =3D=3D MXL_RV32;
>  }
>
>  /*
> --
> 2.39.2
>
>

