Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS6Uo-0006dC-C7
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 15:31:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6Uh-0006IT-Nh
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6TI-0003Zp-J5
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:30:11 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS6TI-0003Ys-E1
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:30:08 -0500
Received: by mail-pg1-x542.google.com with SMTP id y4so9992282pgc.12
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 12:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gF50fLtUWfh/eGxwE0rYxCp6Dep+O/9Il0xGVURU0+8=;
	b=DG2v2oFWiOWVas92EkMuoap6290qJ4AtPh+4R1hZKTsg/wZzStn/XseyvLcszKMX+A
	OqLRRgDIgUUNbS2hLHv2+SH4jnrvbRMHYd3hcnzpZhpFRxhCukwIQ8DdpoRp7yn02v0u
	8RLPwg4K8mIiudMnr4i2XFLcJAV6mzYgmllJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gF50fLtUWfh/eGxwE0rYxCp6Dep+O/9Il0xGVURU0+8=;
	b=T76oiM6ne55b/hOY3W0IjzsNAXz8JzbYr5cJC28NwXZV1mLJQ/Zf/niqJOgH/oItoA
	PiHVndwYtl4aIxUmVKiCuJKdbldDC6QtKkHHcFBDavef6fUCFaOL17holvy7MkfOMjPL
	EjSO8zdEa1SyLmbGwK0/e4mHkPATzow6KzG2HZ43zp8bympOY/vv7ru4xye6Omb9GsTH
	yBMigaD062nyQ/hm25TWNtXCMiTyuYva6tY64dErsMZAEWR80HLbumyoc7NXJ+Rh1+nM
	nEVXbWgwZhRz4OqJaGmXh+T4Xxw4l3N1puffArWaJFLEH/7pzaYLmVYFB5ZcOThIQDJD
	t/gw==
X-Gm-Message-State: AA+aEWYKZBHUdLKZvQvcHJkET1Yka1d0VY2P+sFNycAmCifGLYXwFaHt
	KwthwDO9jAU95uY76oDANi1DPg==
X-Google-Smtp-Source: AFSGD/UIHGPiocO/g1CVjryQwdabODLLaAnXTMCs7ycszV9t3MfjZYOhOG2dC8cjCO/Pw/iIsrMtEw==
X-Received: by 2002:a62:4255:: with SMTP id p82mr20227032pfa.13.1543437006694; 
	Wed, 28 Nov 2018 12:30:06 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	v191sm8258543pgb.77.2018.11.28.12.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 12:30:05 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<46fe7e6cef5c03c2165feaf400cca797ee1b10f9.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b79b17aa-4c5e-e081-2b1f-0f7649b810c4@linaro.org>
Date: Wed, 28 Nov 2018 12:30:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <46fe7e6cef5c03c2165feaf400cca797ee1b10f9.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [RFC v2 23/24] WIP: Add missing instructions
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
X-List-Received-Date: Wed, 28 Nov 2018 20:31:41 -0000

On 11/27/18 1:10 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 77 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 13756f6d0d..b8e9c0e126 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -606,6 +606,57 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
>      return false;
>  }
>  
> +static void tcg_out_addsub2(TCGContext *s,
> +                            TCGReg rl, TCGReg rh,
> +                            TCGReg al, TCGReg ah,
> +                            TCGReg bl, TCGReg bh,
> +                            bool cbl, bool cbh, bool is_sub)
> +{
> +    /* FIXME: This is just copied from MIPS */
> +    TCGReg th = TCG_REG_TMP1;
> +
> +    /* If we have a negative constant such that negating it would
> +       make the high part zero, we can (usually) eliminate one insn.  */
> +    if (cbl && cbh && bh == -1 && bl != 0) {
> +        bl = -bl;
> +        bh = 0;
> +        is_sub = !is_sub;
> +    }
> +
> +    /* By operating on the high part first, we get to use the final
> +       carry operation to move back from the temporary.  */
> +    if (!cbh) {
> +        tcg_out_opc_reg(s, (is_sub ? OPC_SUB : OPC_ADDI), th, ah, bh);
> +    } else if (bh != 0 || ah == rl) {
> +        tcg_out_opc_imm(s, OPC_ADDI, th, ah, (is_sub ? -bh : bh));
> +    } else {
> +        th = ah;
> +    }
> +
> +    if (is_sub) {
> +        if (cbl) {
> +            tcg_out_opc_imm(s, OPC_SLLI, TCG_REG_TMP0, al, bl);

s/SLLI/SLTIU/

> +            tcg_out_opc_imm(s, OPC_ADDI, rl, al, -bl);
> +        } else {
> +            tcg_out_opc_reg(s, OPC_SLLI, TCG_REG_TMP0, al, bl);

s/SLLI/SLTU/

> +            tcg_out_opc_reg(s, OPC_SUB, rl, al, bl);
> +        }
> +        tcg_out_opc_reg(s, OPC_SUB, rh, th, TCG_REG_TMP0);
> +    } else {
> +        if (cbl) {
> +            tcg_out_opc_imm(s, OPC_ADDI, rl, al, bl);
> +            tcg_out_opc_imm(s, OPC_SLLI, TCG_REG_TMP0, rl, bl);

SLTIU

> +        } else if (rl == al && rl == bl) {
> +            tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP0, al, 31);

s/31/TCG_TARGET_REG_BITS - 1/
or somesuch.  I think that's an existing mips bug too...

> +            tcg_out_opc_reg(s, OPC_ADDI, rl, al, bl);

ADD, not ADDI.

> +        } else {
> +            tcg_out_opc_reg(s, OPC_ADDI, rl, al, bl);
> +            tcg_out_opc_reg(s, OPC_SLLI, TCG_REG_TMP0, rl, (rl == bl ? al : bl));

Similarly.

> +        }
> +        tcg_out_opc_reg(s, OPC_ADDI, rh, th, TCG_REG_TMP0);

ADD.

> @@ -1537,6 +1604,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
>      case INDEX_op_ext16s_i32:
>      case INDEX_op_ext16s_i64:
>      case INDEX_op_ext32s_i64:
> +    case INDEX_op_extrl_i64_i32:
> +    case INDEX_op_extrh_i64_i32:

This belongs in a previous patch.


> +    case INDEX_op_add2_i32:
> +    case INDEX_op_add2_i64:
> +        return &rZ_rZ_rZ_rZ_rZ_rZ;
> +
> +    case INDEX_op_sub2_i32:
> +    case INDEX_op_sub2_i64:
> +        return &rZ_rZ_rZ_rZ_rZ_rZ;

Adding 0 with TCG_REG_ZERO is sorta pointless.  You want the I and N
constraints.  Note that MIPS uses a modified symmetric N that can always be
negated [-32767, 32767] instead of [-32767, 32768].  Otherwise that first if
statement doesn't work.


r~

