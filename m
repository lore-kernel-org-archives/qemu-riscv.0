Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhtL-0004zc-Nv
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:26:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhtH-0004xb-IY
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhtC-0004MB-UC
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:26:46 -0500
Received: from mail-it1-x12c.google.com ([2607:f8b0:4864:20::12c]:50282)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhtC-0004LN-7g
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:26:42 -0500
Received: by mail-it1-x12c.google.com with SMTP id k206-v6so35859033ite.0
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rbTvmMWVd+o9D/15cYsVgWKiymjzPvoWr+k05257sCo=;
	b=G4DO/KWizvlrk+GmGhMNMHjr46JYeUWVuJRjINEQECne9+Zx90fAuV4ncDfALAzraQ
	+IjicTa3DWX8CNJeEwbl0pyNmdfgoeG5NVsvxDshnCbcVNdluTTexWLPA2H7H+So8p6C
	edzvG56kWCLCw/KCI22Y9UKP3tGm7e+8pmokw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rbTvmMWVd+o9D/15cYsVgWKiymjzPvoWr+k05257sCo=;
	b=LZ3auDrM4ZmfkExolByGYh7Ogtba/QfqMyKYkXXWDNxXQ+3SbhofhUcyvwXGi5bw/U
	BgtNL3gsSFaguIz8duCkKzFamdXG8RIW+A0MJiS9BO3oqnbWPBmKQWc1ZGe+WTfXz1Of
	Q15CIC7NCCYeAcoJ0wxvW055z1waOvG0jWGD4oUl5D5gsYM/OmKFaPj1iXpyxBEdd1Ml
	f9myj+vV+ApJVIFHEdQCKKK4vAsMztWbM5WIm4Hjv62/jHL4ltWM9A+qQ2RJMgER7FQr
	j58/4p9KuC+HNF0VnRUFBVgGaTbxXgOfgluZcpf8HnOMIs/yvq2Uh6XTdbN+i8bQiOo8
	65NA==
X-Gm-Message-State: AGRZ1gIsh4xh6gRU2vgy8C3h74m3jKS2hlTER+LylwDXkkDdSZKkcrr3
	TjtFAF6FR/3Jt1OuHcGi1v7lwg==
X-Google-Smtp-Source: AJdET5eb+I99/AOwQlfUVel47azH5184dX4M5iirLqiTy7B7I70bGdTs2JjcYirMBNQVp8GRXFeFIw==
X-Received: by 2002:a02:4958:: with SMTP id z85mr2511161jaa.6.1542389200128;
	Fri, 16 Nov 2018 09:26:40 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	b66-v6sm10928243itd.35.2018.11.16.09.26.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:26:39 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2aa0f464-c9c4-3d59-81da-952279f56843@linaro.org>
Date: Fri, 16 Nov 2018 18:26:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12c
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 20/23] riscv: tcg-target: Add
 the target init code
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
X-List-Received-Date: Fri, 16 Nov 2018 17:26:48 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L0);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L1);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);

Why are these three reserved?


r~

