Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD0fL-0006nS-Fr
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0fI-0006n9-NH
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0fH-0007Bf-Kc
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:52:56 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40685)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD0fH-00077z-EY
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:52:55 -0400
Received: by mail-pl1-x644.google.com with SMTP id h11so5360362plk.7
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4KuKDkIqQC/omjXP8z/3uo2FpKZuXa2d25HGbtXyIH4=;
 b=GfSMN0EWNwN/ddkImNWhMncAuLps5opEsCQ2rGk1nmaDZUb7x+1AD3KQNmkM+ZJmt7
 ckFxb/5ZMOEgoiuGTxMyjCm+eubhzGLNJuefttt+o5jv/LjfVasaD4fcL0rtdFjXEJba
 fiLZovVUmJP7ZZnehyCgqkrETG+raLeydiH1xI3HUl9ZaYm9hvJn03ZH8eZnEJeclECf
 Xt8FjWf5RjKKHhvJ/QKNOWmD9WqE7FBws0GUoHJ42mNz4tS8g9UpjQyHJp0dhW+ymeQj
 tT0RvhktUkRK0LuFhrHwWAUPwL8xJtkgbdt4t2MgPYbaXY0JX+IZJ3vdMki4unq8Zqk6
 qNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4KuKDkIqQC/omjXP8z/3uo2FpKZuXa2d25HGbtXyIH4=;
 b=VLsFuhXbYwxB1y/FaH0Ws1SDxVaBVErrBBRyqapP+rRBpZK+128n+/Z9g5Vx/ShWr/
 YmR8tmfkwqSWwWdBFtwW+rRi4x7P6J7qpMuOy/wsNmudH0pTg3vnJ2fkNIa4JvTQeSgp
 J+OvLiSkBvtmmiH9kKlmmLoC5dy7nvLV0ph/VgmatpbWtGmRsa8kt1ubI9z/kRfJNvBt
 7Il6iWNNjRow9UguYibcUj3oPxl1kqjYP0O/PJV3fmJ663/dIbiXGF3BM9HL0VLSz8YP
 /cRiXfvmCWhBT3w33gbEzMjhSSwP0+Y+Q8g4EV2nhQCsIQlaK3t4iK/YfFxIBk0maTwF
 aS1g==
X-Gm-Message-State: ANhLgQ0DcgkXc5uNpgtDROCcaYOA1Tk2MQL/0yr1Wnb3QquNpny36cwg
 eacmy2epbC0Hl/kfHAriL7BFEufjrYw=
X-Google-Smtp-Source: ADFU+vsrKRsiw48qMw5ivE/kj5ahWsjpMI8Ze34GoWgteF7cYSmhN6C3gOZcoko1ZLe5rT/4F+ObSQ==
X-Received: by 2002:a17:902:7796:: with SMTP id
 o22mr16046428pll.250.1584168774210; 
 Fri, 13 Mar 2020 23:52:54 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i2sm23118855pfr.151.2020.03.13.23.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:52:53 -0700 (PDT)
Subject: Re: [PATCH v5 17/60] target/riscv: vector single-width integer
 multiply instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-18-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e35d894d-30a4-dfbd-72ff-f33d70d4f9a0@linaro.org>
Date: Fri, 13 Mar 2020 23:52:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-18-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sat, 14 Mar 2020 06:52:57 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static int64_t do_mulhsu_d(int64_t s2, uint64_t s1)
> +{
> +    uint64_t hi_64, lo_64, abs_s2 = s2;
> +
> +    if (s2 < 0) {
> +        abs_s2 = -s2;
> +    }
> +    mulu64(&lo_64, &hi_64, abs_s2, s1);
> +    if ((int64_t)(s2 ^ s1) < 0) {

Why would the sign of s1 be relevant?
It's always unsigned.

We have code for this in e.g. tcg_gen_mulsu2_i64

    mulu4(&lo, &hi, s1, s2);
    if ((int64_t)s2 < 0) {
        hi -= s2;
    }


r~

