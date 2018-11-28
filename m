Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS6lA-0005BB-PE
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 15:48:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6l8-00059S-CL
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:48:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6l4-00051F-5b
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:48:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS6l3-0004y1-BZ
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:48:29 -0500
Received: by mail-pg1-x531.google.com with SMTP id v28so10010354pgk.10
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 12:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kO38BuFATI0CjcexAvtgt+9TqFezpl4TNnSMngRqxCs=;
	b=LGWVa3ooVGBru9bJo0ebh9wXNC4ELKZIV3xTGvh9T3rRvbeEzO3gaN/t37BKVcoCYp
	VRm6w+mje5w1TmeUjcc4f3UsqskRAGP3lvJQ4RyUMEEohJxTH9lxYcoKQgtV2jvQP4Zy
	b+PXZpsbqM7Y1ixuaielVcECOzQjiwb8SgNkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kO38BuFATI0CjcexAvtgt+9TqFezpl4TNnSMngRqxCs=;
	b=nde/j64JsfhShtMBukIPswGqF028lFWEASTD1Fn2T1fVXmJK2Mz9q6vjgI6NoTQi4N
	lE67VkNIJ9MdmNOlbA7IU9qxLOdwtHgO6k70ZXgCw0y4CKq/HCrTYnA+SD+zHJ28exl6
	+bAOM1ZhGm939LjyZKgRpmZiEA5BWAAlm56T59ens4iZ9IA8Jjgw2RETvdkLsPHOFh2v
	k0fsB6x6Vldg6Z98lv5e2NGIvdfu0tDC2HwQLSERZuWGOpWTzC68dey/XU06dNOzZSzr
	nZSq6iLIChQdUUSANohsghcB8Aavp3scjwbtF+5rNaadxeSRF2vJVIh8ei2w8tWHxOkI
	8KUQ==
X-Gm-Message-State: AA+aEWay1gMarXqArwrcr9UGPeUhn0NoAN1v0dOQYPCQM1c8aNcTdxlk
	SPFVmb3AtFGuzETPRZDfVT69ZQ==
X-Google-Smtp-Source: AFSGD/XzLkuQ/pMxc35H0lTTJjfJU/DFxbHD4dOFGlUeAkPYo10pqifCv1kvrXpfD1ZbBxLKHPYnJg==
X-Received: by 2002:a63:cd17:: with SMTP id i23mr34210742pgg.13.1543438108290; 
	Wed, 28 Nov 2018 12:48:28 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	v184sm11662635pfb.182.2018.11.28.12.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 12:48:27 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<7beac896a4d4ffd873c24a74f7f7be4118ba7e5d.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e8d57887-7650-ac7c-e4ae-f35acf3251ea@linaro.org>
Date: Wed, 28 Nov 2018 12:48:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <7beac896a4d4ffd873c24a74f7f7be4118ba7e5d.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: Re: [Qemu-riscv] [RFC v2 19/24] riscv: tcg-target: Add the target
 init code
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
X-List-Received-Date: Wed, 28 Nov 2018 20:48:35 -0000

On 11/27/18 1:09 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

