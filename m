Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0tIG-0002V0-QQ
	for mharc-qemu-riscv@gnu.org; Mon, 04 Mar 2019 14:30:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h0tIE-0002S4-Kn
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 14:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h0tID-0008Cg-SQ
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 14:30:30 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38449)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h0tID-0008AH-AG
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 14:30:29 -0500
Received: by mail-pg1-x536.google.com with SMTP id m2so3773828pgl.5
	for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2019 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lgBaohOL1p2IDHyJGR2mWykoWrrUvGB/PjktXZEwKlI=;
	b=uSuHs5PG1CKVNPvhmyPbusajLYyMXM/gZe+KKqxZLr3D9L9jeKjENwH7ZX2cdNQ0yh
	qwRwDluCeLjjIvzmAWzV+8gJHK+mmJYrZ2WtR16Ypp1CCXuovzLDXkRg5bqSyHm67D70
	KXGCRtedaCQ0ci9ECJU5BJsxje4zW22hmpQpfq8k0CeuglXhwGURv3a8izYfLslerBm2
	K8mlG7zv1s8130JL65y/Aa1640+DA9ik4720RGeIzhvHpyREc34Ib5/Ger0GPHJCwRtj
	GQwJR9+QgXN/ov1FtS2IdY6OTD/g4lajXOC/V//8bUvIfFGgKn0UHd+0JIna6kELRd67
	Ghxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lgBaohOL1p2IDHyJGR2mWykoWrrUvGB/PjktXZEwKlI=;
	b=paEAZw1kNj3d9x4sHm38feloTbxkZsl67XV5bdU/B0EMkyNVGNEDRMU7vpHqC0JyYA
	uiO1zXajz+93Q1CDEMVAuKW9vRhr7+vJip/gjaKOy6MmY3/AD3DFkEJFmszLAI1jBn+J
	rXkcOfUqa+dTohTRXRHhXvc4/DUhoRPfozzRuvnwilVHUVQGM+6QhvpXHX1FpMVk2vUx
	oeKWiTNoxVb4md3WvBinoMIupulrXkAJiiMgL0xkOvlUuuepIliIljqM9KGxJYWmHVHK
	vR1OFUQTBlpCtEQ/wwRwhQjp3sqSHcHk6om+uIIjlX3eDA7Hy71E2c0yaI1O4DrWJqDj
	k5lg==
X-Gm-Message-State: APjAAAWzgYFDSN6DlqN/s+125i+QF0/nO9Vdj/00t8QYYcFiJSi3NJ+z
	/jgrJPkID3ozEDN4vpifZa7Jlg==
X-Google-Smtp-Source: APXvYqy8OnT4CABNgHsF4ErSvJcvochZn7ZOQuKMUMsw4j2Dx10ohwaNseEPKr+y9ITIhf9p2Wg4Bg==
X-Received: by 2002:a63:cc15:: with SMTP id x21mr20358765pgf.380.1551727826027;
	Mon, 04 Mar 2019 11:30:26 -0800 (PST)
Received: from cloudburst.twiddle.net (ip-184-254-40-25.brbnca.spcsdns.net.
	[184.254.40.25]) by smtp.gmail.com with ESMTPSA id
	e8sm8847658pfn.103.2019.03.04.11.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 11:30:25 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20190301214945.4353-1-palmer@sifive.com>
	<CAFEAcA-ZbFf+_Bt4QGu6ZchOZtvizWPR_5pFz4vOVVYAf23mgA@mail.gmail.com>
	<36b17c57-7caf-1e49-d500-bf2eddcd1f25@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a652de39-fae2-9885-1197-fbb70b28b7cf@linaro.org>
Date: Mon, 4 Mar 2019 11:30:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <36b17c57-7caf-1e49-d500-bf2eddcd1f25@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] target/riscv: Convert to
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
X-List-Received-Date: Mon, 04 Mar 2019 19:30:31 -0000

On 3/4/19 4:52 AM, Bastian Koppelmann wrote:
> This looks like an unforeseen decodetree problem (CC' Richard). As these 16/32
> instructions share the same trans_* function, we emit the same typedef once for
> 16 bit and once for 32 bit. I don't see an easy fix in decodetree

Use an argument set, and add !extern to the argument set definition for the
"second" decoder.

(Leastwise I don't think that feature is sitting on the branch...)


r~

