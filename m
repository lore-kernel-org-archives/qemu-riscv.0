Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXE0b-0007Le-EC
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 18:33:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXE0Z-0007L9-Bl
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:33:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXE0W-0002M2-3V
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:33:39 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gXE0V-0002Ix-D9
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 18:33:35 -0500
Received: by mail-ot1-x341.google.com with SMTP id i20so208833otl.0
	for <qemu-riscv@nongnu.org>; Wed, 12 Dec 2018 15:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Z86FK7pSGnJb8knY/olDVa0vxeemYBT8v+S1jNKsyXo=;
	b=Nq+xmGywagJ/8OupwLRe03flZ6k9Wrrjmxw3zWoy4wG/PXQ+qFK0Iop3E3LCXeGeqd
	sg+/zH+yN5ZRRMGOciiTekj3Q4m6RoaROGHcGnjwQoW45Qr1CZw4opvfgmIOcPCSPhva
	0st4E5kx8upT0sJqBEfkY6yiG1QQ9mobh1Rd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z86FK7pSGnJb8knY/olDVa0vxeemYBT8v+S1jNKsyXo=;
	b=NGjaLQukiEoqz5l1LrzDfdfDMBu7t2JCF6OM1yyjpY+/4JHBDoh8bZY1zWa1polhi8
	mknox6xLFDI8u1asJrfXMHjLBA1Y6wGAsC0jlSaxLZzWr7S9QDMTA6uyLgYxQXS3jXQD
	ERZjedz6l80OAO/VW6Q8xI0oSfGwn0Z9lpTfY5UCf0XoQctciiqdql+PX42uf0CcGJa8
	Qi/ifYxx6Yd8ggKLrf+Mc+Cno8lZ+cY8RS94fJAdpycUFCCyvPAEgVVMtWUf9039x3TJ
	ujBm423/fuwyTMMGwhW8JyWbyp+r9kh4POY+6SUnlm5zyMc962wK4WQCuot66aKiwM8t
	NlCA==
X-Gm-Message-State: AA+aEWZbIpezj8IpIjxrFgKkukoe03/1nqKddj0EDgx3iUeHnG79rnJx
	tmvlMHM4TZeiK4AnVHq1DmEu+w==
X-Google-Smtp-Source: AFSGD/WGktzFL/jnz5HAB0Z3/9FuMDzDVWEsmRMbUGii+oa97hbqM5oWYCO1s/Y2YrFq/QYB3T+3dQ==
X-Received: by 2002:a9d:3ba5:: with SMTP id k34mr16091116otc.364.1544657614368;
	Wed, 12 Dec 2018 15:33:34 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	q203sm102465oif.33.2018.12.12.15.33.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 15:33:33 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <89a7db22-6744-0fb5-e543-847569e942c4@linaro.org>
Date: Wed, 12 Dec 2018 17:33:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-riscv] [PATCH v1 00/23] Add RISC-V TCG backend support
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
X-List-Received-Date: Wed, 12 Dec 2018 23:33:40 -0000

On 12/12/18 1:42 PM, Alistair Francis wrote:
> As this is all new work (so can't cause regressions) I'm starting the
> patch series process with what we have so far. That way others can help
> contribute and test. If anyone has strong feelings for missing functionality
> let me know and we can work on adding that before this is merged.

I'd be ok merging this immediately after the bswap patches currently queued on
my tcg-next-2 branch.  Which for you just means defining
TCG_TARGET_HAS_MEMORY_BSWAP to 0 and fixing the one MAINTAINERS entry.

Anything else can be fixed or improved via normal development.


r~

