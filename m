Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhwA-0007X5-7G
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:29:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhw5-0007Wl-TD
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhvv-0005Fc-Il
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:29:35 -0500
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:53808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhvt-0005DQ-Av
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:29:29 -0500
Received: by mail-it1-x141.google.com with SMTP id r12-v6so35868685ita.3
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PiETATZ26jy2ZSRH/7BzP005xuo2CXApmbYZcQNY/Ro=;
	b=Q9taXePZgwUyC8nK4lu4lT6y67Yr+3QQ8YonY5KQHY01YUtV1m4Xrze/rJpcoB9cQB
	hkHWFDV13GhGSukS5CviV9emQhWijC8ZJnPp7gPZV/YRmsxjCWmvi7hKPXvMhNDviyOR
	2VX0Cpg6KOx9LfgSzfKwowT5uk4ztOrQkYf/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PiETATZ26jy2ZSRH/7BzP005xuo2CXApmbYZcQNY/Ro=;
	b=saCekN8Se/8skYmLNIKvLm+ZY+D3RB9xq2hY4l9NyX5/ZQVfxkUyUhC5Jz0KARkC0Y
	B3s0RH5ztfFZoxtam7Yn+22am6m+hPpQY9aloZpWBL2DS7Z46nVW8Btg6FD3VjAERP+r
	lPiJ6EZgwT+CLsec2LtdH2TnDyNMDELeAzp3Q02GkaMRACevzFrr2+xLwEtYMivNXKX+
	vlaOqv0zJ+eJK+G5Q/lGgFKIN33PjruJWsfPLea5I4mcro+PhzYaDyV101SVA47h2oYe
	8Is+BtUcj2raYiTUAFsG/ZqT7+ISqzS4Z2VOZr6Oh5yUY5eotAtpkVWhlpetqyxMBQY/
	hD4A==
X-Gm-Message-State: AGRZ1gKGLoP7Qdf2pcFB7dYTPNXuqqKfV4qs7pHoTSsid3gG+B1EtADA
	dNQOkI56B6GXYNrs9jOgIaONQA==
X-Google-Smtp-Source: AJdET5d8ARlmXc3H4uBoGkqBpbtbWLNRQ645TFjeBDwBMGmDXZdcLi2xllUzjT1l5MhIW50C3ZItYw==
X-Received: by 2002:a24:1aca:: with SMTP id 193mr8812434iti.150.1542389360619; 
	Fri, 16 Nov 2018 09:29:20 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	o69-v6sm11044892itb.4.2018.11.16.09.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:29:20 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<9e9303670bf6210b643b05f9bddf9c52f684173b.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3ea3567c-1ca0-1853-eebb-7914a750b5a4@linaro.org>
Date: Fri, 16 Nov 2018 18:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <9e9303670bf6210b643b05f9bddf9c52f684173b.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
X-List-Received-Date: Fri, 16 Nov 2018 17:29:45 -0000

On 11/15/18 11:37 PM, Alistair Francis wrote:
> +    /* Detect store by reading the instruction at the program
> +       counter. Note: we currently only generate 32-bit
> +       instructions so we thus only detect 32-bit stores */

Actually, you need to handle what the compiler generates too.  So, if
__riscv_compressed is defined, you need to handle it.


r~

