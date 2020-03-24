Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGkuc-00044n-6B
	for mharc-qemu-riscv@gnu.org; Tue, 24 Mar 2020 10:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGkua-000443-6M
 for qemu-riscv@nongnu.org; Tue, 24 Mar 2020 10:52:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGkuY-0002b5-SF
 for qemu-riscv@nongnu.org; Tue, 24 Mar 2020 10:52:11 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36620)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGkuY-0002aR-I6
 for qemu-riscv@nongnu.org; Tue, 24 Mar 2020 10:52:10 -0400
Received: by mail-pf1-x444.google.com with SMTP id i13so9396635pfe.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Mar 2020 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BU+olHEDMA4SWXhPhSUdr47aT74Eb79xNS9MUGXxFYI=;
 b=FWyV2l4C0eRh0krBZFBqrAkVNLPgzkOuMeTQJlVI/JBG2xfQED4mcRbESUMK5yvxqL
 sVSjiMkHSRBK51T1v7rtp06Kmy+sjcPI1QZcDpkt23lVdr647Pwex/Q+bOJ6W9mGmei1
 i9jiwFZZnFE1spRJ7Fc+7b22KFqA3sf3w6CaTd2/4e1HZiMNwvuRQ5kSwaQBD2MepQE3
 MnedyGT8Im+v83aPG3hSNUUruNoe5u4RoilYi5g4EcVe58A5eE+9ISC/xipTnPpXzaUw
 Y2koIw3aB8DvzN9RvbRnZ+Zgkgxi7eixODwHC3Z7j7KpAwfStB8yTBC16+Ks7k3a58Zx
 XUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BU+olHEDMA4SWXhPhSUdr47aT74Eb79xNS9MUGXxFYI=;
 b=ZxHRd+60qSdhr8xGgyC5mLMEYqjyFL8QZiR7wsSR3CWzwNxRmaiC0BCE1VwA0QFRE2
 ELEqRyWnSFMWZmxjunjn9NUDq5FjDg9MWyVU4zhxm9Zv2LEP2PS9s/cXg91LaO+Uf3Br
 UTYKcO07QtddI4TZW1hSfTZeU78JKvpEey8RVcfJcpItZ68eOo4UDAdnPp99QtITxeo2
 J5io4DmBvyJVF4p0+XXu2G4qmNGhPla7ZFLq1H1mMZZqDXg5f+MRdyjZIkPgyzDSfv8/
 7KdrCTl784/soVdEqfDkuSA9xT22+G3k6Q68/GMixtO8x/DK7vGZg5dDxyxJhVibhoBK
 U/Xw==
X-Gm-Message-State: ANhLgQ24JkSAGZqwPiT57yeb/jjnh0xbCIkfgIaR7dR/muk+4G/1tlUK
 ozDC2Ngt9rPcyHM0Fo6iBfedOU7bv5c=
X-Google-Smtp-Source: ADFU+vvG7YxfYdT+qEUqfiNPI2Z6eWyn6O7L/mghIYQYPkxj5MLW45sJhOdQAOyBMkFA4A20vTMLaQ==
X-Received: by 2002:a05:6a00:8d:: with SMTP id
 c13mr31114563pfj.68.1585061528986; 
 Tue, 24 Mar 2020 07:52:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id k1sm15182475pgg.56.2020.03.24.07.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:52:08 -0700 (PDT)
Subject: Re: [PATCH v5 57/60] target/riscv: vector slide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-58-zhiwei_liu@c-sky.com>
 <28063df7-bf38-d136-2d32-39651692c4c6@linaro.org>
 <88b87d58-5387-9d0d-b1a0-5705171f2e83@c-sky.com>
 <76b6c079-15b2-08f1-f8e2-570efb6cfae5@linaro.org>
 <a99c100f-4b32-810a-97d7-ee54f5f65cda@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25b384a0-c1d7-ed5a-94a1-7912e020c8ed@linaro.org>
Date: Tue, 24 Mar 2020 07:52:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a99c100f-4b32-810a-97d7-ee54f5f65cda@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Tue, 24 Mar 2020 14:52:13 -0000

On 3/24/20 3:51 AM, LIU Zhiwei wrote:
>> (3) It would be handy to have TCGv cpu_vl.
> Do you mean I should define cpu_vl as a global TCG varible like cpu_pc?
> So that I can check vl==0 in translation time.

Yes.

>> vslide1up.vx:
>>      Ho hum, I forgot about masking.  Some options:
>>      (1) Call a helper just as you did in your original patch.
>>      (2) Call a helper only for !vm, for vm as below.
> 
> Sorry, I don't get it why I need a helper for !vm.
> I think I can  call vslideup w/1 whether !vm or vm, then a store to vd[0].

That's right.  I didn't mean a helper specific to vslide1up, but any helper.


r~

