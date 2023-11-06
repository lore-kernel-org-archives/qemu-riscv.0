Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC3FC0018A
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 14:23:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r00VD-0003Ib-Ob; Mon, 06 Nov 2023 09:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r00VC-0003Hm-U1
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 09:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r00VA-0005kc-Bg
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 09:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699280570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5dbkPiZr4z+1yb7wNNqDt+DOhhhjUbdIQfK2e2ZVZ0=;
 b=AbyYnYBFXeYpvz1wWYsyl26JptxrIV8EjE41nbAbi+eoBFlcD1Xt6egwk3LOl1UokmhUCL
 grBKyeBanNhXUBJTcMACk2bbYQjF1xM6DUJXZVUCozERiIUUMO1uyMBv/3K40QqNvGQkJ3
 RYFDB0Zy38OSzZOMjXlI6AFRSrYkALs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-bX8Y7XSFOB-Fxl_FNEu5lA-1; Mon, 06 Nov 2023 09:22:38 -0500
X-MC-Unique: bX8Y7XSFOB-Fxl_FNEu5lA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66fe14725aeso57019346d6.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 06:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699280558; x=1699885358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5dbkPiZr4z+1yb7wNNqDt+DOhhhjUbdIQfK2e2ZVZ0=;
 b=GT7kTtBPmdkAXR7v6aLalyL+h2u4g3umGO1RAFvbTls4lafZ26JpPiVjWoKSf6JvE9
 CB7/y5pf03J0qnYeej+7KJPqymXjFfNwbRdE+Qn99N4jluRTtTy/ta0gMaz4VRkNlzPR
 k17Be6fraNy683XEmtBY5+T5kVd/+KuVBZpAzsshHfwNFQFmKWwZcEPyS/7xwvEZqhzy
 XF3QsuzFz+abtBpuNIoWdv45wX/i2OLeaSgk22IFQqV9Xc3yFFdsjNo11NQauU56PjfS
 NMTvttVpq/iR7b1ijPk5BtWL3s7Oyuz7kUx/9MdYd1FdhWYw6bPQo7F+eJuZaxcPTtbb
 x5Zg==
X-Gm-Message-State: AOJu0YzyUu+CRAnRpBxxgk7wrGJs2miUTbVKh9j2j2UgmWojDRR6gLfc
 pvxCSvHtCz6Yz1WXUGkI87y0aczqZWaCSA3kcJckyc7kEl6CKFmsER6gI25j1aSJTVf81x58HF1
 hu1ROCieGyayoxtM=
X-Received: by 2002:a05:622a:1190:b0:403:a262:7751 with SMTP id
 m16-20020a05622a119000b00403a2627751mr37027473qtk.12.1699280558390; 
 Mon, 06 Nov 2023 06:22:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg+e8cY+c5066l5Ai3TQUPMOEot4yKFMhU0De87s4hJqfTobO55figyqt85vSCA+IovxywaA==
X-Received: by 2002:a05:622a:1190:b0:403:a262:7751 with SMTP id
 m16-20020a05622a119000b00403a2627751mr37027433qtk.12.1699280558084; 
 Mon, 06 Nov 2023 06:22:38 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 g20-20020ac84694000000b00419ab6ffedasm3394548qto.29.2023.11.06.06.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 06:22:37 -0800 (PST)
Date: Mon, 6 Nov 2023 15:22:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, philmd@linaro.org,
 clg@kaod.org, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
Message-ID: <20231106152229.02d6326a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231102002500.1750692-2-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu,  2 Nov 2023 10:24:28 +1000
Gavin Shan <gshan@redhat.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> For target/alpha, the default CPU model name is "ev67". The default
> CPU model is used when no matching CPU model is found. The conditions
> to fall back to the default CPU model can be combined so that the code
> looks a bit simplified.

default cpu should be specified by board not by target internals.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/alpha/cpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 51b7d8d1bf..c7ae4d6a41 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const c=
har *cpu_model)
>      typename =3D g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>      oc =3D object_class_by_name(typename);
>      g_free(typename);
> -    if (oc !=3D NULL && object_class_is_abstract(oc)) {
> -        oc =3D NULL;
> -    }
> =20
>      /* TODO: remove match everything nonsense */

Let's do ^^^^^ instead of just shifting code around.
It will break users that specify junk as input, but it's clear
users error so garbage in =3D> error out.


> -    /* Default to ev67; no reason not to emulate insns by default. */
> -    if (!oc) {
> +    if (!oc || object_class_is_abstract(oc)) {
> +        /* Default to ev67, no reason not to emulate insns by default */
>          oc =3D object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>      }
> =20


