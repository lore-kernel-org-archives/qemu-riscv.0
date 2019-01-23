Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmPz5-0005sp-Rm
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 16:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmPz1-0005r1-Mc
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 16:22:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmPyz-0001YZ-Fz
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 16:22:51 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gmPyz-0001Wh-6f; Wed, 23 Jan 2019 16:22:49 -0500
Received: by mail-lf1-x143.google.com with SMTP id c16so2696125lfj.8;
	Wed, 23 Jan 2019 13:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ds/t8MUyEZtHI2y/6u9sH9w1I0UqEVvraRM0PQH6RUc=;
	b=vHHgsJHDTUgMcmoJiQEp+KaqQ9Y9XVC9vBZ76FpniCzKKjoYjePvOgh2m+dUo8eqMf
	P+TM2hi394yWmauiLHKJrV81mao7JuB+D1YzD58Kr+WGyHBRWy53okgjKu0OEvFsmbg9
	bwPW9MOvtvhoJpWi5Gz1kURkbarJ3WGy+sR051nikfvKDCm1rm/bKWItWNkPpAuJxnoN
	6Iwc//C3MdmcV71iEmia/iEL4Quv3svEady3n6aBejhJSUq+zmz2M23eulB8Nf+MldzF
	le/BBaFbTsDioNv5NkLOwnpRwRLLZayyjkr218EJzQI0fEDlRet6lvgEAUjnDJWh/9no
	FZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ds/t8MUyEZtHI2y/6u9sH9w1I0UqEVvraRM0PQH6RUc=;
	b=NOXnv83A5+sG6xR/BIvMNDiDFyaumzHGVeXR2wy3jS3X/1hfupVyCcRPIfoYULMUgd
	3FHnVOYtDOfpivUrG8kLGaaK9qB8d2VvxUQQQgPcla4k3isYEiMLls5AL1+TK8PGyf80
	Z4LD9SBpmvc5niaFLKT6VSJfHbPVrqZAbbW561+Fkj5In3/FEu7c/VG3AWjx5UYlewCv
	GsuoilXgkAuSGvofHiKABkVWO7Du8kcIWIOKnNoiOtKCyFJo1G7hLksrFnnXrgrAFpIo
	e/6PBVgDePDwdayPmYU2BaiRmVXTAosK6fU+cDpzFYu8Uf9/upurccig4ckCByJakkwj
	rzFA==
X-Gm-Message-State: AJcUukc1ecOpi010gYo5GKBxUBr7tbaUesXGMBdQ9sSDrzm2Y/loNXoz
	4XKXYD82kvSMJzoXUVpuQtruotzdw7P8m3UFWgU=
X-Google-Smtp-Source: ALg8bN7UB4X0CXmrQtrbMPjve+kI6bQ2PUgYXZOOisvWlW7rO9++rY4HpU+0sZEiBUF5EFyHyHPtYQtFEn/CdOQLxP4=
X-Received: by 2002:a19:d486:: with SMTP id l128mr3139445lfg.114.1548278566411;
	Wed, 23 Jan 2019 13:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<2153eec6-f25f-4e34-6423-01d76a14815c@linaro.org>
	<66fd9695-c511-b068-7cf1-b529d9f44d9d@mail.uni-paderborn.de>
In-Reply-To: <66fd9695-c511-b068-7cf1-b529d9f44d9d@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Jan 2019 13:22:19 -0800
Message-ID: <CAKmqyKM8NKY5uzYezWbR5cxfpMpy=VFof3BrOhRaDZsbFHLrig@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, 
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 00/35] target/riscv:
 Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 21:22:55 -0000

On Wed, Jan 23, 2019 at 1:15 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
>
> On 1/22/19 10:38 PM, Richard Henderson wrote:
> > On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
> >> Hi,
> >>
> >> this patchset converts the RISC-V decoder to decodetree in four major steps:
> >>
> >> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
> >>      Many of the gen_* functions are called by the decode functions for 16-bit
> >>      and 32-bit functions. If we move translation code from the gen_*
> >>      functions to the generated trans_* functions of decode-tree, we get a lot of
> >>      duplication. Therefore, we mostly generate calls to the old gen_* function
> >>      which are properly replaced after step 2).
> >>
> >>      Each of the trans_ functions are grouped into files corresponding to their
> >>      ISA extension, e.g. addi which is in RV32I is translated in the file
> >>      'trans_rvi.inc.c'.
> >>
> >> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
> >>      All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
> >>      we convert the arguments in the 16 bit trans_ function to the arguments of
> >>      the corresponding 32 bit instruction and call the 32 bit trans_ function.
> >>
> >> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
> >>      this move all manual translation code into the trans_* instructions of
> >>      decode tree, such that we can remove the old decode_* functions.
> >>
> >> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
> >>     by Richard. [Patch 31-35]
> >>
> >> full tree available at
> >> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
> >>
> >> Cheers,
> >> Bastian
> >>
> >> v4 -> v5:
> >>      - fixed rebase error
> >>      - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
> >>      - removed extra sign extension of sraiw
> >>      - removed rs2 == 0 special cases in sraw/srlw
> > All looks good to me now.  Thanks for persevering.
>
>
> Thanks for your great reviews. I'll do a final respin to fix the funky
> indentations. Alistair do you want to pick up the series?

Thanks, the series looks good :)

Palmer is in charge of pull requests for RISC-V QEMU. So it will have
to go through him.

Alistair

>
> Cheers,
>
> Bastian
>
>

