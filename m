Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDKM2-00088V-GH
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 23:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDKLz-00088K-Td
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 23:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDKLy-0000ju-IA
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 23:54:19 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDKLy-0000en-Cm
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 23:54:18 -0400
Received: by mail-pj1-x1044.google.com with SMTP id np16so6182085pjb.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 20:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ui3Lo/LuSx3DTr/rn3Sq3dRraUq/YXECRClwT6l0PdI=;
 b=xXSJSm9LApPhdUHbGxVMf8oZjQpcRWAavkuvL5RkO+IFDuChLrM/HPb37qOZjTDTcH
 gpKJ62LCJL2EIZa8Pb7jJS9ePExyRKQzxe1vqX1tU6+GgbJ8RA2UFVSVT9PZ0JbbWcXx
 JWbmxH18/615bhRX2c6AHegXLfVdv+OBJeGjykF35z06nOi5RrGsba/t3+o3JqpphIDp
 TkTjwPurC3CxassSLur0xgfnHojHEk0YjVJbhvwwKDqbrG0tArandnbG7j1vfAfLBGYq
 +rnew+sClyWV5iwbfNCOicfzkEstLczHo5IW8Jd/nPy4nwNa/JJ6gUkPX6IzHt9xMpeu
 2Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ui3Lo/LuSx3DTr/rn3Sq3dRraUq/YXECRClwT6l0PdI=;
 b=iguXGBm4vy0dBQGvVD8zwT345FjYXuTsMWK9695V9W7QOYhZfF4ies7QGC/cQ5tXJJ
 +EE8QzNqWK0yy5TfebPyqJqYQFWPkz+EeTPzSaAc6MJDAqFFdclPz/P4OMCgK5elMAt/
 GI24FGHNQ3dXfKq5DVFMpSn8leMTvQKJ8fiSbkrkYsAjXbCAFUQFZth4etaRxUiHHcrx
 MjknU24JDnbXWEiMNsaSBAAhTPTixkh8z0giMMQS/mC59acHcSpP3oi1SJeGB/R/XGWR
 xsaThNwtto6tjd5uuPvVxpLiaRqD0hrH1paKNYe0KIUvDjr7r66GRg/xxVqjy/zMVZLg
 N+Mg==
X-Gm-Message-State: ANhLgQ1UQVeZDw6BDMKdHIH9Rwv2nzJJdGGztl5MOxitoMzmstAO81aK
 TuOsCwVJVzyuy22Q2pnmTMLCzEYxVWU=
X-Google-Smtp-Source: ADFU+vtbIiuaKzZxFaQJwla5r2hPdYkptI3xA3ztRX6g3/g4/1IumZIby1S51bhEp9GnlhJ2BcP4bg==
X-Received: by 2002:a17:90b:1889:: with SMTP id
 mn9mr17514795pjb.85.1584244455641; 
 Sat, 14 Mar 2020 20:54:15 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r10sm56769986pgv.25.2020.03.14.20.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 20:54:15 -0700 (PDT)
Subject: Re: [PATCH v5 55/60] target/riscv: integer scalar move instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-56-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <183a0b1a-8889-988c-6f75-db23acdd4123@linaro.org>
Date: Sat, 14 Mar 2020 20:54:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-56-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Sun, 15 Mar 2020 03:54:21 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  5 +++++
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvv.inc.c | 26 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 15 ++++++++++++++
>  4 files changed, 47 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

What an annoying difference here between 0.7.1 and 0.8.
With 0.8, we can inline this operation as for vmv.x.s.


r~


