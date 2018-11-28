Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS5fD-0001wD-7S
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 14:38:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5fB-0001uj-D9
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5f7-00008s-Qp
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:38:21 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS5f5-00005P-P2
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:38:17 -0500
Received: by mail-pl1-x630.google.com with SMTP id k8so7226908pls.11
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=b2oTiNBDqintqBBTl2AE9tQwOVZ6eiK/9cmd0KJRsQU=;
	b=U3p4omk1Zqn2Lz7daE6mgZKXsQkGrlcxXd+6XuksVOK8VrmuSymfUf5F0CjANgY3sK
	8jSfYJIGJu+7m4wE3EH3yg/qB/3joK2KzAcV//OJ4XiPt2FcFDbYBgCgyVqfy8eR4PkB
	WRdE+c82TSg0M/9tbKvgdEcKIlcbyCdbxJzJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b2oTiNBDqintqBBTl2AE9tQwOVZ6eiK/9cmd0KJRsQU=;
	b=tcrHlI1Xv4O3uKgENukplyeX4HGGsyKlKHbrUeS5WnlQ4gFId6QPKMcgUuKfIl6bzw
	ZgeUbEkWByO24I2HkpPziEz1ebRRLdX8+HnHX4oGlfS2uvLD7UhlrYui1XOfkOXkbTTP
	kHSxsVv7LWE2q3KilA5l4sOxfRIVegXnpHtV3HB9tGqr+pMUtY9i3TlKCX3rkZ9zlQwP
	lVwryhwE6z/7UOd8H90QNU2Hn0q//JNa/xCTbK4ZqfV7zkJdi08cEPqyt54hSZF9tvO6
	BvRiAeMChUepgF9jehyuQJIoO4sbXwrua4xkUUtCSRT7oy8s2zPt1L6g71voC0XDAba/
	ibSQ==
X-Gm-Message-State: AA+aEWaxSAqGR/DPjpPiY5CFLZzvQFGVs7N2ovJeSyIHvDKPTSZzHK5t
	wWJVtdb7TeKd/fyw8EJViUOCrw==
X-Google-Smtp-Source: AFSGD/UcnlsZTXon/MyVMz1l5CJMj+7xDtrP/YkIUGprZcq9mrTKC2NZ3/mU8o07UKFdUrnTV2xtdQ==
X-Received: by 2002:a17:902:3283:: with SMTP id
	z3mr38787159plb.76.1543433893565; 
	Wed, 28 Nov 2018 11:38:13 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	u78sm15385715pfi.2.2018.11.28.11.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 11:38:12 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<6e20c8377a588dcb44a1d8ef9efc07499663f59e.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c9427a60-d06f-714a-c635-6fdb2fb48e6e@linaro.org>
Date: Wed, 28 Nov 2018 11:38:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <6e20c8377a588dcb44a1d8ef9efc07499663f59e.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::630
Subject: Re: [Qemu-riscv] [RFC v2 10/24] riscv: tcg-target: Add the
 relocation functions
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
X-List-Received-Date: Wed, 28 Nov 2018 19:38:22 -0000

On 11/27/18 1:08 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 51 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


