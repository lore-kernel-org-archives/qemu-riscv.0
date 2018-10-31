Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHygP-00018T-3Z
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHygM-00016M-LQ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHygJ-0005Ta-Hf
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHygJ-0005QP-6k
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id d17-v6so17841652wre.11
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vur1EvoJmWax4NekDQz5ZaBrWCl/bxuH3xVEIF9MMLY=;
	b=SGbp6cfxUAi5AlmLd5s+RjZEqyriQ/hNVqcD46cVVfHvkDtvFuqqSL+76t1DDaLOBP
	6R5bHDCMK64DCg+D2KtuOWFHyEgGlvk1Xac7iyVXGYVaDJN+OYbgGyY20nDnzD43S3Kz
	DIU//+BAsjVcY7gkkNoSF26m70C2/hWzTcgAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vur1EvoJmWax4NekDQz5ZaBrWCl/bxuH3xVEIF9MMLY=;
	b=ALqpecx6OGosXurnf6ftJ6HaL/BNiNIb6rFzCceg0bMd73mSE32dBhFrW2BNK3723u
	0qwBXLuzaTHVT2YttcNbRWKYbDbE7r30z/9YMuz5gwyxA59qW8O4NE2/wL/Ql0BYzmHv
	f+lQKkwXzATCsLsQyKSSrKKpzz9YjmvH5/3PSd5LwKjB6oQ1JoSMvRuAnuSPT5u8l/1s
	aGeFpQj7+HybqQMpaFAsc3PhX37aoFdaROfNf3h/nmmWxM7Wo3np2dD4mxC6qhtD11qd
	u8QEitWANLNmwMeMkbHd7TopjtINIjsiQJqy+xRNaiM4FDEnmy4gu0V2pjo18xs/44sH
	Hsjw==
X-Gm-Message-State: AGRZ1gJBXHQU3A4Tu1gtRg5Lk4kt3eqeXlHMOJY4/OKiXKtowD23sj+3
	Q93O6jJhErh0rJToVQnPMYNaE6Ytfvg=
X-Google-Smtp-Source: AJdET5eOMXzix0yqutP/GO58ucHdYKjIBHCpZy0UO2geMvTNFwrCHldfOFVY4qZ525s/EcqAEsoA0w==
X-Received: by 2002:adf:f48c:: with SMTP id
	l12-v6mr4274014wro.247.1541023776951; 
	Wed, 31 Oct 2018 15:09:36 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	y141-v6sm29947367wme.10.2018.10.31.15.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:09:36 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-24-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6e85cce6-3f02-f71a-3dcf-9fbc5479bdc6@linaro.org>
Date: Wed, 31 Oct 2018 22:09:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-24-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: Re: [Qemu-riscv] [PATCH v3 23/35] target/riscv: Remove manual
 decoding from gen_store()
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
X-List-Received-Date: Wed, 31 Oct 2018 22:09:47 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> +static bool gen_store(DisasContext *ctx, arg_sb *a, int memop)

Likewise with TCGMemOp.


r~

