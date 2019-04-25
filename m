Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJhAT-0007fM-SB
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 12:24:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJhAR-0007dD-EQ
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJhAP-0007vN-HR
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:24:11 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJhAN-0007nG-HK
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:24:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id t21so170336pfh.2
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0lCgSw3pkjRgaW70M0VCuZ0KEqCUePo8dIOagiwSZc8=;
	b=fIv2v5GOSlEsjg4DsnGZdtUndwIkheplpxmhON4RNk2HtNVBSbbrZ0jRecMvQ9q/lE
	3EeUmZGIQGOyRmhBO3wbiaJU0K557bQDvV8PUWVxaC/G5FVgKXEBqS9yZr8iwDNpGORW
	opL7GJl9rBmqkaR9aZeaqDZiKD26FNdab/nVBHzA5KXXqsUVFYs8FQtcExWB7LNSVsWC
	nbGQv3+nvkgbPgnJa8jRwMPHiuTIxyR0Z+vQDnH3j7nLJDBcovn5U/Ow0kx7oFMpDtup
	QIuXt3lw90c8l+i7O2yICblPVJo0lV82Hu0FyUrqlqQKFrx5yQXCKId5dyjbhAXEp3RO
	nETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0lCgSw3pkjRgaW70M0VCuZ0KEqCUePo8dIOagiwSZc8=;
	b=IOLqOgecCxZ69h+8G8yxf7GsGs18N0qFdU+cCbYxmgTAZz8t9dpxg2Lh1YnJIOJXPO
	gnILccmGX9CFf3WMKoz59J3iPf2ApjGZyckt/1vnqTye+s2F0fDvh0mghuMZVTxPMnWu
	eN73xMkKqIfFNsWyyQRo8o1AoffUPpjRa2JRwcagwHpJ4hvWaTbBIBbAkQP/K1aSz84a
	DR7h6TBDZxuAgO1Qn6L5oOIMDrr+VY8j8V6ndhzsdkGTvHIX3T5ga8pqYQVy3hf/5tj6
	h69JTxD+QB1eF9c53oL1TbJEExo/+RpixYlr1sXwpl5g+GTbntLQnjyvWt+sOEtY36Mu
	RW3w==
X-Gm-Message-State: APjAAAVsEF4tQWx6JUESkx71Rgp2K9cHv1STn1ylNwAaM156l1G9UNSo
	VquGq84d7QNqtX+iOOj58XXuu7wGFGc=
X-Google-Smtp-Source: APXvYqwwGsovsj+EauvCcpK1hVN15HGeU0lUjGUqjA3CTreN0qxd7Tw1xY9fO5dCmGiPknqo74wibg==
X-Received: by 2002:a63:131d:: with SMTP id i29mr19669525pgl.399.1556209438924;
	Thu, 25 Apr 2019 09:23:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	p66sm50908102pfb.4.2019.04.25.09.23.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:23:58 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Alistair Francis
	<Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <mhng-f96f6f0d-cec7-477e-96c8-af5485b43bc7@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9384b35d-41d0-65b0-17ca-7291c530d13f@linaro.org>
Date: Thu, 25 Apr 2019 09:23:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-f96f6f0d-cec7-477e-96c8-af5485b43bc7@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH for-4.1 0/8] target/riscv: decodetree
 improvments
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
X-List-Received-Date: Thu, 25 Apr 2019 16:24:12 -0000

On 4/25/19 9:04 AM, Palmer Dabbelt wrote:
> 
> Thanks!  I'm happy taking this as it stands, since all those decode issues I
> pointed out aren't regressions in this patch set.  Let me know if you want to
> fix those or if you want me to -- as you can probably tell my email queue is a
> bit long... :)

I'm happy to fix those, if you'll point me at your branch.


r~

