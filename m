Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHyfu-0000j8-6s
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:09:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHyfs-0000hc-AT
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHyfp-0005HW-30
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:16 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33686)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHyfo-0005HH-IR
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:09:12 -0400
Received: by mail-wr1-x444.google.com with SMTP id u1-v6so18187591wrn.0
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UOdbvVZgCwOnQMF49rWPMwdj08uQdDcyjT73tRl5oIQ=;
	b=co4XWd7wM0jDZxDlj40Bd7ptSrfw3WBjtagiN82Rrmg7fkWHOaAwL6p17Ew/mQH5wF
	ESTghMRm9Ml9h2wpM2p0b7SkplXNwPilouqW4m3psgVzoIp8zF+eOY8jrTSteJRivlio
	LVnHushz54Geib04uZIZkPMrpSx2RkZv79seg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UOdbvVZgCwOnQMF49rWPMwdj08uQdDcyjT73tRl5oIQ=;
	b=HvHz+3aRT2mDPxSr3dqcFlVYpjSeCoT2K2fVjXqYupo8QRSt9l/BB9qXSyMCCm9wHv
	za7gDOLp2FuGCrPuOLjrrqqpKFSogdhPjrY+L5hOH+haP0uNvlBvCcWQmKGWvjLTQUQg
	+up+RYPNMMLs2b43Y8htUnzU5M4/lyP+FwMl/MWVCtQxYJivuzY3KI0w98hPRC5ZqiM+
	SmmmqXAhYEkaIoY6AqLMr5UntzB39BS8kKF2qryAVGmKB++BZ+gSFccxE0HYfxXwMTG+
	KJJjnNQrVC2utAs8quqPFEeNmIwAM1RZpmcurrr52VDyc+KpuoOiFubdJXHssKlpoZ6x
	jXeA==
X-Gm-Message-State: AGRZ1gLNztXh+I4rCtm0xLCcuf+WKGsDaCF4pv+pk15yio0PEOSSSBJV
	V9COKv088yD2ATNSSMS0PvP5TElfonY=
X-Google-Smtp-Source: AJdET5dhX52xGSawEKE8hPqseE38ERgNVkoRSTTPcV8ehvTCPW9cOdLV0QuZqJlHMCNTYBaPr/WwgQ==
X-Received: by 2002:adf:b716:: with SMTP id
	l22-v6mr4688218wre.157.1541023751343; 
	Wed, 31 Oct 2018 15:09:11 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	l70-v6sm49699963wma.0.2018.10.31.15.09.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:09:10 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-23-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d4e842f-81b8-0eea-9e5a-f42d973d7d2b@linaro.org>
Date: Wed, 31 Oct 2018 22:09:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-23-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH v3 22/35] target/riscv: Remove manual
 decoding from gen_load()
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
X-List-Received-Date: Wed, 31 Oct 2018 22:09:17 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> With decodetree we don't need to convert RISC-V opcodes into to MemOps
> as the old gen_load() did.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de><Paste>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static bool gen_load(DisasContext *ctx, arg_lb *a, int memop)

Better with TCGMemOp instead of int.


r~

