Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgx37-0004Xz-I2
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 17:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgx36-0004VX-GL
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 17:05:16 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgx34-00061N-Nh
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 17:05:15 -0400
Received: by mail-pg1-x541.google.com with SMTP id p21so4033045pgm.13
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ALZSyeo39NbS9OLB322BCxqDYf5DPRpt4qvdmM0EEqw=;
 b=eNsfPM0ojKk3ID2Xfld3Vu9RFCiL9CPwu8HSU744sFXyuXYw4xx8tAa8IT7MygAMbX
 Ip7YXQmroicxSyNee/jHj/dc2Q4Ia8+yPm6AgROAsmWWxduTP47lxqTSaFYNLfQgMD+6
 BqMHwj8Zc67Y0pzKkOEp/u/bScwjgga+3Hkf0dRilWXkoJyeUngnSioKldiypy5Ei/aW
 U2VPA2qQuN2I9iNKp78srmp7BejwoxVXMvtOCgNWssyz7oGgDGfr7Y3vuKvOjugMckGY
 LNHl9n2H52PjWwV+TvR64ZzVN2TAOf/bSbohjHaS91cD2Ai15ZHk7E4K9dL3LMrAJ2QV
 Zx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ALZSyeo39NbS9OLB322BCxqDYf5DPRpt4qvdmM0EEqw=;
 b=L4MaGmj9r1BOysUiaymaECl3647BnGZoGPx7jtlhfkL2FInN40dO+cDm2qORnRYb37
 M5HdZM6BqPqqRauGLO7Jj+8n9XEIdbnR9Bb7+YupjJbdbu/tgqzGmaw8AgUPTLpoBdJ4
 8l7qfKfn3exLnZOXBGYbJfdgK2/D5UFnmcuZeNoDTEreh7G8W7VD1tt1XBlPAsVFLvRi
 od8MXFBvzXVvzh9YkypjFbLjVqrq08r8bx+bem43YTSBnBEovZP/fpwiuPWiYngC326A
 0QLxY/OLgYHofHV69/8rPU9Bvy77xOvZrwJzt6exs1wM273lZVBIwa7mIYtN60oiBrFf
 l2QQ==
X-Gm-Message-State: AOAM532jYqB89IkCfJDNhTQkNfjAAFV8s/ysQAg4Gr8C6oL3U5q/S1HL
 8YoFaNgzpG09qMOoGYNTW2IUTw==
X-Google-Smtp-Source: ABdhPJyyVeEtKoXWsNi4Z7PauE4xhGzXkdbHyMRIl/GNK7/I4aE5obhrzAmvHaX+azXUUQSVMtSwxA==
X-Received: by 2002:a63:4a1d:: with SMTP id x29mr6096226pga.53.1591304710519; 
 Thu, 04 Jun 2020 14:05:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c1sm2566546pfo.197.2020.06.04.14.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 14:05:09 -0700 (PDT)
Subject: Re: [PATCH v8 56/62] target/riscv: integer extract instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-57-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a75eef93-7ca3-2704-42a0-2449dfd1e2d8@linaro.org>
Date: Thu, 4 Jun 2020 14:05:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-57-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 21:05:16 -0000

On 5/21/20 2:44 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvv.inc.c | 116 ++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


