Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CBEC5B543
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uOtga-0005Yo-RH; Tue, 10 Jun 2025 03:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtgX-0005YI-IH
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:46:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtgV-0004xM-SQ
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:46:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442ea341570so32916485e9.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Jun 2025 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749541574; x=1750146374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MYoVOR1CZxd8oYa4whcklsfk9DWRVKfrTpPqPhEbrvk=;
 b=gi2cwS+UsLAv+BZAXwtGLDrFaEHs1hAteebD6QBHRHQfLh+HsGtoACOvJOVx4u310k
 ZcQrFrp3cP7oEyemelf8TIPUdj6YFFqL+9hR08ilD+YjRCtaivsMqJOrtz2xPKewvBqi
 eWMxW2uizQay0ppbT7ORtxSPICRRUwX5KLJWou7pdW0vwQb7W/QKBs0NXXeplgjMv6Ur
 Fq8P+K+lLiD3Qvni2V+R0N4fCrip7obYqBDZ/YgptmkjtaHbfuNzjS7Y7DjITtyX0LGp
 7po4tpgffCqg2UQOD3gsElEoPi+SVUT8Jj370n67bULfEkA30AeBEy+ApfqIFbDUkUwt
 +yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749541574; x=1750146374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MYoVOR1CZxd8oYa4whcklsfk9DWRVKfrTpPqPhEbrvk=;
 b=wn8ivnSc+NtjBBvKMyPbR3mh3V6vJuIPs4jHo2pIFvUs3FjsODS5NU1y+hBMjmOzRB
 uSZlh0Sixyx6ErmmA0NHOuDVso58wgwulxxTbCTwU16cko7Bx9R9+09hhOPpAUqj3lyp
 pIqtEcvF2FxVCsnYL/MDNt7lovryThK43m4xOgPK1ZPze9Cp9XXnPbE+4hWz5zdOqE6V
 lltfm6F/5qcY5Hs4TAb0HfFvV6pXRoBoc28NVmzQ85kRNbZWB9FsT0nUFsBH4v5g+iq4
 gb535zb5X598PXOKJQnPW2PA/LgKTngFbkGVo//q1ORsuHqqAjjGXMProVouA8rC28SG
 ITow==
X-Gm-Message-State: AOJu0YwBwz/qDBDZFsKordWFJBqO+Q7BezfnJSUUyl75k2T2g+DcWUKP
 /Gop+ATphlM/MkxGnehMxrEAc12zxjz2eXwC2d//bz6TQDMhirCf2EgPM47BNKeRKwo=
X-Gm-Gg: ASbGncuBFZKN0f2gdo8xSEYkCD31KFM2/D6PO17NedJpFu22z/31w6bZI+PTirNm0SH
 lo5jsIp/4MlKRq5BGxy8oc7EDGmxWIdB4UQldqiAWGamuTRDVg0aXxe1Pq41kvYnRP+vdF22zoD
 ltIvrHyKhHQhGCRSpRBP0iz5MC+Cg31D0hmC9V53mQCv29Rc9q1k2LstDW7hKto7icQ313ir+4v
 V19QKgmbJ5JPpXilhvHFe04bKPeCwY6kKKUFCTRrWAQRgIb0f8HEPKuTJxjzuxhgt2eO/+wxabH
 X3CREJGCDiA4WpXZc4wRYtSaJIrIZJ9RchUdXmF+To9jCi+Eq8vsDyx/nylHbkvBvDR+S2P1OfD
 i32BaICnHUuMtqClsPXoAulg0Pg+4BRV0LnA=
X-Google-Smtp-Source: AGHT+IHTwALnX+YgBBIX8b84mz2gWAhXnx1SqX7gmx3oLFuCkSrvvXwL0hmEhZq+BFKgN6noe4kfjQ==
X-Received: by 2002:a05:600c:859b:b0:453:6ca:16a6 with SMTP id
 5b1f17b1804b1-45306ca17f5mr76966835e9.10.1749541573929; 
 Tue, 10 Jun 2025 00:46:13 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730b92d4sm130903155e9.19.2025.06.10.00.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:46:13 -0700 (PDT)
Message-ID: <54d30dde-a988-4fb5-aee8-0d9e2b91d592@linaro.org>
Date: Tue, 10 Jun 2025 09:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] configs/devices: Add MIPS Boston-aia board model
 to RISC-V
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>
References: <20250602131226.1137281-1-djordje.todorovic@htecgroup.com>
 <20250602131226.1137281-9-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250602131226.1137281-9-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2/6/25 15:12, Djordje Todorovic wrote:
> The board model supports up to 64 harts with MIPS CPS, MIPS GCR,
> MIPS CPC, AIA plic, and AIA clint devices. The model can create
> boot code, if there is no -bios parameter. We can specify -smp x,
> cores=y,thread=z. Ex: Use 4 cores and 2 threads with each core to
> have 8 smp cpus as follows.
>    qemu-system-riscv64 -cpu mips-p8700,resetvec=0x1fc00000 \
>    -m 2G -M boston-aia \
>    -smp 8,cores=4,threads=2 -kernel fw_payload.bin \
>    -drive file=rootfs.ext2,format=raw -serial stdio

Please add documentation in docs/system/riscv/ and link it in
docs/system/target-riscv.rst.

> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   configs/devices/riscv64-softmmu/default.mak |   1 +
>   hw/misc/Kconfig                             |   5 +
>   hw/misc/meson.build                         |   1 +
>   hw/misc/riscv_cmgcr.c                       | 204 +++++++++
>   hw/misc/riscv_cpc.c                         | 225 +++++++++
>   hw/riscv/Kconfig                            |   6 +
>   hw/riscv/boston-aia.c                       | 484 ++++++++++++++++++++
>   hw/riscv/cps.c                              | 187 ++++++++
>   hw/riscv/meson.build                        |   1 +
>   include/hw/misc/riscv_cmgcr.h               |  77 ++++
>   include/hw/misc/riscv_cpc.h                 |  69 +++
>   include/hw/riscv/cps.h                      |  75 +++
>   12 files changed, 1335 insertions(+)
>   create mode 100644 hw/misc/riscv_cmgcr.c
>   create mode 100644 hw/misc/riscv_cpc.c
>   create mode 100644 hw/riscv/boston-aia.c
>   create mode 100644 hw/riscv/cps.c
>   create mode 100644 include/hw/misc/riscv_cmgcr.h
>   create mode 100644 include/hw/misc/riscv_cpc.h
>   create mode 100644 include/hw/riscv/cps.h


