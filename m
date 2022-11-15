Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouwEu-000068-32
	for mharc-qemu-riscv@gnu.org; Tue, 15 Nov 2022 08:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouwEr-0008V2-Hk
 for qemu-riscv@nongnu.org; Tue, 15 Nov 2022 08:44:33 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouwEo-00064R-Nz
 for qemu-riscv@nongnu.org; Tue, 15 Nov 2022 08:44:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id h14so13352851pjv.4
 for <qemu-riscv@nongnu.org>; Tue, 15 Nov 2022 05:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzS68UimMW9fo+GAmYC11Uqd9MCO+hbECaAOBmmClvo=;
 b=EhFnihoL4/e+N+I4WUgfmF9OeWBKSPpnV6BEwqTLe0+POy1T7yppdZDXjBtOKvxXBl
 F1qWvz9XUjpROu5vVRtAapIC2TJMj4sR/oTY44a2FFqRkfGY6Xe2pDQTFqlDfNz3qs4E
 AMKc/Yy62yN3allSvw0bzrxV9EGInh53DCydvJTRiuuDRRLAtegMbG3VnUCouFQ+mFnH
 ep8sr7KLbIFlXRSWZyrbdYWct6OavCP+8Z4wkSRFCpk+1z520WOnltu3FmxERPA4STJ8
 StGIViZrqC1Vh6oQ9JX5/oWMjc6d0ufK4ZEmq6fem3hQFThmPlxfdgd7ISz4oA9eG7fk
 cT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzS68UimMW9fo+GAmYC11Uqd9MCO+hbECaAOBmmClvo=;
 b=U6MI/DKc+/eUc2Wmzt3IQ8L56v+IoiwhEBlpn6q8pAZvXwoulYjCSb5cAylqwSpLfn
 Okrm5sOq9WyIUMhWl0/pwiNEJ7ODjPy5baiVjuXbxH6xV5M+5WVAXbaMeuaWHv47mMZT
 LeW+RfAoyJY5cHvI+W2wD7vc1xXuGk02aB3tF2uy5mcpTydErh9mZkM7LVHM8w/WGVnx
 ICb/pb5X5SrtnEIpd+K3BdV24l/i36y9u2rdOfUh2pSaYPNCMk9yEKrF+eVHF/ySFA7P
 vhUYePnyfq6l2K5gMElfaT6VzEsiBZ/24cdrW63cDSz3fnJbYY/TA1qZqAlmTDwnUdhl
 +jFA==
X-Gm-Message-State: ANoB5pmZHOsIdqmrGMlI7uYPCpWB2YpzFA9nPNpHVx173uqblgDWcfCo
 cUcyvm2jaO0UaDQf3NbCYof8Ow==
X-Google-Smtp-Source: AA0mqf4zmbxuE5ldXMSRABg+SUxcabeOI5LMDAF5iF9E+AcgHgPG/gVDYoX0sexfPM2Ugq+W8WLDWA==
X-Received: by 2002:a17:90a:fd06:b0:213:5c5f:f440 with SMTP id
 cv6-20020a17090afd0600b002135c5ff440mr2400187pjb.15.1668519867696; 
 Tue, 15 Nov 2022 05:44:27 -0800 (PST)
Received: from [10.0.0.228] (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f54d00b0017f7c4e2604sm9862159plf.296.2022.11.15.05.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:44:27 -0800 (PST)
Message-ID: <9713c707-2828-5436-dbd4-60fbd18985f6@linaro.org>
Date: Tue, 15 Nov 2022 23:44:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/8] target/riscv: add support for Zcmp extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
 <20221113023251.11047-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221113023251.11047-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2022 13:44:34 -0000

On 11/13/22 12:32, Weiwei Li wrote:
>   {
>     sq              101  ... ... .. ... 10 @c_sqsp
>     c_fsd           101   ......  ..... 10 @c_sdsp
> +
> +  # *** RV64 and RV32 Zcmp Extension ***
> +  cm_push         101  11000  .... .. 10 @zcmp
> +  cm_pop          101  11010  .... .. 10 @zcmp
> +  cm_popret       101  11110  .... .. 10 @zcmp
> +  cm_popretz      101  11100  .... .. 10 @zcmp
> +  cm_mva01s       101  011 ... 11 ... 10 @cm_mv
> +  cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
>   }

There is no overlap in these, so they should be within nested [].


> diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
> new file mode 100644
> index 0000000000..1346de1367
> --- /dev/null
> +++ b/target/riscv/zce_helper.c
> @@ -0,0 +1,210 @@
> +/*
> + * RISC-V Zc* extension Helpers for QEMU.
> + *
> + * Copyright (c) 2021-2022 PLCT Lab
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */

The entire contents of this helper file should be handled at translation time.


r~

