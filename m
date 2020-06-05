Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhGW7-0000D5-Tz
	for mharc-qemu-riscv@gnu.org; Fri, 05 Jun 2020 13:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGW6-0000CA-Kq
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:52:30 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGW5-00071o-GR
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:52:30 -0400
Received: by mail-pg1-x543.google.com with SMTP id p30so5515450pgl.11
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2020 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ZYegxnaM6zf0JrZfZnu4oUrk0aeAu78v2XzWIvM+rc=;
 b=rNPZ2Bj06JJMsVcCGwF7AhduzdzgElGLfqg9ChnAOR/QaPcq5Oj1JICtx5RK2Ljybb
 Ejjk0xakWM0FxfDAHnKIFhbK5kuixMcwby+teKjcWMGHsykSv6VFD7uF1ny4I2BZE3Jz
 8THk5keqG2o/ouF9FnOYr7e9w4r68O8wpLX5elBzPCp4YiMWvU+IXCFGeOhAcTKXo9mQ
 uQd7iSkoKL7Jo/SOFmD5mMRoyLgbsWyc8Qv+gMUW70WMV5B2hXPFIauFsPrIYIHFgK0w
 j5xwkUW1LH6WxPqAllxth47mDmpQweSwvcH33yzCQtlvO+mz710Z4Kc63mK8KiEtZ91T
 V0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ZYegxnaM6zf0JrZfZnu4oUrk0aeAu78v2XzWIvM+rc=;
 b=AFQNCaxMa4oWoHG8JNDqKyNFu/ozqezoZdx5/AgZVa6MxjAwHyKBMcDChnCN39S3yN
 0x39x4MxCeQgK2TFBNhi8kbSRMYq0kJgaaKPZw2UuwrY9PLCOm9QUQTN5hchr+NpzQC5
 L82dOZ9acCiUyMUn4XeSFGBUrooAoMYp6v5DOlVnV9DSRQdDceOsNXRef6JmuRgRIfWo
 xZesQVZslljxGWvnYhHMWLOWWww3GGUj+9C2uXGJwO8u7CJDaIb+IeatYBO24lhX+s4c
 JVSoMPl3jLaz+7NctSHe08guqAbk4NVNssEU+8y4/PQJpYbQCJ2DcsAgsEKsa2kehd27
 V2fw==
X-Gm-Message-State: AOAM530sj5O8bImRbP6gkw+bykGei6Wk2lJuw0mxGoe5TpottPmN8WgL
 5KejizlXefeuh8EsHOkkagXehw==
X-Google-Smtp-Source: ABdhPJzQpr36b/eTpC+nkwZzNWBBYj9JOG9IF6OuqK4sZjS+mbnY0Ht8QNcExSbfifl6Y/D4dYPNRQ==
X-Received: by 2002:a65:4107:: with SMTP id w7mr10411397pgp.226.1591379548136; 
 Fri, 05 Jun 2020 10:52:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm9335307pjb.7.2020.06.05.10.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:52:27 -0700 (PDT)
Subject: Re: [PATCH v2 03/17] target/riscv: Move the hfence instructions to
 the rvh decode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: anup.pate@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1591319882.git.alistair@alistair23.me>
 <6f88ddc816f7828e4b58acc82e3e4b61bd86e158.1591319882.git.alistair@alistair23.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55e23f0e-cc7e-deb7-bc64-e8b31eeb1467@linaro.org>
Date: Fri, 5 Jun 2020 10:52:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6f88ddc816f7828e4b58acc82e3e4b61bd86e158.1591319882.git.alistair@alistair23.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
X-List-Received-Date: Fri, 05 Jun 2020 17:52:30 -0000

On 6/4/20 6:20 PM, Alistair Francis wrote:
> Also correct the name of the VVMA instruction.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/insn32.decode                    |  8 ++-
>  .../riscv/insn_trans/trans_privileged.inc.c   | 38 -------------
>  target/riscv/insn_trans/trans_rvh.inc.c       | 57 +++++++++++++++++++
>  target/riscv/translate.c                      |  1 +
>  4 files changed, 63 insertions(+), 41 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvh.inc.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


