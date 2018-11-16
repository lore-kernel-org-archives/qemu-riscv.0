Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZy4-0007kM-58
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:59:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZy1-0007jl-RT
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZy1-0006FE-5z
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:59:09 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZy0-0006Et-W0
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:59:09 -0500
Received: by mail-wr1-x441.google.com with SMTP id b13so23995656wrx.6
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=goOPg08NaAXI7fe7+flHusaPK9S/WdEf2dIyTKbbwkc=;
	b=e538NC6mMhQ9jCmF+lsRdjUws2G7smQXhZ889s05hwKGx1rm2Zk4zpzY4GlFqpJ7vK
	Z8vMJdRQhUStCR4GsvgqHtNNXgrn+vnr/W2wMYOT7cTAjM8e6FsDPy4yDF1KXGFtnID1
	uF2s+3vgH837NPqrJfr/KVywEaHBFb7F5Erko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=goOPg08NaAXI7fe7+flHusaPK9S/WdEf2dIyTKbbwkc=;
	b=jqaJD73VA+jE3lPL/VjTVpIq/d9SFDYCfp8Qi7TW9qGDsYhjgriQev9u+OF2Ek2zri
	NEUEWc+7eY9t3Om6PZRtKXTdiKxd6xf8BBrXFSCdOW0WdKGU0P90MwvfM7zJrjiYMHoW
	RvBivuuEg3V4jUh0rsEw5e2VOC/8/WgDCo+vHJAJiK71F0dmwkJGKyxZcaib/dnDb/2f
	5ekHMFhCSxR8Pf94OZakVMK7GYp3Tiblhcy7iCs/rMDfaWwR3GcEy/rjRKjktuoCO6vM
	ClkWo1QMvXAPXHFaQSSdMJN3LlR4tgt7weJaQo3MuW+m6B6Fh6uy+dZLRDWxNxOdkJXL
	Q2Ng==
X-Gm-Message-State: AGRZ1gJ5EOxWCur+5EYT9rrAMgVlY9XtIReZHvLM7RBGgyhIAjmxiHt5
	vYuPBOfSLMHytyv2GDMMzxQJvQ==
X-Google-Smtp-Source: AJdET5f3ZsIBp1EKUUimX4pYqJHm0wYR3YilXcyIzyfbg1NJGOwtMGy8ckYZzzKYRis59W2939DjrA==
X-Received: by 2002:adf:c6c3:: with SMTP id
	c3-v6mr8477938wrh.243.1542358747834; 
	Fri, 16 Nov 2018 00:59:07 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm23310181wmd.35.2018.11.16.00.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:59:07 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<7961f2bc55e109ff10543c4665c5cbc3c75a5bf7.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d11e2ddb-978e-1359-16ff-4b640cd74e6d@linaro.org>
Date: Fri, 16 Nov 2018 09:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <7961f2bc55e109ff10543c4665c5cbc3c75a5bf7.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 14/23] riscv: tcg-target: Add
 the out load and store instructions
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
X-List-Received-Date: Fri, 16 Nov 2018 08:59:10 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 56 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 646a4d3ebd..bc433170c4 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -518,6 +518,62 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
>      tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
>  }
>  
> +static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
> +                         TCGReg addr, intptr_t offset)
> +{
> +    int32_t imm12 = sextract32(offset, 0, 12);

sextract64 for rv64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

