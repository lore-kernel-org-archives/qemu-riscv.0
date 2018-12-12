Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWuFE-000655-4Q
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 21:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWuFC-00064t-Il
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:27:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWuF8-00023B-SJ
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:27:26 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35726)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWuF4-00020t-WB
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 21:27:20 -0500
Received: by mail-oi1-x231.google.com with SMTP id v6so13841378oif.2
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 18:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FhNaEymb8hWF6iJ41fe2g+/QvcG5kOR7NunNviJc/No=;
	b=KsSH0MppT/rJu2NdCsUtVLaeGgImcJ/sNDu1oahZjl2Hx6h0dVvvD+tR5dfLK4tpiW
	w3tHyx0spQ4W53gfVBYedWhRkV3FMWWoZiYG3+evtrbbkgkLnDO3OBnnVNp2pTXhgiZu
	TE6n2lBvDIXm95HML+t+JTcWh8ycd+74KcIhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FhNaEymb8hWF6iJ41fe2g+/QvcG5kOR7NunNviJc/No=;
	b=MocUPI2opm/9QV+MHO6GrIqXjIuvYkSK13EmD4TK17ITF/xpoBnfJCxEW2YPlOe5V4
	ftqM2YxXERfPGYOQ0JI48vQQ0xQ8wx2rLOwhNEJ5DZPDrnNU3/g2fN26vXiNlX8lvvN6
	F93iQH659WTw4FaAVpnLVx7VXN7K2fgUj1tMXaUQZKAPWyHg81dCXiIzTLr+VEvGJhTX
	Drww9rDzlcLFGX1/tzIsrwISH6Ch6a2kc9dxvWOJOHTCV8YybiLNvDaaTK0mbxHoqf1N
	yt77BJuKPkiAc7+k/IDvbVyzTvm90ZWWEfoSimzK6gEC6648WeZbGqLWNo47XMJTvfr9
	tv3A==
X-Gm-Message-State: AA+aEWaqxtMuHWo1BzLqm9FBwlx9CAj4ZFXEID5UAoACYSSCssaoc2u+
	+jQXOr9xZpizwPXECSMSlSg2+Q==
X-Google-Smtp-Source: AFSGD/XL4W53YCzzzf9gJsl74dBGq5rN7GuKd8VgvpMJeyG56k5VHYsJToOAUdhv9IQPemGyWQ7fTA==
X-Received: by 2002:aca:cc8b:: with SMTP id c133mr2612944oig.256.1544581637246;
	Tue, 11 Dec 2018 18:27:17 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id e6sm7129441otp.68.2018.12.11.18.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 18:27:16 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<ae344632ba0e63f0e80ef4dfe76d224c915796a3.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <915b8ec4-5c47-791d-2197-fdd7de438991@linaro.org>
Date: Tue, 11 Dec 2018 20:27:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <ae344632ba0e63f0e80ef4dfe76d224c915796a3.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::231
Subject: Re: [Qemu-riscv] [RFC v3 08/24] riscv: tcg-target: Add support for
 the constraints
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
X-List-Received-Date: Wed, 12 Dec 2018 02:27:27 -0000

On 12/7/18 6:47 PM, Alistair Francis wrote:
> +    if ((ct & TCG_CT_CONST_N12) && val == sextreg(-val, 0, 12)) {

 -val == sextreg(-val, 0, 12)

What's here will of course always fail.


r~

