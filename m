Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22424C3ABC9
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 08:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uElOE-0003Pw-JP; Tue, 13 May 2025 04:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElOC-0003Ox-Iy
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElOA-00087W-3T
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747126404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1c399StXOuA/U3cRc3qzs9RfJEJILu72MXX9iqzRvVo=;
 b=Y89BE2m80EVNer7QwZH4/fKvGWkxVuJa5by4JycGhEPU7kOLMxg9Ypxx8pxf/FbtwOJPt3
 JEfcxpf9qeAvGt5nqUslby8aLCugkpEOMKGwSW97c2vjZe/qPkYqeGTyCjggWSSGstJ8CI
 Dat/zbb2wlaN+Q/4CGiceyYnE3nWzhA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-8P-3b7NqPQqMNLMXgYzolw-1; Tue, 13 May 2025 04:53:22 -0400
X-MC-Unique: 8P-3b7NqPQqMNLMXgYzolw-1
X-Mimecast-MFC-AGG-ID: 8P-3b7NqPQqMNLMXgYzolw_1747126402
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so21578195e9.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 01:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747126401; x=1747731201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1c399StXOuA/U3cRc3qzs9RfJEJILu72MXX9iqzRvVo=;
 b=ES5LWmzcAcn3XeFZrTkD50JolTNPJ1ST7trWHz6RA4QZlFJsg7U9qBBi+e/5oYqq2X
 IhX7Kl9nKo0BXQFVuuRk089vgievSUVcxZhtoRRR69zweteVYz+zYrR3VTk95yBwJKSe
 O4Ov1QWofxkYwmSBiK1tw5jk0m3Q03zM0UL2q07u+LFFRdyGnBdE3yd76Q5NVNbRxUyQ
 gxq9+WbpKnqAvUwf+oZ3fVdsDgH70kE92UjSqPlJZGNYxebtfwbDsCZmZ+vECbw7GDSA
 Dm9rG+WIWsu6fxIR8/K//C3NUTfVo9RS8oZ5SeGnplJ3rNin0dx6e3cpcgSJRPNYl4wA
 0C9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcMEy+O9wpSWamu7r9zpMK0solekXvz+ZttifHaU45+pretpX66j5obazRNhqmXTYLyNF0Dw2sm5KW@nongnu.org
X-Gm-Message-State: AOJu0YwMr0o1vRv1CLUz87t6zD6jP7xN8cOrKrBUQUGFz3YS0DqFvYjf
 s1Tvz7kMFBiispInRaD4nn4t8HmDnFTRHMPuvpvAUJlDx5UruGz3URrdG44GDB76QTkVF/2zqwj
 G3gfBnpeW+I5fdgE1x3umtay1z+JdI4cayp8u+Vt3deDPcmwC8wNa
X-Gm-Gg: ASbGncuESksybPPTGfNIvZ4QMBrXulr6MVbexqVO1EURgyJ/4J/NZCIOW3X5oLuGJUU
 e8YsgsdLbian0LQ1VqRYJo3/t9JF2HNaP3bBDpjKdWFQ6alGmLH89XTiDkpliOAd1Ud8PjV6hka
 2IN7H3lgTEhQdhQkBbiOnIpuVSjOU9U32R2vO+csPh3IdZateW0qWf40+crKm1a7JDBU/8k4BO3
 k3238aRjZAdOZrraWxCDcQUOAxNleuU3FLVOVmieBsnx7J5UodXLsG+7HsMJu1fH8j+DsRG4J5P
 kd9uwGDaKJPQ7uHplCEd+QGSm693ivXy
X-Received: by 2002:a05:600c:3148:b0:440:6a68:826a with SMTP id
 5b1f17b1804b1-442eace91cemr25179545e9.13.1747126401651; 
 Tue, 13 May 2025 01:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF549ifJeYTkxz/mvc+aA9gSenujAFnJKqtWZXl8rGu2VGPfZkDo5Kuof3IaWJiNGT8MFf/cQ==
X-Received: by 2002:a05:600c:3148:b0:440:6a68:826a with SMTP id
 5b1f17b1804b1-442eace91cemr25179245e9.13.1747126401294; 
 Tue, 13 May 2025 01:53:21 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aeccdsm198387905e9.32.2025.05.13.01.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:53:20 -0700 (PDT)
Date: Tue, 13 May 2025 10:53:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 17/27] hw/i386/pc: Remove deprecated pc-q35-2.7 and
 pc-i440fx-2.7 machines
Message-ID: <20250513105317.0185bf3b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-18-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-18-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ynqCDJF2wiIdjr9gs-CXx3LKIRdJ6EStbnnfcOtSsuI_1747126402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu,  8 May 2025 15:35:40 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> These machines has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") they can now be removed.  Remove the qtest
> in test-x86-cpuid-compat.c file.

same comment as 1/27,

I'd squash pc|hw_compat_2_7 removal in here

other than that loos good to me, with above
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i386/pc_piix.c                   |  9 ---------
>  hw/i386/pc_q35.c                    | 10 ----------
>  tests/qtest/test-x86-cpuid-compat.c | 11 -----------
>  3 files changed, 30 deletions(-)
>=20
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 98a118fd4a0..98bd8d0e67b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -755,15 +755,6 @@ static void pc_i440fx_machine_2_8_options(MachineCla=
ss *m)
> =20
>  DEFINE_I440FX_MACHINE(2, 8);
> =20
> -static void pc_i440fx_machine_2_7_options(MachineClass *m)
> -{
> -    pc_i440fx_machine_2_8_options(m);
> -    compat_props_add(m->compat_props, hw_compat_2_7, hw_compat_2_7_len);
> -    compat_props_add(m->compat_props, pc_compat_2_7, pc_compat_2_7_len);
> -}
> -
> -DEFINE_I440FX_MACHINE(2, 7);
> -
>  #ifdef CONFIG_ISAPC
>  static void isapc_machine_options(MachineClass *m)
>  {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b7ffb5f1216..a1f46cd8f03 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -648,13 +648,3 @@ static void pc_q35_machine_2_8_options(MachineClass =
*m)
>  }
> =20
>  DEFINE_Q35_MACHINE(2, 8);
> -
> -static void pc_q35_machine_2_7_options(MachineClass *m)
> -{
> -    pc_q35_machine_2_8_options(m);
> -    m->max_cpus =3D 255;
> -    compat_props_add(m->compat_props, hw_compat_2_7, hw_compat_2_7_len);
> -    compat_props_add(m->compat_props, pc_compat_2_7, pc_compat_2_7_len);
> -}
> -
> -DEFINE_Q35_MACHINE(2, 7);
> diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-c=
puid-compat.c
> index 456e2af6657..5e0547e81b7 100644
> --- a/tests/qtest/test-x86-cpuid-compat.c
> +++ b/tests/qtest/test-x86-cpuid-compat.c
> @@ -345,17 +345,6 @@ int main(int argc, char **argv)
> =20
>      /* Check compatibility of old machine-types that didn't
>       * auto-increase level/xlevel/xlevel2: */
> -    if (qtest_has_machine("pc-i440fx-2.7")) {
> -        add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
> -                       "486", "arat=3Don,avx512vbmi=3Don,xsaveopt=3Don",
> -                       "pc-i440fx-2.7", "level", 1);
> -        add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
> -                       "486", "3dnow=3Don,sse4a=3Don,invtsc=3Don,npt=3Do=
n,svm=3Don",
> -                       "pc-i440fx-2.7", "xlevel", 0);
> -        add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
> -                       "486", "xstore=3Don", "pc-i440fx-2.7",
> -                       "xlevel2", 0);
> -    }
>      if (qtest_has_machine("pc-i440fx-2.9")) {
>          add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
>                         "Conroe", NULL, "pc-i440fx-2.9",


