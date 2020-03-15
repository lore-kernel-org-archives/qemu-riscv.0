Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDNCR-0007Hs-Ey
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 02:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNCP-0007Hg-Fx
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNCO-0001pD-Hj
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:56:37 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:37962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDNCO-0001mx-CV
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 02:56:36 -0400
Received: by mail-pj1-x1042.google.com with SMTP id m15so5941540pje.3
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q6gUzbcUAkPYbQB1X66IHSvQ+fx9qkm/75/MoxR0Wg4=;
 b=E8sTFR53GQuLoef2Xc049xgDdNfWLA5CGqej6e7MEgKGK/PlbOUef2rsGheO5pnYDe
 dsvozg/TVFZ/umNV7Nd6tCfifGUGqKWNNoovnpMUu+Vo6XZDzmUpy8RE2hBgruE6wyGg
 s9cOWiOxWPbl9JPxwqME9Ka5GUYSnUiBOauWuUPWbHQ2LIp9tqmntXyMjNv066S6fBR+
 EHFB31gHBqd8mI40Kier7RNP3TygZBN2tdj+7QwARSUebt89uSjrDX4tKtv+XRXchBIS
 ESItHZG8hTX/aXmiRk9tXHzzPpRqUowCike3He6jNEe7ThEAVweZYWtAZKf0A4QJdlmr
 SQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6gUzbcUAkPYbQB1X66IHSvQ+fx9qkm/75/MoxR0Wg4=;
 b=cjgfScKSvC0BOo9AzB29Btg9/duLMTMi9ORV4+nJKaC7+CyQhR8BZfhrvAv7H7T9p/
 BMnDo7yInBy+rHN4lO//QcNrmpLtjGPjATFZ2zR8FCdnL39Sevh43OvuxjAf/nJtq5Fb
 IPXivbeurnYSenB2LaYaORBw/yRNSDnJDca8ML96Ibdm5VqAdatrK52r9BClkTOq+is6
 n29R01VCbGbEui00zWd62Mn9ndrEkls/LzZ6iob6d1+2ZttY+7fsHlaaPf1km3i7/C3c
 h7r1W/LUW80UOs3BPnXUWPkv4pS4G8fsg2TKw8bPjyXZwH7k+qwacFLN1+V3hU+wxH5X
 f/Vw==
X-Gm-Message-State: ANhLgQ0MqEQKe32wcpBdNNUK+vx6AB7z223AzKux5E9jpmPhzUG34fvG
 e8v4dOReuhJu9PHpVgnzi/dzcVkDnbQ=
X-Google-Smtp-Source: ADFU+vtDl8dJt9ehQU6bIAZ05mt++Ht5HYdOf8y7glTIJAO+hx6Xr3bSoEOgDgFEAk/Ps7YNAWQD7g==
X-Received: by 2002:a17:90a:34c6:: with SMTP id
 m6mr19105123pjf.13.1584255394878; 
 Sat, 14 Mar 2020 23:56:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d6sm16251761pjz.39.2020.03.14.23.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 23:56:34 -0700 (PDT)
Subject: Re: [PATCH v5 57/60] target/riscv: vector slide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-58-zhiwei_liu@c-sky.com>
 <28063df7-bf38-d136-2d32-39651692c4c6@linaro.org>
 <67e2c762-8ae5-3bd3-a16a-5b763cd7832e@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5630c35-8d6a-7a37-c3fe-1e0caac4720a@linaro.org>
Date: Sat, 14 Mar 2020 23:56:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <67e2c762-8ae5-3bd3-a16a-5b763cd7832e@c-sky.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 06:56:38 -0000

On 3/14/20 11:49 PM, LIU Zhiwei wrote:
>>> +    if (offset > vl) {                                                    \
>>> +        offset = vl;                                                      \
>>> +    }                                                                     \
>> This isn't right.
> That's to process a corner case.  As you can see the behavior of vslideup.vx
> from Section 17.4.1
> 
> 0 < i < max(vstart, OFFSET) 	  unchanged
> max(vstart, OFFSET) <= i < vl 	  vd[i] = vs2[i-OFFSET] if mask enabled,
> unchanged if not
> vl <= i < VLMAX   
> 	  tail elements, vd[i] = 0
> 
> 
> The spec v0.7.1 or v0.8 does not specified when OFFSET > vl.

Certainly it does, right there:

   offset <= i < vl.

If offset >= vl, then that range is empty of elements.

> Should The elements (vl <=  i  < OFFSET) be seen as tail elements, or unchanged?

Tail elements.

> Here (vl <=  i  < OFFSET) elements are seen as tail elements.

Exactly.

>> Again, eliminate vl == 0 first.  In fact, why don't we make that a global
>> request for all of the patches for the next revision. 
> I don't get it.
> 
> Check vl == 0 first for all patches. Is it right?

Yes.


r~

