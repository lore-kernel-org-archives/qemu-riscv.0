Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYCtu-0006VT-GE
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 14:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCtt-0006TK-DG
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:11:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCts-0005HT-LI
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:11:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id 18so5097396pfx.6
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DBEeLc+TWXFV320JdoAR6LHAocj5llAZ2FB8duCvyvk=;
 b=GrsglkuVZDd3qRH/Gmi8Ptf6Cl1Lh1DhUK0gwhTtgRPkIhp134WI039EQRVbdJEzdk
 UNlDLiOR+xqEWrJFdPvux9uQc+2wGRTcMaxRf6IUxoYPn1hPPRKhfgxrjEc2YjayDHLm
 EIzzm040IRFCyEBm1As5HlrEMhlW6BYD78VIbelKV6odLJtmiEhi8bQpL1IfAn8X/2g/
 SUgvjNLRBz6oyeM4++R94rs9kdWaPu7lbG98FXzqWgfcBqfXD5hyR4e1H4Cbr7JX7Qx6
 zwC27BpMl3ACSBTx+Vb5IVsJYt0BMJRixi7E9kXr00Kz5cibdQdmXFT6Dxh1GWeBfLmw
 FjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DBEeLc+TWXFV320JdoAR6LHAocj5llAZ2FB8duCvyvk=;
 b=rInLoCORoaBfYOMd1eibPEQdk8Ecm1Y1KSy+FIrUiV0wWz91p5NHZsCxD4XvZUi6IH
 7SOGYJLWvo5IsA1Vhwt9Bms3MbFLK+QL94KCaCTU/9lOvynr7egGKvPjbxKt91B87RTD
 QfX33yTNlf1kNL2erWfFfEzDrnFB5Odx9cLNzwrMe5+/uXu2BZA6r1HutrJTPfwEm5jJ
 EWVgBqmHT6mi0SPLioTeF0Uhg+Lm2BOWKFNgnN8hZws8RNe3dQht7h/IIxBbATSqrHM8
 tK2GiRBv7QWbVw5OzO9C8nZMWpTRMiWEb1xF6nLCu0DGaq/hxJc2F8SFOlame7Rx3qhu
 RoMw==
X-Gm-Message-State: AGi0PuYMDpLFpY6l0tz+97wBXHnD3h6ImcuqP24clz88253UaW2P+1Z3
 Xp8CvF9Jvqwq5CZsU2vWPPSLPy+n/5o=
X-Google-Smtp-Source: APiQypJlOXIoG6hmYTcQsqGoLjkFyAolRMbqRGuUJLoDVgUxFVbN7XvG185FedjYwPRm013W1iFDGg==
X-Received: by 2002:aa7:8e8b:: with SMTP id a11mr16673537pfr.62.1589220694606; 
 Mon, 11 May 2020 11:11:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d184sm9571351pfc.130.2020.05.11.11.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:11:33 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] riscv: Add RV64F instructions description
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-9-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99fa418c-9a2e-d806-b164-3a08fecd74e8@linaro.org>
Date: Mon, 11 May 2020 11:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Mon, 11 May 2020 18:11:37 -0000

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> +FCVT_L_S RISCV 1100000 00010 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
> +
> +FCVT_LU_S RISCV 1100000 00011 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
> +
> +FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
> +
> +FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }

Interesting question here: Do we really want to avoid the reserved rounding
modes, or do we want to verify that we raise an invalid operand exception?

I guess I'm fine with it either way.


r~

