Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gl2Ds-0004IB-9o
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 20:48:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl2Do-0004Hx-DE
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:48:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl2Dm-0004lO-TD
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:48:24 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gl2Dm-0004jm-K6
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:48:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 101so8064961pld.6
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gyZfUBb0VL56zKSgTH2YvgYfhGjD/QRIXCPZX7k0la8=;
	b=JGX/LuNaXQXp2fl3v/XEo8Q/q4kyTjs85rhQxPU4U6lUW6pUoAvZ1bBH6sjZV6qrtr
	bYelI0skI1vB/zEd+7m9YCO0xJHXFssuLaGlZUgXUwj0/rTa3VwnogH+xMtZJG2HA7A7
	1QL5ZLJX0jm6RGyfiTNjNrMH40XcBTKoduld8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gyZfUBb0VL56zKSgTH2YvgYfhGjD/QRIXCPZX7k0la8=;
	b=TnjHvjkqUt8Bh+DW/h2dYuWRHOrs+M7uH4ISR6tvzTtFAKHuJd+QdLYnNtZNNFUCHl
	r4WjZppOcd0JTf393jaPGJS7gpeH/bDDhzWMN5Ufj1PStdyBBKFMM1E/LgvpYw9SevUZ
	CVc1ie0+9drrSPEE8jLk0nQo9u+ft+RhwX5qrOG5V82h+4TbEsp2nwsm2GR04cHm+CuG
	VQkjqTTnW+QnMEdoOltCYFuX7uSLidZWtCKJ1eBbMYAwR4tnTqLSiJLwRJk5m8WpFS/s
	X7/lhwFTPneUF87DtnikQ/RqGK2/ukbctiFL3SERth3SHHkzWjOzZOPg3POgNpDcSTmp
	h+NA==
X-Gm-Message-State: AJcUukeuevY4lt2jzE2alHb971w4EbDbg1uVOE8sFLb+45mzy9qnpkns
	jwDDJGOhIANX5UcdyVYB/pwYFg==
X-Google-Smtp-Source: ALg8bN61A0PXCtFJ6Mpe5rM7QpcP3OeFqlWKgQawZnEyVxL1kywezjP4H/G3AQ6dwe211fFjrZvxrA==
X-Received: by 2002:a17:902:1e9:: with SMTP id
	b96mr24772715plb.150.1547948901041; 
	Sat, 19 Jan 2019 17:48:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	w10sm10411657pgi.81.2019.01.19.17.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 17:48:20 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-29-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1dc9690d-608c-c251-531a-22eb5c5e6538@linaro.org>
Date: Sun, 20 Jan 2019 12:48:14 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-29-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: Re: [Qemu-riscv] [PATCH v4 28/35] target/riscv: Rename trans_arith
 to gen_arith
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
X-List-Received-Date: Sun, 20 Jan 2019 01:48:27 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
> v3 -> v4:
>     - trans_sltu/slt added to conversion
> 
>  target/riscv/insn_trans/trans_rvi.inc.c | 18 +++++++++---------
>  target/riscv/insn_trans/trans_rvm.inc.c | 14 +++++++-------
>  target/riscv/translate.c                |  4 ++--
>  3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



