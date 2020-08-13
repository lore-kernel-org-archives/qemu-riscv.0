Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6GwP-0000QM-6i
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 13:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GwN-0000Q6-QC
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:22:59 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GwM-0007ZF-8x
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:22:59 -0400
Received: by mail-pj1-x1042.google.com with SMTP id kr4so3089536pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2020 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4hJxLlG5JQ6jms99XJ5I9kpOWhui2hsmvLug992n5Q=;
 b=BpFDit6JCRiSBLDPPg9V3kOy3+4UdoOwKqdyLT0CNDGUBoHK3OickFzwDU9XEHTFUi
 GYyC8csFksw2RE5d9xInIBfZn8gI314shBPtITYsEi/JvBlU0qHIHHunTWZzl/q8qPHa
 0rbGt8vxEtKtnPgK5QhDMm+bueIlmQRgtJQZ73Pf16Lq/0z52Sgz3HF15RjcE1P0wbwD
 dM9HYxJf8vzMo0RtKfpOdSMAWKeqBFNEdnyOwBhkGCtcKzitIH7dUpqepOEg1ZWiQ9yi
 1+zzBhXMP0al7Q6dSSPwfKTCSkulgw3t3niMWhTM+wFowgGfI1U20/UbJgqdvts0hezN
 VCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4hJxLlG5JQ6jms99XJ5I9kpOWhui2hsmvLug992n5Q=;
 b=omeKRGrzL/LmntyLMhlwlx1K9lzI4rsJu0JQDPyWu7x1QN3O8wo87hYrHNZBIlXWWx
 xCVtkiIoLAkOBHvr+igzl45jcWDIvjEmGsGf1TaGmo0FtdCyq7x/388vlAKMxzFV1mjI
 DQZXT7QeK1mT+l85eJsgxKtPh4jud4UNLUbqogBdyFs3Xhg50l4s+COYOVoqq2rqWHTx
 6+i33E2W8sjc/g99m/oPKdvk2D5AR1/2Q+3ooOG6QoPAn0/KtVhDi/ADLfOLeZb396xD
 /lVNhvf4kncyMPj8z+gR69ugvJ99nxxWojQUO/KYMTSkCIX74/FG6JHf017aW6UCPLTA
 7tPg==
X-Gm-Message-State: AOAM531qWU73SBIcKL2KLpx6ezNuwAe6L6z2DL9DLeWMpMvY+SHAoeP1
 NAvBIV0wm04149ZRE8IQSrAg4w==
X-Google-Smtp-Source: ABdhPJzu6sjJtNLZTE1f58nveiNa5glXGJWoFkZxo9ve5MXCG4ktZMeOqw56F1eI6B7CtxsedrGECA==
X-Received: by 2002:a17:90a:bc96:: with SMTP id
 x22mr6543053pjr.164.1597339376760; 
 Thu, 13 Aug 2020 10:22:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j13sm6435172pfn.166.2020.08.13.10.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 10:22:56 -0700 (PDT)
Subject: Re: [PATCH 1/3] softfloat: target/riscv: implement full set fp16
 comparision
To: Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
References: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
 <1596102747-20226-2-git-send-email-chihmin.chao@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b1382e5-38eb-edee-26ed-db66cdc89d63@linaro.org>
Date: Thu, 13 Aug 2020 10:22:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596102747-20226-2-git-send-email-chihmin.chao@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
X-List-Received-Date: Thu, 13 Aug 2020 17:23:00 -0000

On 7/30/20 2:52 AM, Chih-Min Chao wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Implement them in softfloat and remove local version in riscv
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/fpu/softfloat.h      | 41 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/vector_helper.c | 25 -------------------------
>  2 files changed, 41 insertions(+), 25 deletions(-)

Queued to softfloat-next.

If it happens to get in via a riscv pull first, that's fine.


r~

