Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gky39-0001ZK-CU
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 16:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gky37-0001X0-Gu
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gky34-0001FN-CU
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:21:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gky34-00019k-0S
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:21:02 -0500
Received: by mail-pl1-x634.google.com with SMTP id w4so7927040plz.1
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 13:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wDNm3uDt5cgKsj9c6iCu+AwzQjb5A4GHy4Lx7dqFK4k=;
	b=dEsqSfJCRIUUKzNd4vf56wxVk8/KGadmnYO/0YFI/q/GtFF0UmoYaB9k+jzq8v+wJ9
	l9fqvfrai+A9R8D0g2q7elVrtHYxihA/H0ipV27uYjDiqignBCE4rB4Q37i5B7Lf4iOi
	URnajT7cggkSWueITKqLczjKlaFyEX8Dg5kEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wDNm3uDt5cgKsj9c6iCu+AwzQjb5A4GHy4Lx7dqFK4k=;
	b=OVMt+aQJ4OKHBzEIrawVGrYmKdkHq4pUJS8d64jtppUER6RxCbW562wMhDsa2zK+IL
	g50ySy+brH5Djx6EcuBxaoK4n5TU2M66HcNB4H2LtGk3fiL0mXXoXhmLrOYJQVU/maZb
	fj1yvS3b69iTSfeHLxsjph7V9M9+RN/8n4qqJGX04KPsGsxTYAT6uUxLpu3BF9ahaEpW
	0kCmZnDIoSrISvC4CVYOlcJRA67kVS2fcRj0A0IKCL7Tg4k5sr2dJpnXuDLqZewVPqTu
	V2ULa6OM1pBYtKfSzs4ZalyhKyj4Ojptqhn82yxsWsTo6s7dkO6Y/u7jIOySg7KUO/9L
	X/JA==
X-Gm-Message-State: AJcUukelG8n+0F+wKjh8EvYSQLDAercBwJOkpmgjJPJmIGOc4XMXx7p0
	0rDa5AufJ17m/40jtL9+q2YJNQ==
X-Google-Smtp-Source: ALg8bN5B6bmoRMIhHuc4Ou6o4XXPMB1xA4bYl2BYcXdAebfhKYhcNWHYq23VU2XPj1Jd3Xz0DGWnUg==
X-Received: by 2002:a17:902:7791:: with SMTP id
	o17mr23898607pll.60.1547932859864; 
	Sat, 19 Jan 2019 13:20:59 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	o8sm18597627pfa.42.2019.01.19.13.20.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 13:20:59 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-5-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2e06d480-63dd-e307-db67-9e6e086290fb@linaro.org>
Date: Sun, 20 Jan 2019 08:20:52 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-5-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: Re: [Qemu-riscv] [PATCH v4 04/35] target/riscv: Convert RV32I
 load/store insns to decodetree
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
X-List-Received-Date: Sat, 19 Jan 2019 21:21:06 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
> v3 -> v4:
>     - removed accidental argument removal
> 
>  target/riscv/insn32.decode              | 10 ++++++
>  target/riscv/insn_trans/trans_rvi.inc.c | 48 +++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

