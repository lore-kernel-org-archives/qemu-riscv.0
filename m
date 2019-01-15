Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjX5Y-0003oW-O4
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jan 2019 17:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjX5V-0003o1-GS
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:21:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjX5T-00078A-RF
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:21:37 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gjX5T-00074R-8v
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:21:35 -0500
Received: by mail-pl1-x641.google.com with SMTP id b5so1960030plr.4
	for <qemu-riscv@nongnu.org>; Tue, 15 Jan 2019 14:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j8D6zT34+KzkaK7ilhmglC00yHxOkrEPoKTZPawiuGY=;
	b=NwiFwzs32HLUGcyGFuYboXIgHHW310FJSYsLpsHWCMEehh6ww4QKUnWpaN9LLGFnfh
	TYO4C719/N/ssRLluOLoTM3BTfxuqS27grl2Hi1RrsTRhcYus2laD7gqR7aKuJkkhoL6
	o9HMv8rynCULUj3SXShMvdrWeY6tXdHQmZInY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j8D6zT34+KzkaK7ilhmglC00yHxOkrEPoKTZPawiuGY=;
	b=bqH0mlQ/z6IeW/8FliaCWhADyCOyp+B7JYZVMhFFCTwpjzIiLyKORV2bCuwhTXABR6
	/ZBsS4FBcEeaoNo1Ol1GTQIEYX6IXqCBCvoTnfrPz2XqgwLZTMYCHoiO03HoF2VjuULb
	WAP8hE9OEuSLGaj0SFjCu8p4wpKRDUFY81ENzqUnZWpAVs13rauE8RztRCDINet5nu1j
	9F/15FPLoBDkvXFz8I1AyTbDOL4bPnydAB3GX0UmSuXBAzCy63/YptjlQvTWKFgtDXND
	rrPPUwkfsiZncATkPnmNg/bQs0wyST4U2uyM5gHtr6NL//lTr/7t7hD5SesLNizoBFQi
	Ae6w==
X-Gm-Message-State: AJcUukc+sgv9i+Y/2FWRKojoGETmPCYBb6WblgpnzynR48CrQcbqLZhY
	lT7rnF//B8H8r4puIqtnWuYauw==
X-Google-Smtp-Source: ALg8bN6Jjo1AiRmmLLCr1eHGt9kvvgubkxQNHzzz2dJGctMjR4pkGZzEVNU8ClvIMnN8q8fPfccIYA==
X-Received: by 2002:a17:902:6b09:: with SMTP id
	o9mr6413604plk.208.1547590892539; 
	Tue, 15 Jan 2019 14:21:32 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8003:2e1e:900:a89d:d9ff:18e1:b2fd])
	by smtp.gmail.com with ESMTPSA id
	j21sm6169842pfn.175.2019.01.15.14.21.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 14:21:31 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
	<20ba320ced470eed0f16b39e01b1bf8c24dbd3c4.1547510220.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <18f89999-7b17-d858-0efc-45aa02d65785@linaro.org>
Date: Wed, 16 Jan 2019 09:21:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20ba320ced470eed0f16b39e01b1bf8c24dbd3c4.1547510220.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 4/8] RISC-V: Use riscv
 prefix consistently on cpu helpers
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
X-List-Received-Date: Tue, 15 Jan 2019 22:21:39 -0000

On 1/15/19 10:58 AM, Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
> 
> * Add riscv prefix to raise_exception function
> * Add riscv prefix to CSR read/write functions
> * Add riscv prefix to signal handler function
> * Add riscv prefix to get fflags function
> * Remove redundant declaration of riscv_cpu_init
>   and rename cpu_riscv_init to riscv_cpu_init
> * rename riscv_set_mode to riscv_cpu_set_mode
> 
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

