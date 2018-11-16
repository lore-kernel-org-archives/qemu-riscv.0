Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhuS-0005xP-1V
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:28:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhuP-0005rK-W0
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:27:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhuJ-0004ha-Pp
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:27:55 -0500
Received: from mail-it1-x12b.google.com ([2607:f8b0:4864:20::12b]:40406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhuF-0004fO-OM
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:27:50 -0500
Received: by mail-it1-x12b.google.com with SMTP id e11so35335304itl.5
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YIQVKN0/B7isqTaVN0SwlcYVg47Gzb9FJEUDytxPlSI=;
	b=CtYpon5AODWQzKwyxh6GS72dq/DhAeoy4ckP6gnNcKHgTu8SIcqyHee10hLepH4c7v
	ULqrokmt0pD66czWBaFrq7WREFqgKZ4nhSS8I4W5uKwzbBynlRtnGCwKn4BCUf7jLUBx
	RCHCmd+RHexB0sSxn23bdIn2w1tyUqROgIevg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YIQVKN0/B7isqTaVN0SwlcYVg47Gzb9FJEUDytxPlSI=;
	b=qOhtr52L59kxGsikMZuMNoNhbe9Ckfi2itgs23pB3ZBQ7dd2FZ3oAHCILl3MoEMNw1
	ymyPXJTnUaalvUyrm8qOzQGKtORzszrfwLOwbE5nWJTF9QAdfBdeU1vhQs86hYdE0slO
	Pm8GeUmCrxySkSnIH7PWtLuH4z96IcgVYgUBnJyMiiclEE3E2iOUVkmqYPddIrlh/V40
	4sRxEB/t//jDaDkI2ERjToxjPPBr41JRrNEwQwnotoriP57/DtkXHOwUqL4PBSJce8bg
	uHtbnOq2657Ho/+cZWJTeNRH+FSd+ZRA2jvMfhUGpherSL3K+I21LygWPhEifYw5toyO
	ln3g==
X-Gm-Message-State: AGRZ1gLjQF1WeZPmU2bOzU7AsPkmdnO7GrZC0qDUqoDH/zjzjbJQhVKz
	i5WA4zteWc+zGPqSz0cbuZoUKw==
X-Google-Smtp-Source: AJdET5dACv6kRJhgRGCXftaCsD3hmlLB2Z/Ep2gtlXqodmmgEce2hTrO+NT58QA9UA1b1D0uX0udlg==
X-Received: by 2002:a24:64c3:: with SMTP id
	t186-v6mr10537389itc.136.1542389263237; 
	Fri, 16 Nov 2018 09:27:43 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	c10sm5281253iok.23.2018.11.16.09.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:27:42 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<9e9303670bf6210b643b05f9bddf9c52f684173b.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a5e338c9-15b4-c143-453d-fb43d6686fb4@linaro.org>
Date: Fri, 16 Nov 2018 18:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <9e9303670bf6210b643b05f9bddf9c52f684173b.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12b
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 21/23] tcg: Add RISC-V cpu
 signal handler
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
X-List-Received-Date: Fri, 16 Nov 2018 17:27:58 -0000

On 11/15/18 11:37 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  accel/tcg/user-exec.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


