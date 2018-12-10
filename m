Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWPnL-0007kn-CX
	for mharc-qemu-riscv@gnu.org; Mon, 10 Dec 2018 12:56:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPnJ-0007j5-G4
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:56:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPnE-0000qU-H1
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:56:37 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:34357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWPnE-0000o8-6n
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:56:32 -0500
Received: by mail-oi1-x22c.google.com with SMTP id h25so9738664oig.1
	for <qemu-riscv@nongnu.org>; Mon, 10 Dec 2018 09:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yqR9lZeZLJu1WU3jLPhfDhXox8KLIKozv3a8owjhCx8=;
	b=HqiWIPCW7dPieVnwIE7AxIPr0Q3gZ03n0l5Y+HmSLiNBiGK84LCtNQPx+rO5U473g6
	n934Q0260PANP4+5U6WPoaKX04mmVOl89PjJwtbgjoSAJUdAFqBeOFHRx11wrJYKzShh
	2YBzaMpIjjqhqyqcABgG2GXppbmU6An2uA+Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yqR9lZeZLJu1WU3jLPhfDhXox8KLIKozv3a8owjhCx8=;
	b=eXXtqPmDnJLoSqTnoN6PJjUKzsNPJRvOPsRuI3CfC06qPSZhJ2hvV06ORhQMyYSg/b
	rFqstQqF9+yClQHazqTU37KSodfODFXtvqf3cxYmfzVsLoPIGTJq8RWo9/gCRiGwRxJ1
	6B5Ou9bpVmyhzH9mOAa3yoC1YLRS2WyefYZrWsQc3YmQ9gA/p1BKNaIZWkoijvnrFo3H
	Bzsq8CND5AWsXwrlwSttyfs/7MDqI+MhTuKWTGD9fnpnLkHT1ifU4r/UT3jHfJJkRHzG
	kMx3xZ0XhGH9xUGGi9VaRvk9zqhabOIAe6eqeK8v6XpjQrucdRwjU7GERRDVCUPx6zT2
	gtIg==
X-Gm-Message-State: AA+aEWaqGSH7gF+temxxV1SiI6IVokYJbdoHPLaPotLFYZCt6+YMZai4
	dvNt+bHJhY1Y25taYE2pqGNXsg==
X-Google-Smtp-Source: AFSGD/U/xwFI83jgv1i+jOWTVwttQhxBlLtZxEvJWqlVEVzVfFz7H+Ir7n7M97cnFtdW7LY7rB03tQ==
X-Received: by 2002:aca:a698:: with SMTP id t24mr8172545oij.76.1544464590807; 
	Mon, 10 Dec 2018 09:56:30 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id k11sm298033oib.35.2018.12.10.09.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:56:30 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<c1cbe33881d567ee4712128282e6fcc49a5736b5.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <98465a90-99cc-bce6-8cde-5025a30b3785@linaro.org>
Date: Mon, 10 Dec 2018 11:56:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <c1cbe33881d567ee4712128282e6fcc49a5736b5.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22c
Subject: Re: [Qemu-riscv] [RFC v3 19/24] riscv: tcg-target: Add the out op
 decoder
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
X-List-Received-Date: Mon, 10 Dec 2018 17:56:38 -0000

On 12/7/18 6:49 PM, Alistair Francis wrote:
> +    case INDEX_op_neg_i64:
> +        tcg_out_opc_imm(s, OPC_SUB, a0, TCG_REG_ZERO, a1);

tcg_out_opc_reg.

> +    case INDEX_op_mulsh_i32:
> +    case INDEX_op_mulsh_i64:
> +        tcg_out_opc_imm(s, OPC_MULH, a0, a1, a2);
> +        break;
> +
> +    case INDEX_op_muluh_i32:
> +    case INDEX_op_muluh_i64:
> +        tcg_out_opc_imm(s, OPC_MULHU, a0, a1, a2);
> +        break;

Likewise.


r~

