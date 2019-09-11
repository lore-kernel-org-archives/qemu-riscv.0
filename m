Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8BGi-00045j-G5
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 18:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BGf-00045L-V7
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BGe-0000Jv-UD
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:39:17 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:35083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8BGe-0000JV-Oa
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:39:16 -0400
Received: by mail-qt1-x843.google.com with SMTP id u9so1361619qtq.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t6xvNJ5c14LG5X4spDXlUQXxe7XoibIsGyOYyGqXl/M=;
 b=N9DCxa5mJwzLMxVtgA656yOowqGnwokLFYTnd764OKMhURFYWOoC9AQdL3cQoOtqtw
 SuCUFl0Llk5p4BgzT/N4bsM+Kl9hAngfPSJNiemgQSayHAUixamGwMNkYAyRQjBJ/7nH
 v1OpWKKpWPSv/YbxFpwLMDTz7ehbFF9IQdzvByE/r+lzC/fHIGmtB8GfPfZN5GU4aaOb
 pLR7IZiODa/bISL7GX1ZGAPpjWr7T/OtZjXs+PjT/6D8Y5A4ahb5hmp2qdwzfS7wnhBM
 vO4+xfJ5NlKnwcSkzBNNgGqWlGeyrj1qGzf7ZTO6BH0xXdOhwBhTYZiouYwz4OroT1Cc
 I1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t6xvNJ5c14LG5X4spDXlUQXxe7XoibIsGyOYyGqXl/M=;
 b=TFRvWMQQHLTUMYjTRowVLgSdOHKvuDBjkQJuXaOUlK11DMgW20G+U7KmYdCzaAq6Dm
 dLvLdobYV7Wx67Ho35czSRwrQ+ejZdYAqUcxXVgSEYs2Zc3jqdIXrbDZp1YliNM0aNWb
 jPRB0lsU4CWEUEVDi3X+kc0aJgTWrPpvVoB8H8aA6bRRNhx7/4WPBCmigdCT/5kBO6E4
 0D8AOY5nFbcDBMtCw+/VOxkOjamBw58sjPz4Fj6Gxn0qUv6+JXnz60wPk+Sn0nwOBuIY
 dGv2OFT0L0ckIlcCEFI5iKkSxq6RZiHdszgobI2uNupCy/vH/Jhby2DrHvcM44olBvqc
 uHaQ==
X-Gm-Message-State: APjAAAWPrs4khefwk0n37nCO8zKtPJ9rRbylTgM0K3SuVvk232uCJ4pE
 6sp7TUs8Tpj8Gia3ntGsdlPJFg==
X-Google-Smtp-Source: APXvYqxNFwSXamkUDtF/VcOLInxECJKMfGhc35brRRgn06jVt7c68tGbLMWktf3X+uqqoDv3kSkk/w==
X-Received: by 2002:aed:2381:: with SMTP id j1mr15838416qtc.373.1568241555906; 
 Wed, 11 Sep 2019 15:39:15 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id y7sm9781075qkf.56.2019.09.11.15.39.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 15:39:15 -0700 (PDT)
To: Chih-Min Chao <chihmin.chao@sifive.com>, liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wenmeng_zhang@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
 <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b9c89438-5346-e2ee-403b-3bc1fa1637bc@linaro.org>
Date: Wed, 11 Sep 2019 18:39:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Wed, 11 Sep 2019 22:39:19 -0000

On 9/11/19 10:51 AM, Chih-Min Chao wrote:
> Could  the VLEN be configurable in cpu initialization but not fixed in
> compilation phase ?
> Take the integer element as example  and the difference should be the
> stride of vfp.vreg[x] isn't continuous

Do you really want an unbounded amount of vector register storage?

>     uint8_t *mem = malloc(size)
>     for (int idx = 0; idx < 32; ++idx) {
>         vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
>         vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
>         vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
>    }

This isn't adjusting the stride of the elements.  And in any case this would
have to be re-adjusted for every vsetvl.


r~

