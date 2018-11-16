Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZGF-00088M-D2
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:13:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZGD-00087m-4J
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZG9-0004a2-Ux
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:13:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZG9-0004Wt-OS
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:13:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id j10so9659909wru.4
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5MYvbhBRbli8cdjbQHiHFQey95opNLFoZ+5jzscnTko=;
	b=ef1RxUoRVgrl0DSfoGdSg4s0ZHzG+35cYtoVQcS/8tsRL1P993Un8/K3PN0IbTg8KA
	scVg/dwvRUR7YWYVSPJAQU6yeCkWYVE/GcQvCuvaY0qMzS6R6vUU7edTDGDs2k3+0Ymx
	V8TQTwrKTuZFxNQMnhiSQxsjoCVmFqE8+GAt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5MYvbhBRbli8cdjbQHiHFQey95opNLFoZ+5jzscnTko=;
	b=ML/whFDsJXt+fRqVEpWeVYJjRtO3YTC0eqO0gCcwMlhVWlPnhbjXUlTDA9qr0ewmhp
	GfUkjWDafNjiPX7N1/bxBRJFrUi1ujHIr8Lkhpi5b2sSN8eXA3/Iaw+k1xOLH48/fTFY
	imPZ2DpZBP3zF8HRb8sEyg3TtYBAgzuh1y9h8BIP8M92/YZr0ch3KQSzACWvwXijFjGw
	5edbnUnaR7yUUMX/ooIN8Gf582n6MDWEa0b7LIZIRjrfGJ6JzV4MkhiLRsRRjkgKxBJF
	00T31XSTQXsRSTKnQ5aCw18oAvWrdDC/oOY5/PCFyJG1dVxMcFg1euujhHCV7Yrrq5gQ
	8GsQ==
X-Gm-Message-State: AGRZ1gIMHM9ZVuRLPyjBsf9n7TtawWOZBzZnNT76zm4it/h9fvG3ERoD
	t52Jt2MO5blAZaz8X8mRaOwF5w==
X-Google-Smtp-Source: AJdET5f+QiVMZRRGtpKZka3PtZH8U1Hy0O1hRHmE2Wc/dmz6BcsKkr4ElP3LWIX76SKLayU0WwetfQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr8453922wrp.242.1542356021411; 
	Fri, 16 Nov 2018 00:13:41 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	c188-v6sm17606599wma.39.2018.11.16.00.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:13:40 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1d5f88588063393fe28b689ce9501715022052ed.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <922cee1e-1f34-d351-75f1-b171b7ef4576@linaro.org>
Date: Fri, 16 Nov 2018 09:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1d5f88588063393fe28b689ce9501715022052ed.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 08/23] riscv: tcg-target: Add
 support for the constraints
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
X-List-Received-Date: Fri, 16 Nov 2018 08:13:53 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> +    case 'L':
> +        /* qemu_ld/qemu_st constraint */
> +        ct->ct |= TCG_CT_REG;
> +        ct->u.regs = 0xffffffff;
> +        /* qemu_ld/qemu_st uses TCG_REG_TMP0 */
> +#if defined(CONFIG_SOFTMMU)
> +        /* tcg_out_tlb_load uses TCG_REG_TMP0/TMP1 and TCG_REG_L0/L1 */
> +        /* tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP0); */
> +        /* tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP1); */
> +        tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP2);

Normally TMP registers are reserved and do not need to be mentioned in
constraints at all.

> +    if ((ct & TCG_CT_CONST_S12) && val >= -2048 && val <= 2047) {
> +        return 1;
> +    }
> +    if ((ct & TCG_CT_CONST_N12) && val >= -2047 && val <= 2048) {
> +        return 1;
> +    }

Clearer as val == sextracttl(val, 0, 12)
and -val == sextracttl(-val, 0, 12)?


r~

