Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07CAC77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 06:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzWjz-0005Zx-6K; Thu, 18 May 2023 02:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pzWjx-0005Z8-1D
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 02:03:53 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pzWjv-0003hT-9h
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 02:03:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d2467d63fso14756b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 23:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684389828; x=1686981828;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GhnStdoyaTicSH43+3DwKgegTRO3RNSgDAvHs/DdLxM=;
 b=N7qH8s0xLmyRe1359FX1T+5IQh6j4wP6JjCKtO1ygeVN1d8Xuu9BSxWV5cZIctbs+n
 wk4JFZOh0C5yzRSeri/zaP4Y9uAIjBqpyWYJMSuvxfTeWz+Xe1NFfM511d/jViTI66FQ
 DYszafZe4uHACAEEvzZlhRRGaWa8Oyy9qdhfPybRIb7sxEl5bCxcLzXMuoXBIxq3oCVn
 /1Fcrk/XKdI/UVv3BU4EEWMW0FKGchkrKFiry602WWfIG3yAOuXx0i/tSl0IouX7aciE
 WwojpB8n6aRhyPCHR/mMXzymKOJf5goVCGdmgCB7SRXQvmdKEMRc857MUVNrranvxvqS
 zW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684389828; x=1686981828;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GhnStdoyaTicSH43+3DwKgegTRO3RNSgDAvHs/DdLxM=;
 b=GlFVoXRoegsrdakc9fB04zR3plr0hxEqL3GF/ZLLKqdnsZYBIs0YMBf9pGGCgE4yW6
 zEejEh1WX2aR1JwU+gmZvWZHGmoiaJfO7tMUscGJN1EX+rI+50bnyz/PDV8WJIqlJNGS
 dwqlZmQudN4VMzZk31McTyqz+uXZU+5XOzTvz/YS9IXic9JZXdQ6e63yDFMWwDPUY2fA
 uhBLwvV75U03oEQPc8QpebtoMneTaAKbcyIsjIrhEXOruWoelHhbdH1b6bd9q0Q9BTR/
 ymPp7mrmwTNkyF+1nySF+17w+m6GX4moEJlsyeMUjxfk3jc/oIPGO1ZYBKouiOHoUbzJ
 C4WQ==
X-Gm-Message-State: AC+VfDwB88TblsIFYnk0jgR9bTWPeRcjAoHHLLDh8YR8mF19/Piafhbf
 BX95k7/o07XWB8WxiTcrrgnlQw==
X-Google-Smtp-Source: ACHHUZ5/RGrnSuui3njS/Mqk1O36DkdqEQOpp8g4plICjo+Hpz6Qp7TlG2LLhXox0H1VTBu80sGfIA==
X-Received: by 2002:a05:6a20:430e:b0:100:ac13:9a57 with SMTP id
 h14-20020a056a20430e00b00100ac139a57mr1151884pzk.55.1684389828335; 
 Wed, 17 May 2023 23:03:48 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 u37-20020a632365000000b0050bd4bb900csm424190pgm.71.2023.05.17.23.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 23:03:47 -0700 (PDT)
Date: Thu, 18 May 2023 11:33:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZGW/vqOD6E263wDD@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
 <CAKmqyKPHsjtT03MdSoy4i0TgdLBF=88aS6S32hj8hzpz60d6Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPHsjtT03MdSoy4i0TgdLBF=88aS6S32hj8hzpz60d6Dg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, May 18, 2023 at 02:55:16PM +1000, Alistair Francis wrote:
> On Wed, May 17, 2023 at 10:48 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > On 8/5/23 12:00, Andrea Bolognani wrote:
> > > On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
> > >> On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
> > >>> On 4/25/23 12:25, Sunil V L wrote:
> > >>>> Currently, virt machine supports two pflash instances each with
> > >>>> 32MB size. However, the first pflash is always assumed to
> > >>>> contain M-mode firmware and reset vector is set to this if
> > >>>> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > >>>> instance is available for use. This means both code and NV variables
> > >>>> of EDK2 will need to use the same pflash.
> > >>>>
> > >>>> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > >>>> variables also need to share the same pflash, it is not possible
> > >>>> to keep it as readonly since variables need write access.
> > >>>>
> > >>>> To resolve this issue, the code and NV variables need to be separated.
> > >>>> But in that case we need an extra flash. Hence, modify the convention
> > >>>> such that pflash0 will contain the M-mode FW only when "-bios none"
> > >>>> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > >>>> This enables both pflash instances available for EDK2 use.
> > >>>>
> > >>>> Example usage:
> > >>>> 1) pflash0 containing M-mode FW
> > >>>> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > >>>> or
> > >>>> qemu-system-riscv64 -bios none \
> > >>>> -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> > >>>>
> > >>>> 2) pflash0 containing S-mode payload like EDK2
> > >>>> qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> > >>>> or
> > >>>> qemu-system-riscv64 -bios <opensbi_fw> \
> > >>>> -pflash <smode_fw_vars> \
> > >>>> -pflash <smode_fw_code> \
> > >>>
> > >>> On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
> > >>> Shouldn't riscv64 do the same?
> > >
> > > Good catch, I had missed that!
> >
> > This is a design mistake spreading.
> >
> > What EDK2 maintainers want is one Read-Only + Exec region for CODE and
> > one Read-Write + NoExec region for VARS.
> >
> > QEMU never implemented correctly pflash bank (multiple sectors) write
> > protected.
> >
> > When EDK2 (x86, OVMF) was tried on QEMU, QEMU was using a single pflash.
> > To separate CODE/VARS, a second pflash was added, the first one being
> > "locked" into Read-Only mode. Using a pflash allowed the firmware to
> > identify device size using pflash CFI commands.
> >
> > Then this design was copied to the ARM virt board for EDK2 needs.
> >
> > In retrospective, this design was declared a mistake, since a simple
> > ROM region for the CODE is sufficient, and much simpler [*].
> 
> It seems like we are making changes to the whole flash setup. Is it
> worth adding the ROM region now as well, so we can migrate to the
> simpler approach.
> 

ROM is used for FW image used for -bios option in RISC-V. It appears
that loongarch uses -bios to boot EDK2 also as per
docs/system/loongarch/virt.rst. But in RISC-V, EDK2 is S-mode payload
and hence -bios can not be used. If we have to create ROM for S-mode
payload, do we need to add a new qemu option? Also, I don't see
enough space in the memmap of RISC-V virt machine for PAYLOAD_ROM
region. So, I am not sure how to keep 2 flashes and add ROM region for
S-mode payload. Let me know if I am missing some thing.

> We would keep two pflash regions, hopefully in a way that doesn't
> break any existing users.
> 
Agree. While I agree with Philippe, I think we better solve the current
problem by going back to v1 of the patch.

Thanks,
Sunil

