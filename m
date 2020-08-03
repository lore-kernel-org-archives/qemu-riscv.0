Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2feW-0003jK-P9
	for mharc-qemu-riscv@gnu.org; Mon, 03 Aug 2020 14:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2feV-0003iq-Gp
 for qemu-riscv@nongnu.org; Mon, 03 Aug 2020 14:57:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2feT-0007iK-P5
 for qemu-riscv@nongnu.org; Mon, 03 Aug 2020 14:57:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g33so3120140pgb.4
 for <qemu-riscv@nongnu.org>; Mon, 03 Aug 2020 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9SR8aJxp76dwQjm8gpP0eZpbbdelARJFGvLfkpS1Jpw=;
 b=tgTDdbk1dyspLbdfGfSLyU86onm6Q3pQrMiIto9YSHvtXMpUpzTXe3UKAsiGvgtWpN
 gs0sVV7qAjMOJH3G+RnbsO1PdGwMEkFK9ZuIAyMROnkomTRGL61qRGAGDxs7fpP5t9LM
 SIf8qL/3ToGiXqohTBJIJyYBcXTPQPKOZqmlvgCesQghB3Vm8KQGCCwsQjpYqMirTueF
 x6TBMMBq1AcNBqNT+faK0sK5I8a5cKfYc9op8KMpQSPSBFWFLLTzl4RPxcOt5SilJFXj
 K+YkF4htMjjlKfjGXYI4LNdPiHmxo9pY075Bqj7T2t07htcay2Vggzona1WrR8YVOXD3
 On5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9SR8aJxp76dwQjm8gpP0eZpbbdelARJFGvLfkpS1Jpw=;
 b=PN6C9qd758iFRr4T+k9GYC0Yai4YF1QQn5oUMkwVfO5k0RVxb7bbys48/KE0++ae/K
 axjkXf3yi/LmBGlm1DV+GYVTmydeSwcQUHMbZ0ic5nzdI2ycB/v1kJxZAmL8fuL72UB6
 JWpAd8tfPy0kmE2PPe4VEbuWnzpq+Rzx5ynEr7lonn3iCgIPJIbkNXup/y/Is7fdlREK
 ah12q7s9+GDwBHhfdM4Z4ywmNSlW3W7+TZwbZCQ9ISdWKn+IR/4s656M8kKvUT9XuNic
 DAqg4RC0USx8gkYv2vSWQfj9JmjFP8x1mxSdY1/cuUtOJXqqBqBVdlTmTV+zOkAb9b4F
 WTnw==
X-Gm-Message-State: AOAM5324JT5QMaG+H4HFlubURabo/6imLPmeZqPIRtOjB4zxbgPlBznq
 p7EW49aw5dfgTbZfdAb8YKDStw==
X-Google-Smtp-Source: ABdhPJxmROqEDNiLfjtiuOxrHo4KyTxVeVb5Q2nb5sxLjU5Y0SuUpWW86L4cP37GXMNGog7BIZ2ZxQ==
X-Received: by 2002:a63:d951:: with SMTP id e17mr15633737pgj.318.1596481056196; 
 Mon, 03 Aug 2020 11:57:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b26sm12012029pff.54.2020.08.03.11.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:57:35 -0700 (PDT)
Subject: Re: [RFC v2 59/76] target/riscv: rvv-0.9: floating-point slide
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-60-frank.chang@sifive.com>
 <8ae82210-965a-25cc-46d6-f3d2e05e88a5@linaro.org>
 <CAE_xrPjqNSJBvK3E6c4FW3idxOvHGCf9Sj0x1918rqV35vL77A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e630d88c-4eff-bf2c-5244-128b49c4c9f4@linaro.org>
Date: Mon, 3 Aug 2020 11:57:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPjqNSJBvK3E6c4FW3idxOvHGCf9Sj0x1918rqV35vL77A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 03 Aug 2020 18:57:39 -0000

On 8/3/20 3:35 AM, Frank Chang wrote:
> i.e.
> /DEF_HELPER_6(vslide1up_vx_w, void, ptr, ptr, *tl*, ptr, env, i32)/ vs.
> /DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, *i64*, ptr, env, i32)/
> 
> As /opfvf_trans()/ and /opivx_trans()/ are shared among other instructions,
> I wouldn't like to make prototype changes to these functions.
> 
> So far what I can come up with is to extract the logic in /vslide1up/'s
> helper function to an individual static function and make /vslide1up/
> and /vfslide1up/'s helper functions to call this static function.
> 
> So that the're no redundant logic to be redefined.
> However, this still require to declare /vfslide1up'/s/ /helper function explicitly
> as its function prototype is different with /vslide1up/.

Well, of course the alternative is to adjust the prototypes to be the same,
avoiding TCGv and tl.  That would require an adjustment in the translator
though, which would require a different form of macro instead of GEN_OPIVX_TRANS.

It could be cleanest to do what you have done; hard to tell.


r~

