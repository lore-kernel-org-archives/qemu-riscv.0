Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382A606A31F
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+ijIof9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM3zu-0002Sd-I0; Wed, 28 Oct 2026 09:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM3zm-0002RY-IP
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM3zk-0000Fa-Ss
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793195231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oKwPo2y1+9LCt0tDpALKvVNZXvNd47CM65evbfSeNys=;
 b=U+ijIof9nEXOyoNV++wQN0b9LHAprXMAbyKJpfrt9KuZ8slmcynU7vcY5DbQIO7lrF/6Fa
 znkrCULvbkvuchDld0BxHI7uXYr2o+9msKMskz37HjQdbNHHz1c/CuKoZ8GFbp9T5bPVL9
 oWfevPkWGP15Tiku7V4uGwJM9C+7/K0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-eYuuvcbzMjqinxhsko_A2g-1; Wed, 28 Oct 2026 09:47:09 -0400
X-MC-Unique: eYuuvcbzMjqinxhsko_A2g-1
X-Mimecast-MFC-AGG-ID: eYuuvcbzMjqinxhsko_A2g_1793195228
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48b00febba3so633415f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793195228; x=1793800028;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oKwPo2y1+9LCt0tDpALKvVNZXvNd47CM65evbfSeNys=;
 b=0eC2hcx4fnPI9YCilnUc5Ek0TIzXXK2ttk4yGF4VRiGa5WaZfsFMUbB3PgURQnhP/H
 lyqrNN322hbm76jcocupcoqoDxO6dfmoq2xqDobA6Tgb5DRepUm4ttrleS96OnGrEuXL
 fChfNa56arO4eQID3m4gmswKrblL2U21RWG60WlWXV3umAEcI8XlQr6jUThOcGseat4u
 W4Y8q69f3wDYU46efG5jkV5SvHGBNLbGJa09yd7joQkQA1iXbD5h6GS+/KyqAb/Vk2BK
 TURHbJ7ZLSB4jFEJ1N3ME3x/Vwk2RDFvPomUNNMOwsVeh4PgZuKkt5hnNJtj+6iCxut7
 JXwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzwCVprfCa2zxM7etJMOh6H9UAA17DKNwSoQL01K8sE3wIJP0mfI4d7b/WBLjriwsVQODnxD1e0AOlz@nongnu.org
X-Gm-Message-State: AFq9FYL+rN7Jz6koAGUjYk+yaT4SveP/0PEHftNZ/yr01fTIwjT1YI6t
 2OpBsb1191dpi6zHcu1khBR2iRmHonzUYDYo66tXeI7WZXkLhdLQ/5HwuqfHMmXMIliMWy/erBs
 FK3JRQOmWLWwDJcxW7WHueYvVbEmp9HCyMNK1CKnsueHmZtVc2EG2LR8y
X-Gm-Gg: AYBFou2kw8UhlibY68qeNiYchv1HC4R3/5m7Ut9XNYFf1jJzJcjYtvLUQyhkPMmZPze
 bgjedmmub8E6SsB5a/F5QnjhgaS0YA2xbgKx/QXVBdTIVNTGL8xL75GYaQ1umXwrQFgekVYB6Ji
 jAbQHPrjoflLN8Owoo8dcSXH+HEMfPtkCpJcsfQbNWMIOKwenouNabLsitaP/xVF3oGKA7LwpeH
 1pEnmzvOUtaAdVh0a+2zOIoq78JVYYNY9V7D0gbeR41FE6pFUmhLMzXRawPri84jU8PuoUbROwR
 RfBDim78IzRxUWD1ZXjspLSIsJWVOmvhpKnnott0vSrH5TFGu1Nw1gmH5lioL/kKas1uzhU+dT5
 v6//4SZv9ubjSnItXzhc4w3pigEqEDirPwLG5yZjJ
X-Received: by 2002:a05:6000:2508:b0:48e:5ea1:260a with SMTP id
 ffacd0b85a97d-48e5ea18152mr4937602f8f.3.1793195227784; 
 Wed, 28 Oct 2026 06:47:07 -0700 (PDT)
X-Received: by 2002:a05:6000:2508:b0:48e:5ea1:260a with SMTP id
 ffacd0b85a97d-48e5ea18152mr4937525f8f.3.1793195227116; 
 Wed, 28 Oct 2026 06:47:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39b3sm29535147f8f.10.2026.10.28.06.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 06:47:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:47:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 0/4] RISC-V: ACPI: Add PPTT support
Message-ID: <20261028094619-mutt-send-email-mst@kernel.org>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p607yB1c5B4FiOJePJ_Vgk2HxTr3s63Xb0ubkmXhz5Q_1793195228
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 11, 2026 at 11:55:48PM +0530, Sunil V L wrote:
> From: Sunil V L <sunilvl@oss.qualcomm.com>
> 
> Hi all,
> 
> This series adds ACPI Processor Properties Topology Table (PPTT) support to
> the RISC-V virt machine. PPTT allows the guest to discover the processor and
> cache topology exposed by the machine, which is useful for making better
> scheduling and cache-management decisions.
> 
> The implementation describes the RISC-V virt cache hierarchy with separate
> L1 instruction and data caches, followed by unified L2 and L3 caches. It also
> enables the corresponding cache and cluster properties in the machine SMP
> description and wires the generated PPTT into the existing ACPI table
> build.
> 
> Unlike ARM, RISC-V doesn't have a way to discover the Cache
> topology from registers. Hence, I am hardcoding default values for the
> cache topology structures. These cache topology structures are added in
> virt.c itself so that a future series can add support for DT as well.
> 
> The series also updates the bios-tables-test data and removes the temporary
> PPTT entry from the allowed-diff list. The generated table is 96 bytes and
> describes the package, cluster, and processor hierarchy for the virt machine.
> 
> This work follows the discussion and earlier work shared here:
> https://lists.gnu.org/archive/html/qemu-riscv/2024-01/msg00928.html
> 
> I have retained the contribution from Sia Jee Heng and added his
> Signed-off-by tag to the relevant patch.
> 
> To enable cache structures in the PPTT, one should use similar to below
> command line option.


acpi side's tiny here. that

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> -M virt,smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluster,smp-cache.3.cache=l3,smp-cache.3.topology=socket
> 
> lscpu -C in linux can be used to display these cache structures.
> 
> Sunil V L (4):
>   tests/qtest/bios-tables-test: Allow PPTT for RISC-V
>   hw/riscv/virt: Add ACPI PPTT table
>   tests/qtest/bios-tables-test: Update riscv64 virt PPTT golden
>     reference
>   MAINTAINERS: Update Sunil's email id
> 
>  MAINTAINERS                       |   2 +-
>  hw/riscv/virt-acpi-build.c        |   7 ++++
>  hw/riscv/virt.c                   |  54 ++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h           |   4 +++
>  tests/data/acpi/riscv64/virt/PPTT | Bin 0 -> 96 bytes
>  5 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/riscv64/virt/PPTT
> 
> -- 
> 2.43.0


