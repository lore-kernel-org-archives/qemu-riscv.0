Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm3l6-0007cA-JF
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 16:39:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3l4-0007Y7-FF
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3l3-0006DW-8G
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:38:58 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gm3l3-0006Bw-1f
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:38:57 -0500
Received: by mail-pf1-x441.google.com with SMTP id h3so35623pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 22 Jan 2019 13:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BkJuoclapKB2u4Q13Okmj+djDJCLnLJVc36LO2dPYo8=;
	b=jVEjd5Oj8JPWwSsUle1KSbru93cP+J3zv4zyArZRtSXm0Bx4slpDcdeumrGbJ9IrYK
	XIWc74i5rMF9mnodsEpg6pVoBHYu3a5Iz/ZAhAKr+TCt9t1cF+c08XIqqgn6gyK7mDMd
	0/JJ1+lK5n815FPNsoiGmCoGB/NFaSw2Wa8yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BkJuoclapKB2u4Q13Okmj+djDJCLnLJVc36LO2dPYo8=;
	b=KAGSgVxsbVnGvmjCCNfbkR9HQHLLbaKlL8CEuD3DeU34G/oJvOIPmFY3d1ZRnMzYEX
	mNhX6pL4hY9KK0DqiUpE+XuwaTqZx/tesMmoJlwSEl/le2xa+3M5TFyaoeN9gWe/hSBP
	koypb5L7gprjHVBp8q1pZP6+X3iBq82CQ1F8tRNtlQQuWY+Kbe7yxvFZrrG/FRU/Hv+E
	ArCVf4ZiE+o43d/0sqWpLC/qFkq+V5DndcLmNcSJH43N5C6FO8EqCcl/J/C+9fJsa/d3
	AzOxzSRx5nKMEIc1TlxaLpxWa5fDU0Uuee14Vse4nQ/ZFGlmevDJOtHHK9nmr4HWwsT1
	Mvlg==
X-Gm-Message-State: AJcUukc0t40414kQ+GZSVtHb0Qp+0cKrvtsXYY62Tplv/iBm674FHMyA
	bMryOWkfrbNqUCWjd2C8a97/+A==
X-Google-Smtp-Source: ALg8bN4qz6HAuDe8E4nlViPK3+8yeTwyPInUQHXRahMu7gnnC1K+HV3jpYwU0QimNQSHpNKhcWUENQ==
X-Received: by 2002:a63:d301:: with SMTP id b1mr33640624pgg.61.1548193135533; 
	Tue, 22 Jan 2019 13:38:55 -0800 (PST)
Received: from cloudburst.twiddle.net ([170.173.8.12])
	by smtp.gmail.com with ESMTPSA id
	t90sm23172641pfj.23.2019.01.22.13.38.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 13:38:54 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2153eec6-f25f-4e34-6423-01d76a14815c@linaro.org>
Date: Tue, 22 Jan 2019 13:38:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v5 00/35] target/riscv: Convert to
 decodetree
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
X-List-Received-Date: Tue, 22 Jan 2019 21:38:59 -0000

On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
> Hi,
> 
> this patchset converts the RISC-V decoder to decodetree in four major steps:
> 
> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>     Many of the gen_* functions are called by the decode functions for 16-bit
>     and 32-bit functions. If we move translation code from the gen_*
>     functions to the generated trans_* functions of decode-tree, we get a lot of
>     duplication. Therefore, we mostly generate calls to the old gen_* function
>     which are properly replaced after step 2).
> 
>     Each of the trans_ functions are grouped into files corresponding to their
>     ISA extension, e.g. addi which is in RV32I is translated in the file
>     'trans_rvi.inc.c'.
> 
> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>     we convert the arguments in the 16 bit trans_ function to the arguments of
>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
> 
> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>     this move all manual translation code into the trans_* instructions of
>     decode tree, such that we can remove the old decode_* functions.
> 
> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>    by Richard. [Patch 31-35]
> 
> full tree available at
> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
> 
> Cheers,
> Bastian
> 
> v4 -> v5:
>     - fixed rebase error
>     - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
>     - removed extra sign extension of sraiw
>     - removed rs2 == 0 special cases in sraw/srlw

All looks good to me now.  Thanks for persevering.


r~

