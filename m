Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS5aU-0004hV-Cj
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 14:33:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5aS-0004dd-At
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:33:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5aQ-0004Xb-FT
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:33:28 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS5aO-0004P2-FD
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:33:25 -0500
Received: by mail-pf1-x435.google.com with SMTP id w73so10649761pfk.10
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xdiKauT+lHobMFR1QLDOIxpiqZLOaZqCkJm5bIK0Xp8=;
	b=QkVbtgStq4txcfv+eixI69t+Z/UM/IhB0AwM9e50xH5Q0rn7Hc606vdSIMmzFO66cX
	zZLVAZN++XuUBBoRvGjxJTIbONXDW/yujsyXkzkElVfpBLL4BWzQg1SLX9VVEm/hcr6Z
	MlwC1kuBZ9s696Jhjs5+mZhbPLXFfvLrOQTOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xdiKauT+lHobMFR1QLDOIxpiqZLOaZqCkJm5bIK0Xp8=;
	b=Lsbgs+/B8wWdbS+In6vQPWAYryLoxIfRfryTm51m0R3AjP2IsnXdqcg0b8+sDGkrWS
	hquCv3QKtI19Oi+KUFiKZEiO3aYm7OManHdblNAxYwxaSpbTP6sYzoeXrsI3ORizbubU
	jI/MHdWuMvEZo6uCzBezfeT9l4isVDNcwuXhEyeKy7RWT19Q2wn6a0fMAaWSZhirDTHD
	cVBsSgQTrQdGY49pEmH+Bw1N0dFTJWsp1OAwcNuDqirY7Rn8ezzNC9FRtJ1QEUYs3bOc
	YtrIF7P/kBjAX3AW/1lmhQ66TMIMm39nuQKjcxyFAHw3uR1Palvx+HmxopU+iNTbD9Jz
	1AgA==
X-Gm-Message-State: AA+aEWbW2wDjNfaQvE48TnzypcIyJ6HX4Y+/KVleodyZ0TWP8VgkISud
	3X6jziNRgYxYeyOMfgqaRrZkZg==
X-Google-Smtp-Source: AFSGD/XbaBkYJ+JLc3KcqJrpqtGN/uZhY6XuP74TktxXlsK01rx8PXFGFW9412GnxHtp4lxrOyQZuQ==
X-Received: by 2002:a63:ce50:: with SMTP id r16mr34051737pgi.217.1543433597106;
	Wed, 28 Nov 2018 11:33:17 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	n65-v6sm9699705pfi.185.2018.11.28.11.33.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 11:33:16 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<67303db03721ef2e4d9737379312681543a0ba0c.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e48d8e2c-3399-06cf-e4bb-fb73f5b1dba1@linaro.org>
Date: Wed, 28 Nov 2018 11:33:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <67303db03721ef2e4d9737379312681543a0ba0c.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: Re: [Qemu-riscv] [RFC v2 07/24] riscv: tcg-target: Add support for
 the constraints
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
X-List-Received-Date: Wed, 28 Nov 2018 19:33:29 -0000

On 11/27/18 1:07 PM, Alistair Francis wrote:
> +    OPC_FENCE_RW_RW = 0x0330000f,
> +    OPC_FENCE_R_R = 0x0220000f,
> +    OPC_FENCE_W_R = 0x0120000f,
> +    OPC_FENCE_R_W = 0x0210000f,
> +    OPC_FENCE_W_W = 0x0110000f,
> +    OPC_FENCE_R_RW = 0x0230000f,
> +    OPC_FENCE_RW_W = 0x0310000f,

A full compliment would have 9 alternatives, surely?
Perhaps better to just fill in the fields when emitting?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

