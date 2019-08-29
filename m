Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i3M39-0008JX-3e
	for mharc-qemu-riscv@gnu.org; Thu, 29 Aug 2019 11:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i3M35-0008FP-DQ
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i3M33-0005ZJ-Ti
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:09:19 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i3M33-0005Xq-I9
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:09:17 -0400
Received: by mail-pl1-x644.google.com with SMTP id d3so1726875plr.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2019 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HhoEFe8VeOwQTpSCK7I23HKCrelSH+zQyFEQNk0vW8=;
 b=VdThm1DbksQ4AFoqbCzx0uei/0bJhR1Mphx+0LWMVsWLiwlWgSz7fu5ysXNzg/RIMK
 yf2y5wIcrg7XE9lyGenROAV6r8/jKUXRwzzolPZAEVV/Rsx3c3ajjzD4kSzTpiTPFspi
 IyOEd/+YMQ55oJ/Fhat4wkvS/ITwIGeeWqL8j4Et3dKXQsytvEJfXHHr7370AyuxxofJ
 GRTloZ3xcEzl7bUVqxewOhfWyrLUZEcNBIVo/I1B2CST7OMf0lq36b9/g0abdK36RNiG
 m83m+4o8vzZbwzwTVrukSHEckbKMzjuyNqIqYLCk6eenzyct2rmVT/M9BBT859MbDDbt
 dLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HhoEFe8VeOwQTpSCK7I23HKCrelSH+zQyFEQNk0vW8=;
 b=ojLyCURWo9k3vW+l7lfeLJ3whHAX1qdtGWdS9+Rbp+QqzFSb9VzeZFs+dw250Ja18N
 WWPy7UxzYyDyFGA+b6wADcpKWXKxZFEaDLBPVnmwet/H+q7nYmkBklBA1tvS2pUqz0fa
 0/nm5znkaEMsgmBzdhJVnRB9yNa0DF1KWOvmacrmDqLDsYqiekV8TSWhcRFDA0tND0+q
 cZoEEkQ+dIU4M/6s6X+6dTdwUXBu7XuCRegHANXT1nC00c2JtwMCEcYABm3FWpC9FMSY
 sTMOrPWbc/wWjYMEX3aCzA+70QjR3+GRqyME5cP6gDv6Umis6ia04Xinen7KwFqoTV8p
 wwsw==
X-Gm-Message-State: APjAAAX/NoY3TtYlxVOJg2qyg6NvE8C0gND00PUd/iX6chghpto7AtV4
 PfPZFRZG/mokhwdMGAZT//SsZQ==
X-Google-Smtp-Source: APXvYqz/db+qyXlKQSmPuc4kyT0TrvZi80S0LrVq9iT+aW7A8SQv//Q24HBoaewsSm5nmlbV3zSdeg==
X-Received: by 2002:a17:902:bd0b:: with SMTP id
 p11mr4196630pls.46.1567091356085; 
 Thu, 29 Aug 2019 08:09:16 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j1sm2409261pgl.12.2019.08.29.08.09.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 08:09:14 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 Alistair.Francis@wdc.com, alex.bennee@linaro.org, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
 <3b85e9b6-8799-9682-9aaf-b688924cb52e@linaro.org>
 <841ebe5f-dd5e-c59d-d7e9-c246ad7741c0@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f81553cc-0f95-003e-f608-f83f9a7e8dd2@linaro.org>
Date: Thu, 29 Aug 2019 08:09:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <841ebe5f-dd5e-c59d-d7e9-c246ad7741c0@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2019 15:09:21 -0000

On 8/29/19 5:45 AM, liuzhiwei wrote:
> Even in qemu,  it may be some situations that VSTART != 0. For example, a load
> instruction leads to a page fault exception in a middle position. If VSTART ==
> 0,  some elements that had been loaded before the exception will be loaded once
> again.

Alternately, you can validate all of the pages before performing any memory
operations.  At which point there will never be an exception in the middle.

As it turns out, you *must* do this in order to allow watchpoints to work
correctly.  David Hildebrand and I are at this moment fixing this aspect of
watchpoints for s390x.

See https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05979.html


r~

