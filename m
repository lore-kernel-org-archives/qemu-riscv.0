Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjXAP-0006hQ-M8
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jan 2019 17:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjXAM-0006gT-7M
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:26:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjXA2-00033U-M4
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:26:23 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gjX9y-0002zm-NA
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:26:14 -0500
Received: by mail-pf1-x443.google.com with SMTP id r136so1986988pfc.6
	for <qemu-riscv@nongnu.org>; Tue, 15 Jan 2019 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OZriX2SZ1UFpqFZYBW2TPztULD+EuNIz2xRBHzZym+s=;
	b=hHzSfRwF4UDVJViwuUoes4PoiBRYwA40GUo0xyzzlZ7cNH515qKAiw0MOm+seLn6Of
	ikpf1TltJo+reqjve4sTtxHlnZH1TtHC1CpuSjQQAU06kPHBe1wSofRPLfTvWY5KHSlW
	INJNgfDS6/u5ggUvnmgAG0wEIGzZkJd9EnpIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OZriX2SZ1UFpqFZYBW2TPztULD+EuNIz2xRBHzZym+s=;
	b=J/HP/v0XFHICawbm82M7S2Qw8CsCs/2phams5cpwUVhLQrrx0l14Gh8fvJUlmify4l
	Z7hn+RaybRSc8z7ienUptnIpMMD/yVjPJkcnO+BhREY0aFrSK8dg8CZJQ45Sl/ppITp+
	6eXqI0bzOVMGigoInSWSd42nHOcvvxbwbm93Rwllze4fO9OXsRZjG5tg/JIRhqhiqmml
	I+oTnov9eZWv9rXOALQLxC6UtbbDTHoXah93BaRTB1gC1eJYDROwtwZXWpc0dVY6tIJg
	PfEjVvmMka17NkL6folv7FIA9/7bFnIWsuMQ/JBgnKhLBuqMsaQbeHqm+T4It1juVA45
	HKgA==
X-Gm-Message-State: AJcUukdNftG4S5vBtON6Wg84ROFSmU9XMqOrYKoQ9dMMM198WfjZaYZH
	T6xQHB9AOppVKZq5nh1EWcCWOQ==
X-Google-Smtp-Source: ALg8bN63lzmpzr9R+C5gjhJ0DneWf5kBOdegDq1ytidKMvB7x66a2Q/2vyiadmmilZL75WKYM3iLqw==
X-Received: by 2002:a62:76cc:: with SMTP id r195mr6353267pfc.38.1547591172397; 
	Tue, 15 Jan 2019 14:26:12 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8003:2e1e:900:a89d:d9ff:18e1:b2fd])
	by smtp.gmail.com with ESMTPSA id f64sm8901933pfh.0.2019.01.15.14.26.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 14:26:11 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
	<f437442d547363c1d0c27dd30e1c428a83c02e50.1547510220.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0c224494-c6b5-4800-6f4a-df4eecf0fa8c@linaro.org>
Date: Wed, 16 Jan 2019 09:26:06 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f437442d547363c1d0c27dd30e1c428a83c02e50.1547510220.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 7/8] RISC-V: Add misa.MAFD
 checks to translate
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
X-List-Received-Date: Tue, 15 Jan 2019 22:26:39 -0000

On 1/15/19 10:58 AM, Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
> 
> Add misa checks for M, A, F and D extensions and if they are
> not present generate illegal instructions. This improves
> emulation accurary for harts with a limited set of extensions.
> 
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Emilio G. Cota <cota@braap.org>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 158 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


