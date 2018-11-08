Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKmTW-0004R4-74
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 10:44:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmTT-0004BU-MC
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmTP-0002Gw-69
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:44:03 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKmTO-0002GN-Ua
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:43:59 -0500
Received: by mail-wr1-x442.google.com with SMTP id d10-v6so21752126wrs.5
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 07:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ROsfpV77pNlqKj15jZ84XwL6M2GPQfnABqOknrKchUo=;
	b=aQl3TDpt8RCZhU60dYQC4ArnRJbQSC0pklPZq9y+lV70XvKDR5wA360QbWEFLwWVJ7
	zrd3zoB32mBmJz68PtPZwf5bpJgZQPIVc2wDqCQ2n7Cl/mTjxkQ6jsMOTAuxctktOUDz
	Xio3oQvbGdkgH+4ByiOu+DPQf6CT3n5zotyAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ROsfpV77pNlqKj15jZ84XwL6M2GPQfnABqOknrKchUo=;
	b=lpJsILqvtH4JXNygafWDu2nTFVFNqDNNDTUhRX4c9nm0/7zMvHXUvrexx7GDd8fONZ
	cN9SOR3mA2nMXjO3CefkCcbpIeXWfWkw2kZWi0FWxbIZOLxS07oJdgQQWoDjK2a/vz1S
	dmLTa7X/uuCqP3vPeCbTaTnuf8HKfva0SaOafWv37OKIQCs/o1aaUfuyQIAj/wHsRhfg
	KlNe/oo6YnGYp9ZfaJ779wHI63g+rPm1d6hGDeE4ecyzThwFixiWetaJphXqQy/53OZC
	8V6N9VyhWyGYa7BookqQKApZOcP1DBT2RqYKZM/QsA58OpJC7IkvLjhgN+SEKuD3J/LZ
	sn9g==
X-Gm-Message-State: AGRZ1gJrQiHwDhteqlqzVq1P6yoVPedeRzz82s7rUcPfHmOT7720wpp8
	BGbf3ywrLpEbP+dDIgzZ15NH/g==
X-Google-Smtp-Source: AJdET5e82vz1JrSaQIsXqDnt5g5A4W1EmEhg2Wha0vr3vG7ZPupbNk3FkTFpTKDb6QnUK3Q9z+fgkw==
X-Received: by 2002:adf:ffc9:: with SMTP id x9-v6mr4558705wrs.73.1541691837634;
	Thu, 08 Nov 2018 07:43:57 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	v10-v6sm7686421wrq.4.2018.11.08.07.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 07:43:56 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
	<20181108120628.29926-3-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <91b7de64-c2d9-3669-bcad-31ff683514ca@linaro.org>
Date: Thu, 8 Nov 2018 16:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108120628.29926-3-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/2] target/riscv: Fix
 sfence.vm/a both available in any priv version
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
X-List-Received-Date: Thu, 08 Nov 2018 15:44:04 -0000

On 11/8/18 1:06 PM, Bastian Koppelmann wrote:
> sfence.vm has been replaced in priv v1.10 spec by sfence.vma.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/translate.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

