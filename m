Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgwNY-0003Tq-Os
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 16:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwNW-0003TI-I3
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:22:18 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:56108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwNV-000582-CC
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:22:18 -0400
Received: by mail-pj1-x1044.google.com with SMTP id fs4so1614402pjb.5
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDqVsxMO/Ew4Oyl1upGA18KILvEu0ZLIV+JkPJ/5hhw=;
 b=m3QaVdzysHdvc4oEJf8DMpzWX7ePqlpI+0vswD9NsLnJJY3ZqdKNDfgVfY6RbLM/Fo
 q2zWX+/VDM5V7Y1ZWCxf1nblinss6C8diGAIncxwy7jIbETOWTiG4JGpIl4MTQcNipkL
 Zi9PtziS6nAjXBssC7eP0dAaOj5VcN9dzVxKaB1gXtvVvnTqYzhwNXm5tlYdZiLGkkxV
 2tSYBldDzw+96n13kgK7qmdIfKw90yKUZhRZyuAuNHx0U222XBQVybqVwWrxva/40I3F
 +MgybQ5fNrV31RTctGOQ9QO6xq1c9ByqUAuh9LH0lCoL+NGV7H5ddlr7rTlJiu9Hv7xj
 sZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDqVsxMO/Ew4Oyl1upGA18KILvEu0ZLIV+JkPJ/5hhw=;
 b=d8QLgAXGXNzncLi5V5nv1skWZYG+dosA+pj3I0TfAJPwsXFFT8UV+ANmpVGc33aMwz
 MRkkz4rn9TbxReGLEsn8dZ91K6qokm+C5VS8cL50MdpR8jtAIx5rGdSC7cpAgFswAyYp
 /7mO+bDtgjbvsBIT3zED+RVAOYWYFmvtUMOkbEGqMfB0sky2r6qI88JWu8DN0q7LqNeb
 mT7eZI+Y88/MqwVO9AZu3TkI7qKFxoOCWGfJFnfpzAH5yW3heSModlmwjkoOL/dj8lsr
 I8ijMPNWd+n8I4q6b2Y4Y7TujyvOVZVvqzs1orv4j+Ap/+hdNGCXI1FXdd5QjnymgngW
 k5kg==
X-Gm-Message-State: AOAM531IIzdhSEcCkN5jf+lTDiJWepqVhsedoo5//ZxvISSpb6uQfanj
 RVcIy4oPRDwppt4JKSZnmAG7/g==
X-Google-Smtp-Source: ABdhPJy/tXiqyDeoDslbMzfEVNgSPlbuH9ue/5e2XNcv9zKpO++DZ4BL4h6Xal5BR+X8qghDdlvibg==
X-Received: by 2002:a17:90a:cc18:: with SMTP id
 b24mr7906506pju.89.1591302135623; 
 Thu, 04 Jun 2020 13:22:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p14sm6561790pjf.32.2020.06.04.13.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:22:14 -0700 (PDT)
Subject: Re: [PATCH v8 25/62] target/riscv: vector single-width averaging add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-26-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b988b684-b502-1044-0e6e-19ac8f962f7e@linaro.org>
Date: Thu, 4 Jun 2020 13:22:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-26-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Thu, 04 Jun 2020 20:22:18 -0000

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |  17 ++++
>  target/riscv/insn32.decode              |   5 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |   7 ++
>  target/riscv/vector_helper.c            | 100 ++++++++++++++++++++++++
>  4 files changed, 129 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

