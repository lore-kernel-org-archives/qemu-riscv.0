Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNaMz-0007Jo-Lz
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 04:24:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNaMv-0007IU-W9
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNaMs-0002qU-QB
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:24:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNaMr-0002oG-QM
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:24:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id z13-v6so24114515wrs.3
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8xKTHBv5GF/PPyEA1uRW/q7omHIISjv7NTTdn5pUwOE=;
	b=S7lY7WZUOIeLQvWC8mcIhbtCCuj7vLivSG9M24DgU3EJl2pnqn045HVOc0gCW/0vI9
	ljtpdVKslQ36LUwPRlwnL8SD/m1ob1keayk5WWrSWC2QNUbPVpREPXaYkO8D0WFLjlNL
	NPNdprnXPo4Fexrkd+t3UcDxtX+yZcA+GY8Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8xKTHBv5GF/PPyEA1uRW/q7omHIISjv7NTTdn5pUwOE=;
	b=fdztO4XwUxrdrHuS/rHlSS9EyAsdmQSGCP+RRYJ5jIM3BJUcyjHXU8ivGt7k7ArmdS
	sccsSLMocjwVcnOljsX4m10zgQVW/74u+2v/k3BDixa/Uq601g9Zvrj94llc73P/zlPb
	HnoRHd9Xx7Cp+0fIAShzrTpAzHwxA3adEA0FVMKntt+HhJuR9kQlb4A8ZXmD70e5J5LX
	OK+jVIFOYnBnSX3HVYKaqYk604IJXFSCTVutjesehdBosFKbBiIbhfNk9HlDSRpVjgei
	BMEwqpmhSKyuSUwFSxWghZ/OiZvlc/wrDRfgQj1AVuXH6SU/X4uwLPHpG+MXtKvTcFnS
	eRUw==
X-Gm-Message-State: AGRZ1gK8NdMF9InoWG2RauYqyuFwGhj1/aDRBs1JqQiw+2QlZwNPNSgt
	i4blvaDFBez2pq/b2KY4+FcC0w==
X-Google-Smtp-Source: AJdET5cX3KgfTMP9Df95VjL9qglaPzX/qTICSi76U+AYeNp7czVe7fjXI7c4I6Owj1XyE4Ae2X7HeA==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6-v6mr8656960wrt.75.1542360288642;
	Fri, 16 Nov 2018 01:24:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	y81-v6sm17352735wmd.11.2018.11.16.01.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:24:48 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<bd8f5c781f7086c5b26e1bd4c8e6570b5534b22d.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f56a1b1c-8cc8-7e85-c88b-3894e4628d6b@linaro.org>
Date: Fri, 16 Nov 2018 10:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <bd8f5c781f7086c5b26e1bd4c8e6570b5534b22d.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 16/23] riscv: tcg-target: Add
 slowpath load and store instructions
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
X-List-Received-Date: Fri, 16 Nov 2018 09:24:56 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> +static void tcg_out_mb(TCGContext *s, TCGArg a0)
> +{
> +    static const RISCVInsn fence[] = {
> +        [0 ... TCG_MO_ALL] = OPC_FENCE_RW_RW,
> +        [TCG_MO_LD_LD]     = OPC_FENCE_R_R,
> +        [TCG_MO_ST_LD]     = OPC_FENCE_W_R,
> +        [TCG_MO_LD_ST]     = OPC_FENCE_R_W,
> +        [TCG_MO_ST_ST]     = OPC_FENCE_W_W,
> +        [TCG_BAR_LDAQ]     = OPC_FENCE_R_RW,
> +        [TCG_BAR_STRL]     = OPC_FENCE_RW_W,
> +        [TCG_BAR_SC]       = OPC_FENCE_RW_RW,
> +    };
> +    tcg_out32(s, fence[a0 & TCG_MO_ALL]);
> +}
> +

TCG_MO_* and TCG_BAR_* are two different bitmasks, or'ed together.
Which you've separated by "& TCG_MO_ALL".  Thus the TCG_BAR_* constants should
not appear in this table.


> +static void * const qemu_ld_helpers[16] = {
> +    [MO_UB]   = helper_ret_ldub_mmu,
> +    [MO_SB]   = helper_ret_ldsb_mmu,
> +    [MO_LEUW] = helper_le_lduw_mmu,
> +    [MO_LESW] = helper_le_ldsw_mmu,
> +    [MO_LEUL] = helper_le_ldul_mmu,
> +    [MO_LESL] = helper_le_ldsl_mmu,
> +    [MO_LEQ]  = helper_le_ldq_mmu,
> +    [MO_BEUW] = helper_be_lduw_mmu,
> +    [MO_BESW] = helper_be_ldsw_mmu,
> +    [MO_BEUL] = helper_be_ldul_mmu,
> +    [MO_BESL] = helper_be_ldsl_mmu,
> +    [MO_BEQ]  = helper_be_ldq_mmu,
> +};

The LESL and BESL functions will not be present for rv32 -> link error.  Here
you do need an ifdef.

> +        } else {
> +            adj = cmp_off - sextract32(cmp_off, 0, 12);
> +            tcg_debug_assert(add_off - adj >= -0x1000
> +                             && add_off - adj < 0x1000);
> +
> +            tcg_out_opc_upper(s, OPC_LUI, base, adj);
> +            tcg_out_opc_reg(s, OPC_ADD, base, TCG_REG_ZERO, TCG_AREG0);

base, base, TCG_AREG0.

> +    /* Compare masked address with the TLB entry. */
> +    label_ptr[0] = s->code_ptr;
> +    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);

Another case of a potential out-of-range branch.

It might be worthwhile to move all of this out-of-line from the start, where
that branch will always be short.  See

http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02234.html


r~

