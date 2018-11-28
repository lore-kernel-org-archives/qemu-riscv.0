Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS6kZ-0004HU-Ax
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 15:47:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6kU-00044f-WF
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6kR-0003DL-OO
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:47:54 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS6kP-00035w-6q
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:47:50 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e5so17956348plb.5
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RjEYJkNCvJJ6UEOZEXNyuCAFjaj9oEBXr2RYSrKWEvc=;
	b=RzGmpNILUEc4nNwhV46phsf83nMiiZSSEBO+Bq/3tf4Ys9OXMug636CY/4f7uWsR/E
	ETGPVGXdaP5HZ/hkEx2LiEGYl2GgFCQl9qCDcoiyPHWjyOK9Kr9CPpuHgRfMnyoyy9lL
	SxiCJFNFkJhrZf5SZ/n4QeMc2R02OBYqKo5ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RjEYJkNCvJJ6UEOZEXNyuCAFjaj9oEBXr2RYSrKWEvc=;
	b=YZUcZ/2WPN27HRnLXWpXy2XsxVr2QZ2WDiSVNhc4r8mksFzlW7vCbBTO5k3RqEFr6F
	dwnacmZV7uEnOkhYBU5K5z2jzCevtVzR9V/XBsOSjqJoyBAFhbmVJOHv3HfB19JnntEx
	db8YFT0cxObs5El7iMK4gbfbkA64LO1x/4yxoPhoLPct4z0XxBZpeqnNJhWLV+4MsHAQ
	yLCa9xpmv7In8qVvPYEYnRC7IW+xqcnlkGDT38q2U235RydCI8YW95qbLxEa6RKgimpn
	JxuclFn+qwLDUdr97p8QF9HiddNdzztLE0bq2KTaGBWEuvvnroG6LcjqEKDIA6QHQI0r
	/AUw==
X-Gm-Message-State: AA+aEWb5QEbX/p/mrzPPTZP+RUPMRldTXrmTUOeUh1b3H8VBN7aAyc3N
	qWO1NrhKeLe1L0eeYJAv2NveiA==
X-Google-Smtp-Source: AFSGD/X/PCNohg2WrbCcqZ//8KJAKUmnGuzq8zs+ZYMRxHI02fnr9uI7b1+go4O9jQ9f+u8bKExd7A==
X-Received: by 2002:a17:902:b282:: with SMTP id
	u2mr38900517plr.89.1543438067824; 
	Wed, 28 Nov 2018 12:47:47 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	w80-v6sm10792849pfk.11.2018.11.28.12.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 12:47:46 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<445bbf96c17c4bdb0857fe03707a8911d4b5fec2.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <543821d2-ddf5-9976-a823-2fa044e42dc0@linaro.org>
Date: Wed, 28 Nov 2018 12:47:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <445bbf96c17c4bdb0857fe03707a8911d4b5fec2.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: Re: [Qemu-riscv] [RFC v2 18/24] riscv: tcg-target: Add the prologue
 generation and register the JIT
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
X-List-Received-Date: Wed, 28 Nov 2018 20:47:57 -0000

On 11/27/18 1:09 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 111 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

