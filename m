Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gdN2W-0005bb-Pt
	for mharc-qemu-riscv@gnu.org; Sat, 29 Dec 2018 17:25:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdN2P-00058Z-P3
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:25:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gdMyC-0004JY-Rx
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:20:40 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gdMyC-0004Ao-BH
	for qemu-riscv@nongnu.org; Sat, 29 Dec 2018 17:20:36 -0500
Received: by mail-pl1-x641.google.com with SMTP id w4so11392202plz.1
	for <qemu-riscv@nongnu.org>; Sat, 29 Dec 2018 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Kiai6FEP1XdSdGr8Oxk6mBwysYNgRcE4sKG0KaN4P7g=;
	b=BimFS9+Lk0yXxF7OLkja27FJEU3EE5B4Z71YBnmADu0vBkFgUHnnPBwFxqNQHE6nM8
	dlAG0wLvF3WIw8joBvtxYHLFGpjjIK6tirP3S+DQVQXYbzD6fvloqQklBH8+YEhb9vfO
	WFyPXNjhW5y/p0fKXT19ZxEGP25huTjoL+plA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kiai6FEP1XdSdGr8Oxk6mBwysYNgRcE4sKG0KaN4P7g=;
	b=ecK9wNuM26f7zsfozdIOh4tt905voNDehJabKaK4a8kmjW9NsAFB0/qb/hGMKHwGuv
	6PDJK58+9E6qrWEuVlaFZBSK9coGtqIUayPqDHwdGw0wum8RfNYlrO3qAID0EbFqgfCu
	980iZGWx/yn+hzEnUlWM4aivgoHjzHjC8nsI4l/hfE+LcuI/2IKE4DjAOjLCLi7ljfAS
	lHTG3X0V9i55gN7DPRJkvBkQQ/9HLsuKTNZ3oKj6LVw4IQnPd7li379dpcIwVYxOeMR9
	K19KVuIuWiyHK7wxnouMJAU96UoepDs+Gg+vF3fiRC7smqWKqRTTYW7O+6UGXnNcneCd
	jFdA==
X-Gm-Message-State: AJcUukc68txEMYNr8uDUo8gSxLbAICxr2Lyvs+wR+VBht8VTKaYm2Zaj
	cUZYWOfRIM9ImgsTGE5TT7I+cQDn/SfXwA==
X-Google-Smtp-Source: ALg8bN4gmCvp4Pf0hBWMPwTTDJJgHCZEMbZL1OU6y4RhELvJQqpTDks9DbFhFi/h/qFOcb5QJYHp9Q==
X-Received: by 2002:a17:902:4222:: with SMTP id
	g31mr20549229pld.240.1546122029785; 
	Sat, 29 Dec 2018 14:20:29 -0800 (PST)
Received: from cloudburst.twiddle.net
	(c211-28-135-144.sunsh3.vic.optusnet.com.au. [211.28.135.144])
	by smtp.gmail.com with ESMTPSA id
	n21sm62716681pfg.84.2018.12.29.14.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Dec 2018 14:20:28 -0800 (PST)
To: Jim Wilson <jimw@sifive.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220731.4753-1-jimw@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bcf78767-a96e-8ba4-52da-97b34b3cb3ba@linaro.org>
Date: Sun, 30 Dec 2018 09:20:24 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181228220731.4753-1-jimw@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/5 v2] RISC-V: Add 32-bit gdb
 xml files.
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
X-List-Received-Date: Sat, 29 Dec 2018 22:25:03 -0000

On 12/29/18 9:07 AM, Jim Wilson wrote:
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> ---
>  configure                   |   1 +
>  gdb-xml/riscv-32bit-cpu.xml |  43 ++++++++
>  gdb-xml/riscv-32bit-csr.xml | 250 ++++++++++++++++++++++++++++++++++++++++++++
>  gdb-xml/riscv-32bit-fpu.xml |  46 ++++++++
>  4 files changed, 340 insertions(+)
>  create mode 100644 gdb-xml/riscv-32bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-32bit-csr.xml
>  create mode 100644 gdb-xml/riscv-32bit-fpu.xml

Don't the csr's vary between priv-1.9.1 and priv-1.10?

I wonder if it would be better to auto-generate these, via the
gdb_get_dynamic_xml hook.  That way you don't need near identical copies for
32-bit vs 64-bit.


r~

