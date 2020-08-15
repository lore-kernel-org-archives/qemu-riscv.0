Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6yg0-0003lo-PE
	for mharc-qemu-riscv@gnu.org; Sat, 15 Aug 2020 12:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6yfy-0003ja-Jx
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 12:04:58 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6yfw-0001sa-Tx
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 12:04:58 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b17so13586951ion.7
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2020 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FI/r/KPM3NamuEvu+F9mW+RliiWbhgVxKmNTvx6BQcc=;
 b=tY8QGWDcFtWOVpQJZV0liCOS04JLlmA+FB8vkBPVaUAkjzJWRbZ+qL2u8k2wtCWGTp
 3YdCfIr+k6HZxtWNVQ1Egi7Mofiq82yxK1dIRNgxayxrq7r3UonSJFfy7YhEcpRkw5pP
 s+lIXKL43zbsR5402wVvQ90q/01MmwnBnMOLGgtAtKaSxq8WWNtfCJDUjNVbX8dknKBr
 sjO+74OkbcioE/8OP1ORS0oKdzw6dw9FxybxOeXfdCE6tJZhU7ZxAeztbln9EkPYcbRG
 bTkf2LP0LntNX0xEnlU5NecLQxpUS1GWU399tE940judQvptUKW+d4lwnpHiqPfLGreb
 IF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FI/r/KPM3NamuEvu+F9mW+RliiWbhgVxKmNTvx6BQcc=;
 b=gW9SsZmWcHjZ4t52oacACryUY7+YPjd+rCVOcRxzchUQuEaGSDGoYZGCZSTW4O2ElB
 YrpVtAeq/i0kgyuyddm9iCqhzKhOSi8uqGd+EkCHywJU8MfGoVF4EAlxU2l3+UlQVx1H
 HgMg8D91pozfZrA0fP78n/YEn/BVAGb+XdRPrOTzg9i5e7FhtRsOlj5fZypxBPFGx9aE
 oFqzqY8taELFC22tMBJmT1sPmpZkYRtkbT/x6Q587GfkdqYX509/H+jcx7bRGl6W7Xf+
 aTORutTqSbHk/eqNoo8/Gfbgz9iCv3VfRL6Da4aTvI6/rzmpwMDCkLBoQNvS5K3986Rf
 aFkg==
X-Gm-Message-State: AOAM531m+aezhtuPYjkFMj02L7R793ZPwdVQUKEjVR9c+VGYIFeKDJYh
 a4pXt3Tq9p0tbrXHHhVht5OItIAHnaQn1w==
X-Google-Smtp-Source: ABdhPJw0LwMD3EbR1FBKH852hmnoFvx+VhSkX3kEnC3/GndsGW0vzotWC3zGi6/oUfpLjWlwj3q9YQ==
X-Received: by 2002:a63:1a66:: with SMTP id a38mr3737132pgm.253.1597469360358; 
 Fri, 14 Aug 2020 22:29:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v78sm11468635pfc.121.2020.08.14.22.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 22:29:19 -0700 (PDT)
Subject: Re: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-27-frank.chang@sifive.com>
 <90f01984-54a4-2a56-c52f-d1f4332b39d4@linaro.org>
 <CAE_xrPiJRRV3FYtfve6LMOF6LNEYGfhmi9CiabxqUBEew9igLg@mail.gmail.com>
 <5706a1ca-1dd9-22cd-08ce-c70780111bfc@linaro.org>
 <CAE_xrPgSbzzJqHYTeSND4wQDJUMoMYPmmcH97VE6hRcxh2S54A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de85d715-924a-8156-7424-5c35fd585fb3@linaro.org>
Date: Fri, 14 Aug 2020 22:29:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPgSbzzJqHYTeSND4wQDJUMoMYPmmcH97VE6hRcxh2S54A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 15 Aug 2020 16:04:58 -0000

On 8/14/20 7:52 PM, Frank Chang wrote:
>     probe_pages(env, base + stride * i, nf * esz, ra, access_type);
> and
>     target_ulong addr = base + stride * i + k * esz;
> 
> If we pass ctzl(sizeof(type)) in GEN_VEXT_LD_STRIDE(),
> I would still have to do: (1 << esz) to get the correct element size in the
> above calculations.
> Would it eliminate the performance gain we have in vext_max_elems() instead?

Well, no, it will improve performance, because you'll write

  addr = base + stride * i + (k << esz)

I.e. strength-reduce the multiply to a shift.


r~


