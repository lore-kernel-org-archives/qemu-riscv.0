Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gg4TW-0003I2-Tj
	for mharc-qemu-riscv@gnu.org; Sun, 06 Jan 2019 04:12:06 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:57611 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gg4TV-0003Hr-51
	for qemu-riscv@nongnu.org; Sun, 06 Jan 2019 04:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gg4TU-0001x4-Gh
	for qemu-riscv@nongnu.org; Sun, 06 Jan 2019 04:12:05 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gg4TU-0001va-AU
	for qemu-riscv@nongnu.org; Sun, 06 Jan 2019 04:12:04 -0500
Received: by mail-pf1-x442.google.com with SMTP id c123so20366147pfb.0
	for <qemu-riscv@nongnu.org>; Sun, 06 Jan 2019 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JiLhHpOmAutcUllXz4LKps4Z30qJXlP+/DYnJgWBuJ0=;
	b=HkQ9OY4K7SndtITAobl6xyvnT1217apB2P6y3QCGCnJBF44LT337qvGIo5hGsUJcXp
	lxzyWtLjxYxb89JS+P7gJNBEfvuhfwOW2OrzIvIS2GneYfpid2jpNCSE3R2VlzYe0mA3
	dSZw0u6D/LzjBgIJAUEZc3TpqlpAgJ6Ma0FZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JiLhHpOmAutcUllXz4LKps4Z30qJXlP+/DYnJgWBuJ0=;
	b=rwvl0WUpUxXgaYlzahQcAJIBNrCJ5pihSGIn3Fe/cse1cQd3JceWU3i2dzBSDAPuDn
	89dSP3JQXuwi/9XWPs/hQDk9U9u/3f8IKMDwiUmDBuZydgLTf45iOk1NCc5RpwCWCxCg
	i6w/pU1aymQQK6hJA6dz73mcRykcqTMcJKgC+D52AdJ2s6wd1orK+xJ4kCBt6HTfEK6i
	kMIWQ0gLMtklXJgHUHdfLWZ9hS1lQEfgUXFeOZoxQxpclcBKMuQZ45jqBlWuPL/4YBXU
	aYz3t8h1pn4mgeqtKVMiEuFiFoUvCizmGzV41QtHPcaueOm6MDihotReH795hnlbbUtR
	LPZQ==
X-Gm-Message-State: AJcUukctm1sZsDEJ+5TmT/Z9YRF9VWBh4IBDheBUuuHyoidIpHaSmYN4
	DmojSk2UiLwqNQjvRPHlkO2FRw==
X-Google-Smtp-Source: AFSGD/XPVH90IwIqLrKdcDQloC3qiwy3p2W1IAzuU7ERNzXxFpKm8IsRIUZfW7VzuS+T0nVyqFbGrA==
X-Received: by 2002:a62:4c:: with SMTP id 73mr58141518pfa.24.1546765923232;
	Sun, 06 Jan 2019 01:12:03 -0800 (PST)
Received: from cloudburst.twiddle.net
	(2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net.
	[2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
	by smtp.gmail.com with ESMTPSA id
	g26sm82381316pfh.61.2019.01.06.01.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 01:12:02 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1546644177.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <378cfd04-a6a6-1f00-d4a8-4f12f970277e@linaro.org>
Date: Sun, 6 Jan 2019 19:11:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <cover.1546644177.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 0/3] Upstream more RISC-V
 fork patches
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
X-List-Received-Date: Sun, 06 Jan 2019 09:12:05 -0000

On 1/5/19 9:23 AM, Alistair Francis wrote:
> This is one of the big patches that the RISC-V fork has that we don't.
> After this it should be straight forward to upstream the remaining
> patches.
> 
> Michael Clark (3):
>   RISC-V: Implement modular CSR helper interface
>   RISC-V: Implement atomic mip/sip CSR updates
>   RISC-V: Implement existential predicates for CSRs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

