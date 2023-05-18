Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D8FC77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 04:56:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzVgG-0007Pm-ME; Thu, 18 May 2023 00:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVg4-0007PF-U7; Thu, 18 May 2023 00:55:48 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVg0-0001JY-Ut; Thu, 18 May 2023 00:55:48 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-436161f2cf2so502090137.2; 
 Wed, 17 May 2023 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684385742; x=1686977742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUmX1ClrWU4vJpIUZv6oX2Xl6ODY5qmp2SMBhO9rVoY=;
 b=KSEmKwaoVabuBphpSkOWm4GGGflNp6Rz4k4EPgpp6BH23ATjFXgR/rlcyI0BAsjU2X
 XplRlip/p0zHSUcXfJ0Q7OuhFKJ+A+yEHUTScvX6OT9FLC4SsWON/bd+UOg/NM2KG6Xr
 CWpRdq8HyehRiPFDLKvwBHUrir1kXBIY3ckkXZzVBdV2VUj5M/kJGzGd6LQcxH9xpXez
 TYE4Cl7FU5Jmi04z0f4jg3tEJsH6TPnyRFZ+WQphJXKe+flcVB/bVhLnv+u6qbFENv3C
 UqvU4KL2ZV2zlyisr21HA+w9tFhXvzbrBDmd1DFdvCV+7W+Cyalq1A4JheajiUKo6kF+
 01dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684385742; x=1686977742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HUmX1ClrWU4vJpIUZv6oX2Xl6ODY5qmp2SMBhO9rVoY=;
 b=AnBBbp2HL8yJq+CSM+M7RD+TANsys2ARbVDzN0ZRnHcUE8AmITpeXYSg02Cg0vDGDU
 csjgyXnZIXURIJAs716zzr+RJv2PuM3fJOxMP/Jy8fx0lX8K5SSmb+7xMUtfqy2iQrBv
 rTfFwX8sVN8FA4YNG/hACoThL5yzIkA8zfk+Mp8e/1Hb4pN9RVmaSo0ECTe0ErWXVWD0
 oZ0s4hKRwrfEQogK/DGa1+V+mkgCXSw2P7sCoIl12QlvfuIFAKFeZobOvquC/jGCy4vV
 Rb4FqzGB98rIFJzL5zWmT4L6ENNOBbcES7H+5xy0E1THT3ms7tv7ELkxWJbWgVIRSSNp
 9+dw==
X-Gm-Message-State: AC+VfDy4+V2zPOm6LTSbHQsXCDBQrh7B0N77A9arihHStQ1Z0ySpkU4r
 LSWaJWEMcQPIhqAAzk9v4vTDZxbHwkyGmL9kb70=
X-Google-Smtp-Source: ACHHUZ6yolw9GkcgvkdUVbueZDJuzh5zCaPzH3Vj1Uq9b2v0XS1yv3xQYxeU+wdOxNOC5W3/v6STmNVFQR92CeXx94w=
X-Received: by 2002:a67:bc06:0:b0:42f:ef76:cc45 with SMTP id
 t6-20020a67bc06000000b0042fef76cc45mr171800vsn.14.1684385742377; Wed, 17 May
 2023 21:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
In-Reply-To: <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 14:55:16 +1000
Message-ID: <CAKmqyKPHsjtT03MdSoy4i0TgdLBF=88aS6S32hj8hzpz60d6Dg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Wed, May 17, 2023 at 10:48=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 8/5/23 12:00, Andrea Bolognani wrote:
> > On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
> >> On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
> >>> On 4/25/23 12:25, Sunil V L wrote:
> >>>> Currently, virt machine supports two pflash instances each with
> >>>> 32MB size. However, the first pflash is always assumed to
> >>>> contain M-mode firmware and reset vector is set to this if
> >>>> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> >>>> instance is available for use. This means both code and NV variables
> >>>> of EDK2 will need to use the same pflash.
> >>>>
> >>>> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> >>>> variables also need to share the same pflash, it is not possible
> >>>> to keep it as readonly since variables need write access.
> >>>>
> >>>> To resolve this issue, the code and NV variables need to be separate=
d.
> >>>> But in that case we need an extra flash. Hence, modify the conventio=
n
> >>>> such that pflash0 will contain the M-mode FW only when "-bios none"
> >>>> option is used. Otherwise, pflash0 will contain the S-mode payload F=
W.
> >>>> This enables both pflash instances available for EDK2 use.
> >>>>
> >>>> Example usage:
> >>>> 1) pflash0 containing M-mode FW
> >>>> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> >>>> or
> >>>> qemu-system-riscv64 -bios none \
> >>>> -drive file=3D<mmode_fw>,if=3Dpflash,format=3Draw,unit=3D0 -machine =
virt
> >>>>
> >>>> 2) pflash0 containing S-mode payload like EDK2
> >>>> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> =
-machine  virt
> >>>> or
> >>>> qemu-system-riscv64 -bios <opensbi_fw> \
> >>>> -pflash <smode_fw_vars> \
> >>>> -pflash <smode_fw_code> \
> >>>
> >>> On amd64 and arm64 unit=3D0 is used for code and unit=3D1 is used for=
 variables.
> >>> Shouldn't riscv64 do the same?
> >
> > Good catch, I had missed that!
>
> This is a design mistake spreading.
>
> What EDK2 maintainers want is one Read-Only + Exec region for CODE and
> one Read-Write + NoExec region for VARS.
>
> QEMU never implemented correctly pflash bank (multiple sectors) write
> protected.
>
> When EDK2 (x86, OVMF) was tried on QEMU, QEMU was using a single pflash.
> To separate CODE/VARS, a second pflash was added, the first one being
> "locked" into Read-Only mode. Using a pflash allowed the firmware to
> identify device size using pflash CFI commands.
>
> Then this design was copied to the ARM virt board for EDK2 needs.
>
> In retrospective, this design was declared a mistake, since a simple
> ROM region for the CODE is sufficient, and much simpler [*].

It seems like we are making changes to the whole flash setup. Is it
worth adding the ROM region now as well, so we can migrate to the
simpler approach.

We would keep two pflash regions, hopefully in a way that doesn't
break any existing users.

Alistair

>
> Thankfully the Loongarch64 virt machine started cleanly avoiding the
> previous design flaw. It provides a ROM for CODE and pflash for VARS.
>
> Unfortunately the riscv virt machine copied the x86/arm virt machines.
>
>
> [*] Having 2 distinct pflash is useful for non-virt machines where the
>      firmware might want to (re)program the CODE region, in the "capsule
>      update" scenario. This scenario is irrelevant for virt machines,
>      since a guest will never update its CODE. CODE is updated by the
>      host.
>
> >> Is that a requirement from distros perspective? That was my original v=
1
> >> design.
> >>
> >> But the reason why I kept unit0 for variables, it helps in keeping cur=
rent
> >> EDK2 usage model work. Otherwise, current EDK2 will break if we change
> >> the code to unit 0.
> >
> > I think that it's more important to align with other architectures.
> >
> > The number of people currently running edk2 on RISC-V is probably
> > vanishingly small, and in my opinion requiring them to tweak their
> > command lines a bit is a fair price to pay to avoid having to carry a
> > subtle difference between architectures for years to come.
> >
> > With that in mind, my preference would be to go back to v1.
> >
> >> Second, since unit 0 for RISC-V is currently assumed to start in M-mod=
e fw
> >> which is secure, I think it makes sense to keep variables also in unit
> >> 0.
> >
> > If you're storing variables rather than code in pflash0, does it even
> > make sense to talk about M-mode and S-mode?
> >
> >
> > Taking a step back, what is even the use case for having M-mode code
> > in pflash0? If you want to use an M-mode firmware, can't you just use
> > -bios instead? In other words, can we change the behavior so that
> > pflash being present always mean loading S-mode firmware off it?
> >
>
>

