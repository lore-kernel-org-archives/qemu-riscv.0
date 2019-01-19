Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkybN-0002E0-IP
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 16:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkybL-0002CI-DG
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:56:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkyb8-0003Xq-Tk
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:56:18 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkyb8-0003Vs-BJ
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:56:14 -0500
Received: by mail-pg1-x543.google.com with SMTP id y4so7696932pgc.12
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 13:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uaE9EgqafdXIJxq4Icj9mu8niks7iWgmIsY0numegpM=;
	b=XV1Hs9iukd0Kt6qZOUGbpLxhjhrRse9rUr3gDXhCjhOZIwW7YTnFOYwTd8pl5WtO6F
	YS2buN1VtTVKPuiXrQdZd1Vjq8U9S3Y4ZuO3XHYXV/C+V7gtKSMEMJt3JLEJSgkPN8Yo
	RBCR4K+iTcGtaB6AZfGRpQW781n8WFepbOxUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uaE9EgqafdXIJxq4Icj9mu8niks7iWgmIsY0numegpM=;
	b=cQqTpz0UutL/KcUz21FJorNj4sMwLOaNTnKj2oe7GqGWfezYvJqaSmHjVtXDAT8E0s
	dn/JU+uwnDOHXW3yAN+Z0Ho5SBSTZc7/z1vOHhY1wyl+basgsQdxW3x390DX1X53eZtT
	EFwk8IejbTpsVRrhT3XOW+3tIwTM8EjYh8yped6BhOAqqaSjdEl1ljvJ5iOz+n6bSqd5
	3FJaf1+8RR7kYbz0Y0OXz9Mr7gD714hvt7jmRWqG+b5Rmqw4ZF+6hRjnQY6iTdpOH3UQ
	vsrp/qcpRRHeiKnALM7kxtqTkny4WWFKBAifHkmdezFIEs2bsoRavWGiOxDrvu9Zo4W9
	TEbA==
X-Gm-Message-State: AJcUukeOnwfortwrd8MpWzsyJs962DgVwdYSSr3j1aEF6nCdqVNMBvhi
	4Uia5XqkCQAPtls+EfrF9sZDRg==
X-Google-Smtp-Source: ALg8bN5pUw7aheyB/9AAlIbC0Slgv/xWUu2bhIhJ/qCQVsYpVpraKx/gK5VhauOzcflMzxWjdI9bZA==
X-Received: by 2002:a62:444b:: with SMTP id r72mr24924118pfa.184.1547934972015;
	Sat, 19 Jan 2019 13:56:12 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	d13sm14792375pfd.58.2019.01.19.13.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 13:56:11 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-17-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd487251-91d5-b0d2-92ea-002421cbc4e6@linaro.org>
Date: Sun, 20 Jan 2019 08:56:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-17-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [PATCH v4 16/35] target/riscv: Convert RV priv
 insns to decodetree
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
X-List-Received-Date: Sat, 19 Jan 2019 21:56:28 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
> v3 -> v4:
>     - current_cpu->env_ptr -> ctx-env

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


