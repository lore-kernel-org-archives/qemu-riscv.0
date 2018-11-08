Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKmd6-0002xR-Ma
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 10:54:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmd4-0002wn-Cz
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:53:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmd0-0003gy-EU
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:53:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKmd0-0003gk-4v
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:53:54 -0500
Received: by mail-wm1-x342.google.com with SMTP id 124-v6so1783520wmw.0
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dNbyY+7xckizEhVHExTV4cPpxkm80hFHDTs1Fcwhx0A=;
	b=kbbCsqukDPRtD/C+OPqB3rcaiiDGkbzOKRY+zfO2gt4tBs2njbXxOleOYw3R+pv9lz
	EwmGtDoiAj+wVNI0U8gyMKdMtVSNA0AfJwj/foqEEg5gGvcUDZVzjM9fSX7O26xWle2t
	FnvGanKwu8od8ck30tkEjlKdO7Hz1GClHFLWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dNbyY+7xckizEhVHExTV4cPpxkm80hFHDTs1Fcwhx0A=;
	b=YdnUpYuqfyUiJajHgtbgDO38YXLTQZmkupydkC7NUNFjUu0pZAJLTJjKAle6S3DrBN
	O8/R1lo11vt6JU6m/P/VhKOR/93j9Y36cvggyk9O0/n4G77+6csDemfG7B3ZzVZ6vcur
	5BygjSzR7Yki4cxt924wKPio/4GRlJvZm710nJmJC90CPFOogAlXu7DdQuXU2de90eFh
	09V9n9GKZ1RwERehpG0c+8Q1QoKFsGLc030+wwxhTm6OhZhOFZr+n/BspO7GkoVblUFV
	a/Ff/3xL6KebZ9VwjvEfXgLhyRwQDOixYzi9U7FiY2U+wlPkx8Wlna/MrJ/jhiyd6+rF
	hTZQ==
X-Gm-Message-State: AGRZ1gK6WWwzA/1tauWjUqobS0rmwh63TgUO70UrPgV/IYJ6bzZSGKz5
	AVTtx28VmVHfLWHuFV46GrQkkw==
X-Google-Smtp-Source: AJdET5eEsNsLf+vV6k0/+qtikrLX/vY3RsRrTaPhi+igrTdjW76n3ms837sCEFVc1Mg0TD2q5JiqeA==
X-Received: by 2002:a1c:be0a:: with SMTP id
	o10-v6mr1762275wmf.111.1541692432916; 
	Thu, 08 Nov 2018 07:53:52 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	r126-v6sm5455653wmg.1.2018.11.08.07.53.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 07:53:52 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <97b143d6-5503-21ee-a836-cfa2597a5856@linaro.org>
Date: Thu, 8 Nov 2018 16:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 0/2] target/riscv: Bugfixes
 found in decodetree conversion
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
X-List-Received-Date: Thu, 08 Nov 2018 15:53:59 -0000

On 11/8/18 1:06 PM, Bastian Koppelmann wrote:
> while going through the reviews of the riscv-decodetree patches, two bugs came
> up that I fix here. There is one more problem [1] mentioned by Richard but 
> I don't have the time to investigate it further.
> 
> [1] https://patchwork.kernel.org/patch/10650293/

That one's not a bug, but an optimization.

The other bug mentioned is shrw and shaw not sign-extending the result.


r~

