Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHzCE-0002EK-1V
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:42:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzCC-0002Dg-FQ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzC8-0005NO-9n
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:42:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41264)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHzC8-0005N2-1L
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:42:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id x12-v6so18217119wrw.8
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eCAa3+eOdpdGfnnodt50DTjEERM+RsCD7d5jfeMRYlo=;
	b=DPphTkTi4wV0WSp46cT3mCrJcxItYC7d6ooHe3BvWftAyMptKY3mnIm6kyB9329NY1
	GnLWCiJVTMDI0ojJbLhMArazZxcPBWlUULu18ndY4NSWbqHQ2P+iRuGmD4853NLQm71O
	Az2JgjDo26b7DweP+X8symh9lamgZVZc4eeB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eCAa3+eOdpdGfnnodt50DTjEERM+RsCD7d5jfeMRYlo=;
	b=rwxA+80WZ84tWwk2x4Nd8zm2SwLomxP8dsWN5yF2YMtOM9mT28MLJf8ZGqcJBqL8sk
	aRs/L2AOrE9CCiBMMkgsTN+5ZEGlmnvQq8rn0dTiV7sKQONRxhWATgqUJ9sVzB4zTxX6
	1HwJJ4RTAHZ84iFfz9LXSuvdagpbDV5x6prgmYwCGKxU9Zm2gpim+rw4FIH4OLKpy3DA
	gfZJDkLlL/8dI8QikxlHsKD20CBlb9J6mQH+wI/9vEctvCXkZ6wjsStbAAE2raMhdNyS
	grJ+zKfWAyY52i+7fVUhzIIUb/VxsLSBns+ZS4+bL19bsQhc/iZasoWN8FZkku3wcK4q
	hEgg==
X-Gm-Message-State: AGRZ1gJxvaNvyf12/mHH5qT3k5rtKJEDjrZamkMwRl96gKVBv8te64EZ
	8ekp1AMbo3KfXtl4Zt0gtkzjy9ZfGCc=
X-Google-Smtp-Source: AJdET5fBsmzg1pT0wqnnv1kAppw9AA/CzRzGpfyADv4naBf97/kAIpU0Bl5dhM9kU0lRLrQBi4Mi9Q==
X-Received: by 2002:a5d:44ce:: with SMTP id
	z14-v6mr4730639wrr.286.1541025754492; 
	Wed, 31 Oct 2018 15:42:34 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	g5-v6sm16579980wrw.95.2018.10.31.15.42.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:42:33 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-32-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eb3433f6-2e8b-192b-c3cc-98634afab2a0@linaro.org>
Date: Wed, 31 Oct 2018 22:42:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-32-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: Re: [Qemu-riscv] [PATCH v3 31/35] target/riscv: Convert @cs_2 insns
 to share translation functions
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
X-List-Received-Date: Wed, 31 Oct 2018 22:42:41 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> These all expand simply to R format instructions.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/Makefile.objs              | 10 +++---
>  target/riscv/insn16-64.decode           | 24 ++++++++++++++
>  target/riscv/insn16.decode              | 15 +++++----
>  target/riscv/insn_trans/trans_rvc.inc.c | 44 -------------------------
>  target/riscv/translate.c                | 20 ++++++++---
>  5 files changed, 54 insertions(+), 59 deletions(-)
>  create mode 100644 target/riscv/insn16-64.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

