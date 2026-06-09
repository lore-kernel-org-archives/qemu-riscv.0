Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D632ACD8CA4
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wWw18-0001IL-CJ; Tue, 09 Jun 2026 08:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWw0z-0001En-H3
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 08:57:10 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWw0v-0002Hi-Ei
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 08:57:06 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6603246b66dso5546056d50.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 05:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781009823; cv=none;
 d=google.com; s=arc-20240605;
 b=VM8MJc8bzVfZ4ATjrkckALw58jAw882lU7T48cEn/ycl67wIV/PTxKr0GESBVijxdP
 zjhoXqxwN41d3gDnBvMFc1XXRV/eO0EkqGnR9jXlPFmZin8jzahkwlZI5YF6A62L66zF
 t5qMOWq2Xaid2uiZFVz2i4wJxghgOhV10eULKpZ+73ZNzYzNobMG7Wm6YWXCfaxvFgjT
 IL2d+/eTuh5PswB7Gj+DGwR89D2rCzhP4imVJRfAwo+mo3lVUooaY7eUbBfJih2k7aIS
 2gHAYUVjnRiZVK9o8Gpp6eHzZAv5VPF8av0GFREJWLtuQPGRwZJfTeh62HCIACHdQkTD
 vTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UCT+nxz25XTondRtnZ91yox9fMv3hsYnWssouvjS+gs=;
 fh=ZVywsTtDMMgV7WgCsOPtQ/FuuHA4pjONdbyhQb5gJqQ=;
 b=MSRqVR1ZYwMiljidA8GnKbJlfQv+ziuEZ7TAvDKfXhHTRHQjL9FPlEKEm9COa9KiEM
 HvCtTDmf2h3Kx+Gk6PuaFr+ZvkJ8i81/5/JQYOxQD8l8GbZIzu50r/myW2v9vOT0VtR7
 uBSVYuxFILbqExkTP1dYKaETR6cnBnbbM1QEHNK2CdX/jVXnwAEq69k7gebKZ92CLfIq
 oydVNadyF3IABXEC5TBZm5FUuNRtKO9ojCe/zmccjZbFyWm3n+2YuaaPvIuv46o5c1za
 bJwP9wqC0lPIj6wIAliuuM3smMZcdaVvNAwYfx4JQikTQ0SY0b6Ans17do4vzqtDJ4vC
 RzBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781009823; x=1781614623; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UCT+nxz25XTondRtnZ91yox9fMv3hsYnWssouvjS+gs=;
 b=Mjam3jZbhqVVCMGFsNhJfH0vx3nMO8jMOamyvq8u9b4HWK/Ah0yZG4XhwS9IQ9/EbS
 bcCZJYKInF5/pVylb8EptiABJHBDWhMH9Nol++IWIfg8arflsyUMJdX+WD/+EbhC0Lsy
 tYP2r1XU8Aw/KXHP/It9Ap0osxNnlN1EBtai54YXSLTnHq13eLhk5MyVN/YxbSp5Baa8
 5n1CSnuwUrBB01J5zAuSMg7f2bEH6tqjYRbNoevD6lAjfAogmd3dRpdFwtZgL/05Tyok
 U7vWWxde4XUev+LoNIWI1sKMQ+rlKSzU6k9Y9ttbO9DFAChsaiJD4KmU2C7qjxfWiHQj
 n2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781009823; x=1781614623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCT+nxz25XTondRtnZ91yox9fMv3hsYnWssouvjS+gs=;
 b=Rjt5kW0nzLnLtyhxCDgp78HAR+Ny5Ns0hGTtv9UzHBsKVL62eS5K70QeRZbSUV7q8b
 Iv7Ih1IwiF3OYDJA3PkOfLj0DRQ0jzYPXucNcP9Zn2YxYNiykElcX+hs+ysAysKZMszE
 j8OVWdjls/HRZeb3ZWks1kvdMJvZH7rgsSf6ZZRYKprgZwG4eUpVcDoBpByhpDZ7mNLI
 5sLD4rmP+N1Q3v0LP8q6cONeKsObKkvObwS4uV4CymMTVQwVP8U6a6bF8E7Aaai2gZaa
 ZT1gxIvj2bT1yVpp8qGizw7iZcLaRA6Uv27llTLXJczWA46A1eff+l560F5feAMhws7U
 oP7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ98Zmaf3Wq/3ykSJuCEgEdlpZxEqgCEstRIWsKgipbJX2TOsm+Vv8pwADdczBXkfC1w2SEh8rdx1hSq@nongnu.org
X-Gm-Message-State: AOJu0YwmbSRMn7gq3bgX56ijgjE5371KEVgc686hQc8tFKjE4k8qCzI3
 v1C4BP3U/YU//t7vgKbdAS71dxop/1ukY8VrrE3/KADsJob5EhfQZvTEJ4LeGBWgst4hnPbs1F0
 XnU56ns16xUOO+NoPSTPKpbmUaeOeN/067cWDThCEGw==
X-Gm-Gg: Acq92OFecRjI0POixdsDYYWxnnA9SKxfY4jlTv2hFTp4N//J19HBtceWB3H2lzHLcDW
 ArXRIrX8A44hO9wVA4qufaVjvJ392MPMvAG2Rk2X8DI/LzsG27RmsAGz/OgYwHDi6PfM6xxb6NI
 dvAnty3cXiMTpCiwq/XnB1SYzV/Kd1tXCdmFz4x1Ea5Oxs4Q0W16ysKzwBUt6JOdMeMaYFyReZ6
 a6GdRrEuard9XHrb8BPWAUcT7UZXSUu6/z/lAikBEx/cHd+E4kAOMEs2YXb9xyj+P541Verw9pZ
 kszz6w3WNNqSAeK9npE1iZUyizdOiPo3VZ6DLLTODhROrhvv9p8EbMoNM0riO+psNDfsPmg1pMf
 mKQ==
X-Received: by 2002:a05:690e:4383:b0:660:9c4e:a44d with SMTP id
 956f58d0204a3-66106dcf382mr13081751d50.6.1781009823286; Tue, 09 Jun 2026
 05:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260602074127.63819-1-cp0613@linux.alibaba.com>
 <20260602074127.63819-3-cp0613@linux.alibaba.com>
 <20260609134659.3dc89b40@jic23-huawei>
In-Reply-To: <20260609134659.3dc89b40@jic23-huawei>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 13:56:51 +0100
X-Gm-Features: AVVi8CcX067O8FqveMn6c_pwXBIWPZLxC-Ew61QuhJcjbG1Hyru1nwk5GqLaktc
Message-ID: <CAFEAcA_m_uR5J53rsDtn6+D47BfVzBn4giksLzjBeF6U2zcuwQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv/virt-acpi-build: Add _DEP to ACPI0017 for
 CXL host bridge dependency
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chen Pei <cp0613@linux.alibaba.com>, pbonzini@redhat.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, sunilvl@ventanamicro.com, 
 jonathan.cameron@huawei.com, fan.ni@samsung.com, guoren@kernel.org, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 9 Jun 2026 at 13:48, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Tue,  2 Jun 2026 15:41:25 +0800
> Chen Pei <cp0613@linux.alibaba.com> wrote:
>
> > On RISC-V QEMU virt platform with CXL enabled, the probe ordering
> > of acpi_pci_root (ACPI0016) and cxl_acpi (ACPI0017) is not
> > guaranteed. If cxl_acpi probes before acpi_pci_root has attached
> > the CXL host bridges, the CXL port topology will be incomplete
> > because to_cxl_host_bridge() silently skips devices whose PCI root
> > is not yet ready.
> >
> > Add a _DEP object to the ACPI0017 device in the DSDT, declaring
> > its dependency on the ACPI0016 CXL host bridge devices. This tells
> > the OS to defer ACPI0017 enumeration until all ACPI0016 devices
> > have been attached by acpi_pci_root.
> >
> > This requires a corresponding kernel change to call
> > acpi_dev_clear_dependencies() in acpi_pci_root_add().
> >
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>
> It may be a good idea to add a bios tables test as well.
>
> We only have the x86 q35 one today because I argued at the time
> the ARM64 one would be just duplication.  Now we have this new _DEP
> stuff we should probably add something to cover it.
>
> Please also include an iasl -d dump of the relevant additions to DSDT
> in the patch description.  Much easier to review than the code that
> generates it!
>
> In general looks fine to me and great that you are clearing this up.
> Seems it's luck that x86 and ARM64 worked without this (or strictly
> speaking other things enforcing the ordering).  Ultimately we probably
> want to add this to those two architectures a well.
>
> One small thing inline.

> > +
> > +            QLIST_FOREACH(bus, &s->bus->child, sibling) {
> > +                if (pci_bus_is_root(bus) && pci_bus_is_cxl(bus)) {
> > +                    num_cxl_hbs++;
>
> I think you only care if there is at least one. Instead of counting, just set
> a bool and break out early if you find one.

> > +                Aml *dep_pkg = aml_package(num_cxl_hbs);

Looks like we need it so we can set the num_elements here.

(If we had a version of aml_package() that let you set the number
of elements after the fact we could do this all with a single loop,
but it doesn't look like we have any other places where that would
be useful. Almost all the callers pass a fixed number.)

-- PMM

