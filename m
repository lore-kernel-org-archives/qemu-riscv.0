Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93038C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 03:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whfst-00058i-Gw; Wed, 08 Jul 2026 23:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfsr-00058S-PK
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 23:57:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfsp-00037x-4G
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 23:57:08 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-698e5859a3cso991812a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 20:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783569425; cv=none;
 d=google.com; s=arc-20260327;
 b=Ch0/tcQeomNyXNvUQVJeUb9DYgeaC8gFX/oB8EnA9S0NI09MxaL6rn3IESpwPwKxEN
 E/OH8OmCezZwB8lS90NfIuEN/3VjnnBYbZ4mLLhwtIZoR995NsOLYD78sNuBws2mHHYF
 0xw/0v5QpGn62bhoaGbXMogDUoLsAQwR/RLqVcPfwm/q3q87SRHNi5qjHSbESzm8mNA8
 0ND/n4e0JPFcJc+qIiOBznAnVE5ls52/Qjw9en6KhgBOX1+IyVO9qvnD0pP1pVLYjGpA
 ycEIj3/rwJ1baxt3DYc/I231O3jRyEUDsNpDX/V4RyMZsFpKiM5okvMw5Jmk6v8ILZb4
 qg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nLplJtHM2neuMqbdGc8BysGwibKRIQ2sUJ9QDSTjj9U=;
 fh=NtHaSjEX/TMdd22CDVYzGpJkhCkCwJJYD6Alz5qPJ40=;
 b=j7aPAMVa1UiT8KjdB3Y1O7l+y6FSL/wH8aCeBGUwCd/5xjbrPi7nLud9Vxu03QEb1x
 5C4JL63fbNRf3WVyzyD09j/f/WBZw6eHYAPkq8JWStEhSneWdkp3dCD6qLGhyg/oxN4m
 6EM0XBhqeJwVePkYlFp5YYsagPvPlvOXsDpUXGFr4WpOvrWpvw8DVq+YzAZmD0w+8n1J
 zu4TNpYjBI8aOMlZ/xcNL/iAJV6Qc7V0OmsCj+37FeFJMRp7wrOYj1i0I5DfxbOvQnoh
 VwMsm7HDRZ+QP8vxcH4UvMEuTc/9nyCdXm7hK/JXXvp9KfT0qGEZ6RXhZSeStFSPlz2Z
 40qQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783569425; x=1784174225; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nLplJtHM2neuMqbdGc8BysGwibKRIQ2sUJ9QDSTjj9U=;
 b=TwNwBiUuuKT9EaHqnkwdnc2cAkI3wy8559dabWOToqxbSOOonBXCJSYBu3W2IECdHr
 n2macz1tdbptP+Bc8IxA+aAl//7w1N219BDRnYYotah+sJiXYhbvdreVExnAkFuUk/Zy
 +7wtBM9DvreXJcuWAqUOzqwtAFtvMIGUv0vaKL7BuwARMdQnuOVmW5KwMYsr4vjl5E7x
 tKUF0roTH6lbtTmVgvZGhICO3OASxSKxxG3agUzuSgAeKJdljHoazPpWyQf6afknH1lv
 5raFhfviE9Zt1easFwqjbrpgToY9sZUv7wMDIh1hlqkCMJgQAlKXfoCLxbdL3JxvC5oF
 ImWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783569425; x=1784174225;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nLplJtHM2neuMqbdGc8BysGwibKRIQ2sUJ9QDSTjj9U=;
 b=Rwv5JOnCLuD7D7fNP9TJ4GWsB/mudIV3jpwXd8D+dpyTWIT4NBVOuT5XLoOOnmFvjQ
 9GY9RiBsMn2mOwbOcOj68qPc1xUPsu2bLtKp4GAdh4pk1OTdkYH8LhRfLLqhuMaSxGSN
 WIP0UY3BCzXCAQSIbqVChbJTGIONduQLKrq4Dua8hw9jtVqiNSuSGXOdMs2NoQpxPR4i
 GNf2MOueW0SvWYVk3WVDankvh0dLiW4FKttk/EN3z+I41bjlIBtbm9/WFjUtLI2sIOeR
 UfCwPUqhFleclQmyV8MbFiiHuChcbmEcUNAQT1GQ4kC1F6jjzfqI/yPlpnPCMzDlPsrR
 /1hQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrEXR7UmFnstKWE7YH4aWwrTusqWHmZdnz+yezq90dpKIKYVhdffNyLa/dhPbyLxuMZdMYcBqpwE324@nongnu.org
X-Gm-Message-State: AOJu0YycClJbYPyHW8WgTVrptyz3x+dKhW4THkd2LAWYX3fI7SZs7Cxh
 qYIqsv+QQrjdxAyPLaOXIcZAKfbWSUJ99zHeP+PrwPmA9Ah2NwZaN8Kwi41KB9iBH47aIEP2eND
 FBmRdvMIQL1HAnovErpbt5YbgMA3ODZQ=
X-Gm-Gg: AfdE7clSF0CL+m8yIg83ua78xGMBJiV65974L5Ka2pKAV03W0q9WROhEyC2MhDu4wdE
 i7wrAra3Erzx9/2fXkTP0qFmVdqbT3vUWBpTaXVyuDjhyHVkPONfDRQkTgnoPRqD/wsdUP5K8tU
 aPqOYMPL1EAKRHWL56B+GOH8OdN5YWIfSIhUd5Yy6DWV7PbV2nKh/+pGjg50KzV2ueYiTIDuPHh
 K3J5QnKdF+4r509ZInLud3dYPoEykNWnXLZVTKCflhSBelkLu0jkA5Q3Eryi9QIFaxCUuGSq7HL
 xooZQ5iJEsz0dcxYLKiMIB4gijU=
X-Received: by 2002:a05:6402:3814:b0:698:7418:57a9 with SMTP id
 4fb4d7f45d1cf-69c032a82a1mr376176a12.17.1783569425398; Wed, 08 Jul 2026
 20:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260618093827.3507-1-cp0613@linux.alibaba.com>
 <20260618093827.3507-3-cp0613@linux.alibaba.com>
 <CAKmqyKNmFdJRUegowCGggk+4fOmY7vBxOH+_gnmTSpNhyqWqHg@mail.gmail.com>
 <20260707115030.5161-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260707115030.5161-1-cp0613@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2026 13:56:36 +1000
X-Gm-Features: AUfX_mzGPIZl7w4I_sfMBRvqxgaPOqutCMZGwIBH_MVFtTqZr67SNShdej1XIes
Message-ID: <CAKmqyKPskHLaQMs1SCNjNRzhZjX-E=4KO4x_KS8kAc+LvSh3qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/riscv/virt-acpi-build: Add _DEP to ACPI0017 for
 CXL host bridge dependency
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: jic23@kernel.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, sunilvl@ventanamicro.com, dave.jiang@intel.com, 
 alison.schofield@intel.com, imammedo@redhat.com, mst@redhat.com, 
 guoren@kernel.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
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

On Tue, Jul 7, 2026 at 9:51=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com> =
wrote:
>
> Hi Alistair,
>
> On Mon, 6 Jul 2026 14:08:45 +1000, Alistair Francis wrote:
> > What happens to kernels that don't have this change?
>
> Good question. The behavior depends on how old the kernel is:
>
> - Kernels that support _DEP processing but lack the
>   acpi_dev_clear_dependencies() call in acpi_pci_root_add(): the
>   ACPI0017 (CXLM) device will remain deferred indefinitely because
>   its declared dependency on ACPI0016 is never cleared. CXL memory
>   would be unusable on such kernels with this QEMU.
>
> - Very old kernels that ignore _DEP entirely: the behavior is the
>   same as v1 =E2=80=94 the probe-ordering race between acpi_pci_root and
>   cxl_acpi remains, but nothing is worse than before.
>
> The kernel-side fix has already merged:
>   https://lore.kernel.org/linux-pci/20260526025118.38935-1-cp0613@linux.a=
libaba.com/
>
> So this is effectively a "new QEMU requires a sufficiently new kernel
> for CXL to work" situation, similar to other QEMU features that depend
> on kernel support.

That's fine, we can say you need a new kernel for this new feature to
work, as long as it doesn't break existing PCIe for old kernels

Alistair

>
> Thanks,
> Pei

