Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioaF5-0000UN-8e
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jan 2020 16:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1ioaF2-0000T3-Qx
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 16:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1ioaF1-0003qo-KG
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 16:48:52 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40381)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1ioaF1-0003or-D5
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 16:48:51 -0500
Received: by mail-pl1-x644.google.com with SMTP id s21so19600780plr.7
 for <qemu-riscv@nongnu.org>; Mon, 06 Jan 2020 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FpeHLgsmVIrcPydx9RpKfqremvL17Cg1fOeP/EzJ9Mg=;
 b=PXYn/+6OWKHej1+QBS6j5oJIqOj2Nd4m0/DLYY+SvG5epIbLK3cDbriHxEO/+s5RZ7
 PrHNr8PIujIFa60R7+9LrBJkLc3FOK/fWLGYJgCh051d2p2CPuay9jzWAFGiVSFFuU8K
 wj8Sie6HCqTLm4HsxDpmQUT6aBzMS/QFJOHUDFi+z+iFWS6u5sI2ZSU6y+dRV/5ekpCa
 SyHUEuAzT/A+cdtu/EjqrmLOY54d3oHMv/pOUwbrS/KIp/9kvhNNicYmCzk+Ek32hjYl
 g5bW/uNBKp0juysIS8wT43aeECMfUpIcfDdE109XVWgUY+ksSVx0YJWmUjjE7sajOK/0
 yIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FpeHLgsmVIrcPydx9RpKfqremvL17Cg1fOeP/EzJ9Mg=;
 b=liWsfw9hOj39CU6aOiqUnZ2MQZztjgJyXI/K5h9RdjGKe5NkcnnndE3vtkS9wtLjfK
 naIBUQs2NlWT/cMCD5ibxpH/TSCzHKbjy5DzIZAZoeA5CWKzLYPDYryFBS2CGO+P4CHY
 d6hHYT77UsI6jj/NgC9iqDUeQFTE3hsvDtacmvDoLzpl6sbpCyQ0A4lzd6Gz7+OEcCrU
 iCj/34HDU/ygUafzqX1xZNbHY8+6WKmGJCVAHj/OWNPHq6Qd/n0im5fJiM+ep51DQdc5
 wctaNH3IezcQjPuLne+86nAp2AIaRv3hC29jnhmxilj5q7Md2PRUprek9DTnwSAYtLli
 nsOA==
X-Gm-Message-State: APjAAAVIiUyb5SddWc3dRIFvEjj1dFCI5d4/GXiL7SMxEnD3X3TVuxEm
 lh4u86lxp4AbxEstfM1Z1Esx/A==
X-Google-Smtp-Source: APXvYqw0v0gKNrEAgVf+HUmeacL841tMzwfCnqVaUMdnhNxpAAN5OfAqwB39fWFi+JpIRPafNHgGHQ==
X-Received: by 2002:a17:90a:230b:: with SMTP id
 f11mr45161277pje.124.1578347330114; 
 Mon, 06 Jan 2020 13:48:50 -0800 (PST)
Received: from [10.17.0.74] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u18sm75753175pgn.9.2020.01.06.13.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 13:48:49 -0800 (PST)
Subject: Re: [PATCH v3 2/4] RISC-V: configure and turn on vector extension
 from command line
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 richard.henderson@linaro.org, chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-3-zhiwei_liu@c-sky.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <2e85f9fd-c254-5403-43ac-6988c013e319@sifive.com>
Date: Mon, 6 Jan 2020 13:48:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103033347.20909-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Mon, 06 Jan 2020 21:48:53 -0000

On 1/2/20 7:33 PM, LIU Zhiwei wrote:
> +            if (cpu->cfg.vlen > RV_VLEN_MAX) {
> +                error_setg(errp,
> +                       "Vector extension VLEN must <= %d", RV_VLEN_MAX);
> +                return;

There is no architectural maximum for VLEN.  This is simply an 
implementation choice so you can use static arrays instead of malloc.  I 
think this error should be reworded to something like "Vector extension 
implementation only supports VLEN <= %d."

The other errors here are for architecture requirements and are OK.

Jim

