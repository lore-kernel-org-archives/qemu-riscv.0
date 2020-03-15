Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDNfU-0006Hh-II
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 03:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNfS-0006H0-5b
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNfQ-0007Ty-U7
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:26:38 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDNfQ-0007Rh-Ow
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:26:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id m5so7713097pgg.0
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uvdjHaW15SkeK0LOhctCdKDBlCzeaJduO/aMHtu375c=;
 b=fSYj3/S6E6afs30RJKiyh2Ud40IPAHMUrZr2ZZ+Zso5flTBFh0iT1CATiBJ4hvfCR0
 iJ7xq6UZHJcFRe9oXGehIQE2v+UI7otVCCxU+vk+9vgoULroWvGMsQ4cA0iuybXAVmMC
 NOJw6iIDrx3crf4zF3zp2uBvZMavuoWY5wmc5Ty5Zozil69OX1kbz1aOyZkb0DLW4SzY
 IAHH4uYjuGQSN4+jK4p3ra9uFA203JD2AsbDMh3o6qVCUUNqC+jgRWG3/07lO+TvgHAB
 mJhKR4hzgO5bnz5ZF19uyBguVTecXcE9YGQ13u4udVbL2Cfk7B6RFq0c2P/DnbsrkFqn
 g4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uvdjHaW15SkeK0LOhctCdKDBlCzeaJduO/aMHtu375c=;
 b=MQcf5jFsJe7r5++i/CxJyyW+LHnqYb3Pq7D628EZsBV3hT4xXYe/lnEopjBhaVJLov
 am8LJvCw+gXkp1DSRecKj14PJDILJkcqky0IkQ0n3XqdycoiQgfFc78XAUqhU97NCkaY
 cRJQWEq2Y1PEIKqz2WEM2hHCRDNeR4FZ0IqKaRPUuZVurwhAgcl/+TmsAjeqQZTC3/Q6
 yFYDiWV4ZWeRYwTf+eXEmRj0nqcr3z/C9ZN78mo/iQARZ0dulO8CSuJ12C8KoJ8ofiCj
 CdzQTFgcibjg492Mfxcp71FSNW1XNo3pzF3geRoInO3NDVqws2YC93UOt1XfwK/S/ufl
 8Sjg==
X-Gm-Message-State: ANhLgQ3EGVOwwdxHmw4+jtd0KEUrDzaZyOczezPEqdwrix9wKdhttrM9
 FEhoZGM/wtEs5rNqHmgTQ6phnC2g07w=
X-Google-Smtp-Source: ADFU+vvTgbBvFvjpdELOzKroLhdYmr8Yg1nYRFYtC7TB+kviCYZMRcerjY3J//mbq6jRR5t0c+EPSg==
X-Received: by 2002:a65:460a:: with SMTP id v10mr21210307pgq.370.1584257195141; 
 Sun, 15 Mar 2020 00:26:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 g18sm63588008pfi.80.2020.03.15.00.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 00:26:34 -0700 (PDT)
Subject: Re: [PATCH v5 51/60] target/riscv: set-X-first mask bit
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9684ea94-452c-973d-5996-6cd3ea1d65de@linaro.org>
Date: Sun, 15 Mar 2020 00:26:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sun, 15 Mar 2020 07:26:39 -0000

[ Patch didn't make it to the list, so reviewing

https://github.com/romanheros/qemu/commit/60668e86d94ffa48adb2f9c346753cf77f582686
]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

It should be possible to rewrite the helpers in units of uint64_t.  The
unmasked path is easy; the masked path is more complicated.


r~

