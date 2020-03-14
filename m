Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD060-0000lk-T8
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD05y-0000lT-Dh
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:16:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD05x-0006Zg-GV
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:16:26 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD05x-0006VZ-AM
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:16:25 -0400
Received: by mail-pl1-x641.google.com with SMTP id w3so5342886plz.5
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXd6q5N66ycEsK6jlABtLluIjfbC4JRFNNdfj/T1fSY=;
 b=IGg3e+mAtAFxlbephNBT2MscvTqfP01FFfSD7SIV5EqTfl9KfaN/12U1ULbv4oSHKf
 afrCcETPNzUu7U/W6WmhK93Z5AH6tU/ZH2+klRud7Kv3BYHcvtUwFcm402TSWBvFB4HV
 B7l3kyICpEIH5yO3U0Ma5Rl09OFwe56foz330xQDpp6DzKeeR3RLa7fEwZhFrMIezkbU
 AgeFCdUUv3alAH+dQvTv4f+U+c0ru45LhvXExUW1djn2kudEQQeWrsdRoXKKRHAnIMzA
 eFOj+ugc4HN0LCyafpljMlFBYorQfyfLvTg9fCNsEKXNBdYPVZPm3kJKR9W2OjFKo08W
 8U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXd6q5N66ycEsK6jlABtLluIjfbC4JRFNNdfj/T1fSY=;
 b=HZyq6kVmCJD3WQj3WO/Haq8ReN8VPQfKQrNal7LZmiSBd9j6BBqc7NS3BfiVjpZWY6
 Jbw3cll7RxfIK4x+wnHOk2c2+T2Ll+Nw94P5lGGYQDWdE487W/GcDV8a7N1aDCA9rmiK
 Hpml/ELmzad9B3fyZF8bKnfoI97NEyTm/pdooJy6APzFkdU2rKuswt5VkEVCbHJznB+F
 mNKctngKMIEJPo9BntNEFS6w+DY3z4VvGmQATcQ6p0l1YAfzRSo7CqC41h65zm1VX6Rp
 tPQhy/T3A6sdAWognNEXce35UvjOh73Q8owBXI1NrG9ADfCFiLCvWMcJBPKWkc1rcKmv
 Ov1Q==
X-Gm-Message-State: ANhLgQ2gLaesNZv6iqfLyEIT0K4DJrgZAiv2suLyriFzOGWGulYY9wp8
 DPAxmC7NndIiVjU1LsUQb+WBOl4u8BU=
X-Google-Smtp-Source: ADFU+vtoPlBDdivDklbnEIkxB3cOVsg0uL9OCnrOrhRy7Szn7KKlEu/GgoPlxi4o5LyJ/VdP4JEPeA==
X-Received: by 2002:a17:902:864c:: with SMTP id
 y12mr16556248plt.8.1584166579570; 
 Fri, 13 Mar 2020 23:16:19 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 x197sm11301927pfc.99.2020.03.13.23.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:16:18 -0700 (PDT)
Subject: Re: [PATCH v5 11/60] target/riscv: vector integer add-with-carry /
 subtract-with-borrow instructions
From: Richard Henderson <richard.henderson@linaro.org>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-12-zhiwei_liu@c-sky.com>
 <77fcc875-ba5e-ea18-1228-6a1e7989491b@linaro.org>
Message-ID: <6de2ad7d-c83a-a3a0-622c-51aaf28c36a7@linaro.org>
Date: Fri, 13 Mar 2020 23:16:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <77fcc875-ba5e-ea18-1228-6a1e7989491b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Sat, 14 Mar 2020 06:16:27 -0000

On 3/13/20 10:58 PM, Richard Henderson wrote:
>     C ? N + M <= N : N + M < N

Ho hum.  N + M + 1 <= N.
I'm sure you saw the typo...


r~

