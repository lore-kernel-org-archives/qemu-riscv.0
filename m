Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inW91-0000oW-UN
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jan 2020 18:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1inW8z-0000o3-VK
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:14:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1inW8y-0007yA-E8
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:14:13 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:32850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1inW8y-0007vQ-93
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:14:12 -0500
Received: by mail-pf1-x441.google.com with SMTP id z16so24153432pfk.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jan 2020 15:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oUP0/y1mzkWJW3eu8wJUad0wf8SKejS98YqpmYOsdEk=;
 b=jKtgEJNzi+KrlR7j3fySw/xZloVkcL31s7V0tRGx18wzRPdGBrjNXSM8QeEO115f0y
 3g5CuQtEaiSsGz6B9c4rVbS/HnyTU57lbUatEzzHzBpkmYyHebRTZ/66niGirftHETSS
 0yxdKPFIrn5+lSsuX073zkrjzilCrsexcbSreUPugmYUVSbxa/UrhdOGGQx9MkRFvu3g
 /LER+EuVu6rKd+5e+ZfAcZHFg5yKdtd1j7kwNOPtFuHIUApp7KOWBeXf78/5r4FGr4Oe
 KASzqm2BF2WZbgNphm9a1kPVyJ5mliB0L8yFMmikjPzsfeNB9bROnBP97SkTSIQEbL+T
 RDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oUP0/y1mzkWJW3eu8wJUad0wf8SKejS98YqpmYOsdEk=;
 b=NTYevo/dHibDKtfUW4c6gG2xU2vf6VnMkbPi2pomFwNYz+XFoan1xAZ/OMbI9r0qc6
 rkhF9A8ErKUnYlOmP8Sy3B4fXMwMDs2oltnj1ppAN+36LM9HsmbBMfquYsqLqa6uFIzl
 f8QTchPQzbXi37wNBTVAsNLExNLVffSMcX+8MwDpnNI4dKqzcmsQkjySYcylBMcMYq/q
 wF7kiQnTPvmqYxMd4POw0yYPDTaXPosPYCsHAqHb3kTZnRq/IebZXzL97ThJUapKP7nf
 M29Rn8GBHyLwpnHNaMrqotY5K9FkXFXTBph8h5jmrY87C/s673b8P2f8azHzlXdGQCym
 2/Fg==
X-Gm-Message-State: APjAAAXxGRLtnxUo3CMoExI6Fxl/kk/oQ+PNk+uvN57F0gWLbFqJ9lAO
 h+V1LDLraZ0v0gR9uTw9RTjSLebqkrs65Q==
X-Google-Smtp-Source: APXvYqweqyrXgwamIPM68rTH0ZnBIhS06kz//67oMKGRxTn7F0lWZzBCl1xhlTL/7Uy71pMo6Rebvw==
X-Received: by 2002:aa7:9729:: with SMTP id k9mr98165992pfg.72.1578093250978; 
 Fri, 03 Jan 2020 15:14:10 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22])
 by smtp.gmail.com with ESMTPSA id c22sm46367427pfo.50.2020.01.03.15.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 15:14:10 -0800 (PST)
Subject: Re: [PATCH v3 3/4] RISC-V: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87e202c0-9956-351d-8504-932b4b0aef55@linaro.org>
Date: Sat, 4 Jan 2020 10:14:03 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103033347.20909-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
X-List-Received-Date: Fri, 03 Jan 2020 23:14:15 -0000

On 1/3/20 2:33 PM, LIU Zhiwei wrote:
> Until v0.7.1 specification, vector status is still not defined for
> mstatus.

Using "until" imples that v0.7.1 *does* define the vector status.

Better said as "The v0.7.1 specification does not define vector status within
mstatus.  A future revision will define the privileged portion of the vector
status."

Although lack of a privileged spec does suggest to me that perhaps we ought to
support the vector extension only for CONFIG_USER_ONLY for now.


r~

