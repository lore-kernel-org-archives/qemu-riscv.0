Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHzDb-0002pg-9e
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:44:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzDY-0002pB-EC
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzDR-0005t2-BJ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:44:03 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHzDN-0005qG-5K
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:43:54 -0400
Received: by mail-wm1-x341.google.com with SMTP id l2-v6so10459279wmh.3
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VLwmk7WF+C4dhhOIsDosiDg0/mzRjvES7pnuAvISxLI=;
	b=OtQYvM9c/rMvyKm2UNcPuKuQ8NlP9guxLsasPBpxByo9qY3n+t1Q1rhjVse/ZiOqpY
	MPBLtnTxVEJ4wn53MuFX8ybOwoxxCBfjfCHCSzOOi0xomUWIwXnuL4TmPQ1ufb1iFcQD
	lUBDBa2K5Uf3XdddbQ6x3hrA8STkgsZa2VPto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VLwmk7WF+C4dhhOIsDosiDg0/mzRjvES7pnuAvISxLI=;
	b=GHTOy9kcHUZR0wWh48EmJLARSrP0FYxm8prGeAV90UGqsWf1v2mNLxjM9qQ0Ji302L
	I/yIWjmmdnIpGlG20F5pqDrcxpd3JpNj6TzFehNreHOck5n1kQ/5W+He7yo+ydI/rGV0
	qIeGT4h93GFu/CoLWQBNgHo6kwpxvoQGrjlorXVQFkn9CnM0Ec32JQqqaGtRIUgWlGcR
	60gbCPmBoRJJtvDKSj37OX3Z8ygYPC037tDQ4Bw3fczH6U+kkG6tSlGKyV2BffTJT4OK
	dkSJ49k4nxkfxQ9noflPKSkKR335mLRZ9SMoa/cvH0spHrEDT1H6PWV9bj0JJPGv9Me5
	3lZg==
X-Gm-Message-State: AGRZ1gJ9/qRVnd0Hvdk2XZltu/DtM/vx+76fWvHBZeLeltWuBcx2vH/q
	R8rqhXCMw6zkWlO9OWxkCE8WX+qEiVM=
X-Google-Smtp-Source: AJdET5d/H8LNEf1ImfokDxHsC+PwyADDr5KYbNUkAXQBomOJaJeJyhDN0Ea3JLn0MhJGlfWolPjTtg==
X-Received: by 2002:a7b:c1d1:: with SMTP id
	a17-v6mr3854790wmj.10.1541025830496; 
	Wed, 31 Oct 2018 15:43:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm1135451wmd.10.2018.10.31.15.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:43:49 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-33-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <07ac484f-9455-fa1e-b86a-ee127d6a1d11@linaro.org>
Date: Wed, 31 Oct 2018 22:43:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-33-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-riscv] [PATCH v3 32/35] target/riscv: Convert @cl_d, @cl_w,
 @cs_d, @cs_w insns
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
X-List-Received-Date: Wed, 31 Oct 2018 22:44:05 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/insn16.decode              | 20 ++++++++++----------
>  target/riscv/insn32.decode              |  3 ++-
>  target/riscv/insn_trans/trans_rvc.inc.c | 24 ------------------------
>  3 files changed, 12 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

