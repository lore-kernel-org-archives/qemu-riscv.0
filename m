Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8R8N-0001bp-LF
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8R8L-0001a0-Rd
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8R8K-0005R5-LU
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:35:45 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:43465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8R8K-0005Qs-EI
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 11:35:44 -0400
Received: by mail-qk1-x743.google.com with SMTP id h126so17218321qke.10
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vbV1VsWRy4JGhj+HyjrWiwMobmXD95X4RSgI2CIV3uQ=;
 b=lIO8+K3uuuo7JCCAKvRKyjDAC2RhD3DoZjiDFWF7t6SqkpqJ5NmBqVTBuxtwnZxGmO
 IobtcFu5q+w9xKN3qpo+3u8jDKx8kvZEyaSNaevFhO0RUeUvK/OZBEz6XCN/DCe2e4ST
 pANyRhKdWYcr3F/RMPQ1RIwPMlCkkYV9ZOUvtXufZPNlZLVsKNp3N8EXYjNbHBc12CR/
 FW7OlvSicRErue7h4tZC+yDYORGaGMmWwsSRfhlp6lgt1jAU2QE6xlpher81JM1XoKAK
 A2Xlv2uAFQ8Zw81URUvwvoLmTczwH3ijAoaubOqjGQbzbWZcShrUuyFWanXRiaBgexn/
 XTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vbV1VsWRy4JGhj+HyjrWiwMobmXD95X4RSgI2CIV3uQ=;
 b=XK6l/oqrW/jzP6qWMtL0l9LetJns+Ok2Rpy05EH06NvCxAWdLkahUA+HVzL9LMXoOy
 KkQvxH6hycdli8Svwx4q+FR4Hzh3TLc1dRHTFQCj4ggFt1maYmJYXz/uwxYH/YiovbyG
 jTdcj73jmerAD/UJ+g8thhqL2BqsDwz4l2Unre20SXDqyk/2tPqPlEOoxzPXQlpBau6T
 yCv7gPzsG/Ojp/tVNGor/cU9Qt5R2apUNuZ1YkncqQIjeDGST2qCHa/vUltYTeOLrdQe
 hJnCfEqKYh5GCGRxTIy4jp1mu49rxYHde5dmmIQrLtcYuskjySWA4ovN5ztb23jjhKUg
 EeCA==
X-Gm-Message-State: APjAAAWO9O6uOA5HhIJV19k854qgS2brvRNaMXnoifi0ifo9lTeFWnyJ
 Xy4Dp2I3C+/FISrsM5GtB6HSzg==
X-Google-Smtp-Source: APXvYqyXLoW2qmGXf4NT9fFIk2GnpevuQBqOiNkRlJLHiwZJ/dlCAE7lj7H5GhNWFoRwdoTaT4F0ZQ==
X-Received: by 2002:a37:981:: with SMTP id 123mr42578896qkj.190.1568302543518; 
 Thu, 12 Sep 2019 08:35:43 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id j4sm12601044qkf.116.2019.09.12.08.35.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 08:35:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-9-git-send-email-zhiwei_liu@c-sky.com>
 <1e707c9c-e74e-8a21-11f7-6ce8d09cf06d@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd07e348-7fd5-8263-a781-1f40f46ed6ac@linaro.org>
Date: Thu, 12 Sep 2019 11:35:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1e707c9c-e74e-8a21-11f7-6ce8d09cf06d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 08/17] RISC-V: add vector
 extension integer instructions part1, add/sub/adc/sbc
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
X-List-Received-Date: Thu, 12 Sep 2019 15:35:47 -0000

On 9/12/19 11:27 AM, Richard Henderson wrote:
>> +void VECTOR_HELPER(vadc_vxm)(CPURISCVState *env, uint32_t rs1,
>> +    uint32_t rs2, uint32_t rd)
>> +{
> 
> Watch the spacing between functions.
> Pass gpr rs1 by value.
> 
>> +void VECTOR_HELPER(vadc_vim)(CPURISCVState *env, uint32_t rs1,
>> +    uint32_t rs2, uint32_t rd)
>> +{
> ...
>> +                env->vfp.vreg[dest].u8[j] = sign_extend(rs1, 5)
> 
> Pass the immediate as a sign-extended immediate to begin with, not as an
> unsigned 5-bit field.

Oh, and of course *_vxm and *_vim should be identical, because in both cases
there is a single scalar parameter.  In the first case the scalar is passed by
value from the gpr; in the second case the scalar is the sign-extended constant.


r~

