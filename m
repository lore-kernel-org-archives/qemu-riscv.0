Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gdN3n-0006uk-9G
	for mharc-qemu-riscv@gnu.org; Sat, 29 Dec 2018 17:26:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdN3X-0006eB-DJ
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdN3R-0005mK-5X
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:26:07 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gdN3Q-0005kM-SR
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:26:01 -0500
Received: by mail-pl1-x642.google.com with SMTP id u6so11376575plm.8
	for <qemu-riscv@nongnu.org>; Sat, 29 Dec 2018 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fZJDjMQZLVsPuAUKHXf0QGCh6Ct34+LERddLg5Qu9UM=;
	b=PhijyGzBuC8voF05G95MP9e198+GUSfJrRPjcave75To9zKxmtJHhb+dcuF65BkYBG
	f2mrHZ4j3NghQEWgbA1Xr6dMvzu5DErB6N+EXllh1cCixtrw2LDp1qtCOjfMFihbvPL2
	QxYcVCuIPa9pI9ZoHSE27dfnBspfad8MP6PFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fZJDjMQZLVsPuAUKHXf0QGCh6Ct34+LERddLg5Qu9UM=;
	b=aBzM+vlFzJU1hx3PFNkFVesycD+oQNkfycvpPJ2yLa4UOos3Kh8eiwu3NwoZIBUWlV
	kjGrbCWwrgLRlcZRvhZADW2i7HdfqJ/RcU0InAT1U21YVK4drmgpX3GPl7MfJHe+CN9D
	m3kiisxdhYUIFPEKLzZyiLQ1G7d4lVEmwUsVLxQOGapHZXaO5tyvWpN6Gz/6gY82pjz4
	kChBdSkDNwgqYPxn7tEX7i5tR8Z8aSkiWeuVT5VzOxZtwX99SUdZQaEIgb0eSZBHrZN0
	dotnpwUkTxm8+dJNfJx2tUUhVt5ELxc5RmWyyJjOH4L2LDxVYH/9ZaQu+6AL9zYOgKjV
	7b8A==
X-Gm-Message-State: AJcUukf2WL+e7UJNUkhL19Ok+uxGhcF0ctsMxEVZhYT5G2X2QnzZh2mD
	pVAGC7fLOPEzJsl3bPx+eEeNRz5lU2IF0A==
X-Google-Smtp-Source: ALg8bN7E2T8yKHFcVHil0A/sI/53EEvY+NjXqcgFcjfnzihOI34PPxYVGo/wqJrGU3ZWIGlPb81CDQ==
X-Received: by 2002:a17:902:ba89:: with SMTP id
	k9mr32953531pls.189.1546122359597; 
	Sat, 29 Dec 2018 14:25:59 -0800 (PST)
Received: from cloudburst.twiddle.net
	(c211-28-135-144.sunsh3.vic.optusnet.com.au. [211.28.135.144])
	by smtp.gmail.com with ESMTPSA id
	u29sm60584013pgn.23.2018.12.29.14.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Dec 2018 14:25:58 -0800 (PST)
To: Jim Wilson <jimw@sifive.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228221018.5022-1-jimw@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d7fc84cb-986c-77ce-bc91-0fd4e906025e@linaro.org>
Date: Sun, 30 Dec 2018 09:25:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181228221018.5022-1-jimw@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 4/5 v2] RISC-V: Add debug
 support for accessing CSRs.
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
X-List-Received-Date: Sat, 29 Dec 2018 22:26:22 -0000

On 12/29/18 9:10 AM, Jim Wilson wrote:
> Adds a debugger parameter to csr_read_helper and csr_write_helper.  When
> this is true, we disable illegal instruction checks.
> 
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> ---
>  linux-user/riscv/signal.c |  5 ++-
>  target/riscv/cpu.h        |  7 +++-
>  target/riscv/cpu_helper.c |  4 +-
>  target/riscv/gdbstub.c    |  4 +-
>  target/riscv/op_helper.c  | 93 ++++++++++++++++++++++++++++++++---------------
>  5 files changed, 76 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

