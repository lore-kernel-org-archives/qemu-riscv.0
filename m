Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYCmy-0005E9-Km
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 14:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCmx-0005CN-AM
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:04:27 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCmv-0001Uw-Cl
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:04:26 -0400
Received: by mail-pg1-x544.google.com with SMTP id t11so4914513pgg.2
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eCRzVp62mSxMAEEz+I7VSkKo2tvnwi1uu/90viuOvjU=;
 b=GNUouRuUmdIw400Cyo8nV59d1VFXxc+jY7HUSwOp0RIGU1icGcE5EHh8gNT4gPB26g
 2Y4E8vUe3MRCd4nNwQuxgt93f97lzd5r8aR3lSnXTqMuSQJIslpVwxxdokWXBjg2aP9I
 Wm31MFYYhME4awAXcgc299ec8wtZWKKbf7WDft0DT6Tjre6VHkJGu6kGw+Mp5dqsWCR8
 uUKwZIj6a2QSERwTRi8WTL9EBudugBVEcQ1C1AEL5WcOhI8pihWx0LSH9nBJ3JcDcF6Z
 SgyCfuk4S/6SUGPfaxp7XHb/7SHXWcLr8oP84T7jBpnCHdcs4OfyGPbmOLU4geXt9b1X
 +PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eCRzVp62mSxMAEEz+I7VSkKo2tvnwi1uu/90viuOvjU=;
 b=EjKxfUj8AXtZdItMAq387bDj0lTbW2DsxbCGZFtrz3KlLoW0aWRvJSkxXw8at3F+S8
 FqOQHz8BFlvtPotuAUoBGw3jdyevi/38kXMgGMD8A+Lofnp56ObyZj4XXUvwSQl8yzHn
 pWShbTNUni045ohUlgrHvtF6nleduuGLUQ+efhdh7ucu/iD1mZLhHCz9nAv6loCTFCLm
 gjEuFg/+Bw+mqPGPo97NeowZWHD2NxASf4eZFUxwFxQvg4R/OHknA7loqH236vJYvVCg
 qZUlir00PinCbdYoD9Y+BAsiyKs7GXdokoI2f5gE4x18pFp9GCfEHPTeiufWeCijcidN
 4kzA==
X-Gm-Message-State: AGi0PubqGCqL6a3fJTNdK7aUM7e2jr0DLw5d+uPQfIOcERP0kSCzjGFA
 DS5ze7K6pCgRY2QWuiU2f3cxujKmxlU=
X-Google-Smtp-Source: APiQypL/iOjveScXvHS2VX5DaPlZj0P27T7bCGdy8HE3XKMm4d/13yFd5v9O/p+TgLSn1Tco4XWi5A==
X-Received: by 2002:a63:555c:: with SMTP id f28mr16078954pgm.80.1589220263571; 
 Mon, 11 May 2020 11:04:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a12sm9733302pfr.28.2020.05.11.11.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:04:22 -0700 (PDT)
Subject: Re: [RFC PATCH 5/8] riscv: Add standard test case
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96bc38d9-02e9-ca10-2db8-a279131366b2@linaro.org>
Date: Mon, 11 May 2020 11:04:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Mon, 11 May 2020 18:04:27 -0000

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  test_riscv64.s | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 test_riscv64.s

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

