Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRhmo-0003aN-Kr
	for mharc-qemu-riscv@gnu.org; Thu, 23 Apr 2020 15:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRhmm-0003Wz-Op
 for qemu-riscv@nongnu.org; Thu, 23 Apr 2020 15:45:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRhmh-0000CX-Bv
 for qemu-riscv@nongnu.org; Thu, 23 Apr 2020 15:45:24 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jRhmg-00007S-Rx
 for qemu-riscv@nongnu.org; Thu, 23 Apr 2020 15:45:19 -0400
Received: by mail-pf1-x441.google.com with SMTP id z1so1804929pfn.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Apr 2020 12:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S318y3xgVDniaeGVpSw6IZJ8haGz6GY0bz9DK96kyFU=;
 b=kq1q7o6RArA2Imnyk75F1qYBV5eyJlon1scRNUm16he15ss6J4uyv1HMWThmB+nzZk
 MEOzw+88VL2TkLr4+hu4Sv9W/kAeV+rVvp+3KjyBgDrONCNJ22z/xZ6g8/mE4x+thW7/
 2ANcv2Lg3lewbUBvfoUCP8pAQzauww6UlG7Y4obUZJxo+02xWMonvKgpkvLWO442S1zf
 LmD8qzj0jd6ZRu2Gf20UldJqKXxL+VaYTAMK6EXgzJ7h2f5ANqzOPBhtKZ4mYBmuSwxh
 XjtNb2x1r/lboXOhZ+mF299TT2xBIo4EiYoccIBJoVnb9raLGcCDswul6lqzhJazJIWO
 FdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S318y3xgVDniaeGVpSw6IZJ8haGz6GY0bz9DK96kyFU=;
 b=hKGSImZLGKIcW17T/IkI/RIT+LadkipyTKdUxxy76NjrjZiTCet0r/QG564wWgUn1D
 gzYoS/idAan7av27OtaXC718Z3md6XNzgXbvb9nBlB/WDg2c7Y6q/f9l3GHNpONwhQkg
 R7IoeDVGZunoElZhAdcMcR5TWhCC39iC1F5wvJje9zdD+m0ndRRKonS8SrD50xW0VVAu
 r3GoeNoLmJV576qXypOb96DcOpUlrP8qKYdikhJoPHv2Q2K5S4/ikgNKXf6XmI2cdqao
 2SyNQzGRylnDjommes/pJsbGI992SVhGVioYNzriCTMjTxor751oSpfLm+4hgy7oQyF1
 kYrw==
X-Gm-Message-State: AGi0PuaE69wnikk6WJfkjH98IcvYbmRpSShqt1pPHHgBFUwvVGt29/yK
 4L9XKUKoFnAlxhcYCJUXb/M6cQ==
X-Google-Smtp-Source: APiQypKkx4a33a4bDcjOl9s70vzZN8BIBsNITlTzrv+SNZLjjK0z/rULlMx6mOH9lxjdD4kRn/FdTQ==
X-Received: by 2002:a63:145a:: with SMTP id 26mr5792067pgu.238.1587671115561; 
 Thu, 23 Apr 2020 12:45:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id f6sm3305995pfn.189.2020.04.23.12.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 12:45:14 -0700 (PDT)
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: laurent@vivier.eu, riku.voipio@iki.fi,
 Alistair Francis <Alistair.Francis@wdc.com>, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
 <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
 <07931c1c-c7b3-510a-d3cf-5fb6bc877e87@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b752be1-009d-8a25-9da7-3159d1a24e1c@linaro.org>
Date: Thu, 23 Apr 2020 12:45:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <07931c1c-c7b3-510a-d3cf-5fb6bc877e87@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Thu, 23 Apr 2020 19:45:25 -0000

On 4/22/20 6:55 PM, LIU Zhiwei wrote:
> As far as I know, Guo Ren and Greentime are supporting RVV on Linux, based on
> the v0.7.1 QEMU implementation.
> The main problem is that VLEN is not a  fixed number.

Neither is the SVE vector length fixed.

That's one of the reasons I pointed you at the AArch64 sigcontext for ideas.

> When the Linux kernel released with RVV, I will push a new sigcontext structure
> here.

Yep.


r~

