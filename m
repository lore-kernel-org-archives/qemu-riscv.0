Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYBK5-0000Hp-Cj
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 12:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYBK4-0000HO-25
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 12:30:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYBK2-0006vk-LY
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 12:30:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id l12so4781876pgr.10
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=12LvgeCJuJQO3x2fy3fOhZzkeb9hiF3TwYLbtoQhgjE=;
 b=IM0B5u3hBpCzzpi8IxE9sXcWUgtDEjBiX8nG2PnrRXW9fnY7BhJ4VZX53DNIoh85PL
 8ZsqC7xxT1azwq5FYbXqgAEnyIb/4dWXfchjVLFIJmjr909BuKa4fHRFDO8Ir5AobA9B
 SDQkTu34UIn++jLG22dbNBNZgSA7QSsKOMh7oKLrwdRO7MZy+j8DiFxEqRStMOjFXi8Y
 Tj/tjmz1RQOlrWw6cf1EIjG6rLbfAqnG4FMVknJEcc43dapTc7kBrhqImYJWuj/21zPS
 lg+J3318kmpAvYWe/S9nn2JG80kFNJ1STvvAoWVCN1H1M1RYKddg+nPUuDuwyVAwiiXv
 2b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=12LvgeCJuJQO3x2fy3fOhZzkeb9hiF3TwYLbtoQhgjE=;
 b=PJeuf+gGUGg8J/rDF4QBH7NwJnUs+K15FhI11uteFagdMtmJqNO2olyZ60A32EeHXl
 H6rWxIzSGDqXSzo869bkxc83kMdg4LKWuu6fydLegV12a5wLPtfFaguqfWN1ewms1lXC
 gjyOOHRBHmGUzBAjT0NNndNvOU+QEYFTXvEau3TWyanDKmkXP5KYrV5/9nmTlYQkaj1T
 dPU7OzDAZCxHbQHAEoPhJ1osX+xIbWaUhNt1vcpiK9mgAdobyhHuJyVOdjQlMGBR7B1F
 Bl/bkBx46WtUhngNMkqWJ/UnjGPNRSGrnly85ZYAJOQeinrudr1J4JA0kOIwdOkbgbPq
 DdVA==
X-Gm-Message-State: AGi0Pub2N6ggwt+FSbk05wsAYCKjgk+DVfsUjRlbsNSZrRhecGqHfIfy
 HJig1AmQBrpjkIuPosC0qOS7bAaWVUw=
X-Google-Smtp-Source: APiQypIxSHvfBpeI5GgcgAdvgUY8hMhxX2Z9+ye+soBg+4jiP7ygMrKAW997OWDcXwNQxQmelp09Mg==
X-Received: by 2002:a63:4f65:: with SMTP id p37mr15762222pgl.60.1589214628988; 
 Mon, 11 May 2020 09:30:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w143sm9371201pfc.165.2020.05.11.09.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 09:30:28 -0700 (PDT)
Subject: Re: [RFC PATCH 0/8] RISCV risu porting
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69d804ea-5274-bee4-9368-69c888082143@linaro.org>
Date: Mon, 11 May 2020 09:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Mon, 11 May 2020 16:30:32 -0000

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> It's some difficult when I try to support RV32, because it's very
> similiar to RV64, so I can't make two .risu files like arm.risu and
> aarch64.risu.

You could a command-line parameter, like --be or --sve for this.


r~

