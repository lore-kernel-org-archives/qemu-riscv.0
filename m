Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZvy-0006o5-Ug
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:57:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZvw-0006kn-BH
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:57:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZvv-0005Pm-MU
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:57:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZvv-0005PV-Fx
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:56:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id r63-v6so21358100wma.4
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w5HnZxhrbbW9tcpMPLy+p6tyPtfPgSIlawnI6RrTEsM=;
	b=WziO65NK36aZG4kqQXXyrbLHz1RlQA5AfhLVPc7JpiMETYllmcoQuesMY2yuqKFGWk
	p/m1inRIqGFUDnvWQX29DG38tDyGzBE1wKsBJKjhG+WcMKHzCjn8KucdmtXMKfLm4LQv
	uAUqLJVioOfC0qjF/pGRbgUfHNsijjxHGxFKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w5HnZxhrbbW9tcpMPLy+p6tyPtfPgSIlawnI6RrTEsM=;
	b=eQE/AGNz/2qUUiT7X1GG/+2z6oVRpt/xmCdrJS8oB+mSkZfDBvNK59j3KPLfmPmcoO
	cu1TKHOwrUega3D9P7MO3dqYDbfCj4SEjugL/0zYiAfOIkcxomLSRoQgCSpbDj6/AT9e
	LOfxxMBiWp+CNSG16QMq7b54DtzCgGwph6Amkms/V5Qqqu4kZtlR3D4cJA0U5zHd32n2
	PepS30MSWRM86rZMGfJNXaVQ7Wh59v0xrpWXm88RtbonaKt1d1EC7Zki7kVkDtbvIxFS
	jDWrYPDS6ae+mto6l+64jOP5etSvWl1PxNmq6X5Pun1zvIJQh3sIrAUGSzzSziehZKZw
	6+mQ==
X-Gm-Message-State: AGRZ1gKOZT7qqG3oIfCaNN6Hy2iQwbKBz/IhUw+5wt69Wd+BuZPB6Bq/
	3S5SDoQoChYhka2sX2Zfb0+H9A==
X-Google-Smtp-Source: AJdET5dSWFw2YKTbq6cuEOPU3T1nMcScQKsyxTqxQwCdf8XV5MCu4qxrZHuBxhwUTko8jYrZbFfu7Q==
X-Received: by 2002:a1c:2746:: with SMTP id
	n67-v6mr7710762wmn.116.1542358618450; 
	Fri, 16 Nov 2018 00:56:58 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	x2-v6sm19262766wrw.42.2018.11.16.00.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:56:57 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<ac51f3b3a2d91ea1b08ccd89add5282d308cfe70.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3a5bf32f-8559-f470-bfda-06fc575f747d@linaro.org>
Date: Fri, 16 Nov 2018 09:56:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <ac51f3b3a2d91ea1b08ccd89add5282d308cfe70.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::336
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 13/23] riscv: tcg-target: Add
 the extract instructions
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
X-List-Received-Date: Fri, 16 Nov 2018 08:57:01 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

