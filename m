Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jydre-0003t1-KR
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 12:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jydrd-0003ro-7u
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 12:14:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jydra-00007P-AE
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 12:14:32 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j20so3238149pfe.5
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1NwmDuXeyIXDqLos9VOzL1VsMvF3ILIyzVzhT0SpN5E=;
 b=DHcHCcdxaWDmtEM4ZYXBGvrbhlqr5n4A+G2IRM+vs/TVjpUeaaJ2hY5upovLEURQtP
 MRKJOIL79ITXJI3oB+7p6IAWpcGLwq1aYA0HEyvhHTASj/Mi5TdpC5XVn/dEkI6Ftc6f
 bDzVoZdAA0iIn+tVf+VRLQyhKGKsQnBpgiN2LyhrEBRbcUXC+w1323IHSXUFKzZ92AZ+
 MmmiXebwhS6YMIUyibcDP+WmbBaDxlRpEB41Ggqll7RAzXWRwRqEdot7ydiz6nwOg0CW
 PlJT1fgcENMkWlPumo1Dkft2BCjgYENGP5mFb1LEKibzWmogqW0ZOweJgAh3CAeW07Ww
 Qfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NwmDuXeyIXDqLos9VOzL1VsMvF3ILIyzVzhT0SpN5E=;
 b=CWf78ACz/IM2FSuZfnuinMQnM7n0sPLjj/Zi3I3vs7ayOR//S1zl9hLF/d62FG+Rw4
 I5OBA9dU/shp0N2zFqkeNzlnmiIyUzDb+mC1QXyjikQQGYqq5+7so79m61mBElbjUGbG
 v6rQkX6yddeGfgjZji5hrQxzdL4LmrKl53d5LgKLJQUZ3GjL4tYonAc9FJFht2HyktU1
 4uBm3P368IbRcB04lFXUWLsr5Gr6SzusT/JQuRmZlUk2iA9m9NaKFs27bvPqMzkuYQjY
 U3DyC8ymOCuJC9M7R9k1SXsmUwsr7A6btdHCgen3lKnHKhqvL/WLCFoItjdgz8WOx3uc
 EcMA==
X-Gm-Message-State: AOAM532dt53rAj7Vzh+rrKf4N+vJM0FjF8jZ+Xiu8+ZNt9zveh5rEdcX
 Jrjyr+6DEwPy3CZqCTd0mJ3elA==
X-Google-Smtp-Source: ABdhPJz37Zk1CleY2DwwwHpjAtdfywq5u5O60TbYk9u2rkbvQmWfgNdIiZ7/nQPiinudORH/yquUlA==
X-Received: by 2002:a62:8f4b:: with SMTP id n72mr4555785pfd.284.1595520868654; 
 Thu, 23 Jul 2020 09:14:28 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 r6sm3461360pgn.65.2020.07.23.09.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 09:14:27 -0700 (PDT)
Subject: Re: [RFC v2 19/76] target/riscv: rvv-0.9: add narrower_nanbox_fpr
 helper
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-20-frank.chang@sifive.com>
 <87cba14d-0ff5-97b8-b1ed-34872906495a@linaro.org>
 <CAE_xrPgbj9aMJ3k6-WW72_Ng=hz=GNkVu5y1zu57efNiqkEd3g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f52af7ab-c3fa-5a30-bf79-643e7a88a610@linaro.org>
Date: Thu, 23 Jul 2020 09:14:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPgbj9aMJ3k6-WW72_Ng=hz=GNkVu5y1zu57efNiqkEd3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jul 2020 16:14:33 -0000

On 7/23/20 12:13 AM, Frank Chang wrote:
> On Thu, Jul 23, 2020 at 3:15 AM Richard Henderson <richard.henderson@linaro.org
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 7/22/20 2:15 AM, frank.chang@sifive.com <mailto:frank.chang@sifive.com>
>     wrote:
>     > From: Frank Chang <frank.chang@sifive.com <mailto:frank.chang@sifive.com>>
>     >
>     > For floating-point operations, the scalar can be taken from a scalar
>     > f register. If FLEN > SEW, the value in the f registers is checked for
>     > a valid NaN-boxed value, in which case the least-significant SEW bits
>     > of the f register are used, else the canonical NaN value is used.
>     >
>     > Add helper to generate the correspond NaN-boxed value or the SEW-bit
>     > canonical NaN for floating-point operations.
>     >
>     > Signed-off-by: Frank Chang <frank.chang@sifive.com
>     <mailto:frank.chang@sifive.com>>
>     > ---
>     >  target/riscv/helper.h        |  2 ++
>     >  target/riscv/vector_helper.c | 32 ++++++++++++++++++++++++++++++++
>     >  2 files changed, 34 insertions(+)
> 
>     The helper can be done inline in two tcg ops.
> 
>     Though, really, we need to coordinate with Liu Zhiwei's other patch set that
>     also deals with nan-boxing.
> 
> 
> So, it's better to leverage the codes
> at: https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_liu@c-sky.com/
> but has to extend for the case of SEW=16? 

Yes, or what becomes of that patch set upon revision.


r~

