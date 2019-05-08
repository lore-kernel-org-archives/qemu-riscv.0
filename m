Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOQfj-0003ji-6G
	for mharc-qemu-riscv@gnu.org; Wed, 08 May 2019 13:48:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQfg-0003iJ-Rp
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQfe-0005cL-M1
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:48:00 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOQfd-0005bT-D7
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:47:57 -0400
Received: by mail-pl1-x641.google.com with SMTP id b3so10263231plr.7
	for <qemu-riscv@nongnu.org>; Wed, 08 May 2019 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cjdS/iI/gWEaK9rWXHcGPI8xgjgbFsWcVpG9/iPIp2Q=;
	b=UWdAicsVFEab5M1waOBLO5bGjcSCSkAxQwwI5bVMkp5DJbn5pTV/8JQ7RHN5eqr4iG
	hC5EdJJ3JGD+aP0ypv9mJHJhMfmbZlJ63A9j2n1oCVR1Zid6zB4fakRH+kXBhlDIyWJQ
	EAFDb7Yin67TxUD+g1rm9WWZDBtZfpWbQ+YJ2TbXpqr7YtCqf1xBWVB+7p2O76b9Dcqs
	TpjttZTDMTCjXGiIDXFcWK0cXAUOI5qi0GngbdNkmxMsrQc7oWqBn2XIWSTMvo6GxgFP
	lz1AzGE9fCJOPvhktmwfEfmu66p8FI2wRPcDNRtRNUmQSPnUxOa3AWjW+hZckuMAiD5o
	OtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cjdS/iI/gWEaK9rWXHcGPI8xgjgbFsWcVpG9/iPIp2Q=;
	b=ZKKH5a0ASfnDbl3zZqharYQDBhvilvtwgB0lUJ6qBzIoLtk81zng5luCEPUuY7I4c/
	A5hQRBZ7ikjsI6qzhGNAccp23NIdE1Up8699tqM09WBhgj8N2ImmsH0NDOkZs1Eb2HvM
	uJ71YJzLNx/iUq7ZozB9YihACnzIX5KtmQk404cE17rhbiFWYz1vUgyycb/2tGNC+KDh
	Mv4f2hfsLUOS6+7YmQtLehPNZODiCKXIWoblmezgf8QUZs3k+lRB4mVtOSfK5rL8+F05
	D8RQLAxLBInTVjhPi6U+czABeOEpz5GjitCXHHDomktim1O2APlkGu43JFXI7lP2OJaX
	YHlw==
X-Gm-Message-State: APjAAAUdXTGmQpRS1m+bYV1J3Eut1w7XV+p41fEZHr1DYnQh3SDXADnf
	RrkRA4QZ3VjRlhc/NoajIN8hLA==
X-Google-Smtp-Source: APXvYqym5uIZGg+r5HpNcu8VIZYcZJwEdbZ2B2gf7B2+rFT2U3q4JEUj0L5zu6IvQciZ+59AE8ml/Q==
X-Received: by 2002:a17:902:f208:: with SMTP id
	gn8mr9960720plb.312.1557337675809; 
	Wed, 08 May 2019 10:47:55 -0700 (PDT)
Received: from [192.168.1.11] (97-113-27-95.tukw.qwest.net. [97.113.27.95])
	by smtp.gmail.com with ESMTPSA id
	e6sm26615975pfl.115.2019.05.08.10.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 10:47:55 -0700 (PDT)
To: Jonathan Behrens <jonathan@fintelia.io>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
	Jonathan Behrens <fintelia@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <20190508173835.14528-1-jonathan@fintelia.io>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c8e5df4d-f149-2f6a-8045-be2bf4de6e04@linaro.org>
Date: Wed, 8 May 2019 10:47:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508173835.14528-1-jonathan@fintelia.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Only flush TLB
 if SATP.ASID changes
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
X-List-Received-Date: Wed, 08 May 2019 17:48:01 -0000

On 5/8/19 10:38 AM, Jonathan Behrens wrote:
> There is an analogous change for ARM here:
> https://patchwork.kernel.org/patch/10649857
> 
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  target/riscv/csr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


