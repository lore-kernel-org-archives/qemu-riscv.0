Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mqZGv-0005uG-Bj
	for mharc-qemu-riscv@gnu.org; Fri, 26 Nov 2021 06:20:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZGs-0005s0-F9
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:20:02 -0500
Received: from [2a00:1450:4864:20::42b] (port=45696
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZGp-0002Jx-M4
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:20:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o13so17846385wrs.12
 for <qemu-riscv@nongnu.org>; Fri, 26 Nov 2021 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4OKl01bOGIbyp4u55BVn47b+llH5FbyfeHC/mYV2utY=;
 b=pA4tL6ot7juJ73bNX4Eua4dP9n+bB9A9rPDljbkrw+80ZxgSthUXc2wIGOl2/oRoih
 Ahs2u/y9r13PVjVVxHac+z7ZpTH5ZGSUGoRWkIlWjNdpyzNVgqf+7F8gj6DmhLRKFxSQ
 O0HSqTejOrWjgPey502tKnx6qgTCEJPTNyn+X/vm5131Qv14DfKrIE5k4DnjOvdl3HWE
 Wwu2od0J/U2eHKBJ1Dn6rRuIjVu8e3G3fT65fOyB3O33voFu+yfFRzLzajWWhIOH58Bk
 bvgRvBlL0ujk8TT0jwEFbxQFb4mfG87RnBl6cuztRPdu8MZZD8wCpHOphQ4v2tZHcnuY
 A7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4OKl01bOGIbyp4u55BVn47b+llH5FbyfeHC/mYV2utY=;
 b=mAXVmABAY7tWp5c/coMvL1r+UNT7b1G5kzRfToywJNKpZATMEpdTjm9cIdFQeMdLI9
 Mwk42PpxpRwQfQIQVaGb8yjPklm+EWE0/xY2Cd6gUAfWaFKBsUUAqnvvf3ePSB3HVEc/
 JWPo3tBuqvg4scjEW2dLyFFWEl5UN1Yy11z19KDnmWeFgOCr9EfF1oKQ6TkBT5G91q2B
 d67IPQmYvhm9Pty+REYWcsgqLoqxMC54bnsvNuRRAHgw/2vehw36eqwWNXFr66YvRnQY
 wHr8v8LEHCsREj6s1cAfMaVF6LIgI/WBFBOxFxdzxOoEXJ9CTTq+ouM0Lw6LVpS31EYB
 QEZg==
X-Gm-Message-State: AOAM531Bd8e+TD5w5p8DYkwZTbXlrmoJ12iXLaeLxOkQgT+P4K3YOEqE
 sfDMxp/EYZiPQtip71wyijmc0g==
X-Google-Smtp-Source: ABdhPJwD3tq41JZ+aG6Ej3Uw5EZvyM/RkjAcWHGLlcqLhR8MgphUjDWUoKBAd/Xy2l1LoTEUiyUlOw==
X-Received: by 2002:a5d:452c:: with SMTP id j12mr13129504wra.430.1637925598107; 
 Fri, 26 Nov 2021 03:19:58 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d9sm5253075wre.52.2021.11.26.03.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:19:57 -0800 (PST)
Subject: Re: [PATCH v5 01/22] target/riscv: Adjust pmpcfg access with mxl
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0f578f7-63b3-691c-582b-0f79c5efba70@linaro.org>
Date: Fri, 26 Nov 2021 12:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Nov 2021 11:20:02 -0000

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> +static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
> +{
> +    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {

Let's make this != MXL_RV32.  I suppose real RV128 will extend this restriction to mod 4, 
but that is not yet documented.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

