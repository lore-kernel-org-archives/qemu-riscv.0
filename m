Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS5WA-000308-6t
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 14:29:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5W7-0002zZ-M0
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:29:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5W4-0008By-ID
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:28:59 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS5W4-0008BM-BC
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:28:56 -0500
Received: by mail-pf1-x433.google.com with SMTP id w73so10644238pfk.10
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aA8wzyZFH9fUn9WmGhyH359YugN7pdXtmDWk6NJW0Es=;
	b=MsNvKonrjVKwkd8BZopYemvOThMl00TS3EGJ4Ef6KqB/jbA5ekKKoeGM7cSMZdE3P3
	yoj0qyNfZmiIEcDUV61yQ/VGc3RT4VBhHMUb8vlaKB4x7PvCr9EqC7DOj5T/UnM+DgMH
	4YQQ9a8ax0qULFS/QjPS2ngM9CskA7GakIV9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aA8wzyZFH9fUn9WmGhyH359YugN7pdXtmDWk6NJW0Es=;
	b=Tgku/gZP08BpVB58X7c2YPgRmLqr4n55p+KKSemS3g6j6xKeLBvB4P6MHZuWbRyZaY
	xBn2jVZrsBvqJ7+Rhfc/BAl1DqmzlRlz3JeRpFV8wY31MHxkw7Pan3ZqW8IssdDgJ2Jt
	BIPyVjUkTaowOngxmTx0aEPGrK0vtcGlQDzRGMY1u0qUZS/RRI+p+sbSgG6r4/Revt/K
	qTuZCICU/jvDsYltGlq2BUInddXCUBMNrP5D4jUT4rVojvtI6x1G/nsWUpksTZ6WI+93
	QD1GMP3JIGRb6jV+/C2gdGqFXTOpmPiVMiBfpZiRb4byxH6IiXl/I6w/8m2fajsHZ4IG
	jEpQ==
X-Gm-Message-State: AGRZ1gLnYBfKYETGSs3DMX/+Osl3gpOWxiCachvWZRYNDZp0+ErsidTa
	SojaE/UHekiFn8hChAuqn7l7Eg==
X-Google-Smtp-Source: AJdET5d4BxpoMOoLJopUplJhM3o9T/QITB1vKaV/8rmNRqEgkkD8r+oddY2eParC8mPL3+PS2BpkfQ==
X-Received: by 2002:a62:546:: with SMTP id 67mr37881032pff.99.1543433335251;
	Wed, 28 Nov 2018 11:28:55 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	h134sm10581298pfe.27.2018.11.28.11.28.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 11:28:54 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<d8b4004e95370a8a95bab0506ad5385aa8633cfd.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <85d5af73-a15f-aa5e-a3f9-2c18ae87a5d2@linaro.org>
Date: Wed, 28 Nov 2018 11:28:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <d8b4004e95370a8a95bab0506ad5385aa8633cfd.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::433
Subject: Re: [Qemu-riscv] [RFC v2 05/24] riscv: Add the tcg-target header
 file
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
X-List-Received-Date: Wed, 28 Nov 2018 19:29:00 -0000

On 11/27/18 1:07 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.h | 173 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 tcg/riscv/tcg-target.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

