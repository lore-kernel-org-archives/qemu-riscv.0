Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6GvM-0007ub-9B
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 13:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GvK-0007tK-OW
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:21:54 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GvI-0007Ql-6s
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:21:54 -0400
Received: by mail-pf1-x443.google.com with SMTP id m8so3158037pfh.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2020 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJ0HzUlhmjx7FC9F4faLGWxSwitdxfgfm6ZHbCn97Is=;
 b=WGdp7DvSotSdlv4Ni5V+Tcly8bf61U62Uqr7d3O5FDsJOHE3yVH9poMMZjenGhxf+/
 ixpk1AaopseuSDnbWT0JBlUG49+jHuSBtjludYJFV1HePkNtVwF1VUU2ThXV5xnFaH/H
 0D7Rtj9SmU9mwMnq5GH2jXZZ34FXpMPrE8DfZbGOndJD6c1FEbnggNK+ZVTJhuNt9LmD
 hlIkjDsa2B04CevR+jIFsLmtbOWhrFxtqslW7G2FpWBVfNQ1mGZRnXOQBnInzvLtOQ+M
 EFStj0LZGKjLMSArf/iIly19xRiOGsa0MamL/aj9vgLlWnkVAuBOhhEChuyMqc1dUeul
 v+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJ0HzUlhmjx7FC9F4faLGWxSwitdxfgfm6ZHbCn97Is=;
 b=GzA/mjQtEXrySluif8moYedP7SDai1yE6hJvnk4N3gpMOq98Dastm70ltmOJwy21jO
 C8FQ0zuVCJbRj9bIgN7nBIUWniGLpKIrqCaT3B9YBSA0Xf04x0dv5jPiYB6B87F4gj6T
 YVaHjmKiykfVS+rJj71NbJ7LJWVV7d9AEaZBX3k+pUpgJQur6XoDy8SL0MmoFZLzBMA4
 jNzD8SR6VOeFRTVUv0x3PTB2BfJAlrn+aQigVuTuj/KIfH7Eo//6DMyiQnF00eYHa4dr
 N7a9cb0uWGyGYFUiM6QHeE7UxS8FjKCpFdmMq+PpX1oGC+iXYf3CYMSZ9XTrAmPgCNu2
 JpBg==
X-Gm-Message-State: AOAM531d0ZEPtdysWElbfH8pXxjzXcKTb+Jfw/8qu72zgRBIIBgNQPL/
 udNEwaOBatmnjdH/u/t2cd2wGw==
X-Google-Smtp-Source: ABdhPJwjl3gGG8MXbBGAFzThF9RQzZyGOw4Xi0AsHkChE/ntxy30YVwLv+EK08kkhwEVUITDIrjY+Q==
X-Received: by 2002:aa7:9096:: with SMTP id i22mr1691774pfa.310.1597339310507; 
 Thu, 13 Aug 2020 10:21:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j13sm6533431pfa.149.2020.08.13.10.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 10:21:49 -0700 (PDT)
Subject: Re: [PATCH 2/3] softfloat: add APIs to handle alternative sNaN
 propagation
To: Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
 <1596102747-20226-3-git-send-email-chihmin.chao@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa334be5-e325-8d96-a3ee-00c82cfe2c4d@linaro.org>
Date: Thu, 13 Aug 2020 10:21:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596102747-20226-3-git-send-email-chihmin.chao@sifive.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 13 Aug 2020 17:21:55 -0000

On 7/30/20 2:52 AM, Chih-Min Chao wrote:
> For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,
>   The original logic
>     return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan
> 
>   The alternative path
>     set invalid flag if ft1 == sNaN || ft2 == sNaN
>     return NaN if ft1 == sNaN && ft2 == sNaN
> 
>    The ieee754 spec allows both implementation and some architecture such
>    as riscv choose differenct defintion in two spec versions.
>    (riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
>     alternative)
> 
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>

If both ft1 and ft2 are SNaN, surely the returned result is silenced?  That is
something that is handled by pick_nan, but is not handled here.

Also, the patch subject should be modified to emphasize that this only applies
to min/max and not propagation of all SNaN.


r~



