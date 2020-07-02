Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr3Ap-0004NW-A2
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 13:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3Ad-000449-IT
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:38:47 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr3AZ-0007Q9-TT
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:38:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id bf7so2258054plb.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2020 10:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZTc72DhtseFTiRpOsQCQpjEwjywGIZnMY5O8TZHL83Q=;
 b=LOB5MNPmUYi8BBwXJxbsg1I+TKr+o+01qQA4GyrD8xda9G1fNcXo2uW2MCB71ksTl1
 VePVtuuZpdqIVJnQ46afTad7VUw/qp/1loywz4aUVLpHwiuQE5oTpYTeQi2O1turMw2I
 xDzCyt8Bpu7CzSzz9pDj7AhvcwDxenBLW97AK4GkJ5fE3gXp/rRksBrpx1ydvHbmYqoM
 E12xsYDBzIS6Y8ijfvBkS4/ua7vrTPoxM5243cy8z3vdvT1qATxWwu4/3oz9RnFMeVVy
 tpw8sPlabP9sGuHZ1e7GnA2VFsUCa354d2M4dlSCqFxL8/LPOYQwLTAQlEq1xLtANQbj
 Q8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTc72DhtseFTiRpOsQCQpjEwjywGIZnMY5O8TZHL83Q=;
 b=P04VOTKWrk+1Oyc2r4/Mf2gv/JkqVtpPHP3ezSqxaHtR88Ii4eZVsXxCGdonW6433q
 M7y4GjwzBO64ZYi6mZGcVq6hHVj8FQ7KXP8XQVJ+rY9I0fz0HQALl1nPnUyg3UpQ3HZ9
 dFkM0xehuIktzpw8SKI0Nm6y5+sKLQn/xsakHf8DYRbZxqHR6sree1NV87xwFsEVgrFK
 TpJ4rP4e7QymrurgQaFfpMWIffDGn/UpNVLeHU7FXKxZaiDyTerpZNowLE9ufb0j6Ya0
 tkrrQa+naVDQCHFFQAimlW1OZSqf8lhhhMMheVquIOgbCNwvTSYzzX57m4dAK3Nv0NzP
 7awg==
X-Gm-Message-State: AOAM533SSAXhSfkAZchS8SLZiAIyz9hNB+jQjKy4Hgh0NrcJ8ucDF1Fx
 2PO4M6Lbn8lM7qIv2w6HvG3fXA==
X-Google-Smtp-Source: ABdhPJyuznEQWI9vns6vRPJqFvH6+czvMg2AW1yGYWejoqfNJhtl4AYd1lh5HYvf4/rvLgrwznF2hw==
X-Received: by 2002:a17:90b:b15:: with SMTP id
 bf21mr29960892pjb.53.1593711521203; 
 Thu, 02 Jul 2020 10:38:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l22sm8202373pjq.20.2020.07.02.10.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 10:38:40 -0700 (PDT)
Subject: Re: [PATCH 6/6] target/riscv: clean up fmv.w.x
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, ianjiang.ict@gmail.com
References: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
 <20200626205917.4545-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bea50a30-e8ed-dc96-8b87-d70e655c8524@linaro.org>
Date: Thu, 2 Jul 2020 10:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626205917.4545-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 17:38:48 -0000

On 6/26/20 1:59 PM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/insn_trans/trans_rvf.inc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

