Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gl28y-0003Am-Ng
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 20:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl28w-0003A9-CP
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:43:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl28u-0001qY-2Q
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:43:22 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gl28q-0001ob-Sv
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:43:18 -0500
Received: by mail-pf1-x441.google.com with SMTP id z9so8483191pfi.2
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 17:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YDMdHUpjiWNvNJQTWA7iC/87GxxxweLD6CQju6GjwnM=;
	b=Fs0533WnEcLXtBJshkVG+31hcJ/gWMyWnbMnZfvUBrGyH6HB+NDjI2hDUM0SFtk2FX
	5x+8GyZUmJKDMKUq3Ptk42k8cOjC4BFVpWAhE8ifarRXV6RYYqLSd8kMafbCJcF57+zL
	IWH9o1MCnTEwEHyCoiVxzx2ypImBZzU1R2iIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YDMdHUpjiWNvNJQTWA7iC/87GxxxweLD6CQju6GjwnM=;
	b=LTfMJ+svbUGzpECcB7BvG2CeRtFP6Vtnys/pBrMPTP08uBa1z5cspE775u+Gwd6gyv
	fNpH6hHfwVeXqccatKRPtBYg7836H8qM81z6ma4KQP6Ts6LGBbJeLeuON9uLZF+WRlU+
	UbRil9xLl5OIYK+zk+aUpRm1il+U0703jUfr1r7h7DLBazcRM2XvOyyk4Dxzh+1hwEO3
	ECx2sKELMjaxVt18bWYpnnddOEuIaGDRePFd5ALPXJG+/4ogQZWm9mfZYDoeBwRi4t1i
	hlCWcz6r1E8VD/Fc1Exg+htsd5aZU2rE4atHRktkfwy00EmUbFPLhHHcBJ8bDrVY3ich
	E/PQ==
X-Gm-Message-State: AJcUukcAUcos19KNYx2eMsrjtBt3XxrQmEfrZrUzIquTbmaEaY4ZVu++
	FQUo8SBX7LIGdoYsf2Eee+N14A==
X-Google-Smtp-Source: ALg8bN4wLo0TgY2pmGqaDyJafB5VcDNhYdW0Zojx/9tpC7jXI3MJI7CrdMxHXPsTloeMijcyLWpCyw==
X-Received: by 2002:a63:2e88:: with SMTP id u130mr23605431pgu.9.1547948594339; 
	Sat, 19 Jan 2019 17:43:14 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	r66sm14365588pfk.157.2019.01.19.17.43.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 17:43:13 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-27-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <235a7ee4-8f5e-1b2a-09fd-e4809c674065@linaro.org>
Date: Sun, 20 Jan 2019 12:43:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-27-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v4 26/35] target/riscv: Remove shift and
 slt insn manual decoding
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
X-List-Received-Date: Sun, 20 Jan 2019 01:43:23 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
> v3 -> v4:
>     - refactor tcg_gen_set_cond_tl(TCG_COND_LT,..) into gen_slt function
>       and reuse gen_arith(..., &gen_slt) for all trans_slt functions.
>     - Add missing sign extension to trans_srlw/sllw
>     - Made rs2 == 0 a special case of srlw/sllw

Why?  It's not like it is a likely case, and it works without.

That said,

> 
>  target/riscv/insn_trans/trans_rvi.inc.c | 98 +++++++++++++++++--------
>  target/riscv/translate.c                | 59 +++++----------
>  2 files changed, 86 insertions(+), 71 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


