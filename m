Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHyws-0000Sc-Ky
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:26:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHywp-0000Qm-Nf
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHywk-0005i8-2z
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHywj-0005g6-Ao
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t10-v6so18169180wrn.10
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mI/9S4DsAuCI/seQj5Q/5m/VGFEOGXPWfAa7/4U817A=;
	b=PUq2saaJeqEdgeiOzq3Y+GI72u38Xub2s78oSD/AB7Infp8fTZm4biKRMkirEVaOCx
	pexOgb0BEm+8pKQt2ro4chPWFW3ykmuyv+K8AilYQdYnKQ5H2vj7iS+8HDd0AbslXjxM
	NiDe+MbqWoHeYlcjcaoKzhd2KVsPC8WGx34lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mI/9S4DsAuCI/seQj5Q/5m/VGFEOGXPWfAa7/4U817A=;
	b=WkegZxAHej8HQ9zpKd1VMH586s1f8o9cu9QVTVghh+vH0UrZcEKc9nDYaVCfZlDo7r
	rCKmvM/SCMaTGcM3D2K7EelyfD5pzaKySZxfxXdlaM9Vsy0HvFnK2t9wfBnhFxuvpZqI
	hvUIYioiYxk82Xv1rExUdS9QLblxxw3OdUX6oZYN5EUZ9QEwcIiMLdgWS8UzfW57VFOY
	8KsoJOif32VNP2B0fGPb/aVsVEMs4XmDq7WiJvKlFEFcdzWCTvJ7CebNrFoqCKa6MD0n
	YJNXrupd3MnsFVne5hbgEvXJ0Kmo686Fx/LEKYxVWUsq1VrTmQ0DHGXt6jMF1+yZoJyd
	3SBw==
X-Gm-Message-State: AGRZ1gLQGcpppvPetv/AwEWDf9O59t/nPT4jA6RV3r9Q0Ne1ZCp8aT+e
	UpbRrk6zgziEYBYnMUNDc9CuPRmSK7k=
X-Google-Smtp-Source: AJdET5dv86WSNsa1LnxDPJpBOhNduDYXCrAHOky8nFM2609W+btMuJByPPN1VeI3KEoOCqEBdVdl8g==
X-Received: by 2002:adf:b211:: with SMTP id
	u17-v6mr4235362wra.52.1541024790553; 
	Wed, 31 Oct 2018 15:26:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	e14-v6sm3752522wrv.93.2018.10.31.15.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:26:29 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-25-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e92bb9c-443e-7801-7165-1b19126ce578@linaro.org>
Date: Wed, 31 Oct 2018 22:26:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-25-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: Re: [Qemu-riscv] [PATCH v3 24/35] target/riscv: Move
 gen_arith_imm() decoding into trans_* functions
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
X-List-Received-Date: Wed, 31 Oct 2018 22:26:48 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> +
> +#ifdef TARGET_RISCV64
> +static void gen_addiw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_add_tl(ret, arg1, arg2);
> +    tcg_gen_ext32s_tl(ret, ret);
> +}
> +#endif

This should have been called gen_addw.  It takes no immediate.


r~

