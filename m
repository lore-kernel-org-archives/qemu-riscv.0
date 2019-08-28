Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i34nE-00053R-Tg
	for mharc-qemu-riscv@gnu.org; Wed, 28 Aug 2019 16:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i34nC-00050X-Hv
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 16:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i34nA-0003Yw-M7
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 16:43:46 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i34n6-0003WX-BR
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 16:43:41 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so319486pgp.12
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2019 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cSWtLYk1R6qfwmOKropH2WjXjItWYhBiK+ppZCYJU70=;
 b=BZAmbyRqblWzMszJPAfmwik8DZpH+wTA1Hnumwb61dy6pQsopKQnvesEEfZTgmnEui
 GCrtcaRn3wOIIHyTEVjQl2xQ4+i92Jec56KzwpIeQnDS0q0tXlnA/f2LJsMxlDwEaHaQ
 keL33xRrY1ktSXUqFD+2mdO9UFfTl0POWW8JBBPszTZo0k7bh3nAUB+MztwvHf9sk3R9
 XttCK18TUSgeWso2sftMAY7iRho6MbkGd7BDJjAMZ4OypgCQC9U+nC9tiGd2ByA4DiRO
 oU/ZfF4+jGDY4McaMnX4NXLW5r/h1nhztSUIgrGA9QMWhC5apm9mWGEa35YmBRb5QW8W
 9+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cSWtLYk1R6qfwmOKropH2WjXjItWYhBiK+ppZCYJU70=;
 b=WD3UQgGfm7Fb961WqZCXJyEUBOkiPkH7MoQ1UxsMwS4bqFWtvDAmCaUpT9nHkEadmc
 UgQbKLoQBAscSHbRTkipbYNpMtypwz5E704760VeIejsCPaSnKJsfD2VzIpyurX01vmD
 TcSLFW0M0OC/Nh7jR7gJ5LQ+lJOiLeq0wAn3znCPe13BKPQVI/eNiSVUo9simIPkuJsH
 sJKTbNDi21Bm3r/5/oZWKLG/MhngSvbSHlg5n8zfBFyr2kgV2QX/6LZhKwv6aEQGTH4t
 qdtEa52no4qLQ9r4lJ+uAM8BN9ZrQetU+7mYtrgLfTwlVFy0MPTgL59H6FkmK2v3glRn
 CI/A==
X-Gm-Message-State: APjAAAV67EmbYebiXf/Mdy3v8egfF25vanN/EpVnYvi2LvPpENfgwark
 O+S7NatgF3bKGSKUTy8NAntIsw==
X-Google-Smtp-Source: APXvYqySGOt3IoijDoaGpnC4CNY6L4LvFiKaYn63uGsfqJPqYbjntz+DF+8X4ZpyhiIHp1NesHbDNA==
X-Received: by 2002:a63:bf01:: with SMTP id v1mr4971960pgf.278.1567025018702; 
 Wed, 28 Aug 2019 13:43:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a6sm44914pjv.30.2019.08.28.13.43.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 13:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: liuzhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 Alistair.Francis@wdc.com, alex.bennee@linaro.org, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3b85e9b6-8799-9682-9aaf-b688924cb52e@linaro.org>
Date: Wed, 28 Aug 2019 13:43:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
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
X-List-Received-Date: Wed, 28 Aug 2019 20:43:47 -0000

On 8/28/19 11:54 AM, Richard Henderson wrote:
> But it might be reasonable to include (VSTART == 0 && VL == VLMAX) as a
> single bit.

BTW, it is reasonable to check VSTART == 0 always.  Quoting the spec:

# Implementations are permitted to raise illegal instruction exceptions
# when attempting to execute a vector instruction with a value of vstart
# that the implementation can never produce when executing that same
# instruction with the same vtype setting.

Since qemu will never interrupt a single instruction, each vector instruction
will always run to completion, which clears VSTART.  Since QEMU will never
produce a non-zero value of VSTART, it is allowed to trap on any non-zero
setting of VSTART.

I.e. it can be handled at translation time alongside VILL.


r~

