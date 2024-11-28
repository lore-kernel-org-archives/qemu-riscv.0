Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C545D690FC
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 11:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGcn1-0002X0-Jw; Thu, 28 Nov 2024 06:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGcn0-0002Wg-PY
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:34:30 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGcmy-0003Ro-SZ
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:34:30 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2969ae2c99fso444482fac.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 03:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732793667; x=1733398467;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YusIOAO5IxontvxYC6BK7P3ZvOIqhXq3rM5F6h+5agw=;
 b=hLpMU61HKEqf8HphqPwgaqz9uv6cKm2ngi4aHBldEBt04LJPWqUP+PBZ/0axNzF0dX
 cm04sO6WOQBujaS9zkUuZ8V81GvzBBzFWNfAXgYkF2fDrGghnnNQcjoSTL6sCVS2KftN
 YkYPhaj9mcALiZGSYg50psPHI0Z+1yvE3oqPZT+MCqjsw9922dQb2BFIo3SFFNh9ynU4
 Xt+xRIRteoHrihDRmkbR1w0oXZE6qROTInXxqgLSHC/+38TwAxOGF3ruDK3qqgao9sAM
 qC58MKBwDYlHu9joXN93JtEpkTNQkA1pAjdMvcgplmZs0oXqOPOmfCMacwLgeed7+eC9
 mbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732793667; x=1733398467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YusIOAO5IxontvxYC6BK7P3ZvOIqhXq3rM5F6h+5agw=;
 b=TTaGF5FNHI8qK277sfI2MfsPVHGBLv/uUxoCvWU4ORY3xTp7YKoVp7VJ3RLQUsKa6b
 psWznROR+fDKN9l2yucCvK9MvMASuXTZRXpabYkKTgEdNLcdoUy6VWPAE7teOpwnN9qA
 PWyf+5P5QFqZVs9o12zMhyYynCDVp4pfJXOnukvCjSbUZI0JGViwEPTvCbkcuzziIRvI
 zbyLY/iBED9hMtEKNuZic+EaanH26S76dusS/TRBJkAhxKPrRCTUVaMMs7ckV0Fma4/P
 Hei8y/EfeW1I+0t2NHkEEOnKRNEYmobzlF9Z2ldLP5mLLTCwFbBlWo+0CgWAlbhdxkFh
 T8nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUby3HlS8XJ7ZgGQlNUDDr+p9c/pPwmmr87yBAMm9HWUJx+4uPgz+pOGdxQeaPgvdI4vYmiwOS+4Xbl@nongnu.org
X-Gm-Message-State: AOJu0YwVSsq2k9RA0QM1oVWuNJtHkm9IJhECYI4ihODWgviA/9JqaFvJ
 ekIHAaJbObpK0+0tmLLgrGMfMyLwlzBwqH/+wVS0oFAi9KLwXxnyoTNja1JKdgs=
X-Gm-Gg: ASbGncsWpisdS/hJwTHgKkw4bqHykGxMtFGweagiEmDtvAwI2V2t6xU1aFZLLCJpPoV
 AEpE0/8XOb1XGcGsCj4juijFDkzSJn+H8gTkoc4VRozm1ERIIUKH/sTE5UC/wTym/XaqtdQs+i/
 kkUXMON7TLtpjq+n8qX9mOTCdrvYSFR7RxjnHPyCsWpdaLwY0y51Qb0HQ413PFeNQx74RnlIO5F
 z5EJ40HJ6kd81/2GWkPc7Bd38bsteaxA0EQvyYXSRo9brz5MIr8yWKxupFDwYo=
X-Google-Smtp-Source: AGHT+IFhAMpLYAavC0ychuh6sPkLg96Ne2K6mPDHVdmcWl9D8ES0sp+aOwvSdwPDfIjpcakRBoHGZw==
X-Received: by 2002:a05:6870:ab0b:b0:288:57fa:961d with SMTP id
 586e51a60fabf-29dc438652bmr5739538fac.38.1732793667278; 
 Thu, 28 Nov 2024 03:34:27 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29de9945ce7sm357016fac.37.2024.11.28.03.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:34:26 -0800 (PST)
Message-ID: <efb2b786-f94b-419d-ac36-c7ee4fa37005@daynix.com>
Date: Thu, 28 Nov 2024 20:34:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/15] hw/display/apple-gfx: Adds PCI implementation
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20241127150249.50767-1-phil@philjordan.eu>
 <20241127150249.50767-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241127150249.50767-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2024/11/28 0:02, Phil Dennis-Jordan wrote:
> This change wires up the PCI variant of the paravirtualised
> graphics device, mainly useful for x86-64 macOS guests, implemented
> by macOS's ParavirtualizedGraphics.framework. It builds on code
> shared with the vmapple/mmio variant of the PVG device.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

