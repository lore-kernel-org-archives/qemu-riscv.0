Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHz9c-0001FB-57
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:40:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHz9Z-0001Ee-Bl
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHz9W-0004Ld-1u
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:39:57 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHz9V-0004LC-5L
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:39:53 -0400
Received: by mail-wm1-x342.google.com with SMTP id r63-v6so16645607wma.4
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ptSGaJZm8JndajPFkImMMsb/EYPHVIisOhacm+x4Ju8=;
	b=ZjtFthqcyT5bH0p1i2u7bSTH9TC9eSyEHqKALc7p2mfnVY1aPOb3dqXF21PunRUhbY
	iVvZWVc9/q8eLRo6oSDWrQGCCmw+bmOsfGT61KS4XhUfrceYxjmBpySUPKJJug4TUA9p
	+RJTSLaEm6SX/15y3nV/wYVEd+bXXXtDF6F1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ptSGaJZm8JndajPFkImMMsb/EYPHVIisOhacm+x4Ju8=;
	b=fKRMjVEn8lrHiwIPS+Nqu4sxmC5yzEBUY5x6OzI5eddZHnJURksikFHYFtXvM/Fynt
	TnwiKjiBbe/uS8BX/L/4VLcbRMDdtHSmDEaU4qF4uOfIXTA7rCKKUyXON90ahAXmmrAJ
	tmgeIrM6xhQnR5dkeYF8A8BG8dzREbVD55YiGxdV592EWh89MhEG0d0v8h5eUDSh23be
	6ekzNMdrCs+VrXcd0dBtIDDQMacFYZ2l7Qgf3nJ40FuSWA/FKsXTMANuHeWVGdE2w3ne
	Npo+PWs/ljS+xHl2qSrarwz42AWBhyAj42qv6uJ1HRT1+MPFJxZuDZ7HT5fNnxiw7VSP
	I4JQ==
X-Gm-Message-State: AGRZ1gLwCxMfUj5j8SLlcvEBLhTxx+IJ7+PliWW9maHuGoKEOGOJjWuy
	OFiWp3/Tur7huikV+FjeVlnOgPPl+t0=
X-Google-Smtp-Source: AJdET5do/x38DlR40HY1NovMaCFrivbJQnGGxU4qqx8xOjqUHTA1YLfxLo9vnjwg8fMJzGx6pTf5tg==
X-Received: by 2002:a1c:c287:: with SMTP id
	s129-v6mr3627765wmf.97.1541025591386; 
	Wed, 31 Oct 2018 15:39:51 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	l42-v6sm4254511wre.37.2018.10.31.15.39.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:39:50 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-28-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f6e90c2c-739f-a02c-c280-002f224eb089@linaro.org>
Date: Wed, 31 Oct 2018 22:39:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-28-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [PATCH v3 27/35] target/riscv: Remove manual
 decoding of RV32/64M insn
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
X-List-Received-Date: Wed, 31 Oct 2018 22:39:58 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
> v2 -> v3:
>     - trans_mulw now uses gen_mulw which properly sign extends the result
>     - gen_arith_w -> gen_arith_div_w
>     - gen_arith_div_w properly sign extends the resul

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

