Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHzGY-0004UU-L5
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzGV-0004Tt-P3
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:47:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzGV-0007z6-3Y
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:47:07 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHzGU-0007ys-Sb
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:47:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id q19-v6so232954wmc.2
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZKvJNVURrXKz1jJNqEBeMDhMBzBPmevWTQT2qhsjxsE=;
	b=XaZiUDhkSliIY6N/Y6b2Edz7kCD+zt8EmaWhk0DiA5PLrX0ZAJq12p3pGuHTk6sOnZ
	xWTYuuWugFi33bbnEilPUEaYl/QpPKzbUaFKZ2lMJEgXt/DilR8BNWeAWSlXSsVQA4ch
	xjPymZDVHjzOww2odYpeyk4YKSD0pZk2C9QiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZKvJNVURrXKz1jJNqEBeMDhMBzBPmevWTQT2qhsjxsE=;
	b=kgc9C37AqErPulrx2M1c90PGZAo7VbNlPKRCK42s3REXkK1YJ51reNThXOimkzMrzo
	aVplIPAwf2UIY28dnokR+Uh1M2tyUB8+H3AdX79YMIbUm4TBHrlzoGluyY/pQ90q1Mxg
	Qz6n4iS16aAydqtj3NLZCjz7WfVKl1dvxnKOmqGB+7aCSyTUpjVIu6p0nRIQBBf2Eb1H
	mlLV//jtd9G4P2Q8/rbQSvrViit72lBoXwIiyg7JC/DfEpV4X2/z4TqnLZLaO3ojoVuo
	RFUu2vSdfIdGS4UJLD9mpt+0omJzrWRzIvLxA3+vIQInmzsCpSoGkZV6DyNFcZ4L0Zy3
	siZQ==
X-Gm-Message-State: AGRZ1gKIGaqPJ67s9fLkRW4oe6TH+RYelgYHs2KZlzE8h2R4toVoMjpn
	h+jaCetBTIqDseMmH2qHG6h3eoqxjK8=
X-Google-Smtp-Source: AJdET5eBdy/05HMPve3JyHrz/YNCNwVIPe3GSUMRHwUyVJH/y6jnVSRR1+SBHqhM58zG86JdeAJ8Lw==
X-Received: by 2002:a7b:c183:: with SMTP id y3-v6mr668969wmi.150.1541026025675;
	Wed, 31 Oct 2018 15:47:05 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	y4-v6sm7132569wrd.61.2018.10.31.15.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:47:04 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-35-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cbb7be4b-d50b-43ef-ec7b-8156d4836431@linaro.org>
Date: Wed, 31 Oct 2018 22:47:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-35-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-riscv] [PATCH v3 34/35] target/riscv: Splice remaining
 compressed insn pairs for riscv32 vs riscv64
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
X-List-Received-Date: Wed, 31 Oct 2018 22:47:09 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> it splices flwsp_ldsp, fswsp_sdsp, and jal_addiw and makes each of them
> reuse the code generator used for the non compressed insns.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/insn16-32.decode           |  7 +++++
>  target/riscv/insn16-64.decode           |  5 ++++
>  target/riscv/insn16.decode              | 12 ++------
>  target/riscv/insn32.decode              |  3 +-
>  target/riscv/insn_trans/trans_rvc.inc.c | 40 -------------------------
>  5 files changed, 16 insertions(+), 51 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

