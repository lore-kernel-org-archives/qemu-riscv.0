Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml89h-0003t2-O8
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml89c-0003rN-NM
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:22:04 -0500
Received: from [2a00:1450:4864:20::32a] (port=52898
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml89a-0004DT-JR
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:22:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o29so4756952wms.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hvkKwz5PejTRCPwJ8yb5WvmQrjXes9k/z2Zzq4nho2I=;
 b=jQLLV9ku4BDg1Pal9Ws0f0Ilxn0+A/46G3QVEZzG2ZOreGfmsgAds7yCUtLz54Bjfy
 FsfPZ8WM0eYf2JKiRu4oMS3AmBX8aoFHINN7JhMEa63BCuicFH+jvFlL0EQuathXSGsE
 C58d7yZBD9LQH4nIX61FE55WUF86zIxo1ocdM0/4nEgjGf7Fp8S1wy+hPB7Z+ze4Ll6U
 32O2i7Ig1357oT+IU0iOdSmPxvqq4I7t+pm/KAEIH+6dwgkir74SRIV//ZDwgx/P7Gpt
 HEmbdfWpcxtIX3O0lFWRiCg8USxGH+7GSmDKBtIcpZ9JfyQECmVSxPbs0BpneC1TWDCA
 H2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hvkKwz5PejTRCPwJ8yb5WvmQrjXes9k/z2Zzq4nho2I=;
 b=dA2cmhnPHSm7uzNWHMQXzhQxgfQiHULa/+SoXHkcWce1IQZSdNiCM0HiiFJOb6gtpx
 i4zaPEMyS33eKXAGe+lqtphpVBHXZtAZ5pjQg674WgXhBST3zKIJiuIFe6X1xnJ87y/5
 1LR5oPMPcTY5kf1BJhOxbjcDKwBaHN1214Xr1p/xQ2braapbEjs2GrDgnjOHxaefldfM
 EVs3ymNnXAO7vFLq0euGSaIbCgGPMIljFy96p0VoaKs8GGY08VrS/MaGC33Px5Ry4z/i
 IZulJ0Y9CkXz5JGLqig9lFmM+UyHw1ECn7NO4SOMzqN6OsExsO9ZD0NzHu4uiSIOMMDS
 a/dg==
X-Gm-Message-State: AOAM532fSzE2rng403dY/Ajr08VDpzTYtW2KtCiX8II7y1i9AekZbCRg
 OwCZaCPXPnG6HzqSqoYpBLGlEA==
X-Google-Smtp-Source: ABdhPJwhK2LujHpDP4qyMJMsITjSs852P52hfjmYXeMME6/2wlHBMny59dvriEW9iV83l1EqrBZ8Kg==
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr14245620wmb.84.1636629720861; 
 Thu, 11 Nov 2021 03:22:00 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l2sm8434367wmi.1.2021.11.11.03.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:22:00 -0800 (PST)
Subject: Re: [PATCH v3 07/20] target/riscv: Adjust csr write mask with XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a901c8e-28b6-1390-f0f1-89b5d4949a33@linaro.org>
Date: Thu, 11 Nov 2021 12:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 11:22:06 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Write mask is representing the bits we care about.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/op_helper.c                | 3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

