Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gLOmZ-0000F2-K2
	for mharc-qemu-riscv@gnu.org; Sat, 10 Nov 2018 03:38:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gLOmX-0000EA-Cw
	for qemu-riscv@nongnu.org; Sat, 10 Nov 2018 03:38:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gLOmR-0004BF-O8
	for qemu-riscv@nongnu.org; Sat, 10 Nov 2018 03:38:16 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gLOmQ-00043E-VT
	for qemu-riscv@nongnu.org; Sat, 10 Nov 2018 03:38:11 -0500
Received: by mail-wm1-x342.google.com with SMTP id v70-v6so3433744wmd.1
	for <qemu-riscv@nongnu.org>; Sat, 10 Nov 2018 00:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=whRsqq85BKIZrGKFWKJ7Fk1oqROqJ06mQIekk+yIbOk=;
	b=PRbRjY9QitEZoeqKHHENOM+NMUf9/us2dJANXml7EjBybIr+gwjH/xV84/Pzst3tDo
	TvD/KBRM4g/ZXaG4qnG8ejtm0Pb3eHwu99HQVua9wCdajc7EbsuoLTfPkKDJ4DA8zzq4
	kNjTVUJxcLC0PLPP/En8XmwlMiUQl/1H4/QVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=whRsqq85BKIZrGKFWKJ7Fk1oqROqJ06mQIekk+yIbOk=;
	b=KYq5eOEGH/XpN+zmVxPNuKDDo6GVoTekTf1+SZzwuV22cPf70fPSvAxa8p6Rsdi1Ph
	tsa8TuJHEoAnUThY+6yNL7t7XkApqJctyH/90VlLdlYKoW6FBxsPpy0VPgTuAj2W2MX6
	XDLPyyoeN1r3VoiUYeTAjlA30MPhB8tkMOayVYsauVh9tKEFyF+VVwy4IGKpoINDySTi
	vAsMdGJ7Ht3lMsCQztjanlG9xgD1CKrIyO6d0XnsCVjLOPVtxjK4Mi/jKz2qs/oM5Nbi
	airt3YgHPPwDHDFWGRmcJrPCGGyzhl19pz9KQ3H5o/XKH+vtYb/RcIx3pEu7xlVtts6W
	aeag==
X-Gm-Message-State: AGRZ1gKk80kApBGW9LArW4nAiCDbbPGxr5PyRlvVsqaSzknblnPqWVrQ
	jeYwVrD9a1djNsNNGVv4LbX3Dg==
X-Google-Smtp-Source: AJdET5djoSWJHLqYgcQJj68K3Qq0pVeZaj7AZE6rLUMoNzCfVIXASwSLt00eN3a7kC3jIJKRu+GgeA==
X-Received: by 2002:a1c:9949:: with SMTP id
	b70-v6mr1938207wme.112.1541839081672; 
	Sat, 10 Nov 2018 00:38:01 -0800 (PST)
Received: from cloudburst.twiddle.net
	(201.red-2-142-29.dynamicip.rima-tde.net. [2.142.29.201])
	by smtp.gmail.com with ESMTPSA id j13sm6111844wrx.5.2018.11.10.00.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Nov 2018 00:38:01 -0800 (PST)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20181109191933.6641-1-palmer@sifive.com>
	<20181109191933.6641-2-palmer@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6e88f7e-aaef-5d0e-be10-cce1a6e4bdeb@linaro.org>
Date: Sat, 10 Nov 2018 09:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181109191933.6641-2-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [PATCH for 3.1] RISC-V: Respect fences for
 user-only emulators
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
X-List-Received-Date: Sat, 10 Nov 2018 08:38:18 -0000

On 11/9/18 8:19 PM, Palmer Dabbelt wrote:
> Our current fence implementation ignores fences for the user-only
> configurations.  This is incorrect but unlikely to manifest: it requires
> multi-threaded user-only code that takes advantage of the weakness in
> the host's memory model and can be inlined by TCG.
> 
> This patch simply treats fences the same way for all our emulators.
> I've given it to testing as I don't want to construct a test that would
> actually trigger the failure.
> 
> Our fence implementation has an additional deficiency where we map all
> RISC-V fences to full fences.  Now that we have a formal memory model
> for RISC-V we can start to take advantage of the strength bits on our
> fence instructions.  This requires a bit more though, so I'm going to
> split it out because the implementation is still correct without taking
> advantage of these weaker fences.
> 
> Thanks to Richard Henderson for pointing out both of the issues.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  target/riscv/translate.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

