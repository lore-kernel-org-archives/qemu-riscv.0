Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E3FC77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:41:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz81s-00014x-4t; Tue, 16 May 2023 23:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz81o-00013h-7H; Tue, 16 May 2023 23:40:40 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz81l-00069o-04; Tue, 16 May 2023 23:40:39 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-435ff65df88so56990137.1; 
 Tue, 16 May 2023 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684294833; x=1686886833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPcFQo21eXW1Pge7vlk+v+e+pxWr/D8D6By0VIVq7aY=;
 b=EfwHWNtomS0Tv+odsBZHXHJD2nvuSDeRJrZnxZvzNZJDUuCwrvc6h9jJUpXcmEQNcV
 Vv11MoTZPrZKl28gkyGWpwqjI0HjX9ZiKds0u0f8W0Nvts3k2IPJFhxrrpbiTVXRroXR
 1Nw+YgdESqHLmACAl0TMg8W1vykYFRHbrkEz/4LCFG/SAyDkgSopPuYxJLhnVH1BuKop
 /atnyMb0XougP85P3nmW6ELfvcs3JqhDKoYYxDmE1IvNMe2u0TuXdHN0MP9cuc9K9Pfb
 hc/Dhk4o9ljYTGFE/Un7owtOndftc0WizCnabCVMchvyRmgXBIB4aZv0ubrkWoB80Bq1
 28cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684294833; x=1686886833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPcFQo21eXW1Pge7vlk+v+e+pxWr/D8D6By0VIVq7aY=;
 b=gcFOB5qXaW1eoahbghiCE2nM+FNJF/R9OQp/MAzE6CXxEVQ5Lj9kUgbAGQcoFJOnz9
 VbTYiRYlyn3T0jjxuDRNftah8uTt/fYrqX7ucq80zHRHpngzt5KidBC0v7NUsUIuhyWP
 UOXy2QWJJQtJgTfE+D31IztATGnmCzWZuQc2RS/Xdyeue5xzVYqkmFkAUXv2i2hMo33I
 07QLmDphBwPrqWelDP7Ca6bUnCorvePgLs3RpyfeC1m94d28Wsa7vz28tdUkwhdFdRSl
 OQT/AgVAQuZ6uYRxeQuIUFc5PV3FP4nvdNnVY5t6U2o0qHNQw3XHFpL2J8dLj+2pDCGi
 EeUg==
X-Gm-Message-State: AC+VfDySjw5eMhbqSLydrwefEu9X2+DcAb3SR1W3eh/bRlFOyDZSLT+g
 vRDA8QMqXymZ6tDUnCdTIZAsM6jpcnYwyitQe5Q=
X-Google-Smtp-Source: ACHHUZ67942ijkp7mKH17aVGzoqGMd+jEK1cNXtZF9LbfUPPgdJw/yij8iFXcs/E7ZKllLF7gM39m2Mmomhhhj3HWJc=
X-Received: by 2002:a05:6102:3a66:b0:425:8613:da7d with SMTP id
 bf6-20020a0561023a6600b004258613da7dmr15497351vsb.22.1684294833687; Tue, 16
 May 2023 20:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230509002739.18388-1-gshan@redhat.com>
 <20230509002739.18388-4-gshan@redhat.com>
In-Reply-To: <20230509002739.18388-4-gshan@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 13:40:07 +1000
Message-ID: <CAKmqyKNeKTvKpkCO6z-+3Eh46fmEG6ytRB52LJY7WKyZDmCy+g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] hw/riscv: Validate cluster and NUMA node boundary
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 pbonzini@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org, 
 rad@semihalf.com, quic_llindhol@quicinc.com, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 thuth@redhat.com, lvivier@redhat.com, ajones@ventanamicro.com, 
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Tue, May 9, 2023 at 10:29=E2=80=AFAM Gavin Shan <gshan@redhat.com> wrote=
:
>
> There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
> Both of them are required to follow cluster-NUMA-node boundary. To
> enable the validation to warn about the irregular configuration where
> multiple CPUs in one cluster has been associated with multiple NUMA
> nodes.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 2 ++
>  hw/riscv/virt.c  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 2c5546560a..81f7e53aed 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -354,6 +354,8 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv.spike.ram";
>      object_class_property_add_str(oc, "signature", NULL, spike_set_signa=
ture);
>      object_class_property_set_description(oc, "signature",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..84a2bca460 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1678,6 +1678,8 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv_virt_board.ram";
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
> --
> 2.23.0
>
>

