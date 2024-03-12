Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF793C54E58
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 00:20:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjpsR-0007uH-DW; Mon, 11 Mar 2024 20:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rjpsL-0007rx-J7
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 20:20:13 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rjpsG-0002Ti-OD
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 20:20:10 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51381021af1so4716466e87.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Mar 2024 17:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710202805; x=1710807605;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o40GaIslVQRLOr0iuKq+jLTzbzAp3uD9+opmBCASSLY=;
 b=I1F7OOAJs0ovOjiazZajM2K5F3LwSyflf6v/b0ge0jr7/UEOj5jILHLmQ1GxpCHFh5
 SdUyvUKKpEplqdKVXgqlVmd0cyjTgas3ZdGEo0FFb6RdsUT+2ZvHqQIQQInP0y0fWKnt
 AUBdJEYYnXb0kDBoe0aTyMkbq9zIvN6BmX2uOlDV/6HOHYQnkvr6HQKGGDjdVJbJTCQm
 ZMM03OH1ea7UA8eS+JoOlBgjQEwyOMKC1AwnKTPJehna8ETWhlj2hXXRrfTd73zJ7Dmj
 KuXmUm88UlokN+BrvJbboPOvepDIc9azG3sU8kQoWbMBMKOFvAa4SHN6J77XDbep1Bmh
 ztIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710202805; x=1710807605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o40GaIslVQRLOr0iuKq+jLTzbzAp3uD9+opmBCASSLY=;
 b=R87S8wchLj3UhgU/TypLvmaP4FxgTniBYU2Mla8ER1fUBlWNnzNyu6myTKu2eXD6F9
 +kxrFwUx1ERjAULT9sMc65Tgv/5oshPtFW5Kz8owq3LMo5aJCpK66724OcD69xM6l6St
 eB+rg3ih0Cxd4Sngm+wZluG8OEPl5q3DkwxX/bxQ94vw8nkndula50DQ3FXmMRzzNpS2
 l0MT9PqjJXikrjHgV9H3aIJ0MWptQfvU4uCpIykKY9H4FY7PHJ4y/CauysQXmoyUezb3
 Zw+fq3sUGa5w2DE7N6/dnLhZtoTtk+UJvg8ChbVHWCH00A4tlsrebBfRCq0CLsPyweYm
 bA/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWHWWXaJ6O4bw/ZxUmdO3zhcqZwf/Wz8a9i0PKTws8uIYcQiVxCj4GcEZ+O7x4q+SPL5XbWV09SGgIYHKbyzCZUoV/BZ4=
X-Gm-Message-State: AOJu0YynjC2bJNS8+avz4dHrVxa7F44KpLz2M//4NNDRRjyzTZqT0NtS
 FXy4Pbgiow7iFawZ/riNh8E6UkASpRKD9qCQIP4K+l0khuZGyRr+ykdG+1QKoHuwVDotogq0AUn
 ZlGEuZk0F2waF6Lbbf06eC+8g2c8uQSccAgAcDg==
X-Google-Smtp-Source: AGHT+IFTIv4zXa5CtpQm0PkFLNap0RzKehK9YtbC2CE4SewyVRxHKzy3C/hUpxomgKZUTzEh/IrFZni7a4wN3GjwFy0=
X-Received: by 2002:ac2:528b:0:b0:513:8c61:209f with SMTP id
 q11-20020ac2528b000000b005138c61209fmr4558433lfm.13.1710202805147; Mon, 11
 Mar 2024 17:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240304102540.2789225-1-fei2.wu@intel.com>
 <20240304102540.2789225-2-fei2.wu@intel.com>
 <CAKmqyKMQyDjLkeo+aU58rE6_Vb84QeeZP3FUafw5GuWpk1JmZQ@mail.gmail.com>
 <8f5d6664-c075-4d31-bf33-ce24ceeb9b13@intel.com>
 <CAHBxVyHP1hgGWg6EByX6XzqmTm_Tr0uw7tk65KWcytNYsKdw8w@mail.gmail.com>
 <CAKmqyKM08RwR7RybMGaN6CpmbHJrLwx0DSjz_A1w6h0AkW12rQ@mail.gmail.com>
 <18efc373-b98b-4a9f-96c5-c6821793138f@intel.com>
 <20240308-48ff9db3408048d387d6cfa4@orel>
 <fee8e89a-7d87-43b8-bc87-af76a67c4317@intel.com>
 <20240311-bef101446cc9ea2b033b417d@orel>
In-Reply-To: <20240311-bef101446cc9ea2b033b417d@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 11 Mar 2024 17:19:54 -0700
Message-ID: <CAHBxVyG8uLn=OGEHdCzoMqJ7bcaX8Jqh4JbmXRxKoobWPiEe5w@mail.gmail.com>
Subject: Re: [RISC-V][tech-server-soc] [RISC-V][tech-server-platform] [RFC
 1/2] hw/riscv: Add server platform reference machine
To: Andrew Jones <ajones@ventanamicro.com>
Cc: "Wu, Fei2" <fei2.wu@intel.com>, Alistair Francis <alistair23@gmail.com>,
 pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, andrei.warkentin@intel.com, 
 shaolin.xie@alibaba-inc.com, ved@rivosinc.com, sunilvl@ventanamicro.com, 
 haibo1.xu@intel.com, evan.chai@intel.com, yin.wang@intel.com, 
 tech-server-platform@lists.riscv.org, tech-server-soc@lists.riscv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Mar 11, 2024 at 7:38=E2=80=AFAM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Mon, Mar 11, 2024 at 04:55:24AM -0700, Wu, Fei2 wrote:
> > On 3/8/2024 5:20 PM, Andrew Jones wrote:
> > > On Thu, Mar 07, 2024 at 02:26:18PM +0800, Wu, Fei wrote:
> > >> On 3/7/2024 8:48 AM, Alistair Francis wrote:
> > >>> On Thu, Mar 7, 2024 at 5:13=E2=80=AFAM Atish Kumar Patra <atishp@ri=
vosinc.com> wrote:
> > >>>>
> > >>>> On Wed, Mar 6, 2024 at 4:56=E2=80=AFAM Wu, Fei <fei2.wu@intel.com>=
 wrote:
> > >>>>>
> > >>>>> On 3/6/2024 8:19 AM, Alistair Francis wrote:
> > >>>>>> On Mon, Mar 4, 2024 at 8:28=E2=80=AFPM Fei Wu <fei2.wu@intel.com=
> wrote:
> > > ...
> > >>>>>>> +config SERVER_PLATFORM_REF
> > >>>>>>> +    bool
> > >>>>>>> +    select RISCV_NUMA
> > >>>>>>> +    select GOLDFISH_RTC
> > >>>>>>> +    select PCI
> > >>>>>>> +    select PCI_EXPRESS_GENERIC_BRIDGE
> > >>>>>>> +    select PFLASH_CFI01
> > >>>>>>> +    select SERIAL
> > >>>>>>> +    select RISCV_ACLINT
> > >>>>>>> +    select RISCV_APLIC
> > >>>>>>> +    select RISCV_IMSIC
> > >>>>>>> +    select SIFIVE_TEST
> > >>>>>>
> > >>>>>> Do we really need SiFive Test in the server platform?
> > >>>>>>
> > >>>>> It's used to reset the system, is there any better choice?
> > >>>
> > >>> If we add this now we are stuck with it forever (or at least a long
> > >>> time). So it'd be nice to think about these and decide if these rea=
lly
> > >>> are the best way to do things. We don't have to just copy the exist=
ing
> > >>> virt machine.
> > >>>
> > >> We need a solution to poweroff/reboot, and sifive test is one of the
> > >> hardware implementations, so in general I think it's okay. But I agr=
ee
> > >> Sifive test looks a device for testing only.
> > >>
> > >>> There must be a more standard way to do this then MMIO mapped SiFiv=
e hardware?
> > >>>
> > >> The mapped MMIO mechanism leveraged by Sifive test by itself is kind=
a
> > >> generic, the sbsa_ec for sbsa-ref is also an MMIO mapped device. The=
se
> > >> two devices look very similar except different encodings of the
> > >> shutdown/reboot command.
> > >>
> > >> Probably we can have a generic shutdown/reboot device in QEMU for bo=
th
> > >> sifive test and sbsa_ec, and likely more (not in this patch series).=
 In
> > >> this way, sifive test device will be replaced by this more generic
> > >> device. Any suggestions?
> > >
> > > Operating systems shouldn't need to implement odd-ball device drivers=
 to
> > > function on a reference of a standard platform. So the reference plat=
form
> > > should only be comprised of devices which have specifications and alr=
eady,
> > > or will, have DT bindings. Generic devices would be best, but I don't
> > > think it should be a problem to use devices from multiple vendors. Th=
e
> > > devices just need to allow GPL drivers to be written. With all that i=
n
> > > mind, what about adding a generic GPIO controller or using SiFive's G=
PIO
> > > controller. Then, we could add gpio-restart and gpio-poweroff.
> > >
> > I agree with most of what you said. Regarding generic devices, syscon
> > looks a better choice than gpio in the current situation.
> >
> > Linux kernel has these configurations enabled for virt, and I'm not
> > going to add a new soc for this new board currently, we can use the sam=
e
> > syscon interface for power, and it has already well supported.
> >
> > config SOC_VIRT
> >       bool "QEMU Virt Machine"
> >       select CLINT_TIMER if RISCV_M_MODE
> >       select POWER_RESET
> >       select POWER_RESET_SYSCON
> >       select POWER_RESET_SYSCON_POWEROFF
> >       select GOLDFISH
> >
> > For the qemu part, we can remove device 'sifive_test' and manage that
> > memory region directly with MemoryRegionOps, similar to what
> > hw/mips/boston.c does.
>
> OK, that sounds good. Also, I guess the real concern is whether firmware
> (e.g. OpenSBI) supports the platform's power-off device, since firmware
> will present the SRST SBI call to Linux, so Linux doesn't need to worry
> about it at all. However, if we want Linux to worry about it, then we

Syscon devices are already supported in OpenSBI. So syscon seems to be
the best option right now.

> can't forget to ensure we can implement the syscon interface in AML for
> ACPI too. Indeed, we should be introducing ACPI support for this referenc=
e
> machine type at the same time we introduce the machine in order to ensure
> all device selections have, or will have, both DT and ACPI support.
>

Yeah. In addition to that, this reference platform also needs to
generate minimalistic DT
for OpenSBI even though only ACPI is required for Linux. IIRC,
sbsa-ref also does something similar.

> Thanks,
> drew

