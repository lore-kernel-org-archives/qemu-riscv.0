Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS6Ez-0000JT-NU
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 15:15:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6Ey-0000JI-CX
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:15:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6Eu-0005f1-Ef
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:15:20 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS6Eu-0005cw-7E
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:15:16 -0500
Received: by mail-pf1-x434.google.com with SMTP id y126so2828169pfb.4
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xRGqnAe4HGhYWBnd2IzZ7PQSPkR1OpxBrlwWsfMnwv8=;
	b=MRgK2fE4KBiG0AT0ad6Ckvnjh68JYqhaKI//LOATET5HHi2kpiG9i0G7OnNW8VMXw3
	pRglmh2VFK1U9EKsoJZPVc7MZCb0TbkO3ifvRwoZhRjWeVoib0KsWoQ+EHMXWp0wObw+
	qErIUzUB6w/m4zA04rKSVmO+aNzxhrlxetaiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xRGqnAe4HGhYWBnd2IzZ7PQSPkR1OpxBrlwWsfMnwv8=;
	b=EN5N6vIoUdiUdJNn+1DP+pGRbtqvuFUC5Kqbt8Q4usj7dFxYWf+ttA2ZCM7ORhPKw5
	QMTbn4coXkVFCWbdhrDgpAf0S05szWnaW1zCcPxcoNKWsOcs3PUzIjpXrXi37qmegugc
	0tf0/fIKl0haxPkeOHraMRAxe7VcTzHH805RkqzqL9ictQsB4OjGG07eWN00wtFngl2p
	uUKRYygkZoBroERboIl7hfYOVbCWGLU4RwE0MBKCIayHFKUBHHqM6hDxgucGUzwUaZbj
	GTJdZKN3JUa5Isf7UtO7RSUHg1wrMlFPorAteidclAibxeUJNms3fSaJYXxr0aDVfcj8
	5x/g==
X-Gm-Message-State: AGRZ1gILk5p71preCRGujcrVSgTYLdXRsZDdgfuvg8LLVb4yXSGkz7i9
	nxzEyf4IT3FeM8r6FyBCRs/lUQ==
X-Google-Smtp-Source: AJdET5dUOknUmviPhuNabMrvyZjOssZR3xMfGN0tosXnwvYsESazWwI4GtNzZI6XpYqGj24sSTHYQA==
X-Received: by 2002:a62:1289:: with SMTP id 9mr39429722pfs.102.1543436115236; 
	Wed, 28 Nov 2018 12:15:15 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	p24sm24603395pfk.155.2018.11.28.12.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 12:15:14 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<aa41323b013a6c77e28d487d49026df36d60e4c5.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ea1df40c-ce6c-16a0-4256-298f32748c6c@linaro.org>
Date: Wed, 28 Nov 2018 12:15:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <aa41323b013a6c77e28d487d49026df36d60e4c5.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::434
Subject: Re: [Qemu-riscv] [RFC v2 14/24] riscv: tcg-target: Add branch and
 jump instructions
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
X-List-Received-Date: Wed, 28 Nov 2018 20:15:21 -0000

On 11/27/18 1:08 PM, Alistair Francis wrote:
> +static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
> +{
> +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> +
> +    if (offset == sextract64(offset, 0, 26)) {
> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> +    } else {
> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
> +    }
> +}
> +
> +static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
> +{
> +    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> +    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
> +    if (offset == sextract64(offset, 1, 20) << 1) {

s/20/26/

Seems like there ought to be more shared code between tcg_out_call_int and
tcg_out_goto_long, really.


r~

