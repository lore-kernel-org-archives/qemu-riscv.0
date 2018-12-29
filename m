Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gdN1x-0005AA-9G
	for mharc-qemu-riscv@gnu.org; Sat, 29 Dec 2018 17:24:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdN1t-00058b-GH
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:24:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdN0s-0002PB-OW
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:23:25 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gdN0s-0002Oa-Im
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:23:22 -0500
Received: by mail-pf1-x443.google.com with SMTP id w73so11862166pfk.10
	for <qemu-riscv@nongnu.org>; Sat, 29 Dec 2018 14:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LY76N7v9ABHk0UKHYvhi6Fn6kamH+bvS5H6S2AHv/8E=;
	b=EUqdHtkowFZHDuYE1t7iST3rfkkGO28765PC8JJBaDJ20Z2ik1GSg2RRRMFiu0t+uw
	pZAoVNke+dhSbAneHMY+wJ5N3mdaP2KqEfGTheoKDz1wB78GLOqxeGGRBAaUUw7CzBg2
	UFry9/azMf+6zHktGeMuGQEdcVW3xbdP4M1ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LY76N7v9ABHk0UKHYvhi6Fn6kamH+bvS5H6S2AHv/8E=;
	b=ZW/JmYLTCEyoIX3qvfsw4w8GOPxPSX4MgAX6GRaDQWVIR8TupY96lROAIWNS2vHLAw
	hXJiBP1eaZMX3/ap1ALct0/ef2zOjHW51GhWpD4FxReUV2UHhccHg+t5IfxPVkJJWNko
	2/9Mh8rIjemizxzurfN5oeWxZ0uyA4PAZr7KtczxjLEM+GSjszSn2SmNomP76olExwsG
	WoTwyprGVYqQw8NJZDN/5B9PgndZiYbNATFI9s9jiuk0hUex6cOEfF2nfZSX9hoGbjP6
	NEaszBaU1DigTE5zes8eeDggV6ijAkTEVpVYM6RsfaUTyPQ+BaM3HehV3AuGlXk5ry+i
	xmMQ==
X-Gm-Message-State: AJcUukeZpKk0dcyUckL149/4K/BePb5psFZSaMZ8VuzjK/iRg+fvmIMV
	pB/YaAz9leEG/ipNr0IL8QEgI15rbSDqJQ==
X-Google-Smtp-Source: ALg8bN6DQpjsxKby01yNWEwAbbDyXbWy1K7xdeDfg8SnxLzYrchQ/FaChcyk0kJBFhRKz6lVBO9cfw==
X-Received: by 2002:a65:6215:: with SMTP id d21mr2903446pgv.289.1546122201276; 
	Sat, 29 Dec 2018 14:23:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	(c211-28-135-144.sunsh3.vic.optusnet.com.au. [211.28.135.144])
	by smtp.gmail.com with ESMTPSA id
	202sm89151161pfy.87.2018.12.29.14.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Dec 2018 14:23:20 -0800 (PST)
To: Jim Wilson <jimw@sifive.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220951.4962-1-jimw@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f3e26863-4624-2c8f-5a9d-f3e76b7e6f0e@linaro.org>
Date: Sun, 30 Dec 2018 09:23:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181228220951.4962-1-jimw@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 3/5 v2] RISC-V: Map gdb CSR
 reg numbers to hw reg numbers.
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
X-List-Received-Date: Sat, 29 Dec 2018 22:24:28 -0000

On 12/29/18 9:09 AM, Jim Wilson wrote:
> +++ b/target/riscv/csr-map.h
> @@ -0,0 +1,248 @@
> +/*
> + * The GDB CSR xml files list them in documentation order, not numerical order,
> + * and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
> + * to the hardware numbers.
> + */
> +
> +int csr_register_map[] = {

static const?

Putting an initialized variable in a header file doesn't seem right.  Is this
supposed to be a declaration that is shared between c files?


r~

