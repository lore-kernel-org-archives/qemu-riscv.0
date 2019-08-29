Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i3M7m-0001jz-GU
	for mharc-qemu-riscv@gnu.org; Thu, 29 Aug 2019 11:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i3M7i-0001h8-7Y
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i3M7h-0001pB-2U
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:14:06 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i3M7g-0001oh-Rg
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 11:14:04 -0400
Received: by mail-pg1-x543.google.com with SMTP id k3so1738320pgb.10
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2019 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iYifk+HRFD8aS3YVejlvyfBxGYeLFZzQYEwO4lbL8wY=;
 b=baqePqJapcaKaGglUQyox0IuQG296DCeC62fB1B1JTiqn/qafWpXFa1VUj0mvhwKWT
 wgTZKhZJ8f1NMB6q7bCcZTbDj4IeXBFPrFpK4P0sbNBxSd93FkLLOjlrXWfo0jQQfro6
 ul8lSK7ezOnmdeNeiNXpBYIXifKH/nBlZK0pYf4iWFGRUqY8RLZuzGQvCUIYcoWLX7wA
 IyxQ/Cj8heZ+lb5MIpn+neRMfgq4WUA8Hu4q5hX7t1N9CqvF126sctQz+e5x35XPjHX2
 NL06coQw8Smf/WCNhV5U2SCFhK1lACf9SAXYGj4scBdaLQZI/Mv1YmedDelQRFQrqGcw
 wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iYifk+HRFD8aS3YVejlvyfBxGYeLFZzQYEwO4lbL8wY=;
 b=Vc/BPIllHjXWfP3LsMmDyl4ImwQhXkGIoIj97v7OvvpwcgaW3iXrtgDG7jbt6piF9Y
 0jIOvEtkyXWsZotTUFk1RrChf9gjfTOWrPajb/w/jQsAmLGBOrDH6iLefxa7QQMrKhJR
 i8NSi9xR3Kl6DJZtf8VbtQ98HONDm6SdpSqglwSkPijUJKB4oCBV/0sR5TPv2lKYONe5
 kGrVg4vifj5xIJSbTZuHjV55eLcZS02mlebN1a9S9Vof6zPLclgw2gMZIiUoCdOhzoDr
 Ojvi11K/sOfgVLDKQ1d32Jju1nWDYvo2D4KxKH9eMIS7T8F2487i3dB1w1H1ZE4XJ77k
 cvrA==
X-Gm-Message-State: APjAAAWiwQ/mgMVaX44CnWZL8V5j9agYzbl7QO2GGxUV1wtBW/Lximyx
 0C3uYcnMIkQ5BouxuMqw04wq+Q==
X-Google-Smtp-Source: APXvYqwqzi2kZMLq3zE+ggw5X5H1QO6syQzRiGIg+dwr4ish5fKTPGjTMl/65td1enRGEUze0tpekA==
X-Received: by 2002:a65:568d:: with SMTP id v13mr8510536pgs.229.1567091643579; 
 Thu, 29 Aug 2019 08:14:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id e19sm3688193pfh.114.2019.08.29.08.14.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 08:14:02 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio
 <riku.voipio@iki.fi>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <CAKmqyKMDmaABGWyLZD2R-4J8=jM6hry6Bfmu498+UZzQtxsTMA@mail.gmail.com>
 <af15b620-1350-aa1a-0f02-2a46518f0ef2@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dbea4015-fcfa-e223-cb6a-bf5dee270912@linaro.org>
Date: Thu, 29 Aug 2019 08:14:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af15b620-1350-aa1a-0f02-2a46518f0ef2@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Thu, 29 Aug 2019 15:14:07 -0000

On 8/29/19 5:00 AM, liuzhiwei wrote:
> Maybe there is some better test method or some forced test cases in QEMU. Could
> you give me some advice for testing?

If you have hardware, or another simulator, RISU is very good
for testing these sorts of things.

See https://git.linaro.org/people/pmaydell/risu.git

You'll need to write new support for RISC-V, but it's not hard
and we can help out with that.


r~

