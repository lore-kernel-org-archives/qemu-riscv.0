Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDN4s-0004pv-A0
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 02:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDN4p-0004pQ-GG
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:48:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDN4n-0003GX-JY
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:48:47 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDN4n-0003EE-Cm
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:48:45 -0400
Received: by mail-pj1-x1042.google.com with SMTP id np16so6338968pjb.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H2xdeREEFOV9KzA37pmW7TUq9y/bfXSHkRJvNdSM2TE=;
 b=MOS0p3lxuAVDpk259/tBq4N4bpmuHIdTWHUkPm8ql8vvMYpn80LS4ii2fzB2IXv46j
 VWCANacFi4HUbhftTxW5yho+VWkPtXlYLZLwL/0twITF58Afpso3Qcl1eWiHoKVaU7pw
 SPECJSe9W301ps2P5A7DIGwsQ8d3heQoa5PAAso8fw6aRbTfyLzgNJawuPIXc9WLugyr
 bEZJ0TNSS7EDpUIicbVNMMmzcy/79thF34PeYaBiYLBceCGhFxlCBJz1rbsAyNMNZPrF
 1XPZUTWDsUdR85sxBkgTU/s1TKFusAB6wPlJf0xWCi3zHyyPep1hVcDsJYdDKNCdbgl+
 HiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H2xdeREEFOV9KzA37pmW7TUq9y/bfXSHkRJvNdSM2TE=;
 b=HK8INJJCyP3bpX+DAwpKtL+sW4Ivus72epfkljJrvfPH/uQKduwwMcWbwA/oh15ZND
 3optoX9Dpfu+yC/4s7lZWXFmgDu1QENSYF5HfOB0GcC3cvbEvK7hHScl1FF7JKIvv0iJ
 Tkhi4w1AYvBfRYs/Yip6LNNX9zMpAAdOtOkqOrTpj9dk2m25EP3lgW9DfHB8V1Hja5wf
 6cFoutrRU1+deYqBrqzEZnUWIIUgB9sW1B2SwGLA+dn7Ezn1LKalVloiY1x7quyM4E6X
 ZlEX+wmnl6xlOWQQAJ8TihFvNTxtlO0fbq8t06ID9KJsXhYBSglClpus7UcxkVoL+V5Q
 UnaA==
X-Gm-Message-State: ANhLgQ1K+Wr1Me5QjXWZ3RpZd6yXBJf3TxowcqswA+cw+cFmlrf3dXD3
 luoP0CpwGBaDPPnKDzKG7l8yp25ZZ3Q=
X-Google-Smtp-Source: ADFU+vuybhkSKNVnxyiH//mqK5U30H22lH5PXlG6KojDjLkpMQNxLa0FFhtiNqlLwGNZB4kD76EvuA==
X-Received: by 2002:a17:90a:3208:: with SMTP id
 k8mr19043124pjb.161.1584254923958; 
 Sat, 14 Mar 2020 23:48:43 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f127sm64188191pfa.112.2020.03.14.23.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 23:48:43 -0700 (PDT)
Subject: Re: [PATCH v5 56/60] target/riscv: floating-point scalar move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-57-zhiwei_liu@c-sky.com>
 <8b9161d1-f64f-5677-70a7-ec197d9d3d43@linaro.org>
 <04119654-2741-5bdb-a764-457dbc04161d@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <34b03380-fa6b-f0fa-0af1-a8b2abf787b0@linaro.org>
Date: Sat, 14 Mar 2020 23:48:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <04119654-2741-5bdb-a764-457dbc04161d@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sun, 15 Mar 2020 06:48:48 -0000

On 3/14/20 11:13 PM, LIU Zhiwei wrote:
>> SEW == MO_8 should raise illegal instruction exception.
> I agree. But I didn't find a reference in Section 17.3 both in v0.7.1 and v0.8.
> 
> Perhaps I should refer
> 
> "If the current SEW does not correspond to a supported IEEE floating-point
> type, an illegal instruction exception is raised."(Section 14)

Yes, that's the rule I was thinking of.

>> Missing nan-boxing for SEW==MO_64 && FLEN==32 (!RVD).  Which I think should be
>> done here inline, so that the uint64_t passed to the helper is always correct.
> I think all float registers have been NAN-boxed in QEMU target/riscv.
> 
> As float registers are  always 64bits.  If FLEN is 32, a float register has
> been NAN-boxed in FLW or VFMV.F.S
> 
> Should I NAN-boxed the float register explicitly here ?

Hmm, I see what you mean -- RVF is supposed to have already boxed all of the
values.  Except that it doesn't at the moment.  I remember now that we were
talking about this some months ago; I thought it had been taken care of, but
hasn't.

I think we should explicitly do it here, with a comment.


r~

