Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7MDU-0003XT-0F
	for mharc-qemu-riscv@gnu.org; Fri, 22 Mar 2019 11:36:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7MDP-0003M9-4s
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 11:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7M2G-0003p2-AK
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 11:24:45 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h7M2F-0003oD-Sm
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 11:24:44 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k11so1738527pgb.8
	for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2019 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jTLFJYq4QZUt0fkJgzAueK65vYYNHt311g0LPOyP2wo=;
	b=PBvvEzeXb3DIrgspi4umRH48r6i4m2XLB8uOgLS/McCmpJvQFV59E7ubSJ5KADbjb7
	BnJXA64BbEVRx3u+qYN5RxPNNCFizRFt9r5hj2Il4fbjbYWMkbGJe69KFQ/WAv93l2ul
	ky1nc1rwMloMeVPt4Kxwq4eOof/NBXNkgYTLqoubhKR07VIf4iQA5a0QaQICe1lCN7BB
	bcr/pqeyP8DRp4fBxHjH8b2nPHUVWYLYWLYxJ7L6kX5kZKsSP2ZO/6ISXXLHh01YKOt1
	eMcjWjHqzBy7kNrccMQtKAo8eZR7P+UJZ7AoD+IuJAFtaIiFJ8RN8sQsXih3QOQEx3fi
	jxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jTLFJYq4QZUt0fkJgzAueK65vYYNHt311g0LPOyP2wo=;
	b=DtVQsMxgkZQxZswTQS0PbtJfzCZY/qL4t+d15O/hslzS6HXrcMuc/WzJXpAVEpp5/p
	XYhYni5c3jtrPNPBjHqn3nQxNHrGWSAMYcBKcsvnqWpg2P31fDUdkbOZPZpnLB9zubRo
	PSu0AAWC7j3fwz9USCcr3tWxW/43/QzYA7MGY90NgBIpEYMUSBUaKZAGsKLK3+o9tT47
	INWtCK1tI5DWpm9k1rKp9pp9poMaBSLqJff3VF6ezuSY0yFc3CYTgFHJVYYUEjyU9OS6
	a7tjFEeF01F8Vob6TN4AXNIwgupLpD7pqffanO4C/5BF4kukrRw1UHfyiWBf/IsKN0G9
	W40Q==
X-Gm-Message-State: APjAAAV2PETxjntcuRSbkH7PLLaSYCWuljdrL+bDFT9PyQr8R4FP1Ecx
	j3I/s75qB8nk+WGcXaMSV7RRxw==
X-Google-Smtp-Source: APXvYqwpwa5PfnGbmpmAoxkzofm8/QBKzXAVxx7a4SlkndDNzZs4NO6VJNco2o2Azs7zxywu5lb6DQ==
X-Received: by 2002:a63:e752:: with SMTP id j18mr9341154pgk.313.1553268282295; 
	Fri, 22 Mar 2019 08:24:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-5-201.tukw.qwest.net. [174.21.5.201])
	by smtp.gmail.com with ESMTPSA id
	f65sm12517963pff.21.2019.03.22.08.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Mar 2019 08:24:41 -0700 (PDT)
To: Fabien Chouteau <chouteau@adacore.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
References: <20190322112226.26890-1-chouteau@adacore.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <43360785-4c71-bda6-c2f0-a5b02838865c@linaro.org>
Date: Fri, 22 Mar 2019 08:24:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190322112226.26890-1-chouteau@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: fix single stepping
 over ret and other branching instructions
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
X-List-Received-Date: Fri, 22 Mar 2019 15:36:18 -0000

On 3/22/19 4:22 AM, Fabien Chouteau wrote:
> +/* Wrapper around tcg_gen_exit_tb that handles single stepping */
> +static void exit_tb(DisasContext *ctx, TranslationBlock *tb, unsigned idx)
> +{
> +    if (ctx->base.singlestep_enabled) {
> +        gen_exception_debug();
> +    } else {
> +        tcg_gen_exit_tb(tb, idx);
> +    }
> +}

You should remove the TB and idx parameters here and pass NULL, 0 to
tcg_gen_exit_tb.

> @@ -138,14 +158,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>          /* chaining is only allowed when the jump is to the same page */
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_pc, dest);
> -        tcg_gen_exit_tb(ctx->base.tb, n);
> +        exit_tb(ctx, ctx->base.tb, n);

Because this is the only non-zero use, and it is already protected by
use_goto_tb, which includes the single-step check.

Because goto_tb(n) must be paired with exit_tb(tb, n), and vice-versa.


r~

