Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXDqi-0004rs-AF
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 18:23:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXDqf-0004rb-Uj
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXDqd-00017Y-Ah
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:23:25 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:46839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gXDqd-0000yP-2Y
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:23:23 -0500
Received: by mail-oi1-x234.google.com with SMTP id x202so102264oif.13
	for <qemu-riscv@nongnu.org>; Wed, 12 Dec 2018 15:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dfv2anIoB/KStnjWlEQmfgR5BzVzohmLikcYrQ/NEig=;
	b=N0hhsQ1XMavXMyHDPfrmSBl5FvvX4Rkqya8dFzf35zKnCjjjjEtET4k+oePKtHFCkO
	B2Pt07VIW6xBniVSH3/qN/hJQDrUNW9ANb9ZfMoFdWqWRM+96uHWW9Be+rpXKQLKZaNm
	dZrNq5n6QMkKnqIxfiFW9psCNh9VQjeh8/+14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dfv2anIoB/KStnjWlEQmfgR5BzVzohmLikcYrQ/NEig=;
	b=MhQqz27Q1smjVx6E6rIvA52kGZeSUyRqTJ1nKOE2EWffucM505PYs292xgCXLjGq5b
	7ofXMhnbtebtD/+PLg4R065KQrj7KOGP0WIJFS6UUuL9pJHqQ3dty8mw5KGm1Tkkdcdd
	S/32Wfrf/3hZqvcQqd5D0oOsPr6VaHzj+B9GgbDv8nVXCO73B9vgplYhkSWmCU3kDvK5
	2y1TIqzoUGKNlrP+JYvLsNytI/v5jN2VacBsf3p3rik9On9kkIcdN4SGH4S8maPzlhWC
	B3yAWyGEIfrngmz0/3bsuWsEes4yCZuxCGNvkX0DA6doXJ0miiF582tNiGUoNFVhFxN0
	i4AA==
X-Gm-Message-State: AA+aEWYkZYfg5bJ1D5+SPVrG+4R4V4TZBPtvPTb7EfGUJedjnp+vj0e0
	UaVxoQxurfukZ1JPXin5VQQbwA==
X-Google-Smtp-Source: AFSGD/XtbhpD7+l/K2JEPCOYitF0E/PJYMe2+JAKJmcmEl3ECiaXENQgQSmz8YmAOAWw2T8VwwT8PA==
X-Received: by 2002:aca:4c02:: with SMTP id z2mr1511715oia.318.1544656991950; 
	Wed, 12 Dec 2018 15:23:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id u109sm173072otb.8.2018.12.12.15.23.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 15:23:11 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
	<2560616ffb8a0e8c3001e3c5490c8bc1463468d0.1544643238.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4c5a2e04-2c85-9c46-b807-31b447da8730@linaro.org>
Date: Wed, 12 Dec 2018 17:23:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <2560616ffb8a0e8c3001e3c5490c8bc1463468d0.1544643238.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::234
Subject: Re: [Qemu-riscv] [PATCH v1 05/23] riscv: Add the tcg-target header
 file
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
X-List-Received-Date: Wed, 12 Dec 2018 23:23:26 -0000

On 12/12/18 1:43 PM, Alistair Francis wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddfeb32c6c..aa88ee176e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,6 +262,7 @@ S: Maintained
>  F: target/riscv/
>  F: hw/riscv/
>  F: include/hw/riscv/
> +F: tcg/riscv/

This section is for RISC-V the target.
Your new entry belongs in RISC-V the TCG host.

See the "Tiny Code Generator (TCG)" header.


r~

