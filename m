Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glite-0004na-SQ
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jan 2019 18:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1glitc-0004n1-Kq
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 18:22:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1glita-00034x-CU
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 18:22:24 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1glitZ-00033e-Si
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 18:22:22 -0500
Received: by mail-pg1-x544.google.com with SMTP id t13so10111982pgr.11
	for <qemu-riscv@nongnu.org>; Mon, 21 Jan 2019 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uI2fgTgKSCM6Fc8Un3Y2SupU6jy4pMZCqaUXWMW3B7c=;
	b=bBgpk2wyHaRXT41t+Vpl0ogo+eFozEp5H3kTvFyQrvMDFnAUoI/jHNHuZGUFr0MVz7
	9pppw4g1jaiT4WvRPMMfZFCh2pEwr+DDkgkpVxyLY5fpbbmOm2Gwj6+3dm4m990OpuX+
	O0xjLhkuo/RbrFLW2Kq90AkrhMjkvL2a1zPWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uI2fgTgKSCM6Fc8Un3Y2SupU6jy4pMZCqaUXWMW3B7c=;
	b=g1fHBNfYd/StcJ2rHgZd/J17fxWq9PLEjKNjVbLdMe+5Y329tf5hpXi9/6FgMNFqqg
	Z+cgsb40K4JCV/HUB2njJqW+wt80fjefwckE2WUS+DZpickuosGbz3da+hbdlllAQvig
	3D6Alb5iJ05LPXnishMZblCacOFSG2IoZt1Qwd9hYVXL9TzmgfodAKcf50QqkSICdMsb
	Bw4aHWBzblfgwPGQHBN1wRl07UNysjpf+BXwxg2b8Z18gx6RFD9OljsPR3eMJ8he3s1r
	/y5H97dYBboWSeD8fufWlWXD3h146MhHM4zJbQPdncrdr1fMXLbQ5SExfQeKLxXOqPIj
	TBww==
X-Gm-Message-State: AJcUukdg///wxJ797IOqfhm4BzaaE/v4py3ekW8j22wgxRJv04iMCEs+
	eJDCNySdeZ1Z10svxijVep6qbg==
X-Google-Smtp-Source: ALg8bN4MCxZakRXQ6DvmI3x9RtMC61Ynno86rnqd3LcCeYwoaWeNswjL3UexPGt8DK5/L8LsohSXsw==
X-Received: by 2002:a63:d157:: with SMTP id c23mr29556001pgj.170.1548112938136;
	Mon, 21 Jan 2019 15:22:18 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	j70sm18642777pfc.43.2019.01.21.15.22.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 15:22:16 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-27-kbastian@mail.uni-paderborn.de>
	<235a7ee4-8f5e-1b2a-09fd-e4809c674065@linaro.org>
	<5ad14b08-7db1-279a-a702-9ce2e981397e@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3da52a06-911a-5459-021c-526b23d9a928@linaro.org>
Date: Mon, 21 Jan 2019 15:22:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5ad14b08-7db1-279a-a702-9ce2e981397e@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 26/35] target/riscv: Remove
 shift and slt insn manual decoding
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
X-List-Received-Date: Mon, 21 Jan 2019 23:22:25 -0000

On 1/21/19 1:10 AM, Bastian Koppelmann wrote:
> 
> On 1/20/19 2:43 AM, Richard Henderson wrote:
>> On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>>> ---
>>> v3 -> v4:
>>>      - refactor tcg_gen_set_cond_tl(TCG_COND_LT,..) into gen_slt function
>>>        and reuse gen_arith(..., &gen_slt) for all trans_slt functions.
>>>      - Add missing sign extension to trans_srlw/sllw
>>>      - Made rs2 == 0 a special case of srlw/sllw
>> Why?  It's not like it is a likely case, and it works without.
> 
> 
> Because you suggested it :) (see https://patchwork.kernel.org/patch/10662699/).
> Maybe I misunderstood your comment. If you like I can remove it in the respin.

I meant the register indicated by rs2 containing the value 0,
which you have fixed with the extension.


r~



